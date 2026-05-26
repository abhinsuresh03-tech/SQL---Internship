-- Create the database
CREATE DATABASE ITCompanyDB;

-- Refresh and Use the new database
USE ITCompanyDB;

-- Create Department table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName VARCHAR(100) NOT NULL
);


-- Create Employee table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    HireDate DATE,
    JobTitle VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);


-- Create Project table
CREATE TABLE Project (
    ProjectID INT PRIMARY KEY IDENTITY(1,1),
    ProjectName VARCHAR(100),
    StartDate DATE,
    EndDate DATE
);


-- Create Skill table
CREATE TABLE Skill (
    SkillID INT PRIMARY KEY IDENTITY(1,1),
    SkillName VARCHAR(100)
);


-- Create EmployeeSkill table (Many-to-Many between Employee and Skill)
CREATE TABLE EmployeeSkill (
    EmployeeID INT,
    SkillID INT,
    ProficiencyLevel VARCHAR(20),
    PRIMARY KEY (EmployeeID, SkillID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (SkillID) REFERENCES Skill(SkillID)
);


-- Create ProjectAssignment table (Many-to-Many between Employee and Project)
CREATE TABLE ProjectAssignment (
    EmployeeID INT,
    ProjectID INT,
    Role VARCHAR(100),
    AllocationPercentage INT CHECK (AllocationPercentage BETWEEN 0 AND 100),
    PRIMARY KEY (EmployeeID, ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID)
);