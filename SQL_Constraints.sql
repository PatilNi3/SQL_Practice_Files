-- SQL Constraints
/*
SQL constaints are set of rules that restricts the type of data that can be inserted into a table.
They ensure data integrity and enforce certain conditions on the data stored in the database.
Constraints can be applied to the tables or columns and can be defined at the time of table creation or added afterward.
*/

-- Here are the different types of SQL constraints:
/*
1. UNIQUE
2. NOT NULL
3. PRIMARY KEY
4. FOREIGN KEY
5. IDENTITY
6. CHECK
7. DEFAULT
*/

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 1. UNIQUE:
/*
• Ensures that all values in a column are unique/distinct (no duplicate).
• A unique key constraint can be applied to multiple columns in a table.
*/
USE SQL_Server_DB

CREATE TABLE Employee_unique (
Emp_ID INT UNIQUE,
Emp_Name VARCHAR(100),
Emp_Salary INT
)

INSERT INTO Employee_unique (Emp_ID, Emp_Name, Emp_Salary)
VALUES (1, 'John Doe', 50000)

INSERT INTO Employee_unique (Emp_ID, Emp_Name, Emp_Salary)
VALUES (1, 'Jane Smith', 55000)			--error: Violation of UNIQUE KEY constraint (duplicate value Emp_ID)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 2. NOT NULL:
/*
• Ensures that column cannot have a NULL value.
• A not null constraints can be applied for multiple columns in a table.
*/

CREATE TABLE Employee_notnull (
Emp_ID int UNIQUE,
Emp_Name VARCHAR(100) NOT NULL,
Emp_Email VARCHAR(100) NOT NULL
)

INSERT INTO Employee_notnull (Emp_ID, Emp_Name, Emp_Email)
VALUES (1, 'John Doe', 'john.doe@gmail.com')

INSERT INTO Employee_notnull (Emp_ID, Emp_Name, Emp_Email)
VALUES (2, null, 'jane.smith@gmail.com')			--error: Violation of NOT NULL constraint (can not insert null value)

INSERT INTO Employee_notnull (Emp_ID, Emp_Name, Emp_Email)
VALUES (3, 'Emily Johnson', null)			--error: Violation of NOT NULL constraint (can not insert null value)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 3. PRIMARY KEY:
/*
• Uniquely identifies each record in a table.
• A primary key combines the properties of UNIQUE and NOT NULL constraints.
• A table can have only one primary key. 
• Composite primary key can consist of one or more columns.
*/

-- single column primary key
CREATE TABLE Employee_primary (
Emp_ID INT PRIMARY KEY,
Emp_Name VARCHAR(100) NOT NULL,
Emp_Email VARCHAR(100) UNIQUE
)

INSERT INTO Employee_primary (Emp_ID, Emp_Name, Emp_Email)
VALUES (1, 'John Doe', 'john.doe@gmail.com')

INSERT INTO Employee_primary (Emp_ID, Emp_Name, Emp_Email)
VALUES (1, 'Jane Smith', 'jane.smith@gmail.com')			--error: Violation of PRIMARY KEY constraint (duplicate value Emp_ID)

INSERT INTO Employee_primary (Emp_ID, Emp_Name, Emp_Email)
VALUES (null, 'Emily Johnson', 'emily.johnson@gmail.com')			--error: Violation of PRIMARY KEY constraint (can not insert null value)

INSERT INTO Employee_primary (Emp_ID, Emp_Name, Emp_Email)
VALUES 
(2, 'Robert Brown', 'robert.brown@gmail.com'),
(3, 'David Williams', 'david.williams@gmail.com')


-- composite primry key
CREATE TABLE Employee_composite_primary (
Emp_ID INT,
Emp_Name VARCHAR(100),
Emp_Email VARCHAR(100),
PRIMARY KEY(Emp_Name, Emp_Email)
)

INSERT INTO Employee_composite_primary (Emp_ID, Emp_Name, Emp_Email)
VALUES (1, 'John Doe', 'john.doe@gmail.com')

INSERT INTO Employee_composite_primary (Emp_ID, Emp_Name, Emp_Email)
VALUES (2, 'Jane Smith', null)			--error: Violation of PRIMARY KEY constraint

INSERT INTO Employee_composite_primary (Emp_ID, Emp_Name, Emp_Email)
VALUES (3, 'Jane Smith', 'jane.smith@gmail.com')			--no-error because both Emp_Name and Emp_Email should not be repeated

INSERT INTO Employee_composite_primary (Emp_ID, Emp_Name, Emp_Email)
VALUES (4, 'Jane Smith', 'jane.smith@gmail.com')			--error: Violation of Composite ORIMARY KEY constaint (two records are same)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 4. FOREIGN KEY:
/*
• Foreign key creates a relationship between two tables.
• The value in the foreign key column(s) must match values in the primary key or unique column(s) of the referenced table.
• Foreign key enforces referential integrity meaning it prevents inconsistent data or orphan records. 
• A table can have multiple foreign keys, each linking to different tables.
*/

CREATE TABLE Department_foreign (
Dept_ID INT,
Dept_Name VARCHAR(100),
Emp_ID INT FOREIGN KEY REFERENCES Employee_primary (Emp_ID)
)

INSERT INTO Department_foreign (Dept_ID, Dept_Name, Emp_ID)
VALUES (11, 'HR', 1)

INSERT INTO Department_foreign (Dept_ID, Dept_Name, Emp_ID)
VALUES
(12, 'Marketing', 2),
(11, 'HR', 3)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 5. INDENTITY:
/*
• The IDENTITY constraint automatically generates a unique numeric value for each new row inserted into a table.
• This is typically used for primary keys where a unique, sequential identifier is required.
• You cannot have multiple identity columns in a table because only one column serves as the uniqui identifier (often a primary key).
*/

CREATE TABLE Employee_identity (
Emp_ID INT PRIMARY KEY IDENTITY,
Emp_Name VARCHAR(100),
Emp_Email VARCHAR(100)
)

INSERT INTO Employee_identity (Emp_Name, Emp_Email)
VALUES
('John Doe', 'john.doe@gmail.com'),
('Jane Smith', 'jane.smith@hmail.com'),
('Emily Johnson', 'emily.johnson@gmail.com')

SELECT * FROM Employee_identity

-- with seed and increment value
CREATE TABLE Employee_identity_seedincrement (
Emp_ID INT PRIMARY KEY IDENTITY(10, 1),							-- 10 is seed (starting) and 1 is increment value (step)
Emp_Name VARCHAR(100),
Emp_Email VARCHAR(100)
)

INSERT INTO Employee_identity_seedincrement (Emp_Name, Emp_Email)
VALUES
('John Doe', 'john.doe@gmail.com'),
('Jane Smith', 'jane.smith@hmail.com'),
('Emily Johnson', 'emily.johnson@gmail.com')

SELECT * FROM Employee_identity_seedincrement

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 6. CHECK:
/*
• Ensures that the value in a column satisfies a specific condition or expression.
• It's a way to enforce data integrity by restricting the values tha can be inserted or updated in a table.
• You can multiple check constraints in a table.
*/

-- single check constraint
CREATE TABLE Employee_check (
Emp_ID INT PRIMARY KEY IDENTITY,
Emp_Name VARCHAR(100),
Emp_Email VARCHAR(100),
Emp_Age INT CHECK (Emp_Age > 21)
)

INSERT INTO Employee_check (Emp_Name, Emp_Email, Emp_Age)
VALUES ('John Doe', 'john.doe@gmail.com', 23)

INSERT INTO Employee_check (Emp_Name, Emp_Email, Emp_Age)
VALUES ('Jane Smith', 'jane.smith@gmail.com', 18)			--error: INSERT statement conflicted with the CHECK constraint

-- multiple check constraint
CREATE TABLE Employee_check_multiple (
Emp_ID INT PRIMARY KEY IDENTITY,
Emp_Name VARCHAR(100),
Emp_Email VARCHAR(100),
Emp_Age INT CHECK (Emp_Age > 18),
Emp_Salary INT CHECK (Emp_Salary < 30000)
)

INSERT INTO Employee_check_multiple (Emp_Name, Emp_Email, Emp_Age, Emp_Salary)
VALUES ('John Doe', 'john.doe@gmail.com', 23, 25000)

INSERT INTO Employee_check_multiple (Emp_Name, Emp_Email, Emp_Age, Emp_Salary)
VALUES ('Jane Smith', 'jane.smith@gmail.com', 17, 37000)			--error: INSERT statement conflicted with the CHECK constraint

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 7. DEFAULT:
/*
• Default constraint provide default value for a column when no value is specified during an INSERT operation.
• If a value for the column is not provided, the column will automatically take the default value specified by the constraint.
• You can multiple default constraint in a table.
*/

CREATE TABLE Employee_default (
Emp_ID INT PRIMARY KEY IDENTITY,
Emp_Name VARCHAR(100),
Emp_Age INT DEFAULT 21,
Emp_Department VARCHAR(100) DEFAULT 'IT'
)

INSERT INTO Employee_default (Emp_Name, Emp_Age, Emp_Department)
VALUES ('John Doe', 23, 'HR')

INSERT INTO Employee_default (Emp_Name)
VALUES ('Jane Smith')			--no-error: it takes default value

SELECT * FROM Employee_default

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------