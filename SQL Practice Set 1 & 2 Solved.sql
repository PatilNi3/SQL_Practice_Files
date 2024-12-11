-- PRACTICE QUESTION-ANSWER SET 1

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

create table Department_Practise (DeptNo int Primary Key identity(501,50), DeptName Varchar(20))

insert into Department_practise values ('Marketing');
insert into Department_practise values ('Finance');
insert into Department_practise values ('Operations');
insert into Department_practise values ('HR');
insert into Department_practise values ('IT');

Select * from Department_practise

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

Create table Employee_Practise (EmpID int primary key Identity(101,1), Name varchar(30),Gender varchar(10), JobTitle varchar(50), Email varchar(50), DOJ date, Salary int, Location varchar(20),DeptNo int Foreign key references Department_Practise(DeptNo))

insert into Employee_Practise values ('Anvita Torane','Female','Data quality specialist','ankitatorane100@gmail.com','01-01-2000', 150100 ,'Mumbai',501);
insert into Employee_Practise values ('Amit_Shinde','Male','Data architect','Amitshinde1000@gmail.com','02-10-2000', 230400 ,'Banglore',551);
insert into Employee_Practise values ('Akshay Patil','Male','Data warehouse developer','Akshaypatil1101@gmail.com','05-11-2001', 310200 ,'Noida',601);
insert into Employee_Practise values ('Bani Bisane','Female','Metadata specialist','Banibisane1201@gmail.com','12-12-2001', 450100 ,'Ahemdabad',651);
insert into Employee_Practise values ('Bhavesh Patel','Male','Manager','Bhaveshpatel102@gmail.com','10-01-2002',530400 ,'Hydrabad',701);
insert into Employee_Practise values ('Chetana Bansal','Female','Data analyst','Chetanabansal2102@gmail.com','01-21-2002', 110200 ,'Pune',501);
insert into Employee_Practise values ('Chirag Hirani','Male','Database administrator','Chiraghirani3002@hitmail.com','07-30-2002', 250100 ,'Mumbai',551);
insert into Employee_Practise values ('Dinesh Kale','Male','Data management consultant','Dineshkale2105@yahoo.com','12-21-2005', 330400 ,'Banglore',601);
insert into Employee_Practise values ('Deeti_Nikalje','Female','Master data management clerk','Deeptinikalje405@gmail.com','12-04-2005', 410200 ,'Noida',651);
insert into Employee_Practise values ('Era Vichare','Female','CRM database manager','EraVichare1106@gmail.com','11-11-2006', 550100 ,'Ahemdabad',701);
insert into Employee_Practise values ('Eshan Modi','Male','Data quality specialist','Eshanmodi107@gmail.com','02-01-2007', 130400 ,'Hydrabad',501);
insert into Employee_Practise values ('Hema Kadam','Male','Data architect','Hemakadam908@gmail,com','05-09-2008',210200,'Pune',551);
insert into Employee_Practise values ('Hitesh Deshmukh','Male','Data warehouse developer','Hiteshdeshmukh2010@yahoo.com','08-20-2010', 350100 ,'Mumbai',601);
insert into Employee_Practise values ('Kiran Bhondve','Female','Metadata specialist','Kiranbhondve2112@gmail.com','07-21-2012', 430400 ,'Banglore',651);
insert into Employee_Practise values ('Komal Gandhi','Female','Manager','Komalgandhi2216@gmail.com','03-22-2016', 510200 ,'Noida',701);
insert into Employee_Practise values ('Leisha Patel','Female','Data analyst','Leishapatel3118@gmail.com','05-31-2018', 150100 ,'Ahemdabad',501);
insert into Employee_Practise values ('Meet Shastri','Male','Database administrator','Meetshastri719@gmail.com','01-07-2019', 230400 ,'Hydrabad',551);
insert into Employee_Practise values ('Nitya Mehta','Female','Data management consultant','NityaMehta3008@hotmail.com','11-30-2008', 310200 ,'Pune',601);
insert into Employee_Practise values ('Niraj Chavan','Male','Master data management clerk','Nirajchavan209@gmail.com','09-02-2009', 450100 ,'Mumbai',651);
insert into Employee_Practise values ('Ovi Mhatre','Female','CRM database manager','Ovimhatre510@gmail.com','05-05-2010', 530400 ,'Banglore',701);
insert into Employee_Practise values ('Priyanka Karande','Female','Data quality specialist','Priyankakarande911@yahoo.com','12-09-2011', 110200 ,'Noida',501);
insert into Employee_Practise values ('Rajas Tambe','Male','Data architect','Rajastambe1112@gmail.com','11-11-2012', 250100 ,'Ahemdabad',551);
insert into Employee_Practise values ('Radha Joshi','Female','Data warehouse developer','Radhajoshi1213@gmail.com','12-12-2013',330400 ,'Hydrabad',601);
insert into Employee_Practise values ('Samadhan Ingle','Male','Metadata specialist','samadhaningle1514@gmail.com','12-15-2014',410200 ,'Pune',651);
insert into Employee_Practise values ('Sanket Kamble','Male','Manager','sanketkamble1515@yahoo.com','01-25-2015', 540500 ,'Mumbai',701);
insert into Employee_Practise values ('Tanvi_Pokale','Female','Data analyst','Tanvipokale1716@gmail.com','04-17-2016', 130400 ,'Banglore',501);
insert into Employee_Practise values ('Soni Malviya','Female','Database administrator','sonimalviya1417@hotmail.com','04-14-2017', 210200 ,'Noida',551);
insert into Employee_Practise values ('Vani Jadhav','Female','Data management consultant','Vanijadhav821@yahoo.com','11-08-2021', 340500 ,'Ahemdabad',601);
insert into Employee_Practise values ('Zaid_Mohammad','Male','Master data management clerk','Zaidmohammad1320@gmail.com','11-13-2020', 420300 ,'Hydrabad',651);
insert into Employee_Practise values ('Minal Waghulde','Female','CRM database manager','MinalWaghulde2222@gmail.com','02-22-2022', 510200 ,'Pune',701);

Select * from Employee_Practise

-- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻

-- 1.Display the details of all the employess.

-- 2.Display the name and job for all the employess.

-- 3.Display the name and salary for all the employess.

-- 4.Display the employee no and total salary for all the employess.

-- 5.Display the employee name and annual salary for all the employess.

-- 6.Display the employee names of all employess who are working in HR department.

-- 7.Display the employee names of all employess who are working in HR department and salary is greater than 2000.

-- *8.Display the employee number who are earning same salary.

-- 9.Display the names of employess whose are working in organization for the past 5 years.

-- 10.Display the list of employess who have joined the company before 30-01-2020 after 30-07-2020?

-- 11.Display current date.

-- 12.Display all the tables name from database?

-- 13.Display the employess whos name start with alphabet 'S'.

-- 14.Display the employess whos name ends with alphabet 'S'.

-- 15.Display the employees whose names have second alphabet 'R' in their names.

-- 16.Select the names of the employee whose names is exactly five charecter of length.
 
 -- 17.Display the total salary being paid to all employess.

 -- 18.Display the maximum salary from employee table.

 -- 19.Display the minimum salary from employee table.

 -- 20.Display the Average salary from employee table.


 -- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻

 -- PRACTICE QUESTION-ANSWER SET 2

 -- 1.Display the names of the employee in order of salary i.e. the name of employee earning lowest salary should be first.

 -- 2.Display the empno,ename,deptno,salary sort the output first based on name within name by deptno and within deptno by salary.

 -- 3.Display the name of the employee along with their annual salary (salary*12). The name of the employee earning highest annual salary should appear first.

 -- 4.Display the names,salary,HRA,PF,DA,Total Salary for each employeer.
 -- The output should be in the order of total salary,HRA 15% salary,DA 10% salary, PF 5% of salary, total salary will be (salary+HRA+DA)-PF

 -- 5.Display the department numbers and total number of employees working in each department.

 -- 6.Display the department numbers and total salary for each department

 -- 7.Display the department numbers and total maximum salary for each department

 -- 8.Display the department numbers and total salary for each department whose employee count is more than 2.

 -- 9.Display the names of HR whos earn a salary more than highest salary of Finance department.

 -- 10.Display the name of employess who earn highest salary in their respective department?
 
 -- 11.Display the name of employess who are working in Accounting department (Data Analyst).

 -- 12.Display the name of employess who are working in Mumbai.

 -- 13.Display the department having total salary greater than the maximum salary for managers.

 -- 14.Display the employess last or bottom 5 records.

 -- 15.Display the employess whose employee ID is even.

 -- 16.Display the employess whose employee ID is odd.

 -- 17.How to find '_' within two names (for ex: name like Praveen_Patil)

 -- 18.Display the maximum salary from being paid to Finance department from employee table.

 -- 19.Display the minimum salary from being paid to HR department from from employee table.

 -- 20.Display the Average salary drawn by Manager department from from employee table.


  -- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻


