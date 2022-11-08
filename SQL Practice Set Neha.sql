-- SQL Practice Set by Neha

-- •O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•

create table Practice_Dept ( Dept_No int Primary Key identity(101,1), DName varchar(30), DCity varchar(15) )

insert into Practice_Dept values ('accounting', 'Sydney'), ('HR', 'Chicago'), ('Production', 'Pune')
insert into Practice_Dept values ('Sales', 'Delhi'), ('IT', 'Banglore'), ('Logistics', 'Mumbai')

select * from Practice_Dept

-- •○•○•○•○•○•○•○•○••○•○•○•○•○•○•○•○••○•○•○•○•○•○•○•○••○•○•○•○•○•○•○•○••○•○•○•○•○•○•○•○••○•○•○•○•○•○•○•○••○•○•○•○•○•○•○•○••○•○•○•○•○•○•○•○••○•○•○•○•○•○•○•○••○•○•○•○•○•○•○•○••○•○•○•○•○•○•○•○••○•○•○•○•○•○•○•○•

create table Practice_Emp ( Emp_No int identity(51, 1), EName varchar(30), Job varchar(15), DCity varchar(15), DOJ datetime, Company varchar(15), Salary int, Commision int, Dept_No int Foreign Key references Practice_Dept(Dept_No) )

insert into Practice_Emp values ('Nitin Patil', 'Data Scientist', 'Banglore', getdate()-5, 'Google', 350000, 15000, 101)
insert into Practice_Emp values ('Neha Bendale', 'Data Analyst', 'Sydney', getdate()-6, 'Alphabet', 500000, 45000, 105)
insert into Practice_Emp values ('Ruchita Patil', 'Data Engineer', 'Mumbai', getdate()-10, 'Meta', 110000, 10000, 102)
insert into Practice_Emp values ('Ankita Dhote', 'ML Expert', 'Hyderabad', getdate()-6, 'Amazon', 125000, 12000, 106)
insert into Practice_Emp values ('Amruta Dhote', 'Manager', 'Pune', getdate()-9, 'Flipkart', 140000, null, 104)
insert into Practice_Emp values ('Amol Patil', 'Salesman', 'Pune', getdate()-1, 'Accenture', 100000, 8000, 103)
insert into Practice_Emp values ('Sushil Patil', 'Clerk', 'Mumbai', getdate()-2, 'Flipkart', 150000, null, 102)
insert into Practice_Emp values ('Somnath Koshti', 'Data Analyst', 'Hyderabd', getdate()-1, 'Oracle', 100000, 8000, 103)
insert into Practice_Emp values ('Tejashree Patil', 'Clerk', 'Pune', getdate()-3, 'Cognizant', 100000, null, 104)
insert into Practice_Emp values ('Drisha Patil', 'Data Engineer', 'Hyderabad', '11-23-2021', 'Accenture', 105000, 7000, 105)
insert into Practice_Emp values ('Jija Vichare', 'Data Analyst', 'Sydney', '04-17-2020', 'Amazon', 140000, null, 106)
insert into Practice_Emp values ('era vichare', 'ml expert', 'banglore', getdate()-3, 'meta', 125000, 6000, 105)
insert into Practice_Emp values ('NITIN', 'DATA SCIENTIST', 'BANGLORE', GETDATE()-4, 'ALPHABET', 175000, 17500, 103)
insert into Practice_Emp values ('Timish Bendale', 'Data Analyst', 'Mumbai', getdate()-2, 'Google', 140000, 10000, 104)
insert into Practice_Emp values ('Tejashree Bendale', 'Data Enginner', 'Pune', getdate()-1, 'Alphabet', 125000, null, 105)
insert into Practice_Emp values ('Archana Patil', 'ML Expert', 'Banglore', getdate()-1, 'Meta', 350000, 35000, 101)
insert into Practice_Emp values ('Vaibhav Salunkhe', 'Data Analyst', 'Pune', getdate()-1, 'Amazon', 140000, 10000, 106)
insert into Practice_Emp values ('Uma Chougule', 'Clerk', 'Hyderabad', getdate()-30, 'Flipkart', 90000, 4500, 102)
insert into Practice_Emp values ('Madhuri', 'Salesman', 'Mumbai', '02-07-2019', 'Meta', 100000, 7000, 103)
insert into Practice_Emp values ('Kalyani Gadhave', 'Manager', 'Hyderabad', getdate()-1, 'Accenture', 110000, null, 104)
insert into Practice_Emp values ('Nikita Bhagwat', 'Salesman', 'Pune', getdate(), 'Cognizant', 50000, 2000, 105)
insert into Practice_Emp values ('Komal Surve', 'Clerk', 'Banglore', '12-31-1991', 'Wipro', 75000, 5000, 106)
insert into Practice_Emp values ('Rakesh Natkar', 'Manager', 'Chennai', getdate()-5, 'TCS', 120000, 11000, 101)
insert into Practice_Emp values ('Rucha', 'Data Engineer', 'Delhi', getdate()-3, 'Flipkart', 110000, null, 102)
insert into Practice_Emp values ('Neha', 'Data Scientist', 'Sydney', getdate()-2, 'Google', 250000, 25000, 103)
insert into Practice_Emp values ('Jija', 'Clerk', 'Chennai', getdate(), 'Meta', 45000, 4000, 104)
insert into Practice_Emp values ('Era', 'Salesman', 'Delhi', getdate(), 'Amazon', 55000, 5000, 105)
insert into Practice_Emp values ('Nita Nalwade', 'Clerk', 'Pune', '01-01-1989', 'Flipkart', 60000, 5000, 103)

select * from Practice_Emp

-- •O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•O•

-- Question and Answer

-- 1. Display the dept information from department table.
select * from Practice_Dept
-- 2. Display the details of all employees
select * from Practice_Emp
-- 3. Display the name and job for all employees
 select Ename, Job from Practice_Emp
-- 4. Display name and salary for all employees.
select Ename, Salary from Practice_Emp
-- 5. Display employee number and total salary  for each employee.
select Emp_No, Salary from Practice_Emp
-- 6. Display employee name and annual salary for all employees.
select Ename, Annual_Salary = Salary * 12 from Practice_Emp
-- 7. Display the names of all employees who are working in department number 101
select Ename from Practice_Emp where Dept_No = 101
-- 8. Display the names of all employees working as  clerks and drawing a salary more than 3000
select Ename from Practice_Emp where Job = 'Clerk' and Salary > 3000
-- 9. Display employee number and names for employees who earn commission
select Emp_No, Ename from Practice_Emp where Commision not like 'null'
-- or
select Emp_No, Ename from Practice_Emp where Commision like '%'
-- 10. Display names of employees who do not earn any commission.
select Ename from Practice_Emp where Commision is null
-- 11. Display the names of employees who are working as clerk,salesman or analyst and drawing a salary more than 3000.
select Ename from Practice_Emp where Job in ('Clerk', 'Salesman', 'Data Analyst')
-- 12. Display the names of employees who are working in the company  for the past 5 years.
select Ename from Practice_Emp where DOJ > getdate()-5
-- 13. Display the list of employees who have joined the company before 30th  June 90 after 31st dec 90.
select * from Practice_Emp where DOJ > '06-30-1990' 
-- 14. Display current date.
select getdate()
15. Display the list of users in your  database(using log table).

-- 16. Display the names of all tables from the current user.
select * from master.information_schema.tables
17. Display the name of the Current user.

-- 18. Display the names of employees working in department number 10 or 20(102) or 40(104) employees  working  as  clerks,salesman or analyst
select Ename from Practice_Emp where Dept_No in (101, 102, 104) and Job in ('Clerk', 'Salesman', 'Data Analyst')
-- 19. Display the names of employees whose name starts with alphabet S.
select Ename from Practice_Emp where Ename like 'S%'
-- 20. Display the names of employees whose name ends with alphabet S.
select Ename from Practice_Emp where Ename like '%S'
-- 21. Display the names of employees whose name have second alphabet A in their names.
select Ename from Practice_Emp where Ename like '_A%'
-- 22. Display the names of employees whose name is exactly five characters in length.
select Ename from Practice_Emp where len(Ename) = 5
-- 23. Display the names of employees who are not working as managers.
select Ename from Practice_Emp where Job not in ('Manager')
-- 24. Display the names of employees who are not working as SALESMAN or CLERK or ANALYST.
select Ename from Practice_Emp where Job not in ('Clerk', 'salesman', 'Data Analyst')
25. Display all rows from Emp table .The System should wait after every screen full of information.

-- 26.Display the total number of employees working in the company.
select count(Job) as Total_Employees from  Practice_Emp
-- 27. Display the total salary being paid to all employees.
select sum(Salary) as Total_Salary from Practice_Emp
-- 28. Display the maximum salary from emp table.
select max(Salary) as Max_Salary from Practice_Emp
-- 29. Display the minimum salary from emp table.
select min(Salary) as Min_Salary from Practice_Emp
-- 30. Display the average salary from emp table.
select avg(Salary) as Avg_Salary from Practice_Emp
-- 31. Display the maximum salary being paid to CLERK.
select max(Salary) from Practice_Emp where Job = 'Clerk'
-- 32. Display the maximum salary being paid in dept no 20(102).
select max(Salary) from Practice_Emp where Dept_No = 102
-- 33. Display the min salary being paid to any SALESMAN
select min(Salary) from Practice_Emp where Job = 'Salesman'
-- 34. Display the average salary drawn by managers.
select avg(Salary) from Practice_Emp where Job = 'Manager'
-- 35. Display the total salary drawn by analyst working in dept no 40(104).
select sum(Salary) from Practice_Emp where Dept_No = 104 and Job = 'Data Analyst'
-- 36. Display the names of employees in order of salary i.e. the name of the employee earning  lowest salary should appear first.
select Ename, Salary from Practice_Emp order by Salary
-- 37.  Display the names of employees in descending order of salary
select Ename, Salary from Practice_Emp order by Salary desc
-- 38. Display the details from emp table in order of emp name.
select * from Practice_Emp order by Ename
-- 39. Display empno,ename,deptno and sal .Sort the output first based on name and within name by deptno  and within deptno by sal;
select Emp_No, Ename, Dept_No, Salary from Practice_Emp order by Ename, Dept_No, Salary
-- 40. Display the name of the employee along with their annual salary (sal*12).The name of the employee earning highest annual salary should appear first.
select Ename, Annual_Salary = Salary * 12 from Practice_Emp order by Salary desc
-- 41. Display name ,Sal,hra,pf,da,total sal for each employee.The Output should be in the order of total sal, hra 15% of sal , da 10% of sal , pf 5% of sal total salary will be (sal*hra*da)-pf.
select Ename, Salary, HRA = (Salary*0.15), PF = (Salary*0.10), DA = (Salary*0.05), 
Total_Salary = Salary+(Salary*0.15)+(Salary*0.10)+(Salary*0.05) from Practice_Emp
-- 42. Display dept numbers and total number of employees within each group.
select Dept_No, count(Job) as No_of_Employees from Practice_emp group by Dept_No
-- 43. Display the various jobs and total number of employees with  each job group.
select Job, count(Job) as No_of_Employees from Practice_Emp group by Job
-- 44. Display department numbers and total salary for each department.
select Dept_No, sum(Salary) as Total_Salary_Dept_wise from Practice_Emp group by Dept_No
-- 45. Display department numbers and maximum salary for each department.
select Dept_No, max(Salary) as Max_Salary_Dept_wise from Practice_Emp group by Dept_No
-- 46. Display the various jobs and total salary for each job.
select Job, Max(salary) as Max_Salary_Job_wise from Practice_Emp group by Job
-- 47. Display each jobs along  with minimum sal being paid in each job group.
select Job, min(salary) as Min_Salary_Job_wise from Practice_Emp group by Job
-- 48.Display the department numbers with more than three employees  in each dept.
select Dept_No, Count(Job) as Morethan_3Employees from Practice_emp group by Dept_No having count(Job) > 3
-- 49. Display the various jobs along with total sal for each of the jobs where total sal is greater than 40000(400000)
select Job,  sum(Salary) as Total_Salary from Practice_Emp group by Job having sum(Salary) > 400000
-- 50. Display the various jobs along with total number of employee in each job. The output should contain only those jobs with more than three employees.
select Job, Count(Job) as Total_employees from Practice_Emp group by Job having count(Job) > 3
-- 51. Display the name of emp who earns highest sal.
select Ename from Practice_Emp where Salary in (select max(Salary) as Max_salary from Practice_Emp)
-- 52. Display the employee number and name of employee working as CLERK and earning highest salary among CLERKS.
select Ename, Emp_No from Practice_emp where Salary in (select max(Salary) from Practice_Emp where Job = 'Clerk')
-- 53. Display the name of the salesman who earns a salary more than the highest salary of any clerk.
select Ename from Practice_Emp where Job = 'Salesman' and Salary > (select max(Salary) from Practice_Emp where Job = 'Clerk')		-- No such result found

54. Display the names of clerks who earn salary more than that of James of that of sal lesser than that of Scott.
55. Display the names of employees who earn a Sal more than that of James or that of salary greater than that of Scott.

-- 56.  //Display the names of employees who earn highest salary in their respective departments.
select Dept_No, max(Salary) from Practice_emp group by Dept_No 
-- 57.  //Display the names of employees who earn highest salary in their respective job groups.

-- 58. Display the employee names who are working in accountings dept.
select Ename from Practice_Emp where Dept_No = 101
-- 59. Display the employee names who are working in CHICAGO(102).
select Ename from Practice_Emp where Dept_No = 102
-- 60. //Display the job groups having total salary greater than the maximum salary for managers.
select sum(Salary) from Practice_Emp where Salary > (select max(Salary) from Practice_Emp where Job = 'Manager')
61. Display the names of employee from department number 10 with salary greater than that of all employee working in other departments.

-- 62. Display the name of employees in Uppercase
select Ename, upper(Ename) from Practice_Emp
-- 63. Display the name of employees in Lower case
select Ename, lower(Ename) from Practice_Emp
63. Display the name of employees in  Proper case

-- 64. Find out the length of your name using appropriate function.
select Ename, LEN(Ename) from Practice_Emp where Ename = 'Nitin Patil'
-- 65. Display the length of all employees names.
select Ename, LEN(Ename) from Practice_emp
-- 66. Display the name of the employee concatenate with empno
select concat(Ename, Emp_No) from Practice_Emp
-- 67. Use appropriate function and extract 3 characters staring from 2 characters from the following string ‘Oracle’ i.e the output should be ‘rac’.
select substring('ORACLE', 2, 3)
-- 68. Find the first occurrence of character a from the following string ‘computer maintenance corporation’.
select charindex('A', 'COMPUTER MAINTENANCE CORPORATION' )
-- 69. Replace every occurrence of alphabet A with B in the string Allen’s(user translate function).
select REPLACE('ALLEN', 'A', 'B')
-- 70. Display the information from emp table. Wherever job ‘manager’ is found it should be displayed as boss(replace function).
select REPLACE(Job, 'Manager', 'Boss') from Practice_Emp
-- 71. Display empno,ename,deptno from emp table .Instead of display department numbers display the related department name (use decode function).
select Emp_No, Ename, Dept_No, replace(Dept_No, Dept_No, Job) from Practice_Emp
-- 72. Display your age in days.
select datediff( DD, '11-23-1995', getdate() )
-- 73. Display your age in months.
select datediff( MM, '11-23-1995', getdate() )
-- 74. Display current date as 15th august Friday nineteen forty seven.
select CONVERT( varchar, getdate() )

75.  Display the following output for each row from emp table as ‘scott has joined the company on Wednesday 13th august nineteen ninety’.
76. Find the date of nearest Saturday after Current day.

-- 77. Display current time.
select getdate()
-- 78. Display the date three months before the current date.
select dateadd( MM, -3, getdate() )
-- 79. Display the common jobs from department number 10 and 20.
select Job, count(Job) from Practice_Emp where Dept_No in (101, 102) group by Job having Count(Job) > 1
-- 80. Display the jobs found in department number 10 and 20 eliminate duplicate jobs.
select Job, count(Job) from Practice_Emp where Dept_No in (101, 102) group by Job having count(Job) != 1
-- 81. Display the jobs which are unique to dept no 10.

-- 82. List ename,job, annual sal,deptno,dname and grade who earn 30000 per year and who are not clerks,

83. Find out the jon that was failed in the first half of 1983 and the same job that was failed during the same periond in 1984
Answer me.

-- 84. Find out the all employees who joined the company before thiere manager

-- 85. List out the all employees by  name and number along with their manager's name and number also display 'No Manager' who has no manager.

-- 86 Find out the employees who earned the highest Sal in each job typed sort in descending sal order.

-- 87.  Find out the employees who earned the min sal for there job in ascending order

-- 88.Find out the most recently hired employees in each dept order by hire date.

-- 89. Display ename,sal and deptno for each employee who earn a sal greater than the avg of their department order by deptno

-- 90. Display the department where there are no employees;

-- 91. Display the dept no with highest annual remuneration bill as compensation.

-- 92. In which year did most people join the company. Display the year and number of employees(hey try out)

-- 93. Display avg sal figure for the dept

-- 94. write a query of display against the row of the most recently hired employee. Display ename hire date and column max date showing.

-- 95. Display employees who can earn more than lowest sal in dept no 30

-- 96. Find employees who can earn more than every employees in dept no 30

97. select dept name dept no and sum of sal break on deptno on dname;

98. Find out avg sal and ave total remaninders for each job type

-- 99 . Find all dept's which have more than 3 employees.

-- 100. Display the half of the enames in upper case and remaining lower case.

-- 101. select ename if ename exists more than once.

-- 102. Display all enames in reverse order

-- 103. Display those employee whose joining of month and grade is equal.

104. Display those employee whose joining date is available in dept no

-- 105. Display those employee name as follows A allen, B black

-- 106. List out the employees ename,sal pf from emp

107. Display RSPS from emp without using updating,inserting

-- 108. Add this column to emp table ename varchar(20)

-- 109. opps I forgot to give the primary Key constrains. Add it now.

-- 110.  now increase the length of ename column to 30 characters,

-- 111. Add salary column to emp table.

-- 112. I want to give a validation saying that sal cannot be greater 10,000(note give a name to this comumn)

113. For the time begin I have decided that i will not impose this validation. My boss has agreed to pay more than 10,0000

-- 114. My boss has changed his mind. now he doesn't want to pay more than 10,000. so revoke that salary constraints
 
-- 115. Add column called a s mgr to your emp table.

-- 116. Oh this column should be related to empno. give a command to add this constrains

-- 117. Add dept no column to your emp table

-- 118. This dept no column should be related to deptno column to dept table

-- 119. Create table called as new emp. using single command create this table as well as to get data into this table (use create table as)

-- 120. create table called as newemp. The table should contains only empno,ename,dname

-- 121. Delete the rows of employees who are working in the company for more than 3 years

-- 122. Provide a commission to employees who are not earning any commission.

-- 123. If any employees has commsision his commsision should be incremented by 10% of his salary

-- 124. Display employees name and department name for each employee

-- 125. Display employee number, name and location of the department in which he is working

-- 126. Display ename, dname even if the employees in a particular department(use outer join)

-- 127. Display employee name and his manager name

-- 128. Display the department name along with total salary in each department

-- 129. Display the department no and total number of employees in each department

-- 130. Delete from emp where job name in clerk