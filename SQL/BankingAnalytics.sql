CREATE DATABASE BankingAnalytics;

USE BankingAnalytics;

CREATE TABLE banking_data (
    trans_date_trans_time DATETIME,
    cc_num BIGINT,
    merchant VARCHAR(255),
    category VARCHAR(100),
    amt DECIMAL(10,2),
    gender VARCHAR(10),
    city VARCHAR(100),
    state VARCHAR(10),
    lat DECIMAL(10,6),
    longitude DECIMAL(10,6),
    city_pop INT,
    job VARCHAR(255),
    dob DATE,
    merch_lat DECIMAL(10,6),
    merch_long DECIMAL(10,6),
    is_fraud INT,
    Age INT,
    Age_Group VARCHAR(20),
    Year INT,
    Month VARCHAR(20),
    Day VARCHAR(20),
    Hour INT
);

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/banking_cleaned.csv'
INTO TABLE banking_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT COUNT(*) FROM banking_data;

SELECT COUNT(*) AS Total_Rows
FROM banking_data;

SELECT *
FROM banking_data
LIMIT 10;

-- Check for NULL values:
SELECT
SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Age_Nulls,
SUM(CASE WHEN Age_Group IS NULL THEN 1 ELSE 0 END) AS AgeGroup_Nulls
FROM banking_data; 



-- =========================================
 --   PAGE 1 : EXECUTIVE OVERVIEW DASHBOARD
-- =========================================

--  Total Transactions 

SELECT COUNT(*) AS Total_Transactions
FROM banking_data;


--  Total Revenue 

SELECT
ROUND(SUM(amt),2) AS Total_Revenue
FROM banking_data;


--  Fraud Rate Percentage 

SELECT
ROUND(
SUM(is_fraud) * 100.0 / COUNT(*),
2
) AS Fraud_Rate_Percentage
FROM banking_data;


-- . Revenue by Category 

SELECT
category,
ROUND(SUM(amt),2) AS Revenue
FROM banking_data
GROUP BY category
ORDER BY Revenue DESC;


-- . Monthly Revenue Trend 

SELECT
Month,
ROUND(SUM(amt),2) AS Revenue
FROM banking_data
GROUP BY Month
ORDER BY Revenue DESC;





-- =========================================
-- PAGE 2 : FRAUD ANALYSIS DASHBOARD
-- =========================================


-- Total Fraud Transactions

SELECT
COUNT(*) AS Total_Fraud_Transactions
FROM banking_data
WHERE is_fraud = 1;


-- Fraud Cases by Category

SELECT
category,
COUNT(*) AS Fraud_Count
FROM banking_data
WHERE is_fraud = 1
GROUP BY category
ORDER BY Fraud_Count DESC;


-- Top 10 States with Highest Fraud

SELECT
state,
COUNT(*) AS Fraud_Count
FROM banking_data
WHERE is_fraud = 1
GROUP BY state
ORDER BY Fraud_Count DESC
LIMIT 10;


-- Fraud by Gender

SELECT
gender,
COUNT(*) AS Fraud_Count
FROM banking_data
WHERE is_fraud = 1
GROUP BY gender
ORDER BY Fraud_Count DESC;


-- Fraud by Hour

SELECT
Hour,
COUNT(*) AS Fraud_Count
FROM banking_data
WHERE is_fraud = 1
GROUP BY Hour
ORDER BY Hour;


-- Fraud by Age Group

SELECT
Age_Group,
COUNT(*) AS Fraud_Count
FROM banking_data
WHERE is_fraud = 1
GROUP BY Age_Group
ORDER BY Fraud_Count DESC;







-- =========================================
-- PAGE 3 : TRANSACTION ANALYSIS DASHBOARD
-- =========================================


-- Average Transaction Amount

SELECT
ROUND(AVG(amt),2) AS Avg_Transaction_Amount
FROM banking_data;


-- Revenue by Category

SELECT
category,
COUNT(*) AS Total_Transactions,
ROUND(SUM(amt),2) AS Total_Revenue,
ROUND(AVG(amt),2) AS Avg_Amount
FROM banking_data
GROUP BY category
ORDER BY Total_Revenue DESC;


-- Top 10 States by Revenue

SELECT
state,
COUNT(*) AS Total_Transactions,
ROUND(SUM(amt),2) AS Revenue,
ROUND(AVG(amt),2) AS Avg_Transaction
FROM banking_data
GROUP BY state
ORDER BY Revenue DESC
LIMIT 10;


-- Monthly Revenue & Transaction Trend

SELECT
Month,
COUNT(*) AS Total_Transactions,
ROUND(SUM(amt),2) AS Revenue,
ROUND(AVG(amt),2) AS Avg_Transaction
FROM banking_data
GROUP BY Month
ORDER BY Revenue DESC;


-- Transactions by Hour

SELECT
Hour,
COUNT(*) AS Transactions,
ROUND(SUM(amt),2) AS Revenue
FROM banking_data
GROUP BY Hour
ORDER BY Hour;


-- Peak Transaction Hour

SELECT
Hour,
COUNT(*) AS Transactions
FROM banking_data
GROUP BY Hour
ORDER BY Transactions DESC
LIMIT 1;


-- Peak Transaction Day

SELECT
Day,
COUNT(*) AS Transactions
FROM banking_data
GROUP BY Day
ORDER BY Transactions DESC
LIMIT 1;


-- Top Transaction Category

SELECT
category,
COUNT(*) AS Transactions,
ROUND(SUM(amt),2) AS Revenue
FROM banking_data
GROUP BY category
ORDER BY Transactions DESC
LIMIT 1;


-- Amount Group Analysis

SELECT
Amount_Group,
COUNT(*) AS Transactions,
ROUND(SUM(amt),2) AS Revenue,
ROUND(AVG(amt),2) AS Avg_Amount
FROM banking_data
GROUP BY Amount_Group
ORDER BY Revenue DESC;

-- Transaction Amount Analysis

SELECT
CASE
    WHEN amt <= 50 THEN 'Very Low'
    WHEN amt <= 100 THEN 'Low'
    WHEN amt <= 500 THEN 'Medium'
    WHEN amt <= 1000 THEN 'High'
    WHEN amt <= 5000 THEN 'Very High'
    ELSE 'Extreme'
END AS Amount_Group,
COUNT(*) AS Transactions,
ROUND(SUM(amt),2) AS Revenue,
ROUND(AVG(amt),2) AS Avg_Amount
FROM banking_data
GROUP BY Amount_Group
ORDER BY Revenue DESC;





-- =========================================
-- PAGE 4 : CUSTOMER ANALYSIS DASHBOARD
-- =========================================


-- Customers by Gender

SELECT
gender,
COUNT(*) AS Total_Customers
FROM banking_data
GROUP BY gender
ORDER BY Total_Customers DESC;


-- Customers by Age Group

SELECT
Age_Group,
COUNT(*) AS Total_Customers
FROM banking_data
GROUP BY Age_Group
ORDER BY Total_Customers DESC;


-- Top 10 Cities by Transactions

SELECT
city,
COUNT(*) AS Total_Transactions
FROM banking_data
GROUP BY city
ORDER BY Total_Transactions DESC
LIMIT 10;


-- Average Spend by Gender

SELECT
gender,
ROUND(AVG(amt),2) AS Avg_Spend,
ROUND(SUM(amt),2) AS Total_Revenue
FROM banking_data
GROUP BY gender
ORDER BY Avg_Spend DESC;


-- Average Spend by Age Group

SELECT
Age_Group,
ROUND(AVG(amt),2) AS Avg_Spend,
ROUND(SUM(amt),2) AS Total_Revenue
FROM banking_data
GROUP BY Age_Group
ORDER BY Avg_Spend DESC;


-- Top 10 Jobs by Revenue

SELECT
job,
COUNT(*) AS Total_Transactions,
ROUND(SUM(amt),2) AS Revenue,
ROUND(AVG(amt),2) AS Avg_Spend
FROM banking_data
GROUP BY job
ORDER BY Revenue DESC
LIMIT 10;


-- Top 10 Jobs by Transactions

SELECT
job,
COUNT(*) AS Transactions
FROM banking_data
GROUP BY job
ORDER BY Transactions DESC
LIMIT 10;


-- Customer Distribution by State

SELECT
state,
COUNT(*) AS Customers
FROM banking_data
GROUP BY state
ORDER BY Customers DESC
LIMIT 10;


-- Revenue Contribution by Age Group

SELECT
Age_Group,
ROUND(SUM(amt),2) AS Revenue
FROM banking_data
GROUP BY Age_Group
ORDER BY Revenue DESC;


-- Revenue Contribution by Gender

SELECT
gender,
ROUND(SUM(amt),2) AS Revenue
FROM banking_data
GROUP BY gender
ORDER BY Revenue DESC;



-- =========================================
-- PAGE 5 : ADVANCED REPORTS & INSIGHTS
-- =========================================


-- Q21: Overall Business Summary

SELECT
COUNT(*) AS Total_Transactions,
ROUND(SUM(amt),2) AS Total_Revenue,
ROUND(AVG(amt),2) AS Avg_Transaction,
SUM(is_fraud) AS Total_Fraud_Cases,
ROUND(SUM(is_fraud)*100/COUNT(*),2) AS Fraud_Rate
FROM banking_data;


-- Q22: Top Revenue State with Contribution %

SELECT
state,
ROUND(SUM(amt),2) AS Revenue,
ROUND(
SUM(amt)*100/
(SELECT SUM(amt) FROM banking_data),
2
) AS Revenue_Contribution_Percentage
FROM banking_data
GROUP BY state
ORDER BY Revenue DESC
LIMIT 10;


-- Q23: Top Revenue Categories with Contribution %

SELECT
category,
ROUND(SUM(amt),2) AS Revenue,
ROUND(
SUM(amt)*100/
(SELECT SUM(amt) FROM banking_data),
2
) AS Revenue_Contribution_Percentage
FROM banking_data
GROUP BY category
ORDER BY Revenue DESC;


-- Q24: Fraud Contribution by State

SELECT
state,
COUNT(*) AS Fraud_Cases,
ROUND(
COUNT(*)*100/
(
SELECT COUNT(*)
FROM banking_data
WHERE is_fraud = 1
),
2
) AS Fraud_Contribution_Percentage
FROM banking_data
WHERE is_fraud = 1
GROUP BY state
ORDER BY Fraud_Cases DESC
LIMIT 10;


-- Q25: Fraud Contribution by Category

SELECT
category,
COUNT(*) AS Fraud_Cases,
ROUND(
COUNT(*)*100/
(
SELECT COUNT(*)
FROM banking_data
WHERE is_fraud = 1
),
2
) AS Fraud_Contribution_Percentage
FROM banking_data
WHERE is_fraud = 1
GROUP BY category
ORDER BY Fraud_Cases DESC;


-- Q26: Peak Transaction Hours Ranking

SELECT
Hour,
COUNT(*) AS Transactions,
RANK() OVER(
ORDER BY COUNT(*) DESC
) AS Hour_Rank
FROM banking_data
GROUP BY Hour;


-- Q27: Peak Revenue Days Ranking

SELECT
Day,
ROUND(SUM(amt),2) AS Revenue,
RANK() OVER(
ORDER BY SUM(amt) DESC
) AS Revenue_Rank
FROM banking_data
GROUP BY Day;


-- Q28: Highest Spending Age Groups

SELECT
Age_Group,
COUNT(*) AS Transactions,
ROUND(SUM(amt),2) AS Revenue,
ROUND(AVG(amt),2) AS Avg_Spend
FROM banking_data
GROUP BY Age_Group
ORDER BY Revenue DESC;


-- Q29: Revenue and Fraud by Gender

SELECT
gender,
COUNT(*) AS Transactions,
ROUND(SUM(amt),2) AS Revenue,
SUM(is_fraud) AS Fraud_Cases
FROM banking_data
GROUP BY gender;


-- Q30: Monthly Business Performance

SELECT
Month,
COUNT(*) AS Transactions,
ROUND(SUM(amt),2) AS Revenue,
ROUND(AVG(amt),2) AS Avg_Transaction_Value,
SUM(is_fraud) AS Fraud_Cases
FROM banking_data
GROUP BY Month
ORDER BY Revenue DESC;


-- Q31: Top 10 Cities by Revenue

SELECT
city,
ROUND(SUM(amt),2) AS Revenue,
COUNT(*) AS Transactions
FROM banking_data
GROUP BY city
ORDER BY Revenue DESC
LIMIT 10;


-- Q32: Top 10 Jobs by Revenue

SELECT
job,
ROUND(SUM(amt),2) AS Revenue,
COUNT(*) AS Transactions,
ROUND(AVG(amt),2) AS Avg_Spend
FROM banking_data
GROUP BY job
ORDER BY Revenue DESC
LIMIT 10;


-- Q33: High Risk Categories
-- (Fraud Rate per Category)

SELECT
category,
COUNT(*) AS Transactions,
SUM(is_fraud) AS Fraud_Cases,
ROUND(
SUM(is_fraud)*100/COUNT(*),
2
) AS Fraud_Rate
FROM banking_data
GROUP BY category
ORDER BY Fraud_Rate DESC;


-- Q34: High Value Transactions Risk

SELECT
CASE
WHEN amt <= 50 THEN 'Very Low'
WHEN amt <= 100 THEN 'Low'
WHEN amt <= 500 THEN 'Medium'
WHEN amt <= 1000 THEN 'High'
ELSE 'Very High'
END AS Amount_Group,
COUNT(*) AS Transactions,
SUM(is_fraud) AS Fraud_Cases,
ROUND(
SUM(is_fraud)*100/COUNT(*),
2
) AS Fraud_Rate
FROM banking_data
GROUP BY Amount_Group
ORDER BY Fraud_Rate DESC;