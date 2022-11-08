-- SQL INDEXES

-- Indexes are used by queries to find data from tables quickly.
-- Indexes are created on table and views. Index on a table or view is very similar to an index that we find in a book.
-- The existence of the right index can drastically  improve the performance of the query. 
-- If there is no index to help the query, then the query engine checks every row in the table from beginning to the end, his is called as Table Scan. Table scan is bad for performance.
-- Syntax: CREATE INDEX <Index_Name> on <Table_Name> (expression)

create table IX_Employee_Table (ID int, Name varchar (50), Salary int, Gender varchar (10) )

insert into IX_Employee_Table values (1, 'Nitin', 150000, 'Male'), (2, 'Neha', 450000, 'Female')
insert into IX_Employee_Table values (3, 'Ruchita', 80000, 'Female'), (4, 'Ankita', 125000, 'Female')
insert into IX_Employee_Table values (5, 'Timish', 100000, 'Male'), (6, 'Tejashree', 75000, 'Female')
insert into IX_Employee_Table values (7, 'Tony', 150000, 'Male'), (8, 'Steve', 450000, 'Male')

select * from IX_Employee_Table

select * from IX_Employee_Table where Salary > 50000 and Salary < 100000

-- To find the all employees, who has salary greater than 50000 and less than 100000, the query engine has to check each and every row in the table.
-- resulting in a Table Scan, which can adversely effect on the performance especially if the table is large.
-- Since there is no index to help the query, the query engine performs an entire Table Scan.

-- CREATING AN INDEX

create index IX_Employee_Salary on IX_Employee_Table (Salary ASC)

-- Now, when the SQL server has to execute the same query, it has an index on the salary column to help this query.
-- Salaries between the range of 50000 and 100000 usually present at the top, since the salaries are arranged in an ascending order.
-- SQL server picks up the row addresses from the index and directly fetch the  records from the table, rather than scanning  each row in the table. This is called Index Seek.

sp_helpindex IX_Employee_Table

-- DROP INDEX

-- Syntax: drop index < Table_Name > . < Index_Name >

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- Different types of Indexes in SQL Server
-- 1. Clustered
-- 2. Non-clustered
-- 3. Unique
-- 4. Filteres
-- 5. XML
-- 6. Full text
-- 7. Spatial
-- 8. Columnstore
-- 9. Index with included columns
-- 10. Index on computed columns

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- 1. CLUSTERED INDEX:

-- A clustered index determines the physical order of data in a table.
-- For this reason, a table can have only one clusterd index.

create table Clustered_IX_Employee_Table (ID int Primary Key, Name varchar (50), Salary int, Gender varchar (10), City varchar (30) )

-- Note that ID column is marked as Primary Key.
-- Primary Key constraint creates Clustered Index automatically if no clustered index already exist in the table.
-- To confirm this: sp_helpindex

sp_helpindex Clustered_IX_Employee_Table

insert into Clustered_IX_Employee_Table values
(8, 'Nitin Patil', 150000, 'Male', 'Banglore'), 
(4, 'Neha Bendale', 450000, 'Female', 'Sydney'),
(7, 'Ruchita Patil', 80000, 'Female', 'Mumbai'), 
(3, 'Ankita Dhote', 125000, 'Female', 'Hyderabad'),
(6, 'Timish Bendale', 100000, 'Male', 'Pune'), 
(2, 'Tejashree Bendale', 75000, 'Female', 'Pune'),
(5, 'Tony Stark', 150000, 'Male', 'Los Angeles'), 
(1, 'Steve Rogers', 450000, 'Male', 'California')

-- Note that, the values for ID column are not in a sequencial order.

select * from Clustered_IX_Employee_Table

-- A clustered index is analogus to a Telephone Directory, where the data is arranged by the last name.
-- We just learnt that, a table can have only one Clustered Index.
-- However the index can contain multiple columns ( a composite index ), like the way a telephone directory is organised by last name and first name.

-- Create a Composite Clustered Index on the Gender and Salary columns.

create Clustered Index IX_Employee_Gender_Salary on Clustered_IX_Employee_Table (Gender DESC, Salary ASC)

select * from Clustered_IX_Employee_Table1

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- 2. NON-CLUSTERED INDEX

-- A non-clustered index is analogus to an index page in a textbook.
-- The data is stored in one place and the index in another place. The index will have pointers to the storage location of the data.
-- Since the non-clustered index is stored separately from the actual data. 
-- A table can have more than one non-clustered index, just like how a book can have an index by chapters at the beginning and the another index by common terms at the end.
-- In the index itself, the data is stored in an ascending or descending order of the index key, which doesn't  any way influence the storage of data in the table.

create nonclustered index IX_Employee_Name on Clustered_IX_Employee_Table (Name)

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- Difference between Clustered and Non-Clustered Index

-- 1. Only one clustered index per table, whereas you can have more than one non-clustered index.
-- 2. Clustered index is faster than a non-clustered index, because the non-clustered index has to refer back of the table, if the selected column is not present in the index.
--3. Clustered index determines the storage order of rows in the table and hence doesn't require additional diskspace, but whereas a non-clustered index is stored separately
--     from the table, additional storage space is required.

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- 3. UNIQUE INDEX

-- Unique index is used to enforce uniqness of key value in the index.
-- Uniqueness is a property of an index and both clustered and non-clustered indexes can be unique.

create table Unique_IX_Employee_Table (ID int Primary Key, First_Name varchar (30), Last_Name varchar (30), Salary int, Gender varchar (10), City varchar (30) )

-- Note: By default, Primary Key constraint create a Unique Clustered Index.

sp_helpindex Unique_IX_Employee_Table

create Unique NonClustered Index Unique_IX_Employee_FirstName_LastName on Unique_IX_Employee_Table (First_Name, Last_Name)

select * from Unique_IX_Employee_Table

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- Difference between Unique Constraint and Unique Index

-- There are no major difference between a Unique Constraint and a Unique Index. Infact when you add a unique constraint, a unique index gets created behind the scene.

-- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻
