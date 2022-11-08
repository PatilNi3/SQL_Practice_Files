-- STORED PROCEDURE - 13/09/2022 - Tuesday 

-- A stored procedure is a database object.
-- A SQL server creates an execuation plan and stores it in the cache.
-- If you have situation, where you write the same query over and over again, you can save that specific as stored procedure and call it by just it's name.

-- Syntax:
	-- create procedure < Procedure_Name >
	-- OR
	-- create proc < Procedure_Name >

-- To execute Stored Procedure:
	-- sp< Procedure_Name >
	-- Eg.:
			-- spGetEmployees
			-- Exec spGetEmployees
			-- Execute spGetEmployees

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

create table Stored_Procedure_Table ( Name varchar(10), Gender varchar(10), Dept_ID int )

insert into Stored_Procedure_Table values ('Nitin', 'Male', 1), ('Neha', 'Female', 2), ('Ruchita', 'Female', 3), ('Ankita', 'Female', 3)
insert into Stored_Procedure_Table values ('Amol', 'Male', 1), ('Timish', 'Male', 1), ('Tejashree', 'Female', 2), ('Pratima', 'Female', 2)
insert into Stored_Procedure_Table values ('Amruta', 'Female', 3), ('Jija', 'Female', 1), ('Tony', 'Male', 2), ('Steve', 'Male', 2)

select * from Stored_Procedure_Table

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- EXAMPLE:

create procedure spGetEmployees
as
begin
select Name, Gender, Dept_ID
from Stored_Procedure_Table
end

-- By Graphically
-- [ Object Explorer -> Expand Databases -> select and Expand Your Database -> Programmability -> Stored Procedure (Refresh it) -> right click on procedure and click on "Execute Stored Procedure"

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- EXAMPLE:

create procedure spEmployeesByGenderAndDept
@Gender nvarchar(10),
@Dept_ID int
as
begin
select Name, Gender, Dept_ID
from Stored_Procedure_Table
end

spEmployeesByGenderAndDept				-- Error

spEmployeesByGenderAndDept 'Male', 1

-- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- 

create procedure spGetEmployeesByGenderAndDept
@Gender nvarchar(10),
@Dept_ID int
as
begin
select Name, Gender, Dept_ID
from Stored_Procedure_Table
where Gender = @Gender and Dept_ID = @Dept_ID
end

spGetEmployeesByGenderAndDept 'Male', 1

spGetEmployeesByGenderAndDept 'Female', 2

spGetEmployeesByGenderAndDept @Dept_ID = '2', @Gender = 'Male'

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- ALTER Procedure

alter procedure spGetEmployees
as
begin
select Name, Gender 
from Stored_Procedure_Table
order by Name
end

spGetEmployees

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- DROP Procedure

drop procedure spGetEmployees

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- Definition of Stored Procedure

sp_helptext spEmployeesByGenderAndDept

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- STORED PROCEDURE WITH OUTPUT PARAMETER

-- To create an Stored Procedure with output parameter, we need to use keyword OUTPUT or OUT.

-- EXAMPLE:

create procedure spEmployees_Count_By_Gender
@Gender nvarchar(10),
@Emp_Count int OUTPUT
as
begin
select @Emp_Count = COUNT(Dept_ID)
from 
Stored_Procedure_Table
where gender = @Gender
end

declare @Emp_Count int
Execute spEmployees_Count_By_Gender 'Male', @Emp_Count OUTPUT
print @Emp_Count

declare @Emp_Count int
Execute spEmployees_Count_By_Gender 'Female', @Emp_Count OUTPUT
print @Emp_Count

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- USEFUL SYSTEM STORED PROCEDURES

-- • sp_help < Procedure_Name > = View the information about the stored procedure like parameter name, their datatypes etc.
																--  = sp_help can be used with any database object like tables, views, stored procedures, triggers etc.
	
	-- Eg.: sp_help spEmployees_Count_By_Gender					-- Stored Procedure
	-- Eg.: sp_help Stored_Procedure_Table								-- Table

-- • sp_helptext < Procedure_Name > = View the text of the Stored Procedure

	-- Eg.: sp_helptext spEmployees_Count_By_Gender

-- • sp_depends < Procedure_Name > = View the dependencies of the Stored Procedure.
																		--	= This system stored procedure is very useful, especially if we want to check, if there are any 
																		--		stored procedure that referencing a table.
																		--	=	sp_depends can also be used with database objects like table etc.

	-- Eg.: sp_depends < Stored_Procedure >
	-- Eg.: sp_depends < Table_Name >

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○
