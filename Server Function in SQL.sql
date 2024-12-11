-- Server Functions in SQL
/*
Server function typically refer to built-in functions that are provided by the database management system (DBMS) to perform various tasks	 on the server side, such as calculations, data transformations, string manipulations and data retrieval.
This fucntion help simply	complex queries and allow the database operations to perform	efficiently
Here are some common types of server functions in SQL:
1. Aggregation Functions
2. String Functions
3. Date and Time Functions
4. Mathematical Functions
5. Conditional Functions
6. Conversion Functions
7. Nill Functions
*/

USE SQL_Server_DB
--using Employee table from SQL_Clauses_1 file
SELECT * FROM Employee

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 1. Aggregate Functions:
/*
Aggregate functions perform calculations on a set of values and return a single result. 
These are often used in conjunction with the GROUP BY clause.
*/

--	• COUNT(): Returns the number of rows.

SELECT COUNT(*)	AS Total_Employee FROM Employee

--	• SUM(): Returns the sum of the numeric column.

SELECT SUM(Emp_Salary) AS Total_Salary FROM Employee

--	• AVG(): Returns the average value of a numeric column.

SELECT AVG(Emp_Age) AS Average_Age FROM Employee

--	• MIN(): Returns the minimum value of a column.

SELECT MIN(Emp_Salary) AS Minimum_Salary FROM Employee

--	• MAX(): Returns the maximum value of a column.

SELECT MAX(Emp_Salary) AS Maximum_Salary FROM Employee

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 2. String Functions: These functions perform operations on string data types like CHAR, VARCHAR, or TEXT.

--	• LEN(): Returns the length of a string.

SELECT Emp_name, LEN(Emp_name) AS Name_Length FROM Employee

--	• CONCAT(): Combines two or more strings into one.

SELECT Emp_name, Emp_City, CONCAT(Emp_Name, ' ', Emp_City) as Concat_String FROM Employee

SELECT Emp_Age, Emp_Salary, CONCAT(Emp_Age, Emp_Salary) AS Concat_Integers FROM Employee

--	• UPPER(): Converts a string to uppercase.

SELECT Emp_name, UPPER(Emp_name) AS Emp_Name_Upper FROM Employee

--	• LOWER(): Converts a string to lowercase.

SELECT Emp_Name, LOWER(Emp_Name) AS Emp_Name_Lower FROM Employee

--	•	SUBSTRING(): Extracts a portion of of a string.

SELECT Emp_Email, SUBSTRING(Emp_Email, 10, 20) AS Email_Substring FROM Employee

--	• TRIM(): Removes leading and trailing spaces.

SELECT Emp_Email, TRIM(Emp_Email) AS Email_Trim FROM Employee

SELECT Emp_Email, LTRIM(Emp_Email) AS Email_Ltrim FROM Employee			-- removes leading spaces

SELECT Emp_Email, RTRIM(Emp_Email) AS Email_Rtrim FROM Employee			-- removes trailing spaces

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 3. Date and Time Functions: These functions operate on DATE, TIME, or DATETIME values.

--	• GETDATE(): Returns the current date and time.

SELECT GETDATE()

--	• DATEADD(): Adds a specified time interval to a date.

SELECT DATEADD(DAY, 5, '2024-12-12') AS Date_Added

--	• Subtract a specified time interval from a date.

SELECT DATEADD(DAY, -5, '2024-12-17') AS Date_Subtracted

--	• DATEDIFF(): Return the difference between two dates in days.

SELECT DATEDIFF(DAY, '2024-12-12', '2024-12-17') AS Date_Difference

--	• YEAR(), MONTH(), DAY(): Extract the year, month or day from a date.

SELECT YEAR('2024-12-12') AS Year

SELECT MONTH('2024-12-12') AS Month

SELECT DAY('2024-12-12') AS Day

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 4. Mathematical Functions:

--	• ABS(): Return the absolute value of a number.

SELECT ABS(-25) AS Abs_Value

--	• ROUND(): Rounds a number to a specified number of decimal places.

SELECT ROUND(25.252525, 2) AS Ronded_Value

--	• CEILING(): Rounds a number up to a nearest integer.

SELECT CEILING(25.25) AS Ceil_Value

SELECT CEILING(25.99) AS Ceil_Value

--	• FLOOR(): Rounds a number down to a nearest integer.

SELECT FLOOR(25.25) AS Floor_Value

SELECT FLOOR(25.99) AS Floor_Value

--	• POWER(): Returns the result of a number raised to a power.

SELECT POWER(5, 2) AS Power_Value

SELECT Emp_Age, POWER(Emp_Age, 2) AS Power_Age_Value FROM Employee

--	• SQRT(): Retrns the square root of the number.

SELECT SQRT(25)AS Square_Root

SELECT SQRT(Emp_Age) AS Square_Root_Age FROM Employee

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 5. Conditional Functions:

--	• CASE(): Performs multiple conditional checks and returns different results.

SELECT Emp_Salary, 
CASE
WHEN Emp_Salary >= 75000 THEN 'High'
WHEN 50000 < Emp_Salary AND Emp_Salary < 75000 THEN 'Medium'
ELSE 'Low'
END AS 'Salary_Range'
FROM Employee

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 6. Conversion Functions:

--	• CAST(): Converts an expression from one data type to another.

SELECT Emp_Salary, CAST(Emp_Salary AS char) AS Cast_Salary_Char FROM Employee

--	• CONVERT(): Similar to CAST() but with different syntax in some databases.

SELECT Emp_Salary, CONVERT(CHAR, Emp_Salary) AS Convert_Salary_Char FROM Employee

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 7. Null Functions:

--	• ISNULL(): Checks if a value is NULL.

SELECT Emp_Salary, ISNULL(Emp_Salary, 0) AS Non_Null_Salary FROM Employee

--	• COALESCE(): Returns the first non-NULL value in a list of arguments.

SELECT Emp_Salary, COALESCE(Emp_Salary, 0) AS Non_Null_Salary FROM Employee

-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦
