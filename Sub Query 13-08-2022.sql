-- SUB QUERY and CO-RELATIONAL QUERY - 13/08/2022 - 07:10am to 08:00AM

-- SUB QUERY:

-- When a query included inside the another query, the outer query is known as Main Query and Inner query us known as Sub Query.

-- NESTED QUERY:

-- In nested query, inner query runs first and only once. Outer query is executed with result from inner query.
-- Hence, inner query is used in execuation of Outer Query.
-- Performance better than corelated query.

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

create table Departments (DID varchar (5), DName varchar (25), DLocation varchar (25) )

insert into Departments values ('D1', 'Mechanical', 'Banglore'), ('D2', 'Civil', 'Pune'), ('D3', 'Electrical', 'Mumbai')
insert into Departments values ('D4', 'Electronics & TC', 'Hyderabad'), ('D5', 'Computer Science', 'Gurgaon')
insert into Departments values ('D6', 'Instrumentation', 'Hyderabad'), ('D7', 'Agriculture', 'Pune'), ('D8', 'Commerce', 'Gurgaon')
insert into Departments values ('D9', 'Architecture', 'Pune'), ('D10', 'Construction', 'Dubai'), ('D11', 'Assembly', 'Gurgaon')

select * from Departments
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
create table Employee (EID int, EName varchar (25), EAge int, Salary int, DID varchar (5) )

insert into Employee values (101, 'Nitin', 26, 1800000, 'D1'), (102, 'Vaibhav', 30, 900000, 'D2'), (103, 'Amol', 25, 700000, 'D3'), (104, 'Ruchita', 30, 1000000, 'D4')
insert into Employee values (105, 'Neha', 27, 4500000, 'D5'), (106, 'Drisha', 3, 350000, 'D6'), (107, 'Shital', 26, 1200000, 'D7'), (108, 'Sanika', 16, 270000, 'D8')
insert into Employee values (109, 'Ankita', 27, 1500000, 'D1'), (110, 'Anuradha', 25, 1800000, 'D2'), (111, 'Pratima', 25, 1200000, 'D3'), (112, 'Timish', 26, 1400000, 'D5')
insert into Employee values (113, 'Pratham', 32, 540000, 'D12'), (114, 'Alina', 27, 1200000, 'D13'), (121, 'Sameera', 26, 1800000, 'D15'), (123, 'Tani', 25, 1100000, 'D17')

select * from Employee

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

select max(Salary) from Employee					-- Max Salary

select max(Salary) from Employee where Salary < (select max(Salary) from Employee)			-- 2nd Max Salary

select max(Salary) from Employee where Salary < (select max(salary) from Employee where Salary < (select max(Salary) from Employee) )				-- 3rd Max Salary

select min(Salary) from Employee where Salary > (select min(Salary) from Employee)				-- 2nd last min Salary

select * from Employee where Salary < (select max(Salary) from Employee)			-- all Salaries except max one

select * from Employee where Salary > (select min(Salary) from Employee)			-- all salaries except min one

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- ASSIGNMENT

create table Students (Name varchar (50), City varchar (15), Language varchar (15) )

insert into Students values ('Nitin Patil', 'Banglore', 'Hindi'), ('Neha Bendale', 'Sydney', 'English')
insert into Students values ('Ruchita Patil', 'Pune', 'Hindi'), ('Ankita Dhote', 'Pune', 'Hindi')
insert into Students values ('Amruta Dhote', 'Mumbai', 'Marathi'), ('Timish Bendale', 'Hyderabad', 'Hindi')
insert into Students values ('Amol Patil', 'Mumbai', 'Marathi'), ('Vaibhav Salunkhe', 'Pune', 'Hindi')

select * from Students

-- QUE.: Students Name living out of Pune City and using Language Marathi and Hindi

select Name from Students where City in (select City from Students where City not in ('Pune') and Language in (select Language from Students where Language not in ('English') ) )

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- CORELATED QUERY:

-- In corelated query, Outer query executes first and for every outer query row Inner query is executed.
-- Hence, Inner query uses values from Outer query.
-- Inner query is dependent on Outer query.

-- EXISTS/NOT EXISTS OPERATOR:

-- The EXISTS operator is used to test for the existence of any record in subquery.
-- The EXISTS operator returns TRUE if the subquery returns one or more records.

-- The NOT EXISTS operatorwill act quite opposite to EXISTS operator.
-- The NOT EXISTS operator will check the subquery for row existence, if there are no rows then it will return TRUE.

select * from Departments where exists (select * from Employee where Departments.DID = Employee.DID)
select * from Employee where exists (select * from Departments where Employee.DID = Departments.DID)

select * from Departments where not exists (select * from Employee where Departments.DID = Employee.DID)
select * from Employee where not exists (select * from Departments where Employee.DID = Departments.DID)

-- Using SubQuery:

select * from Departments where DID in (select DID from Employee)

select * from Departments where DID not in (select DID from Employee)

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

create table Sub1 ( ID int identity, Name varchar (30) )

insert into Sub1 values ('Nitin Patil'), ('Neha Bendale'), ('Ruchita Patil'), ('Ankita Dhote'), ('Amruta Dhote')
insert into Sub1 values ('Timish Bendale'), ('Tejashree Bendale'), ('Tejashree Patil'), ('Vaibhav Salunkhe')
insert into Sub1 values ('Anuradha Salunkhe'), ('Archana Patil'), ('Anu Salunkhe'), ('Jija Khare'), ('Era Khare')
insert into Sub1 values ('Drisha Patil'), ('Amol Patil'), ('Sushil Patil'), ('Shital More'), ('Shweta Shinde')
insert into Sub1 values ('Shraddha Dhavale'), ('Aakanksha Dhavale'), ('Priyal Hande'), ('Somnath Koshti')

select * from Sub1

-- -----------------------------------------------------------------------------------------------------------------------------------------------------

create table Sub2 (ID int identity, Marks int)

insert into Sub2 values (99), (40), (97), (99), (65), (87), (95), (35), (93), (56), (96), (81), (83), (70), (92), (44), (63)
insert into Sub2 values (38), (65), (41), (94), (55), (45)

select * from Sub2

-- -----------------------------------------------------------------------------------------------------------------------------------------------------

create table Sub3 (ID int identity, City varchar (15) )

insert into Sub3 values ('Banglore'), ('Sydney'), ('Mumbai'), ('Hyderabad'), ('Pune'), ('Chennai'), ('Gurgaon')
insert into Sub3 values ('Pune'), ('Mumbai'), ('Delhi'), ('Kolkata'), ('Bhopal'), ('Banglore'), ('Hyderabad'), ('Pune')
insert into Sub3 values ('Mumbai'), ('Hyderabad'), ('Pune'), ('Gurgaon'), ('Chennai'), ('Pune'), ('Delhi'), ('Kolkate')

select * from Sub3

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- ASSIGNMENTS: By using both SubQuery and Corelated Query.

-- Que.: Name of students having marks is greater than average marks of all students.

-- Using SubQuery

select Name from Sub1 join Sub2 on Sub1.ID = Sub2.ID where marks > (select AVG(Marks) from Sub2)

-- /Using CorelationalQuery

select * from Sub2 where exists (select * from Sub1 where Marks > (select AVG(Marks) from Sub2 where Sub1.ID = Sub2.ID) )

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- QUE.: Total count of students living in Pune City.

-- Using SubQuery

select COUNT(City) from Sub3 where City = 'Pune' and City in (select City from Sub3 where City = 'Pune')

-- Using CorelationalQuery

select count(City) from Sub3 where City = 'Pune' and exists (select * from Sub3 where City = 'Pune')

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

