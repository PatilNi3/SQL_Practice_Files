-- SQL JOINS
/*
SQL Joins are operations used to combine data from two or more tables based on a related column between them.
These re commonly used when you need to fetch data from multiple tables in a relational database.
Joins allow you to work with data that is spread across different tables by creating relationship between them.

Types of SQL Joins:
1. INNER JOIN
2. LEFT JOIN or LEFT OUTER JOIN
3. RIGHT JOIN or RIGHT OUTER JOIN
4. FULL JOIN or FULL OUTER JOIN
5. CROSS JOIN
6. SELF JOIN
*/

-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

CREATE TABLE Student (
Student_ID INT PRIMARY KEY IDENTITY,
Student_Roll_No VARCHAR(5),
Student_Name VARCHAR(100),
Student_Age INT,
Student_Class VARCHAR(50),
Student_Address VARCHAR(100),
Student_Performance VARCHAR(50)
)

INSERT INTO Student (Student_Roll_No, Student_Name, Student_Age, Student_Class, Student_Address, Student_Performance)
VALUES 
('S001', 'Alice', 10, '5th Standard', '123 Main St', 'Excellent'),
('S002', 'Bob', 9, '5th Standard', '124 Main St', 'Intermediate'),
('S003', 'Charlie', 8, '4th Standard', '125 Main St', 'Below Average'),
('S004', 'David', 10, '5th Standard', '126 Main St', 'Excellent'),
('S005', 'Eve', 9, '4th Standard', '127 Main St', 'Intermediate'),
('S006', 'Frank', 11, '6th Standard', '128 Main St', 'Excellent'),
('S007', 'Grace', 9, '5th Standard', '129 Main St', 'Intermediate'),
('S008', 'Hannah', 10, '6th Standard', '130 Main St', 'Excellent'),
('S009', 'Ian', 8, '4th Standard', '131 Main St', 'Below Average'),
('S010', 'Jack', 10, '5th Standard', '132 Main St', 'Excellent'),
('S011', 'Lily', 13, '8th Standard', '133 Main St', 'Excellent'),
('S012', 'Peter', 14, '9th Standard', '130 Main St', 'Brilliant')

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Teacher (
Teacher_ID INT PRIMARY KEY IDENTITY,
Teacher_Name VARCHAR(100),
Teacher_Age INT,
Teacher_Subject VARCHAR(50),
Teacher_Class VARCHAR(50),
Teacher_Address VARCHAR(100),
Teacher_Experience INT
)

INSERT INTO Teacher (Teacher_Name, Teacher_Age, Teacher_Subject, Teacher_Class, Teacher_Address, Teacher_Experience)
VALUES 
('Mr. Smith', 35, 'Mathematics', '5th Standard', '201 Elm St', 10),
('Mrs. Johnson', 40, 'English', '5th Standard', '202 Elm St', 15),
('Mr. Lee', 38, 'Science', '4th Standard', '203 Elm St', 12),
('Ms. Davis', 32, 'History', '6th Standard', '204 Elm St', 8),
('Mr. Brown', 45, 'Geography', '5th Standard', '205 Elm St', 20),
('Mrs. Wilson', 50, 'Mathematics', '6th Standard', '206 Elm St', 22),
('Mr. Harris', 30, 'English', '4th Standard', '207 Elm St', 5),
('Ms. Taylor', 42, 'Science', '5th Standard', '208 Elm St', 18),
('Mr. Clark', 34, 'History', '4th Standard', '209 Elm St', 9),
('Mrs. Scott', 47, 'Geography', '5th Standard', '210 Elm St', 25),
('Mr. Roger', 50, 'History', '10th Standard', '211 Elm St', 40),
('Mr. Stark', 45, 'Science', '7th Standard', '204 Elm St', 30)

-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦

-- 1. INNER JOIN:
/*
Returns records that have matching values in both tables.
If there is no match, the rwo is not included in the result.
*/

SELECT	Student.Student_Name, Teacher.Teacher_Name 
FROM Student 
INNER JOIN Teacher 
ON Student.Student_Class = Teacher.Teacher_Class

-- 2. LEFT JOIN or LEFT OUTER JOIN
/*
Returns all records from the left table (first table) and the matched records from the right table (second table).
If no match is found, the result will contain NULL for columns from right table.
*/

SELECT Student.Student_Name, Student.Student_Class, Teacher.Teacher_Name,  Teacher.Teacher_Class 
FROM Student 
LEFT JOIN Teacher 
ON Student.Student_Class = Teacher.Teacher_Class

-- 3. RIGHT JOIN or RIGHT OUTER JOIN
/*
Returns all records from the right table (second table) and the matched records from left table (first table).
If no match is found, the result will contain NULL for columns from left table
*/

SELECT Student.Student_Name, Student.Student_Class, Teacher.Teacher_Name, Teacher.Teacher_Class 
FROM Student 
RIGHT JOIN Teacher 
ON Student.Student_Class = Teacher.Teacher_Class

-- 4. FULL JOIN or FULL OUTER JOIN
/*
Returns all records when there is a match in either the left (first) table or right (second) table.
If there is no match, the result will contain NULL for missing side.
*/

SELECT S.Student_Name, S.Student_Class, S.Student_Age, T.Teacher_name, T.Teacher_Class, T.Teacher_Age 
FROM Student S 
FULL OUTER JOIN Teacher T 
ON S.Student_Class = T.Teacher_Class

-- 5. CROSS JOIN
/*
Return the cartesian product of the two tables (i.e., every combination of rows from the left table with rows from the right table).
No condition is applied for matching rows, so every row from the first table is combined with all rows from the second table.
*/

SELECT S.Student_Name, S.Student_Class, T.Teacher_Name, T.Teacher_Class 
FROM Student S 
CROSS JOIN Teacher T

-- 6. SELF JOIN
/*
A self join is a join where a table is joined with itself.
This is typically useful when tha table has a hierarchical relationships, like an employee-manager structure.
*/

-- on student table
SELECT S1.Student_Name, S1.Student_Class, S2.Student_Name, S2.Student_Class 
FROM Student AS S1 
JOIN Student AS S2 
ON S1.Student_Class = S1.Student_Class

-- on teacher table
SELECT T1.Teacher_Name, T1.Teacher_Class, T2.Teacher_Name, T2.Teacher_Class
FROM Teacher T1
JOIN Teacher T2
ON T1.Teacher_Class = T2.Teacher_Class

-- ♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦♦
