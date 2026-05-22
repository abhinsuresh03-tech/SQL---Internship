# SQL-Task-5
Joins
1. Create table and insert values
Firstly, Created the table Customers and Orders as we are going to perform Join operations
 
Types of Joins.
There are 6 types are as follows…
•	Inner join
•	Outer join
•	Right join
•	Left join
•	Cross join
•	Self join

Now we will see one by one…

Inner join
Returns rows that have matching values in both tables.
 
Left join
Returns all rows from the left table, and matched rows from the right. Unmatched rows get NULLs.

Right join
Returns all rows from the right table, and matched rows from the left. Unmatched rows get NULLs.

Full outer join
Returns all rows from both tables. Unmatched rows get NULLs on the side that’s missing.

Cross join
•	Returns the Cartesian product of two tables. That means every row from the first table is paired with every row from the second table, regardless of any matching keys.
•	For instance – Table A has m rows and Table B has n rows.
•	The product of m and n will be the output of the Cross join more like a Matrix Multiplication.
•	Table A has 3 rows and Table B has 3 rows – the ouput has 9 rows.

Self join
A table joins with itself to compare rows.
