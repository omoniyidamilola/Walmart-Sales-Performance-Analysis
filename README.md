# Walmart Sales Performance Analysis

![](Wallmart1.jpg)

## Overview
This project aims to delve into Walmart's sales data to uncover insights into top-performing branches, popular products, and customer behavior trends. The goal is to optimize sales strategies by identifying patterns that can enhance performance.

## Dataset Source
The dataset originates from the Kaggle Walmart Sales Forecasting Competition. It includes historical sales data from 45 Walmart stores across different regions. Each store encompasses multiple departments, and participants are tasked with predicting sales for each department within each store. The dataset also incorporates significant holiday markdown events, which are known to impact sales, though predicting their specific effects on departments remains challenging.

## Purposes Of The Project
The major aim of thie project is to gain insight into the sales data of Walmart to understand the different factors that affect sales of the different branches.

## Tools Used
Structured Query Language(SQL) and Power Bi

## About Data
The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition. This dataset contains sales transactions from a three different branches of Walmart, respectively located in Mandalay, Yangon and Naypyitaw. The data contains 17 columns and 1000 rows:

![](walmart_table.png)

Invoice_id     -         Invoice of the sales made

Branch         -         Branch at which sales were made

City           -         The location of the branch

Customer_type  -         The type of the customer

Gender         -         Gender of the customer making purchase

Product_line   -         Product line of the product self

Unit_price     -         The price of The price of each product

Quantity       -         The amount of the product sold

VAT            -         The amount of tax on the purchase

Total          -          The total cost of the purchase

Date           -          The date on which the purchase was made

Time           -          The time at which the purchase was maded

Payment_method -          The total amount paid

COGS           -           Cost Of Goods 

Gross_margin_percentage -  Gross margin percentage is a financial metric that shows the percentage of revenue that exceeds the cost of goods sold (COGS). 

Gross_income        -      This is the total revenue a company earns from its sales before deducting any expenses like operating costs, taxes, interest, and other expenses.

Rating            -        Rating refers to the score or assessment given by customers based on their satisfaction with a product or service.

## Analysis List

### Product Analysis

Conduct an analysis to understand different product lines, identify top-performing product lines, and pinpoint those needing improvement.

### Sales Analysis

Analyze sales trends to evaluate the effectiveness of current sales strategies and determine necessary modifications to increase sales.

### Customer Analysis

Identify different customer segments, uncover purchase trends, and assess the profitability of each segment.

## Approach Used

### Data Wrangling

The first step involves inspecting the data to detect and address NULL and missing values through data replacement methods.

(a) Build a database.

(b) Create tables and insert the data.

(c) Select columns with NULL values.

There are no NULL values in our database, as we set NOT NULL constraints for each field when creating the tables, thus filtering out NULL values.

### Feature Engineering

Generate new columns from existing ones to derive additional insights.

(a) Add a new column named time_of_day to categorize sales into Morning, Afternoon, and Evening, helping to identify when most sales occur.

(b) Add a new column named day_name to extract the days of the week (Mon, Tue, Wed, Thu, Fri) to determine which days are the busiest for each branch.

(c) Add a new column named month_name to extract the months of the year (Jan, Feb, Mar) to identify which months yield the highest sales and profit.

### Exploratory Data Analysis (EDA)

Perform EDA to answer the project’s key questions and objectives Using SQL.

## Conclusion 

## Business Questions to Answer

### Generic Questions

(a) How many unique cities are represented in the dataset?

(b) Which city is each branch located in?

(c) What is the total sales generated?

(d) How many items were sold in total?

### Product Questions

(a) How many unique product lines are present in the dataset?

(b) What is the average customer rating for each product line?

(c) What is the most commonly used payment method?

(d) What is the most selling product line?

(e) Which product line generated the highest sales?

(f) What is the total revenue by month?

(g) What month had the largest COGS?

(h) Which product line had the largest revenue?

(i) What is the city with the largest revenue?

(j) What product line had the largest VAT?

(k) Which branch sold more products than average product sold?

(l) What is the most common product line by gender?

(m) What is the average rating of each product line?

### Sales Questions

(a) What are the total sales for each branch?

(b) How much revenue was generated by each payment method?

(c) What is the gross margin percentage by branch?

(d) List all transactions where the total sales amount is above $500.

(e) Number of sales made in each time of the day per weekday

(f) How much tax has been collected in each city?

(g) Which of the customer types brings the most revenue?

(h) What is the total gross income generated in each city?

(i) Which city has the largest tax percent/ VAT (Value Added Tax)?

(j) Which customer type pays the most in VAT?

(k) How do sales vary by time of day (Morning, Afternoon, Evening)?

### Customer Questions

(a) How many unique customer types does the data have?

(b) How many unique payment methods does the data have?

(c)  Which customer type buys the most?

(d) What is the gender of most of the customers?

(e) What is the gender distribution per branch?

(f) Which time of the day do customers give most ratings?

(g) Which time of the day do customers give most ratings per branch?

(h) Which branch has the highest total sales?

(i) Which day of the week has the best average ratings?

(j) Which day of the week has the best average ratings per branch?

## Revenue And Profit Calculations

$ COGS = unitsPrice * quantity $

$ VAT = 5% * COGS $

$VAT$ is added to the $COGS$ and this is what is billed to the customer.

$ total (gross_sales) = VAT + COGS $

$ grossProfit(grossincome) = total (gross_sales) - COGS $

Gross Margin is gross profit expressed in percentage of the total (gross profit/revenue)

$ |text{Gross Marain} = |frac{|text{gross income}} {text{total revenue}} $

### Example with the first row in our Database:

### Data given:

  • $ \text{Unite Price} = 45.79 $
  • $ text{Quantity} = 7 $

$ COGS = 45.79 * 7 = 320.53 $

$ \text{VAT} = 5% * COGS\= 5% 320.53 = 16.0265$

$ total = VAT + COGS|= 16.0265 + 320.53 = $336.5565$

$ (text{Gross Margin Percentage} = (fracf|text{gross income}/text{totalrevenue}}|=\frac{16.0265}{336.5565} = 0.047619||approx 4.7619% $

## Code

Please refer to the [Walmart Sales Project SQL file](https://github.com/omoniyidamilola/Walmart-Sales-Performance-Analysis/blob/main/Walmart%20Sales%20Project.sql).

## Answers to the Questions

![](walmart_sales_dashboard.png)

Link to the interactive dashboard [here](https://app.powerbi.com/view?r=eyJrIjoiMjQ1YWE5YmQtNzlkNC00OTVhLWE5ZjItZDhhNzRmNWZiNjJmIiwidCI6ImRmODY3OWNkLWE4MGUtNDVkOC05OWFjLWM4M2VkN2ZmOTVhMCJ9)
### Unique Cities and Branches:

- Yangon: Branch A,
- Mandalay: Branch B,
- Naypyitaw: Branch C
  
•	Total Sales: $320,886.39

•	Total Quantity Sold: 5,472 units

•	Unique Products: 6

### Customer Ratings

•	Average Rating by Product Line:

-	 Highest: Food and Beverage - 7.11,
-	 Second Highest: Fashion Accessories,
-	 Lowest: Health and Beauty - 6.98

### Payment Methods

•	Most Common Payment Methods: 	Cash: 344 transactions,	Ewallet: 342 transactions, and	Credit Card: 309 transactions

•	Sales Revenue by Payment Method: 	Cash: $112,206.57,	Ewallet: $108,330.04,	Credit Card: $100,349.78

### Product Line Performance

•	Most Sold by Count:	Fashion Accessories: 178 units,	Food and Beverage: 174 units,	Electronics Accessories: 169 units,	Lowest: Sports and Travel - 163 units

•	Highest Sales Generated:	Food and Beverage: $56,144.84,	Fashion Accessories: $54,305.90,	Lowest: Health and Beauty - $48,854.38

•	Largest VAT:	Home and Lifestyle: $16.03,	Sports and Travel: $15.76,	Lowest: Fashion Accessories - $14.53

### Sales Performance by Branch and City

•	Total Sales by Branch:	Branch A (Yangon): $105,861.01,	Branch B (Mandalay): $104,534.61,	Branch C (Naypyitaw): $110,490.76

•	Products Sold by Branch:	Branch A: 1,849 units,	Branch B: 1,795 units,	Branch C: 1,828 units

•	Tax Collected: Naypyitaw: $5,261.47,	Yangon: $5,041.00,	Mandalay: $4,977.84

### Monthly Revenue

•	January: $116,291.87 has the	Highest Sales,	March has $108,867.15 sales, February  has the Lowest Sales of $95,727.38		

•	Most Common Product Line by Gender

- Female:	Fashion Accessories: 96 units and	Food and Beverage: 90 units,

- Male:	Health and Beauty: 88 units

•	Gender Distribution:

- Male: 498,

- Female: 497

•	Sales by Time of Day

- Evening: $137,365.27,

- Afternoon: $122,276.61,

- Morning: $61,244.51

•	Sales Count by Time of Day

-	Evening: 56, Afternoon: 48,	Morning: 20

•	Customer Ratings by Time of Day

-	Afternoon: 7.0,	Morning: 6.9,	Evening: 6.9

### Customer Type Analysis

•	Revenue by Customer Type

-	Member: $16,362.10,

-	Normal: $17,261.29

•	VAT Paid by Customer Type

- Member: $15.61,

- Normal: $15.01

### Weekly Performance

•	Best Average Rating by Day

- Monday and Friday: 7.1,
- Lowest: Wednesday - 6.8

## Recommendations to Improve Walmart's Sales Performance

### Enhance Product Line Focus

 •	Food and Beverage: Since this category has the highest sales and customer ratings, consider expanding the variety and availability of food and beverage products. Implementing promotions and discounts can further boost sales in this category.

 •	Fashion Accessories: With high sales and strong customer preference among females, increasing the range and promoting fashion accessories through targeted marketing campaigns can drive more sales.

 •	Health and Beauty: Given that this category has the lowest sales and customer ratings, improving product quality, offering better promotions, and gathering customer feedback to address their concerns can help enhance its performance.

### Optimize Payment Methods

 •	Cash and Ewallet: As these payment methods are the most popular, ensure that checkout processes for these methods are efficient and seamless. Implement loyalty programs or discounts for cash and ewallet users to encourage repeat purchases.

 •	Credit Card Promotions: Since credit card transactions are less frequent, introducing special credit card discounts or cashback offers can encourage more customers to use this payment method, potentially increasing overall sales.

### Monthly Promotions

•	January and March: Capitalize on these high revenue months by running major sales events and promotions. Analyze the factors contributing to higher sales in these months and replicate successful strategies during other months.

•	February: Focus on boosting sales during this traditionally low performing month by introducing special offers, and loyalty rewards.

### Targeted Marketing and Customer Segmentation

•	Gender Specific Campaigns: Tailor marketing campaigns to address the preferences of different genders. For example, promote fashion accessories and food and beverages to female customers, while emphasizing health and beauty products to male customers.

•	Customer Type Promotions: Develop exclusive offers for both member and normal customers. Encourage normal customers to join the membership program by highlighting the benefits and exclusive deals available to members.

### Improve Customer Experience

•	Product Ratings and Reviews: Encourage customers to leave reviews and ratings, especially for lower rated categories like health and beauty and home and lifestyle. Use this feedback to make necessary improvements and address customer concerns.

•	Customer Feedback: Implement regular surveys and feedback mechanisms to understand customer needs and preferences better. Use this information to make data driven decisions and improve product offerings and services.

### Time based Sales Strategies

•	Evening Sales: With the highest sales occurring in the evening, consider extending store hours or offering evening specific promotions to attract more customers during this peak time.

•	Morning and Afternoon Promotions: Introduce special morning and afternoon discounts or loyalty points to drive sales during these times and balance out the sales distribution throughout the day.

### Branch Strategies

Analyzing the sales performance of Branch C (Naypyitaw) in comparison to Branch A (Yangon) and Branch B (Mandalay) can provide insights into factors contributing to its higher sales. Here are some potential factors and actions Branch C might be taking that the other branches could consider

### Factors Affecting Sales Performance

### 1.  Location and Demographics

 •	Population Density: Branch C might be located in an area with a higher population density or more affluent residents, leading to higher foot traffic and sales.

 •	Customer Demographics: The demographic profile of customers, such as income levels, lifestyle preferences, and spending behavior, might be more favorable in Naypyitaw.

### 2. Product Selection and Inventory Management

 •	Product Availability: Branch C may have a better selection of popular products and higher stock levels, ensuring that customer demand is consistently met.

 •	Product Variety: Offering a wider range of products or exclusive items that are not available in other branches could attract more customers.

### 3.  Marketing and Promotions

  •	Targeted Marketing: Branch C might be executing more effective marketing campaigns, utilizing local media, social media, and targeted promotions to attract customers.

 •	Promotional Events: Frequent and appealing promotional events, such as sales, discounts, and loyalty programs, could be driving higher sales.

### 4.  Customer Service and Experience
 
 •	Quality of Service: Superior customer service, including knowledgeable staff, efficient checkout processes, and a pleasant shopping environment, can enhance customer satisfaction and loyalty.

 •	Customer Engagement: Branch C might be more actively engaging with customers through feedback mechanisms, loyalty programs, and personalized services.

### 5.  Operational Efficiency
 
 •	Store Layout: An optimized store layout that enhances the shopping experience and makes it easier for customers to find products could contribute to higher sales.

 •	Operational Hours: Longer operational hours or flexible timing to cater to customer convenience might be a factor.

### 6.     Local Community Engagement

 •	Community Involvement: Branch C might be more involved in local community events, sponsorships, and partnerships, fostering a strong community presence and loyalty.

 •	Local Preferences: Understanding and catering to the specific preferences and needs of the local community can significantly impact sales.

 #### Recommendations for Branches A and B

1.	Conduct Market Research: Understand the local demographics, preferences, and behavior of customers in Yangon and Mandalay. Tailor product offerings and marketing strategies to meet these needs.

2.	Enhance Product Selection: Ensure that popular and high-demand products are always in stock. Consider introducing exclusive items and expanding the product variety.

3.	Improve Marketing Efforts: Increase marketing efforts through local advertising, social media campaigns, and targeted promotions. Highlight unique selling points and promotions to attract customers.

4.	Focus on Customer Service: Train staff to provide excellent customer service, enhance the in store experience, and create a welcoming shopping environment. Implement efficient checkout processes to reduce wait times.

5.	Engage with the Community: Increase involvement in local events, sponsorships, and partnerships. Build a strong community presence to foster customer loyalty.

6.	Optimize Store Layout and Operations: Review and optimize store layouts to enhance the shopping experience. Consider extending operational hours to cater to customer convenience.

7.	Leverage Feedback and Data: Collect and analyze customer feedback regularly to identify areas for improvement. Use sales data to inform decision making and tailor strategies.

By analyzing and replicating successful strategies from Branch C, and addressing the specific needs and preferences of their local customer base, Branches A and B can work towards improving their sales performance.

•	Branch A (Yangon): With the highest number of products sold, focus on maintaining stock levels and ensuring a wide variety of popular products are available.

•	Branch C (Naypyitaw): Since this branch has the highest sales revenue, analyze the successful strategies used here and apply them to other branches. Additionally, focus on further enhancing customer service and product availability.

•	Branch B (Mandalay): Implement strategies to increase sales, such as localized promotions, community engagement, and improving the shopping experience to attract more customers.

### VAT and Tax Strategies

•	City Tax Analysis: Leverage the data on VAT collection to optimize pricing strategies and tax efficient practices across different cities. Ensure compliance and transparency in tax collection to build customer trust.

## Conclusion

By focusing on product line improvements, optimizing payment methods, leveraging seasonal trends, targeting specific customer segments, enhancing customer experience, implementing time based sales strategies, and applying branch tactics, Walmart can significantly improve its sales performance. Regularly analyzing sales data and adapting strategies based on customer feedback and market trends will help sustain growth and drive profitability.

## Thanks for following through

![](Thank_You.jpeg)
