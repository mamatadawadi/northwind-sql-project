-- ==========================================
-- SQL Topic: INNER JOIN
-- Database: Northwind
-- ==========================================
 
-- Q1- Show every customer's company name and their order ID.
SELECT 
    Orders.orderID, customers.companyName
FROM
    orders
        INNER JOIN
    customers ON orders.customerID = customers.customerID;
    
-- Q2- Show customer company name, order date, and freight.
SELECT 
    c.customerID, o.OrderDate, o.freight
FROM
    orders AS o
        INNER JOIN
    customers AS c ON o.customerID = c.customerID
ORDER BY freight DESC;

 -- Q3- Show every employee's full name and the order IDs they handled.
SELECT 
    employees.employeeName, orders.orderID
FROM
    orders
        INNER JOIN
    employees ON employees.employeeID = orders.employeesID;
 
-- Q4- Show product name with its category name.
  SELECT 
    products.productName, categories.categoryName
FROM
    products
        INNER JOIN
    categories ON products.categoryID = categories.categoryID;
    
-- Q5- Show every order with: 
 -- Customer Name 
 -- Employee Name 
 -- Order Date 
 SELECT 
    c.contactName,
    o.OrderDate,
    e.employeeID
FROM
    customers AS c
        INNER JOIN
    orders AS o ON c.customerID = o.CustomerID
        INNER JOIN
    employees AS e ON o.employeeID = e.employeeID
    ORDER BY contactName;
    
    
 


 
 