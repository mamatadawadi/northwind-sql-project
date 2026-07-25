-- ---------------------- -------
-- ----  CASE Statements  ----- --   
-- ---------------------- -------

-- Q1.	Create a column that categorizes products: 
-- o	Price > 50 = Expensive 
-- o	Price 20–50 = Medium 
-- o	Price < 20 = Cheap 

SELECT 
    productName,
    unitprice,
    CASE
        WHEN unitprice > 50 THEN 'Expensive'
        WHEN unitprice BETWEEN 20 AND 50 THEN 'Medium'
        WHEN unitprice < 20 THEN 'Cheap'
    END AS price_category
FROM
    products;
    
-- Q2 2.	Display products as: 
-- o	Discontinued = "Unavailable" 
-- o	Otherwise = "Available" 

SELECT 
    productName,
    discontinued,
    CASE
        WHEN discontinued = 1 THEN 'Unavailable'
        ELSE 'Available'
    END AS display_products
FROM
    products;
    
-- Q3.	Categorize customers: 
-- o	USA = Domestic Customer 
-- o	Other countries = International Customer 

SELECT 
    contactName,
    Country,
    CASE
        WHEN Country = 'USA' THEN 'Domestic Customer'
        ELSE 'International Customers'
    END AS Customer_Category
FROM
    customers;
    
-- Q4.	Categorize orders: 
-- o	Freight > 100 = High Shipping Cost 
-- o	Freight <= 100 = Normal Shipping Cost 

SELECT 
    orderID,
    freight,
    CASE
        WHEN freight > 100 THEN 'High Shipping Cost'
        ELSE 'Normal Shipping Cost'
    END AS order_category
FROM
    orders;
    
-- Q5.	Count the number of products in each price category. 
SELECT 
    CASE
        WHEN unitprice > 50 THEN 'expensive'
        WHEN unitprice BETWEEN 20 AND 30 THEN 'Medium'
        ELSE 'Cheap'
    END AS price_category,
    COUNT(productID) AS Total_Product
FROM
    products
GROUP BY CASE
    WHEN unitprice > 50 THEN 'expensive'
    WHEN unitprice BETWEEN 20 AND 30 THEN 'Medium'
    ELSE 'Cheap'
END;

-- Q6.	Create customer segments: 
-- o	More than 20 orders = VIP 
-- o	10–20 orders = Regular 
-- o	Less than 10 orders = New Customer 

SELECT 
    customerID,
    COUNT(orderID) AS Total_orders,
    CASE
        WHEN COUNT(orderID) > 20 THEN 'VIP'
        WHEN COUNT(orderID) BETWEEN 10 AND 20 THEN 'Regular'
        ELSE 'New Customers'
    END AS customer_segments
FROM
    orders
GROUP BY CustomerID;

-- Q7.	Create a sales performance category: 
-- o	Sales > 10,000 = Excellent 
-- o	Sales 5,000–10,000 = Good 
-- o	Below 5,000 = Needs Improvement 

SELECT 
    productID,
    SUM(unitprice * quantity) AS Total_sales,
    CASE
        WHEN SUM(unitprice * quantity) > 10000 THEN 'Excellent'
        WHEN SUM(unitprice * quantity) BETWEEN 5000 AND 10000 THEN 'Good'
        ELSE 'Needs Improvement'
    END AS performance_category
FROM
    order_details
GROUP BY productID
ORDER BY Total_sales DESC
LIMIT 7;