-- SQL Analysis--

-- (1) What is the most ordered product across the regions, ranking no of orders by product?
WITH orders_by_product as
(SELECT 
  region,
  CASE
   WHEN product_name ='27in"" 4k gaming monitor' THEN '27in 4K gaming monitor'
   ELSE product_name 
  END as clean_product_name,
  COUNT(orders.id) as order_count
FROM core.orders
LEFT JOIN core.customers
  ON orders.customer_id =customers.id
LEFT JOIN core.geo_lookup
  ON geo_lookup.country=customers.country_code
GROUP BY 1,2)

-- Adding a column to rank product orders by region
SELECT *,
  ROW_NUMBER() OVER (PARTITION BY region ORDER BY order_count DESC) as ranking
FROM orders_by_product
QUALIFY ROW_NUMBER() OVER (PARTITION BY region ORDER BY order_count DESC) =1;

--(2) What the differemce between the averagete time to deliver and ship by region across all years?

SELECT
  region,
  EXTRACT (year FROM orders.purchase_ts) as purchase_year,
  ROUND(AVG(DATE_DIFF(delivery_ts, order_status.purchase_ts, day)), 2) AS avg_time_to_deliver,
  ROUND(AVG(DATE_DIFF(ship_ts, order_status.purchase_ts, day)), 2) AS avg_time_to_ship
FROM  core.order_status
LEFT JOIN core.orders
  ON order_status.order_id = orders.id
LEFT JOIN core.customers_orig
  ON orders.customer_id = customers_orig.id
LEFT JOIN core.geo_lookup
  ON customers_orig.country_code = geo_lookup.country
GROUP BY 1,2;
--APAC shows the highest improvement in delivery time from 2019 to 2022


-- (3)How many repeated customer purchaseswhere from loyalty vs non-loyalty members?
-- grouping two or more purchases as returning customers

WITH returning_customers as (
SELECT 
  customer_id
FROM core.orders
GROUP BY 1
HAVING
 COUNT (DISTINCT orders.id)>1
)

---Filtering multiple orders by loyalty status FROM registered customer base
--INNER JOIN is used to extract only orders made by registered customers
SELECT 
  CASE
    WHEN loyalty_program =1 THEN 'loyalty_member'
    ELSE 'nonloyalty_menber' 
  END as loyalty_status,
  COUNT(customer_id) as customer_count,
FROM returning_customers
INNER JOIN core.customers_orig
  ON  returning_customers.customer_id= customers_orig.id
GROUP BY 1
ORDER BY 1 DESC;


--(4)How does the time to make a purchase differ between loyalty customers vs. non-loyalty customers per purchase platform? 

SELECT orders.purchase_platform, 
  CASE 
    WHEN loyalty_program =1 THEN 'loyalty_member'
    ELSE 'nonloyalty_menber' 
  END as loyalty_status,
  ROUND(AVG(DATE_DIFF(orders.purchase_ts, customers.created_on, day)),1) as days_to_purchase,
  ROUND(AVG(DATE_DIFF(orders.purchase_ts, customers.created_on, month)),1) as months_to_purchase,
  COUNT(*) as row_count
FROM core.customers
LEFT JOIN core.orders
  ON customers.id = orders.customer_id
GROUP BY 1,2
ORDER BY 1;

--(5) What is the average quarterly order COUNT and total sales for Macbooks sold in North America across all years? 
--Group purchases by quarter
WITH quarterly_metrics as (
SELECT 
  DATE_TRUNC(orders.purchase_ts, quarter) as purchase_quarter,
  COUNT(DISTINCT orders.id) as order_count,
  ROUND(SUM(orders.usd_price),2) as total_sales
FROM core.orders
LEFT JOIN core.customers
  ON orders.customer_id = customers.id
LEFT JOIN core.geo_lookup 
  ON customers.country_code = geo_lookup.country
WHERE 
  LOWER(orders.product_name) LIKE '%macbook%'
  AND region = 'NA'
GROUP BY 1
ORDER BY 1 DESC)

-- Calculate average order COUNT and sales in each quarter
SELECT 
  AVG(order_count) as avg_quarter_orderes,
  AVG(total_sales) as avg_quarter_sales
FROM quarterly_metrics;

-- (6a) what is the total number of customers and Average Order Value (AOV) per marketing cahannel

SELECT IFNULL(marketing_channel, 'unknown') as marketing_channel,
  COUNT(DISTINCT customer_id) as total_customers,
  ROUND(AVG(usd_price),2) as AOV
FROM core.customers
LEFT JOIN core.orders
  ON customers.id = orders.customer_id
GROUP BY 1
ORDER BY 1;

--(6b) Filter for only customers who placed above 3 orders total?

WITH filtered_orders as (
SELECT 
  DISTINCT customer_id,
FROM core.orders
GROUP BY 1
HAVING
 COUNT(DISTINCT orders.id) >3
)

SELECT marketing_channel,
  COUNT(DISTINCT customers.id) as no_of_customers,
  ROUND(AVG(usd_price),2) as AOV
FROM filtered_orders
LEFT JOIN core.orders using (customer_id)
LEFT JOIN core.customers
  ON customers.id = filtered_orders.customer_id
GROUP BY 1;


--(6c) For each of those active customers (WITH >3 orders), what are their top 3 most expensive orders?

WITH active_customers as (
SELECT
 DISTINCT customer_id,
FROM core.orders
GROUP BY 1
HAVING
 COUNT(DISTINCT orders.id)>3
),

customer_details as(
SELECT 
  active_customers.customer_id,
  orders.id as order_id,
  CASE 
    WHEN product_name ='27in"" 4k gaming monitor' THEN '27in 4K gaming monitor'
    ELSE product_name 
  END as clean_product_name,
  ROUND((usd_price),2) as usd_price
FROM active_customers
LEFT JOIN core.orders
  ON active_customers.customer_id = orders.customer_id
GROUP BY 1,2,3,4
)

SELECT *,
  ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY usd_price DESC) as ranking
FROM customer_details
QUALIFY ROW_NUMBER() OVER (PARTITION BY customer_id  ORDER BY usd_price DESC)<=3;
