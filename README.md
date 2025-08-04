# SQL-Task1
Database schema and ER diagram for a Library Management System
Objective
This project demonstrates how to create a structured relational database for managing IT employees, their departments, skills, and project assignments using Microsoft SQL Server.
Tools Used
Microsoft SQL Server Management Studio (SSMS)
ER Diagram Generator (e.g., built-in in SSMS)
Database Design - Entities & Relationships
The database consists of the following core entities:
1. Department
2. Employee
3. Skill
4. Project
5. EmployeeSkill (Mapping Employee to Skill)
6. ProjectAssignment (Mapping Employee to Project)
 
Schema Creation Script
The Query file contains all the necessary SQL commands to:
• Create the IT_Employee database
• Define all required tables with primary and foreign key constraints
• Establish many-to-many relationships via junction tables
You can find the SQL script in the Query file or copy it from the source if working interactively.
ER Diagram
The ER diagram visually represents the schema and its relationships. It includes:
• One-to-Many: **Department → Employees
• Many-to-Many: **Employees ↔ Skills, Employees ↔ Projects
 
 
Deliverables
1. SQL Script: Query (Creates database and tables)
2. ER Diagram: Screenshot posted in main document
3. README: Project overview and setup guide (this file)
 
How to Run
1. Open **Microsoft SQL Server Management Studio (SSMS)**
2. Execute the script from `schema.sql` to set up the schema.
3. (Optional) Use “Database Diagrams” in SSMS to recreate or view the ER diagram.
 
Notes
• All foreign key constraints are enforced to maintain referential integrity.
• The schema supports scalability with many-to-many mapping via junction tables (`EmployeeSkill`, `ProjectAssignment`).
• Validation like `CHECK` constraints (e.g., `AllocationPercentage` between 0 and 100) is included.

