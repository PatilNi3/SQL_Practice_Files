-- VIEW - 12/09/2022 - Monday

-- Views are basically a virtual table.
-- Views is basially a Stored SQL query.

-- Advantages of View:
	-- 1. To restrict data access.
	-- 2. To make complex queries easy.
	-- 3. To present different views of the same data.

-- Type of View:

	-- 1. Simple View:
		-- When we access the required data from a single base table.
		-- It can suppoert all DML operations.
		-- Simple View is also called as Updatable View.

	-- 2. Complex View:
		-- When we access the required data from multiple base tables.
		-- It does not supports all DML operations on multiple Base Tables at a time but it supports only SELECT operation.
		-- Complex views are also called as Non-Updatable View or Read only view.

-- Syntax:
	-- CREATE view <view_name> as SELECT <column_name> or * from <table_name> [ WHERE conition (optional) ]
	-- SELECT * from <view_name>

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- EXAMPLE: SIMPLE VIEW

select * from Employee

create view Emp_View
as 
select EID, EName, EAge, Salary
from Employee
where EName is not null

select * from Emp_View 

insert into Emp_View values (135, 'Hulk', 50, 3000000)

select * from Emp_View

insert into Emp_View values (136, null, 15, 1110000)

select * from Emp_View
select * from Employee

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- EXAMPLE: COMPLEX VIEW
 
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table Dept_Table ( Dept_ID int, Dept_Name varchar(10) )

insert into Dept_Table values (1, 'IT'), (2, 'Design'), (3, 'HR'), (4, 'Admin')

select * from Dept_Table

-- ----- ----- ----- ----- -----

create table Emp_Table ( ID int identity(100,1), Name varchar(10), Gender varchar(10), Salary int, Department_ID int )

insert into Emp_Table values ('Nitin', 'Male', 150000, 2), ('Neha', 'Female', 450000, 1), ('Ruchita', 'Female', 80000, 3)
insert into Emp_Table values ('Ankita', 'Female', 125000, 4), ('Amol', 'Male', 50000, 3), ('Timish', 'Male', 100000, 1)
insert into Emp_Table values ('Rohit', 'Male', 85000, 2), ('Tejashree', 'Female', 65000, 4), ('Amruta', 'Female', 74000, 3)
insert into Emp_Table values ('Virat', 'Male', 32000, 4), ('Shraddha', 'Female', 50000, 2), ('Hirpara', 'Male', 450000, 1)

select * from Emp_Table

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create view View_Count
as 
select Dept_Name, COUNT(ID) as Total_Emp 
from Emp_Table
join
Dept_Table on
Emp_Table.Department_ID = Dept_Table.Dept_ID
group by Dept_Name

select * from View_Count

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- VIEW WITH JOIN

create view Dept_Emp_Join_View 
as
select ID, Name, Gender, Salary, Dept_Name 
from Emp_Table 
join 
Dept_Table on
Emp_Table.Department_ID = Dept_Table.Dept_ID

select * from Dept_Emp_Join_View

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- * Row Level Security

create view View_Row_Level_Security
as
select ID, Name, Gender, Salary, Dept_Name
from Emp_Table 
join
Dept_Table on
Emp_Table.Department_ID = Dept_Table.Dept_ID
where Dept_Name = 'IT'

select * from View_Row_Level_Security

-----------------------------------------------------------------------------------------------------------------------------------

-- * Column Level Security

create view Column_Level_Security
as
select Name, Salary
from Emp_Table
join
Dept_Table on
Emp_Table.Department_ID = Dept_Table.Dept_ID

select * from Column_Level_Security

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table View_Table (ID int identity, Name varchar(10), Age int)

insert into View_Table values ('Nitin', 26), ('Neha', 27), ('Ruchita', 30), ('Ankita', 27), ('Amruta', 25)
insert into View_Table values ('Timish', 26), ('Tejashree', 30), ('Amol', 24), ('Tony', 40), ('Steve', 50)

select * from View_Table

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create view Alter_View
as
select ID, Name, Age
from View_Table

select * from Alter_View

-- ----- ----- ----- ----- -----

alter view Alter_View add Salary int

-- ----- ----- ----- ----- -----

drop view Alter_View

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○


