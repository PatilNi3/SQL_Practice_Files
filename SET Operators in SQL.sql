-- SET Operators
/*
Set operators are used to combine the results of two SELECT queries	into a single result.
These operators are typically used when you need to merge or compare datasets.
The primary set operators in SQL are:
1. UNION
2. UNION ALL
3. INTERSECT
4. EXCEPT
*/

USE SQL_Server_DB
-- using Student and Teacher table from SQL_Joins file.
SELECT * FROM Student
SELECT * FROM Teacher

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--1. UNION: Combines the result set of two or more SELECT queries, but removes duplicate rows.

SELECT Student_Class FROM Student
UNION
SELECT Teacher_Class FROM Teacher

-- 2. UNION ALL: Combines the result set of two or more SELECT queries, includes all rows including duplicates.

SELECT Student_Class FROM Student
UNION ALL
SELECT Teacher_Class FROM Teacher

-- 3. INTERSECT: Returns only the rows that are common to both result sets.

SELECT Student_Class FROM Student
INTERSECT
SELECT Teacher_Class FROM Teacher

-- 4. EXCEPT: Return rows from the first SELECT query that are not present in the second SELECT query.

SELECT Student_Class FROM Student
EXCEPT
SELECT Teacher_Class FROM Teacher

-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦
