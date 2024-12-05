-- SQL Commands
/*
SQL commands are categorized into different types based on their functionality. 
Below are the key categories of SQL commands, along with examples for each:
*/

-- 1. Data Query Language (DQL): DQL is used to query data from the database.

--	• SELECT: Retrieves data from one or more tables.

-- select all columns from a table
SELECT * FROM Employee

--- select specific columns from a table
SELECT Emp_ID, Emp_Name FROM Employee

-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

-- 2. Data Definition language (DDL): DDL is used to define and manage structure of a database, such as creating, altering and deleting.
/*
1. CREATE
2. ALTER
3. DROP
4. TRUNCATE
*/

--	• CREATE: Create a new table, view, stored procedure and other objects.

-- create a new table Employee
CREATE TABLE Employee (
Emp_ID INT, 
Emp_Name VARCHAR(100), 
Emp_Age INT UNIQUE, 
Emp_Email VARCHAR(100), 
Emp_Joining_Date DATE, 
Emp_Salary DECIMAL(10, 2)
)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--	• ALTER: Modifies an existing database object (like table, view, stored procedure).

-- alter a table Employee by adding new column Department
ALTER TABLE Employee ADD Department VARCHAR(100)

-- alter a column constraint in a table
ALTER TABLE Employee ALTER COLUMN Emp_ID INT NOT NULL
ALTER TABLE Employee ADD CONSTRAINT PK_Emp_ID PRIMARY KEY (Emp_ID)

-- NOTE: you cannot directly alter an existing column to add a PRIMARY KEY constraint if that column is nullable. First, modify the column to make it non-nullable. Then, add the PRIMARY KEY constraint.

-- alter column by droping constraint
ALTER TABLE Employee DROP CONSTRAINT UNIQUE

-- NOTE: As we move ahead we will see all types of constraints (PRIMARY KEY, UNIQUE and more)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--	• DROP: Deletes a table, view, stored procedure and other objects.

-- drop a table
DROP TABLE Employee

-- NOTE: Dropping table will delete its a structure as well

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- • TRUNCATE: Removes all rows from a table, but the table structure remain the same.

-- remove all rows from the table
TRUNCATE TABLE Employee

-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

-- 3. Data Manipulation Language (DML): DML is used for manipulating the data stored in the database.
/*
1. INSERT
2. UPDATE
3. DELETE
*/

--	• INSERT: Add new rows of data into a table.

-- insert single row of data
INSERT INTO Employee VALUES (1, 'John Doe', 30, 'john.doe@gmail.com', '2020-01-15', 50000.00)

INSERT INTO Employee (Emp_ID, Emp_Name, Emp_Age, Emp_Email, Emp_Joining_Date, Emp_Salary)
VALUES (2,	 'Jane Smith', 28, 'jane.smith@gmail.com', '2019-03-22', 55000.00)

-- insert single row data into a specific columns
INSERT INTO Employee (Emp_ID, Emp_Name, Emp_Email, Emp_Joining_Date)
VALUES (3, 'Emily Johnson', 'emily.johnson@gmail.com', '2017-09-15')

-- insert multiple row of data
INSERT INTO Employee (Emp_ID, Emp_Name, Emp_Age, Emp_Email, Emp_Joining_Date, Emp_Salary)
VALUES 
(4, 'Robert Brown', 35, 'robert.brown@example.com', '2018-07-01', 60000.00),
(5, 'David Williams', 45, 'david.williams@example.com', '2016-11-01', 70000.00)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--	• UPDATE: Modifies existing data in a table.

-- update a single record
UPDATE Employee 
SET Emp_Age = 40
WHERE Empl_ID = 3

-- update multiple records
UPDATE Employee
SET Emp_Salary = 100000
WHERE Emp_Age = 50

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--	• DELETE: Removes one or more rows from a table.

-- delete a specific record
DELETE FROM Employee
WHERE Emp_ID = 10

-- delete multiple records
DELETE FROM Employee
WHERE Emp_Salary > 100000

-- delete all records from a table

-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

-- 4. Data Control Language (DCL): DCL is used to control access to data in the database.
/*
1. GRANT
2. REVOKE
*/

--	• GRANT: Gives specific privilege to a user or role.

-- grant SELECT privilege to a user
GRANT SELECT ON Employee TO user1

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- • REVOKE: Removes specific privilage from a user or role.

-- revoke SELECT privilege from a user
REVOKE SELECT ON Employee FROM user1

-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

-- 5. Transaction Control Language (TCL): TCL is used to manage transactions in the database.
/*
1. COMMIT
2. ROLLBACK
3. SAVEPOINT
*/

--	• COMMIT: Save all changes made during the current transaction.

-- commit the trasaction (save changes)
COMMIT

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--	• ROLLBACK: Undoes chnages made during the current transaction.

-- rollback the transaction (undo changes)
ROLLBACK

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--	• SAVEPOINT: Save a point within a transaction to which you can later roll back.

-- set a savepoint with a transaction 
SAVEPOINT savepoint1

-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦
