 CREATE DATABASE IF NOT EXISTS salesDataWalmart;

CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    VAT FLOAT(6, 4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment_method VARCHAR(15) NOT NULL,
    cogs DECIMAL(10, 2) NOT NULL,
    gross_margin_percentage FLOAT(11, 9) NOT NULL,
    gross_income DECIMAL(12, 4) NOT NULL,
    rating FLOAT(2,1) 
    );
    
SELECT *
FROM salesdatawalmart.sales;


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------- Feature Engineering------------------------------------------------------------------------------------------------

--------- time_of_day
SELECT
    time,
    CASE
        WHEN time BETWEEN '00:00:00' AND '11:59:59' THEN 'Morning'
        WHEN time BETWEEN '12:00:00' AND '15:59:59' THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sales;

ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

UPDATE sales
SET time_of_day = (
    CASE
        WHEN time BETWEEN '00:00:00' AND '11:59:59' THEN 'Morning'
        WHEN time BETWEEN '12:00:00' AND '15:59:59' THEN 'Afternoon'
        ELSE 'Evening'
    END
);

---- day_name
SELECT 
    date,
    DAYNAME(date) AS day_name
FROM sales;

ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);

UPDATE sales
SET day_name = DAYNAME(date);

---- month_name

SELECT 
	date,
    MONTHNAME(date)
FROM sales;

ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

UPDATE sales
SET month_name = MONTHNAME(date);
-------------------------------------------------------------------------------------------------------------

------------------------------------ Generic Question --------------------------------------------------------------------

 ----------------- How many unique cities does the data have?
SELECT 
    DISTINCT city
FROM sales;

---------- In which city is each branch?
SELECT 
    DISTINCT branch
FROM sales;

SELECT 
    DISTINCT branch,
    city
FROM sales;

----- What is the total sales generated?
SELECT
    SUM(Total) AS Total_Sales
FROM sales;

---- Total Quantity Sold:
-----   How many items were sold in total?
SELECT
    SUM(Quantity) AS Total_Quantity 
FROM sales;

------------------------------------------- Product Questions ------------------------------------
----- How many unique product lines does the data have?
SELECT 
   COUNT(DISTINCT product_line)
FROM sales;

------- What is the average customer rating for each product line?
SELECT 
    product_line, 
    AVG(Rating) AS Average_rating
FROM sales
GROUP BY Product_line;

------- What is the most common payment method?
SELECT 
	payment_method,
    COUNT(payment_method) AS count
FROM sales
GROUP BY payment_method
ORDER BY count DESC;

------ What is the most selling product line?
SELECT 
	product_line,
    COUNT(product_line) AS count
FROM sales
GROUP BY product_line
ORDER BY count DESC;

------- Which product line generated the highest sales?
SELECT 
    Product_line, 
    SUM(Total) AS Total_Sales
FROM sales
GROUP BY Product_line
ORDER BY Total_Sales DESC
LIMIT 1;

------ What is the total revenue by month?
SELECT 
    month_name AS month,
    SUM(total) AS total_revenue
FROM sales
GROUP  BY month_name
ORDER BY total_revenue DESC;

----- What month had the largest COGS?
SELECT 
	month_name AS month,
    SUM(cogs) AS cogs
FROM sales
GROUP BY month_name
ORDER BY cogs DESC;

-------- What product line had the largest revenue?
SELECT
    product_line,
    SUM(total) AS total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;

------- What is the city with the largest revenue?
SELECT
    branch,
    city,
    SUM(total) AS total_revenue
FROM sales
GROUP BY branch, city
ORDER BY total_revenue DESC;

----- What product line had the largest VAT?
SELECT
    product_line,
    AVG(VAT) AS avg_tax
FROM sales
GROUP BY product_line
ORDER BY avg_tax DESC;

----------- Which branch sold more products than average product sold?
SELECT 
    branch,
    SUM(quantity) AS qty
FROM sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales);

----- What is the most common product line by gender?
SELECT 
    gender,
    product_line,
    COUNT(gender) AS total_count
FROM sales
GROUP BY gender, product_line
ORDER BY total_count DESC;

---------- What is the average rating of each product line?
SELECT 
    ROUND(AVG(rating), 2) AS avg_rating,
    product_line
FROM sales 
GROUP BY product_line
ORDER BY avg_rating DESC;


--------------------------------- Sales Questions -------------------------------------------------
--------------------------------------------------------------------------------------------------
-------- What are the total sales for each branch?
SELECT 
    Branch,  
    SUM(Total) AS Total_Sales
FROM sales
GROUP BY Branch;

------- How much sales revenue was generated by each payment method?
SELECT 
    payment_method, 
    SUM(Total) AS Total_Sales
FROM sales
GROUP BY payment_method
ORDER BY Total_Sales DESC;

------- What is the gross margin percentage by branch?
SELECT 
    Branch, 
    AVG(gross_margin_percentage) AS Average_Gross_Margin
FROM sales
GROUP BY Branch;

----- List all transactions where the total sales amount is above $500.
SELECT *
FROM sales
WHERE Total > 500;

------------ Number of sales made in each time of the day per weekday
SELECT
    time_of_day,
    COUNT(*) AS total_sales
FROM sales
WHERE day_name = "Monday"
GROUP BY time_of_day
ORDER BY total_sales DESC;

------ How much tax has been collected in each city?
SELECT 
    city, 
    SUM(VAT) AS Total_Tax
FROM sales
GROUP BY city;

------- Which of the customer types brings the most revenue?
SELECT 
    customer_type,
    SUM(total) AS total_revenue
FROM sales
GROUP BY customer_type
ORDER BY total_revenue;

------ What is the total gross income generated in each city?
SELECT 
    city, 
    SUM(gross_income) AS Total_Gross_Income
FROM sales
GROUP BY city;

-------------- Which city has the largest tax percent/ VAT (Value Added Tax)?
SELECT
    city,
    AVG(VAT) AS VAT
FROM sales
GROUP BY city
ORDER BY VAT;

------------- Which customer type pays the most in VAT?
SELECT 
    customer_type,
    AVG(VAT) AS VAT
FROM sales
GROUP BY customer_type
ORDER BY VAT DESC;

------ How do sales vary by time of day (Morning, Afternoon, Evening)?
SELECT 
    CASE
        WHEN Time BETWEEN '00:00:00' AND '11:59:59' THEN 'Morning'
        WHEN Time BETWEEN '12:00:00' AND '15:59:59' THEN 'Afternoon'
        ELSE 'Evening'
    END AS Time_of_Day,
    SUM(Total) AS Total_Sales
FROM sales
GROUP BY 
    CASE
        WHEN Time BETWEEN '00:00:00' AND '11:59:59' THEN 'Morning'
        WHEN Time BETWEEN '12:00:00' AND '15:59:59' THEN 'Afternoon'
        ELSE 'Evening'
    END;


-------------------------------- Customer Questions ---------------------------------------------------
-------------------------------------------------------------------------------------------------------
------------- How many unique customer types does the data have?
SELECT 
    DISTINCT customer_type
FROM sales;

--------- How many unique payment methods does the data have?
SELECT 
    DISTINCT payment_method
FROM sales;

---------- Which customer type buys the most?
SELECT
    customer_type,
    COUNT(*) AS customer_count
FROM sales
GROUP BY customer_type;

------------- What is the gender of most of the customers?
SELECT
    gender,
    COUNT(*) AS gender_count
FROM sales
GROUP BY gender
ORDER BY gender_count DESC;

------------- What is the gender distribution per branch?
SELECT
    gender,
    COUNT(*) AS gender_count
FROM sales
WHERE branch = "A"
GROUP BY gender
ORDER BY gender_count DESC;

SELECT
    gender,
    COUNT(*) AS gender_count
FROM sales
WHERE branch = "B"
GROUP BY gender
ORDER BY gender_count DESC;

SELECT
    gender,
    COUNT(*) AS gender_count
FROM sales
WHERE branch = "C"
GROUP BY gender
ORDER BY gender_count DESC;

------ Which time of the day do customers give most ratings?
SELECT
    time_of_day,
    AVG(rating) AS avg_rating
FROM sales
GROUP BY time_of_day
ORDER BY avg_rating DESC;

-------------- Which time of the day do customers give most ratings per branch?
SELECT
    time_of_day,
    AVG(rating) AS avg_rating
FROM sales
WHERE branch = "A"
GROUP BY time_of_day
ORDER BY avg_rating DESC;

------ Which branch has the highest total sales?
SELECT 
    Branch, 
    SUM(Total) AS Total_Sales
FROM sales
GROUP BY Branch
ORDER BY Total_Sales DESC
LIMIT 1;

---------- Which day of the week has the best avg ratings?
SELECT
    day_name,
    AVG(rating) AS average_rating
FROM sales
GROUP BY day_name
ORDER BY average_rating DESC;

------- Which day of the week has the best average ratings per branch?
SELECT
    day_name,
    AVG(rating) AS average_rating
FROM sales
WHERE branch = "A"
GROUP BY day_name
ORDER BY average_rating DESC;


