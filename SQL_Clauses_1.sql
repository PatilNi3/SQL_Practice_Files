-- SQL Clauses Part 1
/*
In SQL, clauses are the componenets that make up SQL statements.
Each clause serves a distinct purpose in constructing in constructing a query, allowing you to specify what actions should be performed on the data.
The most common clauses in SQL are:

1. SELECT
2. FROM
3. WHERE
4. GROUP BY 
5. HAVING
6. ORDER BY
7. INSERT INTO
8. UPDATE 
9. DELETE
10. LIMIT/TOP
11. DISTINCT
12. UNION/UNION ALL
13. AS
14. WITH
15. BETWEEN 
16. IN
17. LIKE 
18. EXISTS

This clauses can be combined to create complex SQL queries that retreive, modify and manipulate data in various ways.
*/

-- NOTE	: Some of the clauses we have already seen while creating tables, modifying tables, while working on SQL commands(DDL, DML, etc).
--				: Some of them we will cover in this Clauses section and rest of them we will cover as we move ahead.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- NOTE	: In this section we will cover, WHERE, GROUP BY, HAVING, ORDER BY, LIMIT/TOP but at the same time we will cover some small clauses also.
--				: So before diving into Clauses we will cover some basic Operators and Aggregate Functions.

-- Operators:
/*
SQL supports a variety of operators that allow you to perform operations on data within queries. 
These operators can be broadly categorized into comparison, logical, arithmetic, and pattern matching operators, among others.
*/

-- 1. Comparison Operators: This operators are used to compare two values and return a boolean results (true or false).
--	• = (Equal to): Returns true if the values on both sides are equal.
--	• != or <> (Not equal to): Returns true if the values are not equal.
--	• > (Greater than): Returns true if the left value is greater than the right value.
--	• < (Less than):	Returns true if the left value is less than the right value.
--	• >= (Greater than or equal to): Returns true if the left value is greater than or equal to the right value.
--	• <= (Less than or equal to): Returns true if the left value is less than or equal to the right value.

-- 2. Logical Operators: Logical operators are used to combine multiple conditions in a query.
--	• AND: Returns true if both conditions are true.
--	• OR: Returns true if at least one of the conditions is true.

-- 3. IN and NOT IN Operators: Checks if value is present or absent in a list of values.
--	• IN: Returns true if the value is within a specified set of values.
--	• NOT IN: Returns true if the value is not in the specified set of values.

-- 4. BETWEEN and NOT BETWEEN Operators: Used to filter range of values.
--	• BETWEEN: Returns true if the value is within a specified range (inclusive).
--	• NOT BETWEEN: Returns true if the value is outside the specified range.

-- 5. LIKE and NOT LIKE Operators: This operators are used for pattern matching with string data.
--	• LIKE: Matches a specified pattern in a column value. It uses wildcards such as % (any sequence of characters) and _ (a single character).
--	• NOT LIKE: Returns true if the value does not match the specified pattern.

-- 6. Arithmetic Operators: These operators are used to perform mathematical operations on numerical data.
--	• + (Addition): Adds two values.
--	• - (Subtraction): Subtracts one value from another.
--	• * (Multiplication): Multiplies two values.
--	• / (Division): Divides one value by another.
--	• % (Modulus): Returns the remainder when one value is divided by another.

-- 7. Other Operators:
--	• IS NULL: Checks whether a value is NULL (undefined or missing).
--	• IS NOT NULL: Checks whether a value is not NULL.
--	• EXISTS: Returns true if a subquery returns any results.
--	• ALL: Used to compare a value to all values in another query.
--	• ANY: Used to compare a value to any value in another query.

-- NOTE: We will see this all operators in WHERE clause.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Employee (
Emp_ID INT PRIMARY KEY IDENTITY,
Emp_Name VARCHAR(100),
Emp_Age INT,
Emp_Email VARCHAR(100),
Emp_City VARCHAR(50),
Emp_Contact VARCHAR(10),
Emp_Salary INT
)

INSERT INTO Employee (Emp_Name, Emp_Age, Emp_Email, Emp_City, Emp_Contact, Emp_Salary)
VALUES 
('John Doe', 30, 'john.doe@example.com', 'Mumbai', '9876543210', 50000.00),
('Jane Smith', 28, 'jane.smith@example.com', 'Delhi', '9123456789', 55000.50),
('Emily Johnson', 40, 'emily.johnson@example.com', 'Bengaluru', '9976543210', 62000.30),
('Robert Brown', 35, 'robert.brown@example.com', 'Chennai', '9087654321', 60000.75),
('David Williams', 45, 'david.williams@example.com', 'Kolkata', '9988776655', 70000.00),
('Sarah Miller', 32, 'sarah.miller@example.com', 'Hyderabad', '9162334455', 52000.10),
('Michael Taylor', 29, 'michael.taylor@example.com', 'Pune', '9856723412', 48000.20),
('Laura Anderson', 38, 'laura.anderson@example.com', 'Ahmedabad', '9871234567', 75000.55),
('James Thomas', 50, 'james.thomas@example.com', 'Surat', '9911223344', 80000.00),
('Sophia Jackson', 27, 'sophia.jackson@example.com', 'Jaipur', '9944556677', 47000.25)

INSERT INTO Employee (Emp_Name, Emp_Email, Emp_City, Emp_Contact)
VALUES 
('Jessi Turner', 'jessi.turner@example.com', 'Indore', '9855445566')

SELECT * FROM Employee

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 1. WHERE clause: Filters record based on a specific condition.

--	• Comparison Operators:

--		○ = (Equal to)

SELECT * FROM Employee WHERE Emp_ID = 5

SELECT * FROM Employee WHERE Emp_Name = 'Sophia Jackson'

--		○ != (Not equal to)

SELECT * FROM Employee WHERE Emp_Age != 30

SELECT * FROM Employee WHERE Emp_City != 'Chennai'

--		○ > (Greater than)

SELECT * FROM Employee WHERE Emp_Salary > 50000

SELECT * FROM Employee WHERE Emp_Age > 50

--		○ < (Less than)

SELECT * FROM Employee WHERE Emp_Salary < 50000

SELECT * FROM Employee WHERE Emp_Age < 27

--		○ >= (Greater than or equal to)

SELECT * FROM Employee WHERE Emp_Salary >= 75000

SELECT * FROM Employee WHERE Emp_Age >= 50

--		○ <= (Less than or equal to)

SELECT * FROM Employee WHERE Emp_Salary <= 50000

SELECT * FROM Employee WHERE Emp_ID <= 5

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--	• Logical Operators:

--		○ AND

SELECT * FROM Employee WHERE Emp_Age = 30 AND Emp_City = 'Mumbai'

SELECT * FROM Employee WHERE Emp_Salary > 50000 AND Emp_Age > 35

SELECT * FROM Employee WHERE Emp_Salary > 80000 AND Emp_ID <= 10

--		○ OR

SELECT * FROM Employee WHERE Emp_Age = 30 OR Emp_City = 'Pune'

SELECT * FROM Employee WHERE Emp_Salary > 50000 OR Emp_Age < 25

SELECT * FROM Employee WHERE Emp_Salary > 80000 OR Emp_ID > 10

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--	• IN and NOT IN Operators:

--		○ IN

SELECT * FROM Employee WHERE Emp_ID IN (2, 4, 6, 8, 10)

SELECT * FROM Employee WHERE Emp_Salary IN (40000, 60000, 80000)

SELECT * FROM Employee WHERE Emp_City IN ('Mumbai', 'Pune', 'Bengaluru')

SELECT * FROM Employee WHERE Emp_Contact IN ('9876543210', '9911223344')

SELECT * FROM Employee WHERE Emp_Name IN ('John Doe', 'Emily Smith', 'Sarah Williams')

--		○ NOT IN

SELECT * FROM Employee WHERE Emp_ID NOT IN (2, 4, 6, 8, 10)

SELECT * FROM Employee WHERE Emp_Salary NOT IN (40000, 60000, 80000)

SELECT * FROM Employee WHERE Emp_City NOT IN ('Mumbai', 'Pune', 'Bengaluru')

SELECT * FROM Employee WHERE Emp_Contact NOT IN ('9876543210', '9911223344')

SELECT * FROM Employee WHERE Emp_Name NOT IN ('John Doe', 'Emily Smith', 'Sarah Williams')

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--	• BETWEEN and NOT BETWEEN Operators:

--		○ BETWEEN

SELECT * FROM Employee WHERE Emp_Age BETWEEN 30 AND 40

SELECT * FROM Employee WHERE Emp_Salary BETWEEN 60000 AND 80000

SELECT * FROM Employee WHERE Emp_City BETWEEN 'Hyderabad' AND 'Kolkata'

--		○ NOT BETWEEN 

SELECT * FROM Employee WHERE Emp_Age NOT BETWEEN 30 AND 40

SELECT * FROM Employee WHERE Emp_Salary NOT BETWEEN 60000 AND 80000

SELECT * FROM Employee WHERE Emp_City NOT BETWEEN 'Hyderabad' AND 'Kolkata'

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--	• LIKE and NOT LIKE Operators:

--		○ LIKE

SELECT * FROM Employee WHERE Emp_Name LIKE 'J%'

SELECT * FROM Employee WHERE Emp_Email LIKE '%@example.com'

SELECT * FROM Employee WHERE Emp_Email LIKE '%@%'

SELECT * FROM Employee WHERE Emp_Name LIKE '[JD]%'			--Emp_Name startswith J and D

SELECT * FROM Employee WHERE Emp_Name LIKE '%[ns]'			--Emp_Name endswith n and s

SELECT * FROM Employee WHERE Emp_City LIKE '[^MP]%'			--Emp_City not startswith M and P

SELECT * FROM Employee WHERE Emp_City LIKE '%[^di]'				--Emp_City not endswith d and i

SELECT * FROM Employee WHERE Emp_City LIKE 'M_____'

SELECT * FROM Employee WHERE Emp_City LIKE '___e'

SELECT * FROM Employee WHERE Emp_Name LIKE '[C-J]%'			--Emp_Name startswith from C to J (both including)

SELECT * FROM Employee WHERE Emp_Name LIKE '%[h-s]'			--Emp_Name endswith from h and s (both including)

SELECT * FROM Employee WHERE Emp_Name LIKE '%[ ]%'			--Emp_Name which is having whitespace in between

--		○ NOT LIKE

SELECT * FROM Employee WHERE Emp_Name NOT LIKE 'J%'

SELECT * FROM Employee WHERE Emp_Email NOT LIKE '%@example.com'

SELECT * FROM Employee WHERE Emp_Email NOT LIKE '%@%'

SELECT * FROM Employee WHERE Emp_Name NOT LIKE '[JD]%'			--Emp_Name startswith J and D

SELECT * FROM Employee WHERE Emp_Name NOT LIKE '%[ns]'			--Emp_Name endswith n and s

SELECT * FROM Employee WHERE Emp_City NOT LIKE '[^MP]%'			--Emp_City not startswith M and P

SELECT * FROM Employee WHERE Emp_City NOT LIKE '%[^di]'				--Emp_City not endswith d and i

SELECT * FROM Employee WHERE Emp_City NOT LIKE 'M_____'

SELECT * FROM Employee WHERE Emp_City NOT LIKE '___e'

SELECT * FROM Employee WHERE Emp_Name NOT LIKE '[C-J]%'			--Emp_Name startswith from C to J (both including)

SELECT * FROM Employee WHERE Emp_Name NOT LIKE '%[h-s]'			--Emp_Name endswith from h and s (both including)

SELECT * FROM Employee WHERE Emp_Name NOT LIKE '%[ ]%'			--Emp_Name which is having whitespace in between

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--	• Arithmetic Operators:

--		○ + (Addition)
SELECT Emp_Name,  Emp_Salary, Emp_Salary + 5000 AS Updated_Salary FROM Employee   

--		○ - (Subtraction)
SELECT Emp_Name, Emp_Age, Emp_Age - 3 AS Updated_Age FROM Employee

--		○ * (Multiplication)
SELECT Emp_Name, Emp_Salary, Emp_Salary * 12 AS Yearly_Package FROM Employee

--		○ / (Division)
SELECT Emp_Name, Emp_Salary, Emp_Salary / 30 AS One_Day_Payment FROM Employee

--		○ % (Modulus)
SELECT Emp_Name, Emp_Age, Emp_Age % 5 AS Age_Modulus FROM Employee

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--	• Other Operators:

--		○ IS NULL

SELECT * FROM Employee WHERE Emp_Age IS NULL

SELECT * FROM Employee WHERE Emp_Salary IS NULL

--		○ IS NOT NULL

SELECT * FROM Employee WHERE Emp_Age IS NOT NULL

SELECT * FROM Employee WHERE Emp_Salary IS NOT NULL

--		○ EXISTS

SELECT * FROM Employee WHERE Emp_Age > 40 AND EXISTS (SELECT * FROM Employee WHERE Emp_Salary > 50000)

SELECT * FROM Employee WHERE Emp_ID > 5 AND EXISTS (SELECT * FROM Employee WHERE Emp_Age >=30)

--		○ ALL

SELECT Emp_Name FROM Employee WHERE Emp_Salary > ALL (SELECT Emp_Salary FROM Employee WHERE  Emp_Salary > 50000)

--		○ ANY

SELECT Emp_Name FROM Employee WHERE Emp_Salary > ANY (SELECT Emp_Salary FROM Employee WHERE  Emp_Salary > 50000)

-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦