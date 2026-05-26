create database Employees

use Employees

-- Employee table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

-- Inserting data into employees table
INSERT INTO employees (employee_id, first_name, last_name, email, salary, department_id) VALUES
(101, 'John', 'Doe', 'john.d@example.com', 60000.00, 10),
(102, 'Jane', 'Smith', 'jane.s@example.com', 75000.00, 20),
(103, 'Peter', 'Jones', 'peter.j@example.com', 55000.00, 10),
(104, 'Mary', 'Johnson', 'mary.j@example.com', 90000.00, 30),
(105, 'Chris', 'Lee', 'chris.l@example.com', 62000.00, 20);

-- department table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Inserting data into department table
INSERT INTO departments (department_id, department_name) VALUES
(10, 'IT'),
(20, 'Sales'),
(30, 'Finance');

select * from employees
select * from departments

--Find employees earning more than the average salary
SELECT
    first_name,last_name,salary
FROM employees
WHERE
    salary > (SELECT AVG(salary) FROM employees); 

--Find all employees who work in the 'Sales' department
SELECT first_name, last_name
FROM employees
WHERE department_id IN (SELECT department_id FROM departments WHERE department_name = 'Sales');

--Find all employees who have a salary greater than the average salary of their own department.
SELECT
    first_name,last_name,salary,department_id
FROM employees e1
WHERE
    salary > (SELECT AVG(salary) FROM employees e2 WHERE e2.department_id = e1.department_id);

--Find employees who are in either the 'IT' or 'Finance' departments.
SELECT first_name,last_name
FROM employees
WHERE
    department_id IN (SELECT department_id FROM departments WHERE department_name IN ('IT', 'Finance'));

--if there exists a department record with a department_name of 'Sales' for each employee
SELECT first_name, last_name
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM departments d
    WHERE d.department_id = e.department_id AND d.department_name = 'Sales'
);

--List each employee's salary and compare it to the overall average salary.
SELECT
    first_name,last_name,salary,
    (SELECT AVG(salary) FROM employees) AS average_salary
FROM employees;

--Calculate the average salary for each department and then find the departments 
--where the average is above the company-wide average.
SELECT
    dept_name,avg_salary
FROM
    (SELECT d.department_name AS dept_name, AVG(e.salary) AS avg_salary
    FROM employees e
    JOIN departments d ON e.department_id = d.department_id
    GROUP BY d.department_name) AS department_avg_salaries  -- This is the derived table
WHERE
    avg_salary > (SELECT AVG(salary) FROM employees);