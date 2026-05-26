
-- Create the suppliers table
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_name VARCHAR(100),
    phone_number VARCHAR(20)
);

-- Create the products table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    supplier_id INT,
    unit_price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- Create the orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    product_id INT,
    quantity INT NOT NULL,
    order_date datetime DEFAULT(getdate()),
    total_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);



-- The first value of supplier table has all details provided
INSERT INTO suppliers (supplier_id, supplier_name, contact_name, phone_number)
VALUES (1, 'Global Tech Inc.', 'Sara Connor', '555-100-2000');
select * from suppliers

-- The second value of supplier is inserted with missing contact details, which will be stored as NULL
INSERT INTO suppliers (supplier_id, supplier_name)
VALUES (2, 'Food Mart Co.');
select * from suppliers

-- The first value product is inserted with an explicit stock quantity
INSERT INTO products (product_id, product_name, supplier_id, unit_price, stock_quantity)
VALUES (101, 'Laptop', 1, 1200.00, 50);

select * from products



-- The second product is inserted without specifying stock_quantity, which will use the DEFAULT value of 0
INSERT INTO products (product_id, product_name, supplier_id, unit_price)
VALUES (102, 'T-Shirt', 2, 25.00);
select * from products

--Update the unit price of a specific product
UPDATE products
SET unit_price = 1150.00
WHERE product_id = 101;
select * from products

-- Update the stock quantity and supplier for a product
UPDATE products
SET stock_quantity = 100, supplier_id = 1
WHERE product_name = 'T-Shirt';
select * from products

--Replacing the null values for supplier tables
UPDATE suppliers
SET contact_name = 'James Bond', phone_number = '555-007-0070'
WHERE supplier_id = 2;
select * from suppliers

-- Delete a specific order
DELETE FROM orders
WHERE order_id = 1001;
select * from orders

DELETE FROM products
WHERE product_id = 102;
select * from products
