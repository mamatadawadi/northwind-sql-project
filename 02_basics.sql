-- =========================
--  BASIC SELECT QUERIES
-- =========================

-- -- Question 1. Which countries have the most customers?
SELECT 
    Country, COUNT(CustomerID) AS Total_Customers
FROM
    Customers
GROUP BY Country
ORDER BY Total_Customers DESC
LIMIT 5;


-- -- Question 2. Which customers are from USA and UK? 
SELECT 
    country, COUNT(CustomerID) AS total_customers
FROM
    Customers
WHERE
    Country IN ('USA' , 'UK')
GROUP BY Country;

-- -- Question 3. Who are the top 5 customers by name sorting (A–Z)? 
SELECT 
    CustomerID, CompanyName, Country
FROM
    Customers
ORDER BY CustomerID ASC
LIMIT 5;

-- -- Question 4 . Which products are the most expensive? 
 SELECT 
    ProductName, Unitprice
FROM
    Products
ORDER BY UnitPrice DESC
LIMIT 5;


-- -- Question 5. Which products are the cheapest?  
  SELECT 
    ProductName, UnitPrice
FROM
    Products
ORDER BY UnitPrice ASC
LIMIT 5;


-- -- Question 6. Wich customers have names starting with “A” or “B”? 
SELECT 
    CustomerID, Country
FROM
    Customers
WHERE
    CustomerID LIKE 'A%'
        OR CustomerID = 'B%';
        

-- -- Question 7.	Which products have UnitPrice greater than 20?
SELECT 
    ProductName, UnitPrice
FROM
    Products
WHERE
    UnitPrice > 20;
    
    
-- -- Question 8. Which products have names starting with “Ch” or “Ca"?
SELECT 
    ProductID, ProductName
FROM
    Products
WHERE
    ProductName LIKE 'Ch%'
        OR ProductName LIKE 'Ca%';  


-- -- Question 9.	Which orders have the highest freight cost?  
SELECT 
    CustomerID, freight
FROM
    Orders
ORDER BY freight DESC
LIMIT 5;


-- -- Question 10. Which orders are most recent (latest first)? 
SELECT 
    OrderID CustomerID, OrderDate
FROM
    Orders
ORDER BY OrderDate DESC
LIMIT 5;


-- -- Question 11.	Which orders have low freight (< 20)? 
 SELECT 
    OrderID, CustomerID, Freight
FROM
    Orders
WHERE
    Freight < 20;
    
    
-- -- Question 12.	Which orders are shipped to USA or Germany? 
SELECT
    Orders.OrderID,
    Orders.OrderDate,
    Customers.CompanyName,
    Customers.Country
FROM Orders
JOIN Customers
    ON orders.CustomerID = Customers.CustomerID
WHERE Customers.Country IN ('USA', 'Germany');


-- -- Question 13. What are the top 5 orders by freight value? 
 SELECT 
    OrderID, CustomerID, Freight
FROM
    Orders
ORDER BY Freight DESC
LIMIT 5;

-- -------------- --
-- DISTICNT
-- Q14 Show the different countries where customers are located.
SELECT DISTINCT country, contactName 
FROM customers;

-- Q15 Find the number of unique countries where customers are located. 
SELECT count(DISTINCT country) AS Number_ofCountries
FROM customers;

-- Q16 Display all unique combinations of customer country and city. 
SELECT DISTINCT country, city
FROM customers;

-- Q17 Find how many different cities exist for each customer country. 
SELECT count(distinct city) AS Number_of_city, Country
FROM customers
GROUP BY Country;

-- Q18 Show the unique customer contact titles for customers from a specific country. 
SELECT DISTINCT contactTitle, Country
FROM customers
WHERE Country = 'Germany';

-- Q19 Find the top 5 countries with the highest number of unique customer cities.
SELECT COUNT(DISTINCT city) AS Number_of_city, Country
FROM customers
GROUP BY Country
ORDER BY Number_of_city DESC
LIMIT 5; 

-- Q20 Find the number of unique customers who have placed at least one order. 
SELECT COUNT(DISTINCT customerID) AS Number_of_customer
FROM customers;

-- Q21 Find the number of unique products ordered by each customer. 
SELECT orders.customerID, COUNT(DISTINCT order_details.productID) AS Number_of_product
FROM orders
INNER JOIN order_details
ON orders.OrderID = order_details.OrderID
GROUP BY customerID
ORDER BY Number_of_product DESC;

-- Q22 Show the unique employee IDs who have processed orders in the year 1997. 
SELECT DISTINCT employees.employeeID, orders.orderdate
FROM employees
INNER JOIN orders
ON employees.employeeID = orders.employeeID

