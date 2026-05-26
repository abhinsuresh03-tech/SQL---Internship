CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    CGPA DECIMAL(5,2),
    city VARCHAR(100),
    enrollment_date DATE
);

INSERT INTO student (student_id, name, age, gender, CGPA, city, enrollment_date)
VALUES
(1, 'Aarav Kumar', 17, 'Male', 88.50, 'Kochi', '2023-06-15'),
(2, 'Meera Iyer', 18, 'Female', 92.00, 'Kozhikode', '2022-08-20'),
(3, 'Rohan Das', 16, 'Male', 76.25, 'Kochi', '2023-01-10'),
(4, 'Divya Raj', 17, 'Female', 81.75, 'Trivandrum', '2023-03-05');


select * from student

--students from Kochi scoring between 80 and 95.
SELECT * FROM student
WHERE CGPA BETWEEN 80 AND 95
  AND city LIKE 'Kochi%'
ORDER BY CGPA DESC


--select top 5 results
select top 5 * from student order by CGPA

--list names of top 3 students
select top(3) name from student order by CGPA

--students who are exactly 18 years old
SELECT * FROM student WHERE age = 18;

--male students who has above 80% CGPA
SELECT * FROM student WHERE gender = 'Male' AND CGPA > 80;

--students who came from Trivandrum or Kozhikode
SELECT * FROM student WHERE city = 'Trivandrum' or city = 'Kozhikode'

--students whose name ends with letter r
SELECT * FROM student WHERE name LIKE '%r';

--students who joined in the year of 2023
SELECT * FROM student WHERE enrollment_date BETWEEN '2023-01-01' AND '2023-12-31';
