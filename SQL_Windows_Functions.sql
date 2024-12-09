-- SQL WINDOWS FUNCTIONS
/*
Windows functions in SQL, are used to perform calculations across a set of rows related to the current row.
This functions are typically used for aggregates, ranking and cumulative total without altering the data.
*/

-- Key Concepts of Windows Functions:
/*
1. Partitioning:	You can partition the result set into subsets of data (like grouping) but still return individual rows.
2. Ordering: You can define the order in which the rows are processed (usful for operations like ranking).
3. Window Frame: The 'window' is the range of rows that are used for calculations and it can be defined in various ways (e.g for a range of rows before and after the current row)	.
*/

USE SQL_Server_DB
-- Employee_Department table from SQL_Clause_2 file
SELECT * FROM Employee_Department

-- Type of Windows Function:
--1. Ranking Function: These assign a rank to each row in result set.

--	• ROW_NUMBER(): 
--		- Assign a unique number to each row, based on the order by clause.

SELECT Emp_Name, Emp_Salary, Emp_Department, 
ROW_NUMBER() 
OVER (PARTITION BY Emp_Department ORDER BY Emp_Salary) as Emp_Row_No 
FROM Employee_Department

--	• RANK(): 
--		- Assign a rank to each row within every partition.
--		- Rank is assigned such that rank 1 given to the first row and rows having same value are assigned same rank (i.e., 1). 
--		- For the next rank after two same rank values, one rank value will be skipped.
--		- For instance, if two rows share­ rank 1, the next row gets rank 3, not 2.

SELECT Emp_Name, Emp_Department, Emp_Salary, 
RANK() 
OVER (PARTITION BY Emp_Department ORDER BY Emp_Salary) AS Emp_Rank 
FROM Employee_Department

--	• DENSE RANK:
--		- It assigns rank to each row within partition.
--		- Just like rank function first row is assigned rank 1 and rows having same value have same rank.
--		- The difference between RANK() and DENSE_RANK() is that in DENSE_RANK(), for the next rank after two same rank, consecutive integer is used, no rank is skipped. 

SELECT Emp_Name, Emp_Department, Emp_Salary, 
DENSE_RANK() 
OVER (PARTITION BY Emp_Department ORDER BY Emp_Salary) AS Emp_Dense_Rank 
FROM Employee_Department

--	• NTILE(N): 
--		- Divides the result set into 'n' equal parts and assigns a bucket number.
--		- It’s commonly used for dividing data into quartiles, deciles, or any other custom number of segments.

-- 2 number of segments
SELECT Emp_Name, Emp_Department, Emp_Salary, 
NTILE(2) 
OVER (PARTITION BY Emp_Department ORDER BY Emp_Salary) AS Emp_Ntile 
FROM Employee_Department

-- 3 number of segments
SELECT Emp_Name, Emp_Department, Emp_Salary, 
NTILE(3) 
OVER (PARTITION BY Emp_Department ORDER BY Emp_Salary) AS Emp_Ntile 
FROM Employee_Department

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 2. Aggregate Window Function: These perform a calculation on a set of rows and return a single value, but the OVER clause allows them to be applied to windows of data.

--	• SUM(): Calculates the sum of values over a specified window.
--	• AVG(): Calculates the average of values in a window.
--	• COUNT(): Counts the number of rows in the window.
--	• MAX(): Calculate the maximul value in a window.
--	• MIN(): Calculate the minimum value in a window.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 3. Value Functions: These function provide specific value over a window.

--	• LEAD(): Accesses the value of a row at a specified physical offset from the current row.

SELECT Emp_name, Emp_Department, Emp_Salary, LEAD(Emp_Salary, 1) OVER (PARTITION BY Emp_Department ORDER BY Emp_Salary) AS Emp_Lead FROM Employee_Department

--	• LAG(): Accesses the value of a row at a specified physical offset before the current row.

SELECT Emp_Name, Emp_Department, Emp_Salary, LAG(Emp_Salary, 1) OVER (PARTITION BY Emp_Department ORDER BY Emp_Salary) AS Emp_Lag FROM Employee_Department

--	• FIRST_VALUE(): Returns the first value in the window.

SELECT Emp_name, Emp_Department, Emp_Salary, FIRST_VALUE(Emp_Salary) OVER (PARTITION BY Emp_Department ORDER BY Emp_Salary) AS Emp_First_Value FROM Employee_Department

--	• LAST_VALUE(): Returns the last value in the window.

SELECT Emp_Name, Emp_Department, Emp_Salary, LAST_VALUE(Emp_Salary) OVER (PARTITION BY Emp_Department ORDER BY Emp_Salary) AS Emp_Last_Value FROM Employee_Department

-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

-- More Examples on Windows Functions:

-- 1. Rank employees by their salary within each department.
SELECT Emp_Name, Emp_Department, Emp_Salary, 
RANK() OVER (PARTITION BY Emp_Department ORDER BY Emp_Salary) AS Emp_Salary_Rank 
FROM Employee_Department

-- 2. Dense Rank Employees by Salary Within Each Department.
SELECT Emp_Name, Emp_Department, Emp_Salary, 
DENSE_RANK() OVER (PARTITION BY Emp_Department ORDER BY Emp_Salary) AS Emp_Salary_Dense_Rank 
FROM Employee_Department

-- 3. Assign a unique row number to each employee, ordered by their age within each department.
SELECT Emp_Name, Emp_Age, 
ROW_NUMBER() OVER (PARTITION BY Emp_Department ORDER BY Emp_Age) AS Emp_Age_Row_Number 
FROM Employee_Department

-- 4. Identify Top 3 Highest Paid Employees in Each Department.
SELECT Emp_Name, Emp_Salary, Emp_Department, Top_3_Salary_Rank 
FROM 
(SELECT Emp_Name, Emp_Salary, Emp_Department, 
RANK() OVER (PARTITION BY Emp_Department ORDER BY Emp_Salary) AS Top_3_Salary_Rank 
FROM Employee_Department) AS Ranked_Employee 
WHERE Top_3_Salary_Rank <= 3
--or
SELECT Emp_Name, Emp_Salary, EMp_Department, Top_3_Salary_Row_Number 
FROM 
(SELECT Emp_Name, Emp_Salary, EMp_Department, 
ROW_NUMBER() OVER (PARTITION BY Emp_Department ORDER BY Emp_Salary) AS Top_3_Salary_Row_Number 
FROM Employee_Department) AS Ranked_Employee 
WHERE Top_3_Salary_Row_Number <= 3

-- 5. Rank employees by the number of years they have been with the company. Older join dates should rank higher.
SELECT Emp_Name, Emp_Department, Emp_Date_of_Joining, 
RANK() OVER (PARTITION BY Emp_Department ORDER BY Emp_Date_Of_Joining) AS Emp_Rank_Date_of_Joining 
FROM Employee_Department

-- 6. Find Employees with the Same Salary in Each Department.
SELECT Emp_Name, Emp_Salary, Emp_Department, 
RANK() OVER (PARTITION BY Emp_Department ORDER BY Emp_Salary) AS Same_Salary 
FROM Employee_Department 
WHERE Emp_Salary 
IN 
(SELECT Emp_Salary FROM Employee_Department GROUP BY Emp_Department, Emp_Salary HAVING COUNT(*) > 1)

-- 7. Get the Highest Paid Employee in Each Department.
SELECT Emp_Name, Emp_Salary, Emp_Department, Highest_Salary 
FROM 
(SELECT Emp_Name, Emp_Salary, Emp_Department, RANK() OVER (PARTITION BY Emp_Department ORDER BY Emp_Salary DESC) AS Highest_Salary 
FROM Employee_Department) AS High_Salary 
WHERE Highest_Salary = 1

-- 8. Find the Second Highest Paid Employee in Each Department.
SELECT Emp_Name, Emp_Salary, Emp_Department 
FROM 
(SELECT Emp_Name, Emp_Salary, Emp_Department, RANK() OVER (PARTITION BY Emp_Department ORDER BY Emp_Salary) AS Second_Highest_Salary FROM Employee_Department) AS Second_Highest 
WHERE Second_Highest_Salary = 2

-- 9. Assign a rank to employees by their age within each department. The oldest employee in each department should be ranked first.
SELECT Emp_Department, Emp_Age,  
RANK() OVER (PARTITION BY Emp_Department ORDER BY Emp_Age DESC) AS Emp_Age_Rank 
FROM Employee_Department

-- 10. Employees with the Same Department and Age Rank.
SELECT Emp_Department, Emp_Age, Emp_Age_Rank 
FROM 
(SELECT Emp_Department, Emp_Age, RANK() OVER (PARTITION BY Emp_Department ORDER BY Emp_Age) AS Emp_Age_Rank 
FROM Employee_Department) AS Emp_Age_Ranked 
WHERE Emp_Age_Rank > 1

-- 11. Count Employees in Each Department Ordered by Joining Date.
SELECT Emp_Department, 
COUNT(*) AS No_of_Employee 
FROM 
(SELECT Emp_Department, Emp_Date_of_Joining, 
ROW_NUMBER() OVER (PARTITION BY Emp_Department ORDER BY Emp_Date_of_Joining) AS Emp_Joining_Order FROM Employee_Department) AS Emp_Joined 
GROUP BY Emp_Department

-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦
