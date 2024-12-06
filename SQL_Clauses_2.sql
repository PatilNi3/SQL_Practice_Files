-- SQL Clauses Part 2

-- NOTE: Before starting group by clause, first we will see what are the Aggregate Functions

USE SQL_Server_DB

CREATE TABLE Employee_Department (
    Emp_ID INT PRIMARY KEY IDENTITY,
    Emp_Name VARCHAR(100),
    Emp_Age INT,
    Emp_Email VARCHAR(100),
    Emp_Date_of_Joining DATE,
    Emp_Salary DECIMAL(10, 2),
    Emp_Department VARCHAR(50)
);

INSERT INTO Employee_Department (Emp_Name, Emp_Age, Emp_Email, Emp_Date_of_Joining, Emp_Salary, Emp_Department)
VALUES
('John Doe', 30, 'john.doe@example.com', '2020-01-15', 50000.00, 'IT'),
('Jane Smith', 28, 'jane.smith@example.com', '2019-03-22', 55000.50, 'HR'),
('Emily Johnson', 30, 'emily.johnson@example.com', '2017-09-15', 60000.00, 'IT'),
('Robert Brown', 35, 'robert.brown@example.com', '2018-07-01', 62000.75, 'Finance'),
('David Williams', 40, 'david.williams@example.com', '2016-11-01', 70000.00, 'Finance'),
('Sarah Miller', 28, 'sarah.miller@example.com', '2021-06-05', 50000.00, 'HR'),
('Michael Taylor', 40, 'michael.taylor@example.com', '2020-08-20', 47000.50, 'IT'),
('Laura Anderson', 38, 'laura.anderson@example.com', '2015-12-10', 75000.55, 'Marketing'),
('James Thomas', 30, 'james.thomas@example.com', '2020-01-15', 50000.00, 'IT'),
('Sophia Jackson', 40, 'sophia.jackson@example.com', '2021-06-05', 60000.00, 'HR')

INSERT INTO Employee_Department (Emp_Name, Emp_Email, Emp_Date_of_Joining, Emp_Department)
VALUES ('James Jackson', 'james.jackson@example.com', '2019-03-22', 'Marketing')

SELECT * FROM Employee_Department

 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- AGGREGATE FUNCTIONS

--	• COUNT(): Returns the number of rows that match a specified condition.

SELECT COUNT(Emp_Salary) AS Total_No FROM Employee_Department

SELECT COUNT(*) AS Total_Row FROM Employee_Department			--COUNT(*) counts null value also

SELECT COUNT(Emp_Name) as Total_Names FROM Employee_Department

--	• SUM(): Returns the sum of the value in a numeric column.

SELECT SUM(Emp_Salary) AS Total_Salary FROM Employee_Department

--	• AVG(): Returns the average/mean value of a numeric column.

SELECT AVG(Emp_Age) as Average_Age FROM Employee_Department

SELECT AVG(Emp_Salary) AS Average_Salary FROM Employee_Department

--	• MIN(): Returns the minimum value in a set of values.

SELECT MIN(Emp_Age) AS Minimum_Age FROM Employee_Department

SELECT MIN(Emp_Salary) AS Minimum_Salary FROM Employee_Department

SELECT Emp_Name, Emp_Age FROM Employee_Department WHERE Emp_Age = (SELECT MIN(Emp_Age) AS Minimum_Age FROM Employee_Department)

SELECT Emp_Name, Emp_Salary FROM Employee_Department WHERE Emp_Salary = (SELECT MIN(Emp_Salary) AS Minimum_Salary FROM Employee_Department)

--	• MAX(): Return the maximum value in a set of values.

SELECT MAX(Emp_Age) AS Maximum_Age FROM Employee_Department

SELECT MAX(Emp_Salary) AS Maximum_Salary FROM Employee_Department

SELECT Emp_Name, Emp_Age FROM Employee_Department WHERE Emp_Age = (SELECT MAX(Emp_Age) AS Maximum_Age FROM Employee_Department)

SELECT Emp_Name, Emp_Salary FROM Employee_Department WHERE Emp_Salary = (SELECT MAX(Emp_Salary) AS Maximum_Salary FROM Employee_Department)

--	• DISTINCT(): Shows only distinct/unique values.

SELECT DISTINCT(Emp_Age) AS Distinct_Age FROM Employee_Department

SELECT DISTINCT(Emp_Name) AS Distinct_Names FROM Employee_Department

--	• TOP(): Top is used to restrict the number of rows returned from the query.

SELECT TOP(5) * FROM Employee_Department

SELECT TOP(3) Emp_Name FROM Employee_Department

-- NOTE: Aggregate functions ignore NULL values in the calculation, except for COUNT(*), which counts NULL values.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 2. GROUP BY clause: Group rows that have the same values into summary rows, often used with Aggregate Functions.

-- Number of employees who is having same age.
SELECT Emp_Age, COUNT(*) AS Total_Age FROM Employee_Department GROUP BY Emp_Age

-- Calculate the average salary of employees in each department.
SELECT Emp_Department, 
AVG(Emp_Salary) AS Group_Salary 
FROM Employee_Department 
GROUP BY Emp_Department

-- Count the number of employees in each department.
SELECT Emp_Department, 
COUNT(*) AS No_of_Emp 
FROM Employee_Department 
GROUP BY Emp_Department

-- Find the total salary paid to employees in each department.
SELECT Emp_Department, 
SUM(Emp_Salary) AS Total_Salary_Paid 
FROM Employee_Department 
GROUP BY Emp_Department

-- List the highest salary in each department.
SELECT Emp_Department, 
MAX(Emp_Salary) as Highest_Salary 
FROM Employee_Department 
GROUP BY Emp_Department 

-- List the number of employees who joined in each year.
SELECT YEAR(Emp_Date_of_Joining), 
COUNT(*) AS No_of_Employee 
FROM Employee_Department 
GROUP BY YEAR(Emp_Date_of_Joining)

-- Find the average age of employees in each department.
SELECT Emp_Department, 
AVG(Emp_Age) AS Average_Age 
FROM Employee_Department 
GROUP BY Emp_Department

-- Find the earliest hire date for employees in each department.
SELECT Emp_Department, 
MIN(Emp_Date_of_Joining) AS Earliest_Hire_Date 
FROM Employee_Department 
GROUP BY Emp_Department

-- Count the number of employees who have a salary above 50,000 in each department.
SELECT Emp_Department, 
COUNT(*) AS No_of_Employee 
FROM Employee_Department 
WHERE Emp_Salary > 50000 
GROUP BY Emp_Department

-- Find the number of employees in each department who are older than 30.
SELECT Emp_Department, 
COUNT(*) AS No_of_Employee 
FROM Employee_Department 
WHERE Emp_Age > 30 
GROUP BY Emp_Department

-- List the department-wise average age and salary of employees.
SELECT Emp_Department, 
AVG(Emp_Age) AS Average_Age, 
AVG(Emp_Salary) AS Average_Salary 
FROM Employee_Department 
GROUP BY Emp_Department

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 3. HAVING clause: Similar to WHERE, but it is used to filter results after aggregation (i.e., works with GROUP BY). It filters the results based on the condition applied to the aggregated data.

-- Find departments with more than 2 employees.
SELECT Emp_Department, 
COUNT(*) AS No_of_Employee 
FROM Employee_Department 
GROUP BY Emp_Department 
HAVING COUNT(*) > 2

-- Find departments where the average salary is greater than 60,000.
SELECT Emp_Department, 
AVG(Emp_Salary) AS Average_Salary 
FROM Employee_Department 
GROUP BY Emp_Department 
HAVING AVG(Emp_Salary) > 60000

-- List departments where the total salary is greater than 200,000.
SELECT Emp_Department, 
SUM(Emp_Salary) AS Total_Salary 
FROM Employee_Department 
GROUP BY Emp_Department 
HAVING SUM(Emp_Salary) > 200000

-- Find departments with at least one employee having a salary above 70,000.
SELECT Emp_Department, 
MAX(Emp_Salary) AS No_of_Employee 
FROM Employee_Department 
GROUP BY Emp_Department 
HAVING MAX(Emp_Salary) > 70000  
--or
SELECT Emp_Department, 
MAX(Emp_Salary) AS No_of_Employee 
FROM Employee_Department 
WHERE Emp_Salary > 70000 
GROUP BY Emp_Department

-- Find departments where the number of employees with a salary above 50,000 is greater than 1.
SELECT Emp_Department, 
COUNT(*) AS No_of_Employee 
FROM Employee_Department 
WHERE Emp_Salary > 50000 
GROUP BY Emp_Department 
HAVING COUNT(*) > 1

-- List departments where the number of employees who joined after 2019 is more than 2.
SELECT Emp_Department, 
COUNT(*) AS No_of_Employee 
FROM Employee_Department 
WHERE YEAR(Emp_Date_of_Joining) > 2019 
GROUP BY Emp_Department 
HAVING COUNT(*) > 2

-- Find departments where the average salary is between 50,000 and 60,000.
SELECT Emp_Department, 
AVG(Emp_Salary) as Average_Salary 
FROM Employee_Department 
GROUP BY Emp_Department 
HAVING AVG(Emp_Salary) BETWEEN 50000 AND 60000

-- List departments where the total salary exceeds 200,000 but has fewer than 5 employees.
SELECT Emp_Department, 
SUM(Emp_Salary) as Total_Salary, 
COUNT(*) AS No_of_Employee 
FROM Employee_Department 
GROUP BY Emp_Department 
HAVING AVG(Emp_Salary) > 200000 and COUNT(*) < 5			--no recors because sum(emp_salary) is not greater than 300000, its below 300000 but query is correct

-- Find departments where the maximum employee age is greater than 39.
SELECT Emp_Department, 
MAX(Emp_Age) AS Maximum_Age 
FROM Employee_Department 
GROUP BY Emp_Department 
HAVING MAX(Emp_Age)>39

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 4. ORDER BY clause: Orders the result set based on one or more columns, either in ascending (ASC) or descending (DESC) order.

-- List all employees sorted by their age in ascending order.
SELECT Emp_ID, Emp_Name, Emp_Age 
FROM Employee_Department 
ORDER BY Emp_Age

-- List all employees sorted by their salary in descending order.
SELECT Emp_ID, Emp_Name, Emp_Salary 
FROM Employee_Department 
ORDER BY Emp_Salary DESC

-- List all employees sorted by their date of joining, starting from the most recent.
SELECT Emp_ID, Emp_Name, Emp_Date_of_Joining 
FROM Employee_Department 
ORDER BY  Emp_Date_of_Joining DESC

-- List all employees in the IT department, sorted by their salary in ascending order.
SELECT Emp_Name, Emp_Salary, Emp_Department 
FROM Employee_Department 
WHERE Emp_Department = 'IT' 
ORDER BY Emp_Salary

-- List all employees sorted by their name in alphabetical order.
SELECT Emp_ID, Emp_Name 
FROM Employee_Department 
ORDER BY Emp_Name

-- List employees sorted by department first, and then by salary within each department in descending order.
SELECT Emp_Name, Emp_Department, Emp_Salary 
FROM Employee_Department 
ORDER BY Emp_Department, Emp_Salary DESC

-- List employees sorted by their age in descending order, and within the same age, by their date of joining in ascending order.
SELECT Emp_ID, Emp_Age, Emp_Date_of_Joining 
FROM Employee_Department 
ORDER BY Emp_Age DESC, Emp_Date_of_Joining

-- List employees whose salary is above 50,000, sorted by their name in alphabetical order.
SELECT Emp_ID, Emp_Name, Emp_Salary 
FROM Employee_Department 
WHERE Emp_Salary > 50000 
ORDER BY Emp_Name

-- List the employees in the Finance department, sorted by their joining date in ascending order and age in descending order.
SELECT Emp_ID, Emp_Date_of_Joining, Emp_Age, Emp_Department 
FROM Employee_Department 
WHERE Emp_Department = 'Finance' 
ORDER BY Emp_Date_of_Joining, Emp_Age DESC

-- List the employees who are younger than 30, sorted by salary in descending order.
SELECT Emp_Age, Emp_Salary 
FROM Employee_Department 
WHERE Emp_Age > 30 
ORDER BY Emp_Salary DESC

-- Find the number of employees in each department and order the result by the number of employees in descending order.
SELECT Emp_Department, 
COUNT(*) AS NO_of_Employee 
FROM Employee_Department 
GROUP BY Emp_Department 
ORDER BY NO_of_Employee DESC

-- Find the average salary of employees in each department, and only include departments where the average salary is greater than 50,000, ordered by average salary in descending order.
SELECT Emp_Department,  
AVG(Emp_Salary) AS Avgerage_Salary 
FROM Employee_Department 
GROUP BY Emp_Department 
HAVING AVG(Emp_Salary) > 50000
ORDER BY Avgerage_Salary DESC

-- List departments where the total salary of employees is more than 200,000, and order the results by total salary in descending order.
SELECT Emp_Department, 
SUM(Emp_Salary) AS Total_Salary	 
FROM Employee_Department 
GROUP BY Emp_Department 
HAVING SUM(Emp_Salary) > 200000 
ORDER BY Total_Salary DESC

-- Find departments where the average salary is between 50,000 and 60,000, and order the results by department name in alphabetical order.
SELECT Emp_Department, 
AVG(Emp_Salary) AS Average_Salary 
FROM Employee_Department 
GROUP BY Emp_Department 
HAVING AVG(Emp_Salary) BETWEEN 50000 AND 60000 
ORDER BY Emp_Department

-- Find departments where the number of employees with a salary above 50,000 is greater than 1, and order the results by the number of such employees in descending order.
SELECT Emp_Department, 
COUNT(*) AS No_of_Employee 
FROM Employee_Department 
WHERE Emp_Salary > 50000 
GROUP BY Emp_Department 
HAVING COUNT(*) > 1 
ORDER BY No_of_Employee DESC

-- List the departments where the average age of employees is greater than 30, and order the results by the average age in ascending order.
SELECT Emp_Department, 
AVG(Emp_Age) AS Average_Age 
FROM Employee_Department 
GROUP BY Emp_Department 
HAVING AVG(Emp_Age) > 30 
ORDER BY Average_Age

-- Find departments where the maximum salary is greater than 70,000, and order the results by the maximum salary in descending order.
SELECT Emp_Department, 
MAX(Emp_Salary) AS Maximum_Salary 
FROM Employee_Department 
GROUP BY Emp_Department 
HAVING MAX(Emp_Salary) > 70000 
ORDER BY Maximum_Salary DESC 

--	List departments where the number of employees is more than 2 and the total salary exceeds 150,000, ordered by total salary in ascending order.
SELECT Emp_Department, 
COUNT(*) AS No_of_Employee, 
SUM(Emp_Salary) as Total_Salary 
FROM Employee_Department 
GROUP BY Emp_Department 
HAVING COUNT(*) > 2 AND SUM(Emp_Salary) > 150000 
ORDER BY Total_Salary

-- Find departments where the total number of employees with salary above 50,000 is greater than 1, and order by the department name alphabetically.
SELECT Emp_Department, 
COUNT(*) AS Total_Employee 
FROM Employee_Department 
WHERE Emp_Salary > 50000 
GROUP BY Emp_Department 
HAVING COUNT(*) > 1 
ORDER BY Emp_Department

-- List the departments where the average salary is less than 60,000 and the number of employees is more than 3, ordered by department name.
SELECT Emp_Department, 
AVG(Emp_Salary) AS Average_Salary, 
COUNT(*) AS No_of_Employee 
FROM Employee_Department 
GROUP BY Emp_Department 
HAVING AVG(Emp_Salary) < 60000 AND COUNT(*) > 3 
ORDER BY Emp_Department

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 5. LIMIT/TOP clause: Limits the number of rows returned in the result set.

-- NOTE: LIMIT clause works in MySQL, PostgreSQL, SQLite and some other database. TOP clause works in SQLServer

SELECT TOP 5 Emp_Name, Emp_Salary FROM Employee_Department ORDER BY Emp_Salary

SELECT TOP 5 Emp_Name, Emp_Salary FROM Employee_Department ORDER BY Emp_Salary DESC

SELECT TOP 3 * FROM Employee_Department

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------