# Elist_Analysis
# Company Profile
Elist is an e-commerce company that specialises in electronics products including high-demand brands such as Apple, Samsung, and Lenovo. It was founded in 2018 and has since expanded to a global customer base selling through its online sales platform and mobile app. The company also uses multiple marketing channels such as email campaigns, SEO, and affiliate partnerships to reach its customers. 

### Project Goals
Elist is prioritising the analysis of its underutilised dataset comprising orders, order statuses, customers, products, and geographic data with an aim to identify opportunities that help cross-functional teams including  finance, sales, product and marketing to improve business performance and drive data-informed decision-making. The insights generated will be beneficial in providing actionable next steps to support growth within a competitive landscape.

The Entity Relationship Diagram can be found [here](ERD.png)

# Executive Summary
**From 2019  to 2022, Elist total sales is valued at $28M with an average order value (AOV) of $260 per customer from 108K orders across all years**.
Within the four year period, the number of orders and sales volume grew by 28% respectively.

- **Notably, 2020 had the the highest values in sales revenue ($10M), average order value ($300) and order quantity(34K)**. This sales boom, representing a twofold increase from the previous year, reflects a change in consumer's purchasing pattern to online ordering during the COVID pandemic.

- However, sales have declined significantly by 46% from 2021 to 2022. Developing strategies to sustain the value captured in 2020 and 2021 is vital in maximizing key business KPIs and driving long term growth.
  

# Deep-dive Insights

## Seasonality
<img width="907" alt="Screenshot 2025-06-05 at 12 33 11 pm" src="https://github.com/user-attachments/assets/d6b962a6-6437-42c6-bae7-5e4dbd7fcaca" />

- **Year-over-year monthly analysis show that November and December stand out as peak revenue performance periods across all years** with monthly growth rates reaching 35% and 33% respectively. This seasonal trend indicates increased  consumer demand during holiday periods,  enhanced by strategic promotional campaigns (including Black Friday deals), and increased market activity during the Q4 festive season.
- **In contast, the weakest performing months Feburary and October with the lowest drop by 33% and 55% in 2022**.
-  The seasonal trends reveals customers purchase patterns and can be leveraged to optimize product launches and targeted advertising efforts, thereby driving additional sales.
-  **Focusing on the peak sales year in 2020, March was the the primary driver of with a 50% surge in sales compared to the previous month**. The uniformity of this trend across all regions suggests that it was driven by the height of the COVID-19 crisis, where restrictions and shifts to remote work environments stimulated increased purchases of electronic devices.

## Product Trends
- Of Elist’s 8 core products, **the Gaming Monitor consistently leads in performance, generating $9.8M in revenue, accounting for an average of 35% of total sales.** With 23,000 orders and an AOV of $421, this product shows strong price-market fit and high demand. MacBook laptops and Apple headphones rank as the second and third top-performing products.
  
- **From a brand perspective, Apple dominates across product categories**,driven by Airpods headphones and macbook laptops
  - **Apple Headphones** lead in order volume with over **48,000 units sold** despite a lower AOV of $160.
  - **MacBook Laptops** yielded the highest customer spend with an **AOV of $1,588** and total revenue of $6.3M.
  - **Conversely, Apple iPhones underperform relative to other Apple products**, contributing second-lowest total sales volume with only 288 orders across the four years, **albeit an average customer spend of $740, which is 3times the overall product average**. Further analysis shows that Apple iPhones have only one unique product_id, while other Apple products have at least five. This suggests limited iPhone model variety in stock. Expanding the iPhone selection range and implementing cross-selling with high-demand Apple products could improve iPhone sales performance.

- Lastly, Bose Headphones rank lowest across all performance indicators with sales, order count, and AOV; signaling limited market traction.



### Global reach
- North America leads regional sales performance, generating $14.5 million in revenue and 56,000 orders which represents 52% of total sales and order volume respectively.
- The gaming monitor,Macbook laptops and Apple headphones  account for at least 75 % of sales across all regions. However, Apple headphones outperform MacBooks in EMEA and North America, deviating from the overall global product ranking.
-APAC has shown the most significant growth in customer spend. The average customer spend rose from the lowest ($212) among all regions in 2019 to the highest($317) from 2020 onwards, consistently exceeding the global average through 2022. This trend is driven by increased laptop purchases and improved operational efficiences 
  - In 2020, APAC saw a five fold increase in purchases of Macbook laptops and 3.6times in Thinkpad laptops products which drove the spike in total sales and AOV.
  - Operational improvements supported this growth as APAC had the largest gains in logistics metrics across all regions, cutting its average shipping time from 3 days in 2019 to under 2 days in 2022, while delivery times improved from over 8 days to 7.5 days. These results show the region’s agility and rebound from COVID-19 constraints.
  
  


## Loyalty Program
To assess the impact of Elist's loyalty program, non-loyalty and loyalty members where compared across sales, AOV and the number of repeated purchases.
- Sales: Non-loyalty members generated more sales revenue from 2019 to 2020 reaching a peak of $788K in September 2020. However, sales from loyalty customers outperformed non-loyalty customers in 2021 and 2022 with a maximum revenue of 508K in December 2021. Although the total sales amount from non-loyalty customers exceed loyalty cusomers , loyalty sales share has risen from 11% to 41% over the four-year period, indicating stronger retention compared to non-loyalty customers.
  
- AOV: Loyal customers spend increased by 93% from march to Septembr 2019  and remained fairly consistent ($200-$250) despite fluctuations in sales in 2021 and 2022. Contrastly, non-loyalty members show a volume driven trend with spikes corresponding to sales.
- Both loyalty and Non-loyalty sales  and AOV fall sharply in late (Oct- Dec) 2022, which may reflect broader market changes to pre-pandemic levels

- Repeated purchases: Of all registered customers, 70,000 made a single purchase while 4,600 placed multiple orders. Notably, 4,500 of these repeat purchasers were non-loyalty customers, compared to only 154 loyalty members. This gap highlights that the current loyalty program is not influencing repeat purchases.





## Recommendations
Based on the analysis, the company should implement the following recommendations 
### Target high-performing products and optimise product portfolio
- Leverage Apple’s strong product portfolio to build closer partnerships with distributors, secure volume discounts and expand the range and model of apple devices, particulatly iphones, to ensure a resilient supply chain and steady stock with competitive pricing. This approach will enhances the company's profit margins and delivers greater value and choice  to customers.
- Assess the underperformance of Bose headphones to determine whether to replace, reprice, or discontinue the product.

### Implement Promotional strategies
-  Incorporate sales promotions into established seasonal patterns to maximize revenue opportunities. For example, end-of-year sales bundles in November and December and introduce summer holiday promotions around mid-year. Customer profiles and seasonal demand trends should be further investigated to ensure these campaigns are tailored to the customers needs and deliver stronger conversion rates.
- Additionally, implement cross-sell strategies by recommending complementary products, bundling high-demand items with accessories and providing service support packages to increase the revenue per customer.

### Accelerate Growth in APAC region:
- APAC’s high customer spend and operational efficiency makes it a high-potential market. Starting with the region’s leading players—Japan, Australia, and India—marketing efforts should be scaled up, supported by expanded laptop inventory and localized promotions, with a focus on MacBook and ThinkPad models.

- Further investment in logistics excellence is recommended, as prior shipping improvements have already enhanced customer satisfaction; faster delivery could become a key competitive differentiator. This is particularly relevant given APAC’s status as a prominent manufacturing and assembly hub for premium electronic devices.

### Augument and monitor Loyalty Program
  :Continue and augment the loyalty programme – clarify and augment the benefits to include faster delivery guarantees, early access to deals, and exclusive discounts.
It may need rethinking — either making it more rewarding, easier to join, or better aligned with what your natural repeat buyers actually value.
Work with the products team to investigate the high refund rates of the ThinkPad Laptop and Macbook Air Laptop while improving product descriptions and photos.


caveat
- profit
