-- Partition By - 04/08/2022 - Thursday - 07:10am to 07:55am

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

create table Partition (ID int identity, Name varchar (10), Age int, City varchar (10) )

insert into Partition values ('Nitin', 26, 'Banglore'), ('Neha', 27, 'Sydney'), ('Ruchita', 30, 'Mumbai'), ('Ankita', 27, 'Hyderabad')
insert into Partition values ('Pratima', 25, 'Pune'), ('Tejashree', 30, 'Pune'), ('Amol', 25, 'Pune'), ('Sushil', 26, 'Mumbai')
insert into Partition values ('Jija', 26, 'Sydney'), ('Drisha', 27, 'Mumbai'), ('Amruta', 30, 'Hyderabad'), ('Shraddha', 24, 'Banglore')
insert into Partition values ('Neha', 27, 'Sydney'), ('Ruchita', 30, 'Pune')
insert into Partition values ('Nitin', 18, 'Sangli'), ('Nitin', 5, 'Miraj')

select * from Partition

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- Partition By Clause is used to partition rows of table into groups.
-- It is useful when we have to perform a calculation on individual rows of a group using other rows of that group.

select *, ROW_NUMBER() over ( partition by Name order by City desc ) as Row_No from Partition

select *, DENSE_RANK() over ( partition by City order by Age desc ) as DenseRank from Partition

select Name, RANK() over ( partition by Name order by Age desc ) as Rank_No from Partition

select *,
ROW_NUMBER() over ( partition by Name order by Age desc ) as Rank_No, 
DENSE_RANK() over ( partition by Name order by Age desc ) as DenseRank, 
RANK() over ( partition by Name order by Age desc ) as Rank_No 
from Partition

select *,
ROW_NUMBER() over ( partition by Age order by City desc ) as Rank_No, 
DENSE_RANK() over ( partition by Age order by City desc ) as DenseRank, 
RANK() over ( partition by Age order by City desc ) as Rank_No 
from Partition

-- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻






