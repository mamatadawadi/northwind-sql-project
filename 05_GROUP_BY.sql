
-- ---------------------------
-- ----- GROUP BY -------- --
-- ---------------------------

-- Q1.Count customers by country. 
SELECT 
    COUNT(customerID) AS total_customers, country
FROM
    customers
GROUP BY country;

-- Q2 Count customers by city.
SELECT 
    COUNT(customerID), city
FROM
    customers
GROUP BY city;

-- Q4. Average product price by category.
SELECT 
    CategoryID, AVG(unitprice) AS AVG_product_price
FROM
    Products
GROUP BY categoryID
ORDER BY AVG_product_price DESC;

-- 6.Total sales by customer.
SELECT 
    customers.contactName,
    SUM(order_details.unitprice * order_details.quantity * (1 - order_details.discount)) AS Total_sales
FROM
    customers
        INNER JOIN
    orders ON customers.customerID = orders.CustomerID
        INNER JOIN
    order_details ON orders.OrderID = order_details.OrderID
GROUP BY customers.contactName;

-- 7 Average quantity ordered.
SELECT 
    order_details.OrderID,
    AVG(order_details.quantity) AS AVG_quantity
FROM
    order_details
GROUP BY order_details.orderID
ORDER BY AVG_quantity DESC;

-- 8 Count discontinued products.
SELECT 
    discontinued, COUNT(*) AS product_count
FROM
    products
GROUP BY discontinued;

 -- 9 Count orders by year. 
SELECT 
    YEAR(orderDate) AS order_year,
    COUNT(orders.orderID) AS total_count
FROM
    orders
GROUP BY YEAR(orderDate)
ORDER BY order_year;

 -- 10 Average order value by customer.
 SELECT 
    AVG((order_details.unitprice * order_details.quantity) - (1 - order_details.discount)) AS AVG_orderValue,
    customers.contactName
FROM
    order_details
        INNER JOIN
    orders ON order_details.OrderID = orders.OrderID
        INNER JOIN
    customers ON orders.CustomerID = customers.customerID
GROUP BY customers.contactName
ORDER BY AVg_orderValue DESC;

 -- 11 Highest freight by employee.
SELECT 
    employees.employeeName,
    MAX(orders.freight) AS Highest_freight
FROM
    employees
        INNER JOIN
    orders ON employees.employeeID = orders.employeeID
GROUP BY employees.employeeName
ORDER BY Highest_freight DESC;

 -- 12 Lowest freight by employee.
SELECT 
    employees.employeeName,
    MIN(orders.freight) AS Lowest_freight
FROM
    employees
        INNER JOIN
    orders ON employees.employeeID = orders.employeeID
GROUP BY employees.employeeName
ORDER BY Lowest_freight ASC;

 -- 13 Count orders by month.
SELECT 
    MONTH(orderDate) AS order_Month,
    COUNT(orderID) AS total_orders
FROM
    orders
GROUP BY MONTH(orderDate)
ORDER BY order_Month;

 -- 14 Total units sold per product.
SELECT 
    products.productName,
    COUNT(order_details.quantity) AS Total_quantity
FROM
    products
        INNER JOIN
    order_details ON products.productID = order_details.productID
GROUP BY products.productName
ORDER BY Total_quantity DESC;


 

