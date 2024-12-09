-- Null Value Replacement
/*
In SQL, NULL values can be replaced or handled in various ways using built-in functions. 
The three most common methods for replacing null values are using:
1. COALESCE() function
2. ISNULL()
3. CASE Statement
*/

-- 1. COALESCE() function: 
/*
The COALESCE() function returns the first non-NULL	value in the list of arguments. 
It can be used to replace NULL values with a specified value.
*/

USE SQL_Server_DB
-- using Employee_Department table from SQL_Clauses_2 file.
SELECT * FROM Employee_Department

-- replace null value from Emp_Age column
SELECT Emp_Name, Emp_Age, COALESCE(Emp_Age, 0) AS Updated_Age FROM Employee_Department

-- replace null value from Emp_Salary column
SELECT Emp_Name, Emp_Salary, COALESCE(Emp_Salary, 0) AS Updated_Salary FROM Employee_Department

-- replace null value from Emp_Age column
SELECT Emp_Age, COALESCE(Emp_Age, (SELECT AVG(Emp_Age) FROM Employee_Department )) AS Updated_Age FROM Employee_Department

-- replace null value from Emp_Salary column
SELECT Emp_Salary, COALESCE(Emp_Salary, (SELECT AVG(Emp_Salary) FROM Employee_Department)) AS Updated_Salary FROM Employee_Department

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 2. ISNULL() function:
/*
SQL Server uses ISNULL(), for replacing null with specified value. 
*/

SELECT Emp_name, Emp_Age, ISNULL(Emp_Age, 0) AS Updated_Age FROM Employee_Department

SELECT Emp_Name, Emp_Age, ISNULL(Emp_Age, (SELECT AVG(Emp_Age) FROM Employee_Department)) AS Updated_Age FROM Employee_Department

SELECT Emp_Age, ISNULL(Emp_Salary, (SELECT AVG(Emp_Age) FROM Employee_Department)) AS Updated_Age FROM Employee_Department

SELECT Emp_Salary, ISNULL(Emp_Salary, (SELECT AVG(Emp_Salary) FROM Employee_Department)) AS Updated_Salary FROM Employee_Department

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 3. CASE Statements:

-- You can also use a CASE statement to conditionally replace NULL values.

-- replace null value from Emp_Age column
SELECT Emp_Age,
CASE
WHEN Emp_Age IS NULL THEN 0
ELSE Emp_Age
END AS Emp_Age
FROM Employee_Department

-- replace null value from Emp_Salary column
SELECT Emp_Salary,
CASE
WHEN Emp_Salary IS NULL THEN 0
ELSE Emp_Salary
END AS Emp_Salary
FROM Employee_Department

-- replace null value from Emp_Age column
SELECT Emp_Age,
CASE
WHEN Emp_Age IS NULL THEN (SELECT AVG(Emp_Age) FROM Employee_Department)
ELSE Emp_Age
END AS Emp_Salary
FROM Employee_Department

-- replace null value from Emp_Salary column
SELECT Emp_Salary,
CASE
WHEN Emp_Salary IS  NULL THEN (SELECT AVG(Emp_Salary) FROM Employee_Department)
ELSE Emp_Salary
END AS Empl_Salary
FROM Employee_Department

-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦
