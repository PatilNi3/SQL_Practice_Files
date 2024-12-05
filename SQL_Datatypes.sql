-- SQL Datatypes
/*
SQL data types define the type of data a column can hold in a database table. 
They determine the kind of operations that can be performed on the data, its size, and how it is stored. 
SQL data types are broadly classified into several categories:
*/
-- 1. Numerica Data Types: These store numbers, either integer or real numbers.

--	• INT/INTEGER: Stores integer values (whole numbers) with size typically 4 bytes.
--		○ Example	: INT, INTEGER
--								: CREATE TABLE Employee (Emp_ID INT) 

--	• SMALLINT: Stores smaller integer values (2 bytes).
--		○ Example	: SMALLINT
--								: CREATE TABLE Employee (Emp_ID SMALLINT)

--	• BIGINT: Stores larger integer values (8 bytes).
--		○ Example	: BIGINT
--								: CREATE TABLE Employee (Emp_ID BIGINT)

--	• DECIMAL/NUMERIC: Stores fixed point numbers with a specific precision and scale. 
--		○ Example	: DECIMAL(10, 2)			-- e.g., 10 digits in total and 2 digits after decimal point
--								: CREATE TABLE Employee (Emp_Salary DECIMAL(10, 2))

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 2. Character Data Types: These store text or string data.

--	• CHAR: It is used to store strings of a fixed length. If the string is shorter than the defined length, the remaining space is padded with spaces.
--		○ Example	: CHAR(10)
--								: CREATE TABLE Employee (Emp_Name CHAR(50))

--	• VARCHAR: It is used to store strings of a variable length. It only uses as much space as the length of the actual string.
--		○ Example	: VARCHAR(100)
--								: CREATE TABLE Employee (Emp_Name VARCHAR(100))

--	• TEXT: Stores long text strings of unlimited length (depending on the DBMS)
--		○ Example	: TEXT
--								: CREATE TABLE Employee (Emp_Address TEXT)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 3. Date and Time Data Types: Thses store date, time or both.

--	• DATE: Stores only the date (year, month, day).
--		○ Example	: DATE
--								: CREATE TABLE Employee (Emp_Date_of_Joining DATE)

--	• TIME: Stores only the time (hours, minutes, seconds).
--		○ Example	: TIME
--								: CREATE TABLE Employee (Emp_Lunch_Time TIME)

--	• DATETIME: Stores both date and time
--		○ Example	: DATETIME
--								: CREATE TABLE Employee (Emp_Login DATETIME)

--	• YEAR: Stores a year in 4-digit format.
--		○ Example	: YEAR
--								: CREATE TABLE Employee (Emp_Birth_Year YEAR)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 4. Boolean Data Types: These stores the Boolean values (True or False).

--	• BOOLEAN: Stores a true/false values.
--		○ Example	: BOOLEAN
--								: CREATE TABLE Employee (Emp_Status BOOLEAN)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

