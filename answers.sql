-- =========================================================
-- Advanced SQL Queries and Aggregations
-- File: answers.sql
-- =========================================================

-- ---------------------------------------------------------
-- Question 1: Total payment amount per payment date
-- Display payment date and total amount paid on that date
-- Sort by payment date descending, show top 5 latest dates
-- ---------------------------------------------------------
SELECT
    paymentDate,
    SUM(amount) AS total_amount
FROM payments
GROUP BY paymentDate
ORDER BY paymentDate DESC
LIMIT 5;

-- ---------------------------------------------------------
-- Question 2: Average credit limit per customer
-- Display customer name, country, and average credit limit
-- Group by customer name and country
-- ---------------------------------------------------------
SELECT
    customerName,
    country,
    AVG(creditLimit) AS avg_credit_limit
FROM customers
GROUP BY customerName, country;

-- ---------------------------------------------------------
-- Question 3: Total price of products ordered
-- Display product code, quantity ordered, and total price
-- Group by product code and quantity ordered
-- ---------------------------------------------------------
SELECT
    productCode,
    quantityOrdered,
    SUM(quantityOrdered * priceEach) AS total_price
FROM orderdetails
GROUP BY productCode, quantityOrdered;

-- ---------------------------------------------------------
-- Question 4: Highest payment amount per check number
-- Display check number and the highest amount paid
-- Group by check number
-- ---------------------------------------------------------
SELECT
    checkNumber,
    MAX(amount) AS highest_amount
FROM payments
GROUP BY checkNumber;
