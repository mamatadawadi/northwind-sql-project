-- ---------------- --
------  HAVING  ------   
-- ---------------- --


-- Q1 Countries with more than 5 customers.  
SELECT 
    Country, COUNT(*) AS Total_Customers
FROM
    Customers
GROUP BY Country
HAVING COUNT(*) > 5
ORDER BY Total_customers DESC;

-- Q2 Categories with more than 10 products.
SELECT 
    categoryID, COUNT(productName) AS Total_products
FROM
    products
GROUP BY categoryID
HAVING COUNT(productName) > 10
ORDER BY Total_products DESC;

-- Q3 Customers with more than 5 orders.
SELECT 
    customers.contactName, COUNT(orders.OrderID) AS Total_Orders
FROM
    customers
        INNER JOIN
    orders ON customers.customerID = orders.CustomerID
GROUP BY customers.contactName
HAVING COUNT(orders.OrderID) > 5
ORDER BY Total_orders DESC
LIMIT 5;

-- Q4 Employees handling over 50 orders.
SELECT 
    employees.employeeName,
    COUNT(orders.OrderID) AS Total_orders
FROM
    employees
        INNER JOIN
    orders ON employees.employeeID = orders.employeeID
GROUP BY employees.employeeName
HAVING COUNT(orders.orderID) > 50
ORDER BY Total_orders DESC
LIMIT 10;

-- Q5 Categories with average price greater than 30.
SELECT 
    categories.categoryName,
    AVG(products.unitprice) AS Avg_price
FROM
    categories
        INNER JOIN
    products ON categories.categoryID = products.categoryID
GROUP BY categories.categoryName
HAVING AVG(products.unitPrice) > 30
ORDER BY Avg_price DESC;

-- Q6 Customers spending over 10,000.
SELECT 
    customers.contactName,
    SUM(order_details.unitprice * quantity) AS Total_spend
FROM
    customers
        INNER JOIN
    orders ON customers.customerID = orders.CustomerID
        INNER JOIN
    order_details ON orders.OrderID = order_details.OrderID
GROUP BY customers.customerID , customers.contactName
HAVING SUM(order_details.unitprice * quantity) > 10000
ORDER BY Total_spend DESC;

-- Q7 Countries with freight greater than 5000.
SELECT 
    customers.country, SUM(orders.freight) AS Total_freight
FROM
    customers
        INNER JOIN
    orders ON customers.CustomerID = orders.CustomerID
GROUP BY customers.country
HAVING SUM(orders.freight) > 5000
ORDER BY Total_freight DESC;

-- Q8 Employees with average freight greater than 70.
SELECT 
    employees.employeeName, AVG(orders.freight) AS Avg_freight
FROM
    employees
        INNER JOIN
    orders ON employees.employeeID = orders.employeeID
GROUP BY employees.employeeName
HAVING AVG(orders.freight) > 70;

-- Q9 Products sold over 200 units.
SELECT 
    products.productName,
    SUM(order_details.quantity) AS Total_units
FROM
    products
        INNER JOIN
    order_details ON products.productID = order_details.productID
GROUP BY products.productName
HAVING SUM(order_details.quantity) > 500
ORDER BY Total_units DESC;


-- Q10 Cities with more than 3 customers.
SELECT 
    City, COUNT(contactName) AS Total_customers
FROM
    customers
GROUP BY City
HAVING COUNT(contactName) > 3;
