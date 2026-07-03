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

-- ===================
 -- Data Cleaning
-- ===================

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

ALTER TABLE employees
CHANGE COLUMN employees_ID employeeID INT;

ALTER TABLE Orders
CHANGE COLUMN employee_ID employeesID INT;

ALTER TABLE ORDERS
CHANGE COLUMN emplyoeesID employeeID INT;
