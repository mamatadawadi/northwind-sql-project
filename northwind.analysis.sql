-- DATABASE SETUP -- 
CREATE DATABASE Northwind; 

-- TABLES --
CREATE table orders (
order_ID INT NOT NULL,
Customer_ID Text NOT NULL,
employee_ID int not null,
Order_Date date not null,
required_date date not null,
shipped_date date not null,
shipper_ID int not null,
freight decimal (10,2) not null,
primary key(order_ID) );

CREATE TABLE order_details (
order_ID INT NOT NULL,
product_ID INT NOT NULL,
unit_Price DECIMAL (10,2) NOT NULL,
quantity INT NOT NULL,
discount INT NOT NULL,
PRIMARY KEY(order_ID) );

-- CHANGE COLUMN NAME
DESCRIBE Orders;

ALTER TABLE Orders
CHANGE COLUMN order_id OrderID INT;

ALTER TABLE Orders
CHANGE COLUMN Customer_ID CustomerID Text;

ALTER TABLE order_details
CHANGE COLUMN Order_ID OrderID INT;

ALTER TABLE Orders
CHANGE COLUMN Shipper_ID ShipperID INT;

ALTER TABLE Orders
CHANGE COLUMN Order_Date OrderDate Time;


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
