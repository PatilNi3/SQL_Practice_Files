-- CONSTRAINTS - 27/07/2022 - Wednesday - 07:05am to 08:05am

-- Constraints are the predefined set of rules and restrictions applied on the tables or columns
-- for restricting unauthorised values to be inserted into the tables.

 -- 1. Primary Key
 -- 2. Unique
 -- 3. Not Null
 -- 4. Check
 -- 5. Default
 -- 6. Foreign Key
 -- 7. Identity

 -- 1. PRIMARY KEY:

 -- We cannot enter the null, empty or duplicate values in the primary key constraints columns. 
 -- Each table can contain only one primary key column.

 create table T_Four (ID int primary key, Name varchar(10))

 insert into T_Four values (1, 'Neha')
 insert into T_Four values (1, 'Ruchita')		-- error: violation of primary key
 insert into T_Four values (3, null)
 insert into T_Four values (4, null)
 insert into T_Four values (5, 'Drisha')
 insert into T_Four values (null, 'NitiN')		-- error

 select * from T_Four

 -- -------------------------------------------------------------------------------------------------------------------

 create table T_Five (ID int, Name varchar(10) primary key)

 insert into T_Five values (51, 'NitiN')
 insert into T_Five values (51, 'Rucha')
 insert into T_Five values (52, 'NitiN')			-- error: violation of primary key
 insert into T_Five values (53, null)				-- error
 insert into T_Five values (54, 'Neha')

 select * from T_Five

 -- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

 -- 2. UNIQUE:

 -- The UNIQUE constraint ensures that no duplicate values can be inserted into a column.
 -- It is similar to the primary key, but it allows one null value. 
 -- It can be applied while creating a table or after creating the table using the ALTER statement.

 create table T_Six (ID int unique, Name varchar(10))

 insert into T_Six values (1, 'Neha')
 insert into T_Six values (1, 'Ruchita')			-- error: violation of unique
 insert into T_Six values (3, null)
 insert into T_Six values (null, 'Jija')
 insert into T_Six values (null, 'Drisha')	-- error: violation of unique

 select * from T_Six

 --- ------------------------------------------------------------------------------------------------------------------- 

 create table T_Seven (ID int, Name varchar(10) unique)

 insert into T_Seven values (71, 'Nitin')
 insert into T_Seven values (72, 'Nitin')			-- error: violation of unique
 insert into T_Seven values (73, null)
 insert into T_Seven values (74, null)				-- error: violation of unique

 select * from T_Seven

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

 -- 3. NOT NULL:

 -- We can restrict NULL value from being inserted into a given column by using a NOT NULL constraint.
 -- We must provide the valid non-null value in the table while using the INSERT or UPDATE operations as the column will always have data.

 create table T_Eight (ID int not null, Name varchar(10))

 insert into T_Eight values (81, 'Nitin')
 insert into T_Eight values (81, 'Neha')
 insert into T_Eight values (null, 'Ruchita')			-- error
 insert into T_Eight values (82, null)

 select * from T_Eight

--- ------------------------------------------------------------------------------------------------------------------- 

 create table T_Nine (ID int, Name varchar(10) not null)

 insert into T_Nine values (91, 'Nitin')
 insert into T_Nine values (92, 'Neha')
 insert into T_Nine values (93, null)			-- error
 insert into T_Nine values (null, 'Ruchita')

 select * from T_Nine

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

 -- 4. CHECK:

 -- It determines whether the value associated with the column is valid or not with the given condition.
 -- We can specify more than one check constraint for a specific column.
 -- We can apply CHECK constraints while creating the table or after creating the table using the ALTER statement.

 create table C1 (Name varchar(10), Salary int check (Salary > 50000) )

 insert into C1 values ('Nitin', 150000)
 insert into C1 values ('Neha', 450000)
 insert into C1 values ('Ruchita', 49999)			-- error

 select * from C1

 -- Que.: Gender only M or F

 create table C2 (Name varchar(10), Gender varchar(1) check (Gender in ('M', 'F' ) ) )
 
 insert into C2 values ('Nitin', 'M')
 insert into C2 values ('Neha', 'F')
 insert into C2 values ('Ruchita', 'X')			-- error
 insert into C2 values ('XYZ', 'Male')

 select * from C2

 -- Que.: Check for valid mail id

 create table C3 (Name varchar(10), Email varchar(50) check (Email like '%@gmail.com') )

 insert into C3 values ('Nitin', 'nitinpatilp29@gmail.com')
 insert into C3 values ('Neha', 'nehabendalep29@gmail.com')
 insert into C3 values ('Ruchita', 'ruchitapatil.p29@yahoo.com')			-- error

 select * from C3

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

 -- 5. DEFAULT:

 -- This constraint is used to insert the default value in the column when the user does not specify any value for that column.
 -- It can also be created either during the creation of the table or after creating the table.

 create table C4 (ID int, City varchar(10) default 'Banglore' )

 -- Method 1:
 insert into C4 values (1, default)
 insert into C4 values (2, 'Mumbai')

 -- Method 2: (best way)
 insert into C4 (ID) values (3)
 insert into C4 (ID) values (4)
 insert into C4 (ID) values (5)			-- City changed to Banglore but result is same
 insert into C4 (ID) values (6)			-- City changed to Banglore but result is same

 select * from C4

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

 -- 6. IDENTITY: (Auto Constraint)

 -- IDENTITY column is a special type of column that is used to automatically generate key values based on a provided seed (starting point) and increment.
 -- Seed and Increment default value is 1.
 -- Only once used in table.

 create table C5 (ID int identity, Name varchar(10) )

 insert into C5 values ('NitiN')
 insert into C5 values ('Neha')
 insert into C5 values ('Ruchita')
 insert into C5 values ('Ankita')

 select * from C5

 --  ------------------------------------------------------------------------------------------------------------------- 

 create table C6 (ID int identity (1, 1), Name varchar(10) )

 insert into C6 values ('NitiN')
 insert into C6 values ('Neha')
 insert into C6 values ('Ruchita')
 insert into C6 values ('Ankita')

 select * from C6

 --  ------------------------------------------------------------------------------------------------------------------- 

 create table C7 (ID int identity (50, 5), Name varchar(10) )
 
 insert into C7 values ('Nitin')
 insert into C7 values ('Neha')
 insert into C7 values ('Ruchita')
 insert into C7 values ('Ankita')

 select * from C7

-- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻

-- 28/07/2022 - Sunday - 07:07am to 08:00am

 -- 7. FOREIGN KEY:

 -- A foreign key is a database key that links two tables together.
 -- This constraint is also known as referencing key as it identifies the relationships between the tables by referencing a column of the child table containing the foreign key to the PRIMARY KEY column of the parent table.
 -- It means the foreign key column in one table refers to the primary key column of another table.
 -- The table with the primary key is called as Parent Table and the table with the foreign key is called as Child Table.

 create table Department (D_ID int primary key identity, D_Name varchar(50) )

 insert into Department values ('Mechanical')
 insert into Department values ('Civil')
 insert into Department values ('Computer Science')
 insert into Department values ('Electronics & Tc')

 select * from Department

 -- ---------------------------------------------------------------------------------------------------------------------------------------------------------

 create table Student (S_ID int, S_Name varchar(25), D_ID int foreign key references Department (D_ID) )
 
 insert into Student values (101, 'Nitin', 1)
 insert into Student values (102, 'Neha', 2)
 insert into Student values (103, 'Ruchita', 2)
 insert into Student values (104, 'Ankita', 3)
 insert into Student values (105, 'Anamika', 3)
 insert into Student values (106, 'Manjulika', 3)
 insert into Student values (107, 'Chandramukhi', 4)
 insert into Student values (108, 'Kanchana', 5)			-- error

 select * from Student
 
 select * from Department
 
-- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻




