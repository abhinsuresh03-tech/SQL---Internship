-- Create a new database
CREATE DATABASE SalesDB;

-- Switch to the new database
USE SalesDB;

-- Create Customers table
CREATE TABLE Customers (
    CustID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Country VARCHAR(100)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustID INT,  -- Foreign key to Customers
    Product VARCHAR(100),
    Price DECIMAL(10,2),
    FOREIGN KEY (CustID) REFERENCES Customers(CustID)
);

-- Insert sample data into Customers
INSERT INTO Customers (CustID, Name, Country) VALUES
(1, 'Alice', 'USA'),
(2, 'Bob', 'UK'),
(3, 'Charlie', 'India'),
(4, 'David', 'Canada'),
(5, 'Eva', 'Germany');

-- Insert sample data into Orders
INSERT INTO Orders (OrderID, CustID, Product, Price) VALUES
(101, 1, 'Laptop', 1200.00),
(102, 2, 'Phone', 800.00),
(103, 3, 'Tablet', 400.00),
(104, NULL, 'Headphones', 150.00), -- Order without customer
(105, 1, 'Monitor', 300.00);

SELECT * FROM Customers;
SELECT * FROM Orders;

--FULL OUTER JOIN - All customers & all orders
SELECT c.CustID, c.Name, c.Country, o.Product, o.Price
FROM Customers c
FULL OUTER JOIN Orders o ON c.CustID = o.CustID;

--RIGHT JOIN - all orders including the orders has no customer details 
SELECT c.CustID, c.Name, c.Country, o.Product, o.Price
FROM Customers c
RIGHT JOIN Orders o ON c.CustID = o.CustID;

--LEFT JOIN - List all customers, including who haven’t ordered placed any orders.
SELECT c.CustID, c.Name, c.Country, o.Product, o.Price
FROM Customers c
LEFT JOIN Orders o ON c.CustID = o.CustID;


--INNER JOIN - Customers who placed orders
SELECT c.CustID, c.Name, c.Country, o.Product, o.Price
FROM Customers c
INNER JOIN Orders o ON c.CustID = o.CustID;


--CROSS JOIN - All possible combinations
SELECT c.Name, o.Product
FROM Customers c
CROSS JOIN Orders o;

SELECT * FROM Customers;

--SELF JOIN - Customers from same country 
SELECT 
    c1.Name AS Customer1,
    c2.Name AS Customer2,
    c1.Country FROM Customers c1
JOIN Customers c2
    ON c1.Country = c2.Country
   AND c1.CustID <> c2.CustID
ORDER BY c1.Country, c1.Name;