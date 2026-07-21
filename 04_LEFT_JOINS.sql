
-- ---------------------- --
-- LEFT JOINS---- ---------------------- -- 
-- ---------------------- --

-- Q1 Show all customers even if they never ordered. 
SELECT c.customerID, c.contactname
FROM customers as c
LEFT JOIN orders as o
ON c.customerID = o.CustomerID
WHERE o.orderID IS NULL;

-- Q2 List each shipper, the products shipped, and the customers who received them.
SELECT 
    shippers.companyName,
    products.productname,
    orders.CustomerID
FROM
    shippers
        LEFT JOIN
    orders ON shippers.shipperID = orders.shipperID
        LEFT JOIN
    order_details ON orders.OrderID = order_details.OrderID
        LEFT JOIN
    products ON order_details.productID = products.productID;
    
  -- Q3 Show all categories even if empty. 
SELECT 
    products.productID,
    products.productName,
    categories.categoryName
FROM
    products
        LEFT JOIN
    categories ON products.categoryID = categories.categoryID;
    
 -- Q4 . Show all employees even if no orders. 
SELECT 
    orders.OrderID, orders.CustomerID, employees.employeeName
FROM
    orders
        LEFT JOIN
    employees ON orders.employeeID = employees.employeeID;
    
 -- Q5 Show all products even if never ordered.
 SELECT products.productID, products.productName, order_details.OrderID
 FROM products
 LEFT JOIN order_details
 ON products.productID = order_details.productID;
 
 -- Q6 List customers with total orders (including zero).
SELECT 
    COUNT(orders.orderID) AS total_orders,
    customers.customerID,
    customers.contactName
FROM
    customers
        LEFT JOIN
    orders ON customers.customerID = orders.CustomerID
GROUP BY customers.customerID , customers.contactName
ORDER BY Total_orders DESC;
 
 -- Q7 Find customers with no orders.
SELECT 
    orders.orderID, customers.customerID, customers.contactName
FROM
    customers
        LEFT JOIN
    orders ON customers.CustomerID = orders.customerID
WHERE
    orders.orderID IS NULL;

 -- Q8 Find categories without products.
 SELECT products.productID, products.productName, categories.categoryName
 FROM categories
 LEFT JOIN products
 ON categories.categoryID = products.categoryID
 WHERE products.productID IS NULL;

 -- Q9 Find products never ordered.
 SELECT 
    products.productName, order_details.OrderID
FROM
    products
        LEFT JOIN
    order_details ON products.productID = order_details.productID
WHERE
    order_details.productID IS NULL;
    
-- Q10 Show customer names with latest order.
SELECT 
    customers.contactName, MAX(orders.OrderDate) AS latest_order
FROM
    customers
        LEFT JOIN
    orders ON customers.customerID = orders.CustomerID
GROUP BY customers.contactName;

 -- Q11 Show categories and average price.
SELECT 
    categories.categoryName,
    AVG(products.unitPrice) AS Avg_Price
FROM
    categories
        LEFT JOIN
    products ON categories.categoryID = products.categoryID
GROUP BY categories.categoryName;

 -- Q12 . Show products and quantities sold.
SELECT 
    products.productName,
    COUNT(order_details.quantity) AS total_Quantities
FROM
    products
        LEFT JOIN
    order_details ON products.productID = order_details.productID
GROUP BY products.productName;
 
  
