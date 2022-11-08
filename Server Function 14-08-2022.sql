-- SQL SERVER FUNCTION - 14/08/2022 - Sunday - 10:40am to 11:50am

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

create table Functions (ID int identity, Name varchar (30), DOB varchar (30), Age int, City varchar (15), Email varchar (50) )

insert into Functions values ('Nitin Patil', '1995-11-23', 26, 'Banglore', 'nitinpatilp29@gmail.com')
insert into Functions values ('NEHA BENDALE', '1995-04-17', 27, 'SYDNEY', 'NEHABENDALEP29@GMAIL.COM')
insert into Functions values ('ruchita patil', '1992-02-07', 30, 'mumbai', 'ruchitapatil.p29@gmail.com')
-- insert into Functions values ('Ankita Dhote', '1994-09-17', 27, 'Hyderabad', 'ankitadhotep29@gmail.com', select GETDATE)

select * from Functions

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table Fun (ID int, Name varchar (30), DOB datetime)

insert into Fun values (1, 'NaNa', getdate())

select * from Fun

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- 1. UPPER FUNCTION:

-- SQL Upper function to convert the characters in the expression into uppercase.
-- Syntax: 
	-- select upper(string)
	-- select upper(Column_name) as (New_Column_Name) from <table_name>

select UPPER('nitin')
select UPPER('neha') as UpperCase
select UPPER(City) as UpperCAse from Functions
select UPPER(City) as UpperCase from Functions where Age = 30
update Functions set Name = UPPER(Name) where City = 'Mumbai'
select * from Functions

-- 2. LOWER FUNCTION:

-- It converts uppercase letters to lower case for the specified text or expression.
-- Syntax:
	-- select lower(string)
	-- select lower(Column_name) as (New_Column_Name) from <table_name>

select LOWER('NITIN')
select LOWER('RUCHITA') as LowerCase
select LOWER(City) as LowerCase from Functions
select LOWER(City) as LowerCase from Functions where Age = 27
update Functions set Name = 'ruchita patil' where Age = 30				-- Permanent changes in table.
select * from Functions

-- 3. LEN:

-- The LEN() function returns the length of a string.
-- Trailing spaces at the end of the string is not included when calculating the length.
-- Syntax:
	-- LEN(string)
	-- select LEN(column_name) as (New_Column_Name) from<Table_Name>

select LEN('Nitin')
select LEN('Ankita') As StringLength
select LEN(Email) as StringLength from Functions
select City, LEN(City) from Functions
update Functions set Name = LEN(Name)  where Age = 30					-- Permanent changes in table.
select * from Functions

-- 4. SUBSTRING:

-- The SUBSTRING() function extracts some characters from a string.
-- Syntax:
	-- select SUBSTRING('string')
	-- select SUBSTRING(Column_Name, Starting Position, Length_of_string)

select SUBSTRING('Nitin Patil', 1, 11)
select SUBSTRING('Nitin Patil', 6, 11)

select SUBSTRING('Neha Bendale', 6, 12) as Surname
select SUBSTRING('Neha Bendale', 5, 12) as Surname
select SUBSTRING('Neha Bendale', 6, 6) as Surname

select SUBSTRING(City, 3, 5) as City_SubString from Functions
select SUBSTRING( City, 1, LEN(City) ) as City_SubString from Functions

-- 5. CONCAT:

--  The CONCAT() function adds two or more stringds together.
-- Syntax:
	-- select CONCAT(string1, string2, ... )
	-- select CONCAT (Column1, Column2, ... ) as (New_Column_Name) from <Table_Name>

select CONCAT('Nitin', 'Patil')
select CONCAT ('Love ', 'You ', '3000') as Morgan_Stark

select CONCAT (Name, City, Email) as UserID from Functions
select CONCAT (City, '@', Age) as Password from Functions

-- 6. REPLACE:

-- The REPLACE() function replaces all ocurances of a substring within a string, with a new substring.
-- Syntax:
	-- select REPLACE(input_string, substring, new_substring)

select REPLACE('Schoop', 'p', 'l')
select REPLACE('Nitin', 'tin', '3')

select REPLACE (Email, 'gmail', 'yahoo') as New_MailID from Functions

-- 7. REPLICATE:

-- The REPLICATE() function repeats a string a specified number of times.
-- Syntax: 
	-- select REPLICATE (string, int)

select REPLICATE ('NitiN', 5)
select REPLICATE ('Ni3 ', 3) as Replica

select REPLICATE (City, 2) as City_Replicate from Functions

-- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻

-- SQL SERVER FUNCTION - 16/08/2022 - Tuesday - 07:05am to am

-- 8. REVERSE:

-- The REVERSE() function reverses a string and returns the result.
-- Syntax:
	-- select REVERSE (string)

select REVERSE ('Neha')

select REVERSE (City) as ReverseCity from Functions

-- 9. TRIM:

-- Remove leading and trailing spaces from a string.
-- Syntax:
	-- select TRIM ( string with leading or trailing or both spaces )

select TRIM ('     Nitin     ')
select LTRIM ('     Nitin     ')
select RTRIM ('     Nitin     ')

-- 10. CONVERT:

-- The CONVERT() function converts a value (of any datatype) into a specified datatype.
-- Syntax:
	-- select CONVERT (datatype, column_name/expression) 

select CONVERT (varchar (10), 23.1195)
select CONVERT (int, 23.1195)
select CONVERT (float, 23)

select DOB, CONVERT (varchar, DOB) from Fun

select DOB, CONVERT (int, DOB) from Functions					-- error
select DOB, CONVERT (datetime, DOB) from Functions

-- 11. CAST:

-- The CAST() function converts a value (of any datatype) into a specified datatype.
-- Syntax:
	-- select CAST (column_name/expression as datatype)

select CAST (2311.1995 as int)
select CAST (2311 as float)

select DOB, CAST (DOB as datetime) from Functions

select DOB, CAST (DOB as varchar) from Fun

-- 12. CHARINDEX:

-- The CHARINDEX() function searches for a substring in a string and returns the position.
-- If the substring is not found, this function returns 0.
-- Syntax:
	-- select CHARINDEX (substring, string/column_name)+1

select CHARINDEX ('t', 'NitiN')
select CHARINDEX ('eh', 'Neha') as Bendale

select CHARINDEX ('@', Email) as Mail from Functions

select SUBSTRING (Email, CHARINDEX ('@', Email), LEN (Email) ) from Functions

-- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻