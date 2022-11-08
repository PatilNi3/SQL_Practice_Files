-- SQL 20/07/2022 - Wednesday - 07:05am to 08:05am

create table s_table (ID int, Name varchar(20), Age int, City varchar(10), Company varchar(20), Contact varchar(15), Email varchar(50), Package varchar(10))

insert into s_table values (55, 'Nitin Patil', 26, 'USA', 'Alphabet', '+91 9604332227', 'nitinpatilp29@gmail.com', '62 LPA')
insert into s_table values (50, 'Neha Bendale', 27, 'Australia', 'Apple', '+91 9604342328', 'nehabendalep29@gmail.com', '60 LPA')
insert into s_table values (51, 'Ruchita Patil', 26, 'UK', 'Google', '+91 9604352429', 'ruchitapatil.p29@gmail.com', '58 LPA')

insert into s_table (ID, Name, Age, Email, Package) values (52, 'Ankita Dhote', 27, 'ankitadhotep29@gmail.com', '55 LPA')
insert into s_table (ID, Name, Company, Email) values (53, 'Pratima Patil', 'Meta', 'pratimapatil420@gmail.com')
insert into s_table (Name, City, Contact, Package) values ('Pooja Sawant', 'Banglore', '+91 9604362530', '35 LPA')

select * from s_table

-- Clauses:

-- 1. where clause (simple filter purpose)
-- 2. order by (ascending or descending order)
-- 3. group by
-- 4. having clause (filter purpose but applied on group by)


-- ☺1. WHERE Clause:

-- ♦ 1.1. Comparitive Operator:  =,  !=,  <,  <=,  >,  >=

select * from s_table where ID = 51
select * from s_table where Name = 'Neha Bendale'

select * from s_table where City != 'Banglore'
select * from s_table where Package != null

select * from s_table where ID > 60
select * from s_table where Name > 'Nitin Patil'

select * from s_table where id >= 60
select * from s_table where Package >= '1 Cr'

select * from s_table where Age < 27
select * from s_table where City < 'UK'

select * from s_table where Contact <= '+91 9604342328'
select * from s_table where Email <= 'nitinpatilp29@gmail.com'

-- ♦ 1.2. Logical Operator:  and,  or

select * from s_table where ID = 55 and Package = '62 LPA'
select * from s_table where Name = 'Neha Bendale' and Package > '50 LPA'
select * from s_table where ID > 50 and Age < 28
select * from s_table where City >= 'UK' and Contact != '+91 9604332227'
select * from s_table where Company != 'TCS' and Email != 'nitinpatil@gmail.com'

select * from s_table where ID = 55 or Package = '58 LPA'
select * from s_table where Name = 'Ruchita Patil' or Package > '59 LPA'
select * from s_table where ID > 50 or age < 28
select * from s_table where City >= 'UK' or Contact != '+91 9604332227'
select * from s_table where Company = 'TCS' or Email = 'ruchitapatil.p29@gmail.com'

-- ♦ 1.3. In/Not In Operator:  IN,  NOT IN

select * from s_table where ID in (55)
select * from s_table where Name in ('Nitin Patil', 'Neha Bendale', 'Ruchita Patil')
select * from s_table where Age in (26, 27)
select * from s_table where Contact in ('+91 9604332227', '+91 9604352429')
select * from s_table where Email in ('nehabendalep29@gmail.com', 'ruchitapatil.p29@gmail.com', 'ankitadhotep29@gmail.com')

select * from s_table where ID not in (51, 52, 53, 54)
select * from s_table where Name not in ('Nitin Patil', 'Neha Bendale', 'Ruchita Patil')
select * from s_table where Age not in (26)
select * from s_table where Contact not in ('+91 9604332227', '+91 9604352429')
select * from s_table where Email not in ('nehabendalep29@gmail.com', 'ruchitapatil.p29@gmail.com', 'ankitadhotep29@gmail.com')
 
 -- ♦ 1.4. Between/Not Between Operator:  BETWEEN,  NOT BETWEEN

 select * from s_table where ID between 50 and 60
 select * from s_table where Name between 'Ankita Dhote' and 'Nitin Patil'				-- both including
 select * from s_table where Name between 'A' and 'N'			-- A including, N excluding
 select * from s_table where Name between 'A' and 'P'			-- A including, P excluding
 select * from s_table where Contact between '+91 960433' and '+91 960435'			-- +91 960435 excluding

 select * from s_table where ID not between 50 and 53
 select * from s_table where Name not between 'Ankita Dhote' and 'Nitin Patil'	-- both excluding
 select * from s_table where Name not between 'A' and 'N'		-- A excluding, N including
 select * from s_table where Name not between 'N' and 'P'		-- N excluding, P including
 select * from s_table where Contact not between '+91 960433' and '+91 960435'			-- '+91 960433' excluding, '+91 960435' including

  -- ♦ 1.5. Like Operator:  LIKE,  NOT LIKE

  select * from s_table where ID like '5%'
  select * from s_table where Name like 'N%'
  select * from s_table where Name not like 'N%'
  select * from s_table where Name like '%l'
  select * from s_table where Age like '2%'
  select * from s_table where Contact like '+91 96%'
  select * from s_table where Email like '%@gmail.com'
  select * from s_table where Name like '%i%'
  select * from s_table where Name like 'P%l'
  select * from s_table where Name like '%i%l'
  select * from s_table where name like '______P%'
  select * from s_table where Name like '%_P%'			-- all Patil's

  select * from s_table where Name like 'N%' and ID like '5%'
  select * from s_table where Age like '2%' or Company like 'A%'

  select * from s_table where Name like '[RP]%'			-- startswith R and P
  select * from s_table where Name like'%[te]'			-- endswith T and E
  select * from s_table where Name like '[^RP]%'		-- never startswith R and P
  select * from s_table where Name like '%[^te]'		-- never endswith t and e

  select * from s_table where Name like '[A-N]%'		-- startswith from A to N (both including)
  select * from s_table where Name like '[^A-N]%'		-- never startswith from A to N (both including)
  select * from s_table where Name like '%[a-t]'			-- endswith from A to t (both including)
  select * from s_table where Name like '%[^a-t]'		-- never endswith from a to t (both including)
 
 -- select * from <table_name> where Name like '%[_]%'		-- fetching the Name which is having underscore ( _ ) in between

  select * from s_table

  -- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻

  -- SQL 21/07/2022 - Thursday - 07:05am to 08:10am

    -- ♦ 1.5. Arithmetic Operator:  +,  - ,  *,  /

  select * from s_table

  -- select *, New_Column_Name		- to create 1 temporary column at the end

  select *, Updated_Package = Package + 5 from s_table		-- error
  select *, Updated_Age = Age +2 from s_table
  select *, Experience = Age - 22 from s_table
  select *, account_No = ID * 25 from s_table
  select *, Updated_ID = ID / 2 from s_table

  select *, Experience = Age - 21 from s_table where Name like 'N%'
  select Age, Eligible = Age+5  from s_table where Age > 26

  insert into s_table values (57, 'Gaurav Choudhary', 30, 'UAE', 'Technical Guruji', '+91 9876543210', 'tg@gmail.com', 10000000)

  select *, PerDaySalary = Package / 30 from s_table where ID = 57 

-- ☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺

  -- ☺2. ORDER BY Clause:

  -- Syntax:
  -- select * from <table_name> order by <column_name> ;					ascending order - default
  -- select * from <table_name> order by <column_name> desc ;		descending order

  select * from s_table order by ID		-- ascending order - default
  select * from s_table order by ID desc		-- descending order

  -- SEQUENCE: WHERE + ORDER BY

  select * from s_table where Name like '%[le]' order by Age
  select * from s_table where Name in ('Nitin Patil', 'Neha Bendale', 'Ruchita Patil', 'Ankita Dhote') order by Package
  select * from s_table where ID >= 50 and ID <= 55 order by City desc
  select * from s_table where Age between 20 and 27 order by ID
  select * from s_table where Age = 27 order by Package desc

-- ☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺

-- DML (Data Manipulation Language): Data Related Command
-- 1. Insert
-- 2. Update
-- 3. Delete

-- 1. INSERT - Insert statement used to insert values in the table

-- Syntax:
-- insert into <table_name> values (value1, value2, vakue3, ... )
-- For Example: don't run the queries

insert into f_table values (101, 'Nitin Patil', 26, 'Banglore', 'nitinpatilp29@gmail.com', '18 lpa');
insert into f_table values (102, 'Neha Bendale', 27, 'Australia', 'nehabendalep29@gmail.com', '58 lpa');
insert into f_table values (103, 'Ruchita Patil', 30, 'Mumbai', 'ruchitapatil.p29@gmail.com', '15 lpa');

insert into f_table (ID, Name, Age) values (104, 'Ankita Dhote', 27);
insert into f_table (Name, City, Email) values ('Drisha Patil', 'Panvel', 'drishapatil@gmail.com');

select * from f_table

-- 2. UPDATE - Update data in table row by row

-- Syntax: 
-- update <table_name> set <column_name> = values
-- update <table_name> set <column_name> = values where Column_Name = 'Existing_value'

update s_table set Company = 'Data Scientists'
update s_table set City = 'Hyderabad' where Name = 'Ankita Dhote'
update s_table set City = 'Pune' where Name = 'Pratima Patil'
update s_table set Age = 24, Contact = '+91 9604322255', Package = '24 LPA', Company = 'Meta' where Name = 'Pratima Patil'
update s_table set ID = 58, Age = 34, Company = 'HP', Email = 'poojasawant@gmail.com' where Name = 'Pooja Sawant'
update s_table set Company = 'Attitude', Contact = '+91 9604050302' where Name = 'Ankita Dhote' 
update s_table set Age = 30,  Company = 'Apple' where Name = 'Ruchita Patil'
update s_table set Company = 'Google' where Name = 'Neha Bendale'
update s_table set Company = 'Alphabet' where Name = 'Nitin Patil'
update s_table set ID = 56, Age = 22, Name = 'Ajey Nagar', City = 'Mumbai', Company = 'CarryMinati', Email = 'carryminatiaj@gmail.com' where Package = '100'
update s_table set Company = 'YouTube', Package = '1.5 Cr' where Name = 'Gaurav Choudhary'
update s_table set Package = '2.3 Cr' where Name = 'Ajey Nagar'

select * from s_table

-- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻

 -- SQL 22/07/2022 - 07:20am to 08:20am

 -- 3. DELETE:
 -- We can delete data from table, row by row either single, multiple or whole table.
 -- By deleting whole table, structure remains the same.
 -- We can do roleback/undo in delete.

 -- Syntax: 
 -- delete <table_name>			- to delete whole table
 -- delete <table_name> where <condition>		- to delete it row by row

 delete s_table where ID = 56			-- deleting single row
 delete s_table where ID in (58, 57)			-- deleting multiple row
 select * from s_table

 -- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

 -- DDL (Data Definition Language) : 
 -- Structure Related Command.
 -- We can't use WHERE clause in DDL Command.
 -- 1. Create
 -- 2. Drop
 -- 3. Alter
 -- 4. Truncate

 -- 1. CREATE: It is used to create table

 -- Syntax:
 -- create table <table_name> (column1 datatype, column2 datatype, column3 datatype, ... )
 -- For Example: don't run the query

 create table f_table (ID int, Name varchar(20), Age int, City varchar(10), Email varchar(40), Package varchar(10))

 -- 2. DROP: 
 -- It is used to delete the whole table including its structure.
 -- We can not do roleback here

 -- Syntax:
 -- drop table <table_name>
 -- For Example: don't run the query

 drop table f_table

 --
 create table Alter_operation (ID int, Name varchar(15))
 
 insert into Alter_operation values (2311, 'Nitin')
 insert into Alter_operation values (1704, 'Neha')
 insert into Alter_operation values (0702, 'Ruchita')
 insert into Alter_operation values (0000, 'Ankita')
 insert into Alter_operation values (1109, 'Pratima')

 select * from Alter_operation
 --

 -- 3. ALTER: 
 -- Changing the table structure
 -- By using Alter we can Add new column, Delete existing column, Change Datatype of column
 
 -- Syntax: 
 -- to add single new column
 -- alter table <table_name> add <new_column_name with datatype>

 alter table Alter_operation add Age int
 select * from Alter_operation

 -- to add multiple new column
 -- alter table <table_name> add <new_column_1 datatype, new_column_2 datatype, ... >
 
 alter table Alter_operation add Company varchar (20), City varchar (10)
 select * from Alter_operation

 -- to delete single column
 -- alter table <table_name> drop column <column_name>

 alter table Alter_operation drop column Age
 select * from Alter_operation

 -- to delete multiple column
 -- alter table <table_name> drop column column1, column2, column3, ...
 
 alter table Alter_operation drop column Company, City
 select * from Alter_operation

 -- to change the datatype of column
 -- int to varchar is possible but vice versa is not.
 -- alter table <table_name> alter <column_name> <changed datatype>

 alter table Alter_operation alter column ID varchar (10)
 
 insert into Alter_operation values ('Five', 'Changed')
 select * from Alter_operation

 -- 4. TRUNCATE: 
 -- We can delete the data from the table excluding its structure.
 -- The truncate command removes the complete data from the table but not the table itself. It preserves the table structure.
 -- It is the fastest command, because no condition is there.

 -- Syntax:
 -- truncate table <table_name>

 truncate table f_table

-- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻

 -- SQL 23/07/2022 - Saturday - Holiday

-- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻

 -- SQL 24/07/2022 - Sunday - Holiday

-- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻

 -- SQL 25/07/2022 - Monday - 07:10am to 08:00am

 -- AGGREGATE FUNCTION:

 -- min, max, sum, avg., top, distinct, count 
 -- It performs the calculation on set of values and return a single value.
 -- It ignores null values, except count(*).
 -- sum and avg only deals with int datatype.
 -- Aggregate functions are often used with group by clause.

 -- MIN:
 select * from s_table 	

 select min(Age) from s_table
 select min(Age) as Min_Age from s_table
 select min(Name) as Min_Name from s_table
 select min(Contact) as Min_Contact from s_table
 select min(Email) as Min_Email from s_table
 select min(City) as Min_City from s_table
 select min(Company) as Min_Company from s_table
 select min(Package) as Min_Package from s_table	-- problem occured

 -- MAX:
  select * from s_table 

  select max(Age) as Max_Age from s_table
  select max(Name) as Max_Name from s_table
  select max(Contact) as Max_Contact from s_table
  select max(Email) as Max_Email from s_table
  select max(City) as Max_City from s_table
  select max(Company) as Max_Company from s_table
  select max(Package) as Min_Package from s_table	-- problem occured

  -- SUM:
  select * from s_table

  select sum(ID) as Sum_ID from s_table
  select sum(Age) as Sum_Age from s_table
  select sum(Name) as Sum_Name from s_table		-- error

  -- AVG:
  select * from s_table

  select avg(ID) as Avg_ID from s_table
  select avg(Age) as Avg_Age from s_table
  select avg(Name) as Avg_Name from s_table		-- error

  -- TOP:
  select * from s_table

  select top 3* from s_table
  select top 5 Company from s_table
  select top 3 Package from s_table

  -- DISTINCT: shows only unique values
  select * from s_table

  select distinct(ID) as Distinct_ID from s_table
  select distinct(City) as Distinct_City from s_table
  select distinct(Age) as Distinct_Age from s_table
  select distinct(Contact) as Distinct_Contact from s_table
  select distinct(Email) as Distinct_Email from s_table

  -- COUNT:
  select * from s_table

  select count(Name) as Count_Name from s_table

  insert into s_table values (101, 'Aakanksha Dhavale', 23, 'Pune', 'Accenture', null, null, '57 LPA')

  select count(Contact) as Count_Contact from s_table			-- ignores null value
  select count(*) as Count_All from s_table			-- does not ignore null value

-- ☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺

create table t_table (ID int, Name varchar(20), Age int, City varchar(10))

insert into t_table values (2311, 'Nitin Patil', 26, 'Banglore')
insert into t_table values (1704, 'Neha Bendale', 27, 'Mumbai')
insert into t_table values (0702, 'Ruchita Patil', 30, 'Mumbai')
insert into t_table values (0001, 'Ankita Dhote', 27, 'Pune')
insert into t_table values (1109, 'Pratima Patil', 25, 'Pune')
insert into t_table values (0002, 'Jija Khare', 26, 'Banglore')
insert into t_table values (0003, 'Drisha Patil', 27, 'Mumbai')
insert into t_table values (0004, 'Swapnil Metkari', 30, 'Pune')

select * from t_table

-- ☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺☺

 -- ☺3. GROUP BY Clause:

 -- GROUP BY Clause is used to group rows by one or more column.
 -- Atleast 1 aggregate function should be there to use GROUP BY Clause.
 
 -- Syntax:
 -- select <column_name_1>, aggregate_function (column_name_2) from <table_name> group by (column_name_1)

 -- Que.: Write a query for Minimum Age of name from each City

 select City, Min(Age) from t_table group by (City)
 select City, Min(Age) as Min_Age_City from t_table group by (City)
 -- other
 select City, Min(Age) as Min_Age_City from t_table group by (Age)		-- error
 select City, min(City) as Min_Age_Age from t_table group by (Age)		-- error
 select City, Min(City) as Min_Age_City from t_table group by (City)		-- problem

 -- Que.: Write a query for Age where ID should be Minimum

 select Age, min(ID) as Min_ID_Age from t_table group by (Age)
 -- other
 select Age, avg(ID) as Avg_ID_Age from t_table group by (Age)
 select Age, sum(ID) as Sum_ID_Age from t_table group by (Age)

 -- SEQUENCE:  WHERE + GROUP BY + ORDER BY

 select City, min(ID) as Min_ID from t_table where City is not null group by (City)
 select City, min(ID) as Min_ID from t_table where City is not null group by (City) order by City
 
 select City, min(Age) as Min_Age from t_table where City is not null group by (City)
 select City, min(Age) as Min_Age from t_table where City is not null group by (City) order by City

-- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻

 -- SQL 26/07/2022 - Tuesday - 07:05am to 08:00am

 -- ☺4. HAVING Clause:

 -- Filter purpose
 -- The WHERE clause places conditions on the selected columns, whereas the HAVING clause places conditions on groups created by the GROUP BY clause.
 -- The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.

 select City, min(Age) as Min_Age from t_table group by City
 select City, min(Age) as Min_Age from t_table group by City having min(Age)>25
 select City, min(Age) as Min_Age from t_table group by City having City ='Mumbai'
 
 select Age, min(Name) as Min_Name from t_table group by Age
 select Age, min(Name) as Min_Name from t_table group by Age having min(Name) in ('Jija Khare', 'Ankita Dhote') 
 select Age, min(Name) as Min_Name from t_table group by Age having Age > 25
 
 select * from t_table

 -- SEQUENCE:  WHERE + GROUP BY + HAVING + ORDER BY

 select City, min(Age) as Min_Age from t_table where City > 'A' group by City having min(Age) > 25 order by City
 select City, min(Age) as Min_Age from t_table where City > 'A' group by City having City > 'A' order by City

 select Age, min(City) as Min_City from t_table where Age >= 25 group by Age having min(City) > 'A' order by Age
 select Age, min(City) as Min_City from t_table where Age >= 25 group by Age having age > 26 order by Age

 -- Que.: Write a query for City where Age of atleast 2 people have same age.

 select Age, COUNT(City) as Same_Age from t_table group by Age having COUNT(Age) >= 2 

-- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻
