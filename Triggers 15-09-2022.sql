-- TRIGGERS - 15/09/2022 - Thursday

-- Triggers are stored program/procedure, which are automatically executed or fired when  some events occurs.
-- Events can be any of the following:
	-- 1. Database Manipulation (DML) -> statements like Insert, Update, Delete
	-- 2. Database Definition (DDL) -> statements like Create, Alter, Drop
	-- 3. Database Operation -> like LogON, LogOFF, Startup or Shutdown
-- Triggers can be defined on the Table, View, Schema or Database with which the event is associated.

-- Types of SQL server Triggers:
	-- 1. DDL Triggers
	-- 2. DML Triggers

-- 1. DDL Triggers:
	-- DDL triggers are fired in response to the DDL events, such as CREATE, ALTER, and DROP statements. 
	-- We can create these triggers at the database level or server level, depending on the type of DDL events. 
	-- It can also be executed in response to certain system-defined stored procedures that do DDL-like operations.
	-- The DDL triggers are useful in the following scenario:
		-- When we need to prevent the database schema from changing.
		-- When we need to audit changes made in the database schema.
		-- When we need to respond to a change made in the database schema.

-- 2. DML Triggers:
	-- DML triggers are fired in response to DML events like INSERT, UPDATE, and DELETE statements in the user's table or view. 
	-- It can also be executed in response to DML-like operations performed by system-defined stored procedures.
	-- The DML triggers can be classified into two types:
		-- After/For Triggers
		-- Instead Of Triggers

	-- After/For Trigger:
		-- AFTER trigger fires, when SQL Server completes the triggering action successfully, that fired it. 
		-- Generally, this trigger is executed when a table completes an insert, update or delete operations. 
		-- It is not supported in views. Sometimes it is known as FOR triggers.
		-- We can classify this trigger further into three types:
			-- AFTER INSERT Trigger
			-- AFTER UPDATE Trigger
			-- AFTER DELETE Trigger

	---- Instead Of Trigger:
		-- An INSTEAD of Trigger is a trigger that skips an INSERT, DELETE or UPDATE statements to a table or a view and execute other statements defined in the trigger instead. 
		-- The actual INSERT, DELETE or UPDATE operation does not occur at all.
		-- We can classify this trigger further into three types:
			-- INSTEAD of INSERT Trigger
			-- INSTEAD of UPDATE Trigger
			-- INSTEAD of DELETE Trigger



-- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻
-- EXAMPLES: AFTER/FOR TRIGGERS
-- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻



-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

create table TR_Table ( ID INT PRIMARY KEY, Name VARCHAR(45), Salary INT, Gender VARCHAR(12), DepartmentId INT )  

INSERT INTO TR_Table VALUES 
(1,'Nitin', 150000, 'Male', 3),  
(2,'Neha', 520000, 'Female', 2),  
(3,'Timish', 100000, 'male', 1),  
(4,'Amol', 60000, 'Male', 2),  
(5,'Ruchita', 80000, 'Female', 3) 

select * from TR_Table 

-- ----- ----- ----- ----- -----

create table TR_Test_Table ( ID int identity, Action text )

select * from TR_Test_Table

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○
-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- AFTER/FOR INSERT TRIGGER

create TRIGGER Trigger_Insert   
on TR_Table
for insert  
as 
begin  
declare @ID int  
select @ID = ID from inserted  
insert into TR_Test_Table  
values ('New employee with ID = ' + CAST(@ID as varchar(10)) + ' is Added at ' + CAST(Getdate() as varchar(22)))  
end  

insert into TR_Table values (6,'Tony', 55555, 'Male', 3)

select * from TR_Table
select * from TR_Test_Table

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○
-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- AFTER/FOR UPDATE TRIGGER

create TRIGGER Trigger_Update_1   
on TR_Table
for update
as 
begin  
declare @ID int  
select @ID = ID from inserted
insert into TR_Test_Table  
values ('Employee data with ID = ' + CAST(@ID as varchar(10)) + ' is Inserted & Updated at ' + CAST(Getdate() as varchar(22)))  
end

update TR_Table set Name = 'Tony Stark' where ID = 6

select * from TR_Table
select * from TR_Test_Table

-- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- 

create TRIGGER Trigger_Update_2   
on TR_Table
after update
as 
begin  
declare @ID int  
select @ID = ID from deleted
insert into TR_Test_Table  
values ('Employee data with ID = ' + CAST(@ID as varchar(10)) + ' is Deleted & Updated at ' + CAST(Getdate() as varchar(22)))  
end

update TR_Table set Name = 'Stark' where ID = 6

select * from TR_Table
select * from TR_Test_Table

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○
-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- AFTER/FOR DELETE TRIGGER

create TRIGGER Trigger_Delete   
on TR_Table  
after delete  
as
begin  
declare @ID int  
select @ID = ID from deleted  
insert into TR_Test_Table  
values ('An existing employee with ID = ' + CAST(@ID as varchar(10)) + ' is Deleted at ' + CAST(Getdate() as varchar(22)))  
end 

delete from TR_Table where ID = 6

select * from TR_Table
select * from TR_Test_Table

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○
-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

create table TR_Emp ( ID int identity primary key, Name varchar (30), Salary int, DOB datetime, Experience int )

create trigger Trigger_Insert_Emp
on TR_Emp
after insert
as
declare @DOB varchar (25)
declare @Age int
declare @Experience int
select @DOB = DOB from inserted
select @Experience = Experience from inserted

-- Employee's Age must not above 30 years
set @Age = YEAR(getdate()) - YEAR(@DOB)
if @Age > 30
	begin
	print 'Not Eligible: Age is greater than 30'
	rollback
	end

-- Employee should have more than 5 Years of experience
else if @Experience < 5
	begin
	print 'Not Eligible: Experience is less than 5'
	rollback
	end

else
	begin
	print 'Employees record inserted successfully'
	end

insert into TR_Emp values ('Nitin', 150000, '1995-11-23', 5)
insert into TR_Emp values ('Neha', 450000, '1995-04-17', 4)
insert into TR_Emp values ('Ruchita', 80000, '1991-02-07', 7)

select  * from TR_Emp

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

drop table TR_Table
drop table TR_Test_Table
drop trigger Trigger_Insert
drop trigger Trigger_Update_1
drop trigger Trigger_Update_2
drop trigger Trigger_Delete

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○
-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○



-- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻
-- EXAMPLES: INSTEAD OF TRIGGERS
-- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻



-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

create table Emp_Table_For_Tr (ID int, Name varchar (30), Gender varchar (10), DepartmentID int) 

insert into Emp_Table_For_Tr values (1, 'Nitin', 'Male', 2), (2, 'Neha', 'Female', 1), (3, 'Ruchita', 'Female', 3)
insert into Emp_Table_For_Tr values (4, 'Ankita', 'Female', 4), (5, 'Jija', 'Female', 1), (6, 'Amruta', 'Female', 4)
insert into Emp_Table_For_Tr values (7, 'Timish', 'Male', 2), (8, 'Era', 'Female', 1), (9, 'Amol', 'Male', 4)

select * from Emp_Table_For_Tr

-- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- 

create table Dept_Table_For_Tr ( DeptID int, Dept_Name varchar (10) )

insert into Dept_Table_For_Tr values (1, 'IT'), (2, 'Design'), (3, 'HR'), (4, 'Admin')

select * from Dept_Table_For_Tr

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

create view TR_View
as
select ID, Name, Gender, Dept_Name
from Emp_Table_For_Tr
join Dept_Table_For_Tr
on Dept_Table_For_Tr.DeptID = Emp_Table_For_Tr.DepartmentID

select * from TR_View

insert into TR_View values (10, 'Jija', 'Female', 'IT')			-- Error

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○
-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- INSTEAD OF INSERT TRIGGER

create trigger Tr_Instead_Insert
on TR_View
instead of insert
as
begin
	select * from inserted
	select * from deleted
end

insert into TR_View values (10, 'Jija', 'Female', 'IT')		-- it is got inserted in a view but not in its base tables

-- ----- ----- ----- ----- ----- 

alter trigger Tr_Instead_Insert
on TR_View
instead of insert
as 
begin

	declare @DeptID int
	select @DeptID = DeptID
	from Dept_Table_For_Tr
	join inserted
	on
	inserted.Dept_Name = Dept_Table_For_Tr.Dept_Name

	if @DeptID is null 
	begin
		raiserror ('Invalid department name. Your statement terminated', 16, 1)
		return
	end

	insert into Emp_Table_For_Tr (ID, Name, Gender, DepartmentID)
	select ID, Name, Gender, @DeptID
	from inserted

end

insert into TR_View values (10, 'Jija', 'Female', 'IT')	

insert into TR_View values (11, 'Tony', 'Male', 'HR')

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

select * from TR_View
select * from Emp_Table_For_Tr
select * from Dept_Table_For_Tr

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○
-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- INSTEAD OF UPDATE TRIGGER

select * from TR_View

update TR_View set Name = 'Ni3', Dept_Name = 'IT' where ID = 1			-- View Error

update TR_View set Dept_Name = 'IT' where ID = 1

select * from TR_View
select * from Dept_Table_For_Tr

update Dept_Table_For_Tr set Dept_Name = 'Design' where DeptID = 2

select * from TR_View
select * from Dept_Table_For_Tr

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

alter trigger Tr_Instead_Update
on TR_View
instead of update 
as
begin

	if ( update (ID) )
	begin
		raiserror ('ID cannot be changed', 16, 1)
		return
	end

	if ( update (Dept_Name) )
	begin
		declare @DeptID int
		select @DeptID = DeptID
		from Dept_Table_For_Tr
		join inserted
		on
		inserted.Dept_Name = Dept_Table_For_Tr.Dept_Name

		if (@DeptID is null)
		begin
			raiserror ('Invalid Department Name', 16, 1)
			return
		end

		update Emp_Table_For_Tr set DepartmentID = @DeptID
		from inserted
		join Emp_Table_For_Tr
		on
		Emp_Table_For_Tr.ID = inserted.ID

	end

	if ( update (Gender) )
	begin
		update Emp_Table_For_Tr set Gender = inserted.Gender
		from inserted
		join Emp_Table_For_Tr
		on
		Emp_Table_For_Tr.ID = inserted.ID
	end

	if ( update (Name) )
	begin
		update Emp_Table_For_Tr set Name = inserted.Name
		from inserted
		join Emp_Table_For_Tr
		on
		Emp_Table_For_Tr.ID = inserted.ID
	end

end

update TR_View set Dept_Name = 'IT' where ID = 1

select * from TR_View
select * from Dept_Table_For_Tr

update TR_View set Name = 'Ni3', Gender = 'M', Dept_Name = 'Design' where ID = 1

select * from TR_View
select * from Dept_Table_For_Tr

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○
-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- INSTEAD OF DELETE TRIGGER

select * from TR_View

delete TR_View where ID = 1			-- View Error

create trigger Tr_Instead_Delete
on TR_View
instead of delete
as
begin

	delete Emp_Table_For_Tr
	from Emp_Table_For_Tr
	join deleted
	on
	Emp_Table_For_Tr.ID = deleted.ID

end

delete TR_View where ID = 1

select *from TR_View
select * from Emp_Table_For_Tr

-- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- 

alter trigger Tr_Instead_Delete
on TR_View
instead of delete
as
begin

	-- by using SubQuery
	delete Emp_Table_For_Tr
	where id in ( select ID from deleted )

end

delete TR_View where ID = 2

select *from TR_View
select * from Emp_Table_For_Tr

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○
-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻



























