# SQL-Task2
Data Insertion and Handling Nulls

DML STATEMENT USING SIMPLE RETAIL SYSTEM
1. Create Tables
Firstly, creating the tables suppliers, products, and orders. Each table includes primary keys, foreign keys, and constraints like NOT NULL and DEFAULT.
 
2. Insert values 
Adding Values
Adding the first value of Supplier table where we provided all the column values without skipping it.

Null values
Skipping contact_name and Ph.no of Supplier table which will be stored as NULL.

Handling Defau1t values
We explicitly provided the first value of Product table and We skipped the value of stock_quantity of the product resulted 0 as we used DEFAULT constraints.

 
3. UPDATE and DELETE with WHERE Conditions
Modifying and removing data using WHERE clauses to ensure changes are applied to the correct records.

UPDATE Statements

Update the unit price of a specific product.
Update the stock quantity and supplier for a product
Replacing the null values for supplier tables.

DELETE Statements
Delete a specific order
Delete a product that is no longer sold
Delete a supplier (this may fail if there are foreign key constraints from other tables that still reference it, so we delete products first if needed).
