-- VIEWS IN SQL
/*
- A view in SQL is a saved SQL query that acts as virtual table.
- It can fetch data from one or more tables and present it in a customized format, allowing developers to simply complex query, enhance security, data flexibility.
- A view doesn't store data itself, instead it stores the SQL query (the data is generated dynamically by the SQL query stored in the View).
*/

-- Types of Views:
/*
1. Simple View: A view that is based on a single table or a simple query without any complex joins or aggregations.
2. Complex View: A view that involves multiple tables, joins or aggregations.
3. Updatable View: A view that allows insert, update or delete operations to be performed on the underlying table through the view (not all views support this).
4. Materialized View: A view where the result set is set is stored physically. This can improve performance for complex queries but requires periodic refreshes to keep data updated.
*/

USE SQL_Server_DB
-- using Student and Teacher table from SQL_Joins file
SELECT * FROM Student
SELECT * FROM Teacher

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 1. Simple View:

CREATE VIEW View_Student_Performance_Excellent 
AS 
SELECT Student_Name, Student_Class, Student_Performance 
FROM Student 
WHERE Student_Performance = 'Excellent'

SELECT * FROM View_Student_Performance_Excellent

-- 2. Complex View:

CREATE VIEW View_Student_Teacher_Class 
AS
SELECT S.Student_Name, S.Student_Class, T.Teacher_Name, T.Teacher_Class 
FROM Student S 
JOIN 
Teacher T 
ON S.Student_Class = T.Teacher_Class

SELECT * FROM View_Student_Teacher_Class

-- 3. Updatable View:

CREATE VIEW View_Update 
AS 
SELECT Student_ID, Student_Name, Student_Age 
FROM Student 
WHERE Student_Age = 10

SELECT * FROM View_Update

UPDATE View_Update 
SET Student_Age = 11 
WHERE Student_ID = 10

SELECT * FROM View_Update

SELECT * FROM Student			-- changes reflected in original table

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- UPDATING VIEW

-- updating view has already done in Updatable View (above)
UPDATE <view_name> 
SET <column_name> = <new_value> 
WHERE <condition>

-- DELETING VIEW

DROP VIEW View_Update

SELECT * FROM View_Update			--view already deleted

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 1. Create a view that shows the Student_ID, Student_Roll_No, Student_Name, and Student_Class of all students who have "Excellent" performance.

CREATE VIEW View_Student_Info
AS
SELECT Student_ID, Student_Roll_No, Student_Name, Student_Class 
FROM Student
WHERE Student_Performance = 'Excellent'

SELECT * FROM View_Student_Info

-- 2. Create a view that shows the Teacher_Name, Teacher_Subject, and Teacher_Class along with the Student_Name and Student_Class where the teacher's class matches the student's class.
CREATE VIEW View_Teacher_Student_Class AS
SELECT T.Teacher_Name, T.Teacher_Subject, T.Teacher_Class, S.Student_Name, S.Student_Class
FROM Teacher T 
INNER JOIN Student S 
ON T.Teacher_Class = S.Student_Class

SELECT * FROM View_Teacher_Student_Class

-- 3. Create a view that displays the Teacher_Name, Teacher_Age, and Teacher_Experience for teachers who have more than 10 years of experience.
CREATE VIEW View_Teacher_Experience_10year AS
SELECT Teacher_Name, Teacher_Age, Teacher_Experience 
FROM Teacher 
WHERE Teacher_Experience > 10

SELECT * FROM View_Teacher_Experience_10year

-- 4. Create a view that shows the Student_Class and a count of how many students are in each class. The result should group students by their class.
CREATE VIEW View_Student_In_Each_Class AS 
SELECT Student_Class, 
COUNT(*) AS Student_Count 
FROM Student 
GROUP BY Student_Class

-- 5. Create a view that shows the Student_Name, Student_Class, Teacher_Name, and Teacher_Subject where the student's class matches the teacher's class.
CREATE VIEW View_Student_Teacher AS 
SELECT S.Student_Name, S.Student_Class, T.Teacher_Name, T.Teacher_Subject FROM Student S INNER JOIN Teacher T ON S.Student_Class = T.Teacher_Class

SELECT * FROM View_Student_Teacher

-- 6. Create a view that displays the Student_Roll_No, Student_Name, and Student_Performance for all students whose performance is "Below Average".
CREATE VIEW View_Student_Below_Average AS
SELECT Student_Roll_No, Student_Name, Student_Performance 
FROM Student 
WHERE Student_Performance = 'Below Average'

SELECT * FROM View_Student_Below_Average

-- 7. Create a view that shows the Teacher_Name, Teacher_Age, and Teacher_Subject for all teachers who teach more than one subject. 
CREATE VIEW View_Teacher_Multiple_Subject AS
SELECT Teacher_Name, Teacher_Age, Teacher_Subject	FROM Teacher GROUP BY Teacher_Name, Teacher_Age, Teacher_Subject HAVING COUNT(DISTINCT Teacher_Class) > 1

SELECT * FROM View_Teacher_Multiple_Subject

-- 8. Create a view that shows the Student_Name, Student_Class, Teacher_Name, and Teacher_Subject for students and teachers who belong to the same class.
CREATE VIEW View_Student_Teacher_Same_Class AS
SELECT S.Student_Name, S.Student_Class, T.Teacher_Name, T.Teacher_Subject FROM Student S INNER JOIN Teacher T ON S.Student_Class = T.Teacher_Class

SELECT * FROM View_Student_Teacher_Same_Class

-- 9. Create a view that displays the Teacher_Name, Teacher_Age, Teacher_Subject, and Teacher_Experience of all teachers who teach either Mathematics or History.
CREATE VIEW View_Teacher_Mathematics_History AS
SELECT Teacher_Name, Teacher_Age, Teacher_Subject, Teacher_Experience FROM Teacher WHERE Teacher_Subject IN ('Mathematics', 'history')

SELECT * FROM View_Teacher_Mathematics_History

-- 10. Create a view that calculates the average age of students in each Student_Class.
CREATE VIEW View_Average_Age AS
SELECT Student_Class, AVG(Student_Age) AS Average_Age FROM Student GROUP BY Student_Class

SELECT * FROM View_Average_Age

-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦
