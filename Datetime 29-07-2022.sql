-- DATE FUNCTION AND DATATYPE - 29/07/2022 - Friday - 07:10am to 08:00am

-- In SQL, DATETIME date datatype is used for values that contain both date and time.
-- SQL retrieves and displays DATETIME values in "YYYY-MM-DD hh: mm: ss" format. 
-- The supported range is ‘1753-01-01 00:00:00’ to ‘9999-12-31 23:59:59.997’.
-- Intervals:
	-- YY/YYYY - Year ranges from 1753 to 9999
	-- MM - Month ranges from 01 to 12
	-- DD - Date ranges from 01 to 31
	-- hh - Hour ranges from 00 to 23
	-- mm - Minutes ranges from 00 to 59
	-- ss - Seconds ranges from 00 to 59
	-- n* - Fractional Seconds ranges from 0 to 999

select GETDATE()				-- currentn date and time
select getdate() +1			-- +1 for +24 hours in current date and time
select getdate() -1				--  -1 for -24 hours in current date and time

-- Date Functions:
	-- 1. datediff ( )
	-- 2. dateadd ( )
	-- 3. datepart ( )

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table DT (Sr_No int identity, Name varchar(25), Birthdate varchar(15), Today varchar(15) default GETDATE() )

insert into DT (Name, Birthdate) values ('Nitin Patil', '1995/11/23')
insert into DT (Name, Birthdate) values ('Neha Bendale', '1995/04/17')
insert into DT (Name, Birthdate) values ('Ruchita Patil', '1992/02/07')

select * from DT
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 1. DATEDIFF ( ):
-- Difference between any two dates like Birthdate, Experience of employee etc.

-- Syntax:
-- select datediff (interval, date1, date2)
-- or
-- select datediff (interval, date_column1, date_column2)

select DATEDIFF (YY, '1995/11/23', GETDATE())
select DATEDIFF (MM, '1995/11/23', GETDATE()) as Age_Months
select DATEDIFF (DD, '1995/11/23', GETDATE()) as Age_Days

select *, DATEDIFF (YY, Birthdate, GETDATE() ) as Age_Year from DT
select *, DATEDIFF (MM, Birthdate, GETDATE() ) as Age_Month from DT
select *, DATEDIFF (DD, Birthdate, GETDATE() ) as Age_Day from DT
select *, DATEDIFF (DD, Birthdate, Today) as Age_Day from DT			-- error

-- 2. DATEADD ( ):
-- Add or Subtract a specified time interval from a date.
 
-- Syntax:
-- select dateadd (interval, value, date/date_column)

select DATEADD (YY, 27, '1995/11/23' )
select DATEADD (MM, -321, GETDATE() ) as Months
select DATEADD (DD, -9789, GETDATE() ) as Days
select DATEADD (DD, 10000, '1995/11/23') as Nitin_Celebration
select DATEADD (DD, 10000, '1995/04/17') as Neha_Celebration

select *, DATEADD (YY, 27, Birthdate) as Birthday from DT
select *, DATEADD (MM, 324, Birthdate) as Birthday from DT
select *, DATEADD (DD, 9752, Birthdate) as Birthday from DT

-- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻

-- 30/07/2022 - saturday - 08:10pm to pm

-- 3. DATEPART ( ):
-- Returns a specified part of a date.

-- Syntax:
-- select *, datepart (interval, date/date_column) as new_column_name from <table_name>

select *, DATEPART (YY, GETDATE() ) as Year from DT
select *, DATEPART (MM, GETDATE() ) as Month from DT
select *, DATEPART (DD, GETDATE() ) as Day from DT

select *, DATEPART (YY, Birthdate ) as Birth_Year from DT
select *, DATEPART (MM, Birthdate ) as Birth_Month from DT
select *, DATEPART (DD, Birthdate ) as Birth_Day from DT

-- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻

