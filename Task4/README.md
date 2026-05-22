# SQL-Task4
Aggregate & Grouping
1. Create table and insert values
Firstly, Creating the table Cloud usage student as we are finding the cost of each services using aggregate function and grouping along with having functions.
 
Aggregate functions 
Aggregate functions perform a calculation on a set of values (a column) and return a single, summary value. They are typically used with the SELECT statement and are often paired with the GROUP BY and HAVING clause to perform the calculations on subsets of data. 
Now we will see one by one…

Sum & Average 
•	Sum Calculates the total sum of all non-NULL values in a numeric column.
•	AVG Calculates the average (mean) value of all non-NULL values in a numeric column.
 
Maximum & Minimum

•	Max - Finds the maximum value in a column.
•	Min - Finds the minimum value in a column.


Count() 

•	COUNT(*): Counts all rows, including those with NULL values. It's the most common way to count all records in a table.
•	COUNT(column_name): Counts only the rows where the specified column_name is not NULL.
•	COUNT(DISTINCT column_name): Counts the number of unique, non-NULL values in a column.

