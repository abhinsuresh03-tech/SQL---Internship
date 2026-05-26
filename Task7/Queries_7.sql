create database Ecom

use Ecom

-- Create Customers table
CREATE TABLE customers (
    cust_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(20),
    address VARCHAR(255)
);

-- Create Orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    cust_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id)
);

-- Insert data into the customers table
INSERT INTO customers (cust_id, first_name, last_name, email, phone_number, address) VALUES
(1, 'Alice', 'Johnson', 'alice.j@email.com', '555-1234', '123 Main St, Anytown'),
(2, 'Bob', 'Williams', 'bob.w@email.com', '555-5678', '456 Oak Ave, Somewhere'),
(3, 'Charlie', 'Brown', 'charlie.b@email.com', NULL, '789 Pine Rd, Otherplace');

-- Insert data into the orders table
INSERT INTO orders (order_id, cust_id, order_date, total_amount) VALUES
(101, 1, '2025-08-01', 75.50),
(102, 1, '2025-08-05', 150.00),
(103, 2, '2025-08-02', 25.75),
(104, 3, '2025-08-10', 200.25),
(105, 1, '2025-08-14', 50.00);

select * from customers
select * from orders

--Create View for showing all order details 
CREATE VIEW customer_order_details AS
SELECT
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date,
    o.total_amount,
    o.status
FROM
    customers c
JOIN
    orders o ON c.cust_id = o.cust_id;

--Show the result of View which we created
select * from customer_order_details

--Create view with complex select query to shows the total spending for each customer.
CREATE VIEW customer_spending AS
SELECT
    c.first_name,
    c.last_name,
    COUNT(o.order_id) AS number_of_orders,
    SUM(o.total_amount) AS total_spent
FROM
    customers c
JOIN
    orders o ON c.cust_id = o.cust_id
GROUP BY
    c.first_name, c.last_name;

--Show the result of View which we created
SELECT first_name, last_name, total_spent FROM customer_spending;

--create a view that hides a customer's address and email for public users.
CREATE VIEW public_customer_info AS
SELECT
    cust_id,
    first_name,
    last_name,
    phone_number
FROM
    customers;

--Show the result of View which we created
select * from public_customer_info

--Reusing the view without mentioning joins
SELECT first_name, last_name FROM customer_spending
where total_spent > 250;

--creating view for Updating Data
CREATE VIEW updatable_customers AS
SELECT cust_id, first_name, last_name, email FROM customers;

-- Updating data
UPDATE updatable_customers SET email = 'johnson.a@email.com' WHERE cust_id = 1;

--Show the result of View which we created
select * from updatable_customers

--creating view for non-Updating Data
CREATE VIEW non_updatable_view AS
SELECT cust_id, COUNT(order_id) AS total_orders FROM orders GROUP BY cust_id;


-- Updating data
UPDATE non_updatable_view SET cust_id = 0 WHERE total_orders = 3;

--Drop a view
DROP VIEW customer_order_details;

select * from customer_order_details

--create a view for orders with a total_amount greater than 100.
CREATE VIEW large_orders AS
SELECT order_id, cust_id, total_amount
FROM orders
WHERE total_amount > 100
WITH CHECK OPTION;

--Show the result of View which we created
select * from large_orders

--Indexed view using Schemabinding
CREATE VIEW dbo.CustomerOrderSummary0
WITH SCHEMABINDING
AS
SELECT
    C.cust_id,
    C.first_name,
    C.last_name,
    SUM(O.total_amount) AS TotalSpent,
    COUNT_BIG(*) AS NumberOfOrders  -- Corrected to use COUNT_BIG(*)
FROM
    dbo.customers AS C
JOIN
    dbo.orders AS O ON C.cust_id = O.cust_id
GROUP BY
    C.cust_id,
    C.first_name,
    C.last_name;
select * from dbo.CustomerOrderSummary0

--Indexed view using Unique cluster
CREATE UNIQUE CLUSTERED INDEX IX_CustomerOrderSummary0_CustomerID
ON dbo.CustomerOrderSummary0 (cust_id);

select * from dbo.CustomerOrderSummary1



-- Create a materialized view
CREATE MATERIALIZED VIEW customer_spending_mv AS
SELECT
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_spent
FROM
    customers c
JOIN
    orders o ON c.customer_id = o.customer_id
GROUP BY
    c.first_name, c.last_name;

-- To refresh the data
REFRESH MATERIALIZED VIEW customer_spending_mv;
