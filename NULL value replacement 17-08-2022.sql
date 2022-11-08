-- SQL NULL VALUE REPLACEMENT - 17/08/2022 - Wednesday - 07:08am to 07:52am

-- To replace Null with specified replacement value, we can use any of the following:
	-- 1. ISNULL ( ) function
	-- 2. CASE statement
	-- 3. COALESCE ( ) function

create table Replace_Null (Sr_No int identity, Name varchar (30), Age int, City varchar (15), Email varchar (50) )

insert into Replace_Null values ('Nitin Patil', 26, 'Banglore', 'nitinpatilp29@gmail.com')
insert into Replace_Null values ('Neha Bendale', null, 'Sydney', 'nehabendalep29@gmail.com')
insert into Replace_Null values ('Ruchita Patil', 30, null, 'ruchitapatil.p29@GMAIL.COM')
insert into Replace_Null values (null, 27, 'Hyderabad', 'ankitadhotep29@gmail.com')
insert into Replace_Null values ('Amruta Dhote', null, 'Pune', null)
insert into Replace_Null values ('Timish Bendale', 25, null, 'timishbendale@gmail.com')

select * from Replace_Null

-- 1. ISNULL ( ) function:

-- The isnull function is a built in function to replace nulls with specified replacement values.
-- To use this function, all we need to do is pass the column name in the first parameter and in the second parameter pass the value with which you want to replace the null value.
-- Syntax:
	-- select ISNULL (column_name, value) from <table_name>

select ISNULL (Name, 'Attitude') from Replace_Null
select ISNULL (Age, 'Amar') from Replace_Null				-- error
select ISNULL (Age, 0) from Replace_Null
select ISNULL (City, 'Jannat') from Replace_Null
select ISNULL (Email, 'Email Email Email Email Email Email Email') from Replace_Null

-- 2. CASE Statement:

-- The case expression goes through conditions and returns a value when the first condition is met.
-- So once a condition is true, it will stop reading and return the result.
-- If no conditions are true, it returns the value in the ELSE clause.
-- If there is no ELSE part and no conditions are true, it returns NULL.
-- Syntax:
	-- select CASE
			-- WHEN condition 1 THEN result 1
			-- WHEN condition 2 THEN result 2
			-- WHEN condition 3 THEN result 3
			-- ELSE condition 4 THEN result 4
	-- END
	-- from <table_name>

select Case 
when Name is null then 'Attitude Queen'
else Name
end
from Replace_Null
-- -------------------------------------------------------------------
select case
when age = 26 then 0
else Age
end
from Replace_Null
-- -------------------------------------------------------------------
select case
when Age is null then 100
else Sr_No
end
from Replace_Null
-- -------------------------------------------------------------------
select case
when City is null then 'Juhu Choupati'
else City
end
from Replace_Null
-- -------------------------------------------------------------------
select case
when Email is null then 'Email Likho Pagal'
else Email
end
from Replace_Null

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- ASSIGNMENT

-- QUE.: IF ADDITION OF 5 SUBJECT IS > 100 THEN SHOW GREEN
			--	IF ADDITION IS 70 TO 100 THEN ORANGE
			--	IF ADDITION IS < 70 THEN RED

create table Marks ( Name varchar (10), M1 int, M2 int, M3 int, M4 int, M5 int )

insert into Marks values ('Nitin', 27, 25, 29, 26, 25), ('Neha', 28, 26, 28, 25, 24)
insert into Marks values ('Ruchita', 25, 11, 6, 6, 27), ('Ankita', 11, 12, 13, 14, 15)

select * from Marks

select case
when (M1 + M2 + M3 + M4 + M5) > 100 then 'Green'
when (M1 + M2 + M3 + M4 + M5) between 70 and 100 then 'Orange'
when (M1 + M2 + M3 + M4 + M5) < 70 then 'Red'
end as Colour
from Marks

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

create table Eng_Maths_Marks ( Name varchar (25), English int, Maths int )

insert into Eng_Maths_Marks values ('Nitin', 53, 85), ('Neha', 85, 90)
insert into Eng_Maths_Marks values ('Ruchita', 60, null), ('Ankita', null, 70)

select * from Eng_Maths_Marks

select case
when English is null then Maths
when Maths is null then English
else (English + Maths)
end
from Eng_Maths_Marks

-- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻

