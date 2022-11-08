-- JOIN - 01/08/2022 - Monday - 07:05am to 08:00am

-- Join:

-- Joins indicate how SQL Server should use data from one table to select the rows in another table.
-- We can join the table using a SELECT statement and a JOIN condition. 

-- Types of Join:
	-- 1. Inner Join
	-- 2. Outer Join
		-- 2.1. Left Outer Join
		-- 2.2. Right Outer Join
		-- 2.3. Full Outer Join
	-- 3. Cross Join
	-- 4. Self Join
	-- 5. Equi Join

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

create table A (AID int identity, Name varchar(10) )

insert into A values ('Nitin')
insert into A values ('Neha')
insert into A values ('Ruchita')
insert into A values ('Ankita')
insert into A values ('Amol')

select * from A

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table B (Name varchar(10), Age int)

insert into B values ('Amruta', 25)
insert into B values ('Drisha', 3)
insert into B values ('Ruchita', 30)
insert into B values ('Ankita', 27)
insert into B values ('Amol', 25)

select * from B

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- 1. INNER JOIN:

-- This JOIN returns all records from multiple tables that satisfy the specified join condition. 

select * from A
select * from B
select * from A join B on A.Name = B.Name

-- 2.1. LEFT OUTER JOIN:

-- The LEFT OUTER JOIN retrieves all the records from the left table and matching rows from the right table. 
-- It will return NULL when no matching record is found in the right side table.

select * from A
select * from B
select * from A left join B on A.Name = B.Name

-- 2.2. RIGHT OUTER JOIN:

-- The RIGHT OUTER JOIN retrieves all the records from the right-hand table and matched rows from the left-hand table. 
-- It will return NULL when no matching record is found in the left-hand table.

select * from A
select * from B
select * from A right join B on A.Name = B.Name

-- 2.3. FULL JOIN:

-- The FULL OUTER JOIN in SQL Server returns a result that includes all rows from both tables. 
-- The columns of the right-hand table return NULL when no matching records are found in the left-hand table. 
-- And if no matching records are found in the right-hand table, the left-hand table column returns NULL.

select * from A
select * from B
select * from A full join B on A.Name = B.Name

-- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻

-- 02/08/2022 - Tuesday - 07:10am to 08:05am

-- 3. CROSS JOIN:

-- CROSS JOIN in SQL Server combines all of the possibilities of two or more tables and returns a result that includes every row from all contributing tables.
-- All rows present in the first table multiplied by all rows present in the second table.

select * from A
select * from B
select * from A cross join B

-- 4. SELF JOIN:

-- A table is joined to itself using the SELF JOIN. It means that each table row is combined with itself and with every other table row.
-- We can do this with the help of table name aliases to assign a specific name to each table's instance.

select * from A
select * from A as A1, a as A2 where A1.Name = A2.Name

-- OR

select * from B
select * from B as B1, B as B2 where B1.Name = B2.Name

-- 5. EQUI JOIN:

-- It is as similar as Inner Join but the syntax is different.
-- Here we need not use JOIN and ON keyword, instead of that we use WHERE clause.

select * from A, B where A.Name = B.Name

-- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻
-- REFERENCES: https://www.javatpoint.com/sql-server-joins