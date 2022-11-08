-- ROW NO, DENSE RANK, RANK - 03/08/2022 - Wednesday - 07:10am to 08:05am

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

create table Ranking ( ID int identity, Age int )

insert into Ranking values (23), (23), (24), (24), (24), (25), (25), (25), (26), (27), (27), (27), (28), (28)
insert into Ranking values (29), (29), (29), (29), (29), (30), (31), (31), (32), (32), (33), (34), (34), (34)

select * from Ranking

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- ROW NUMBER:

  -- The ROW_NUMBER ( ) function generates a sequential number for each row within a partition in the resultant output. 
  -- In each partition, the first-row number begins with 1. 
  -- We must always use the ORDER BY clause to ensure that the numbers are assigned in the proper sequence.

  select *, ROW_NUMBER () over ( order by Age desc ) as Row_No from Ranking

-- DENSE RANK:

  -- This function assigns a unique rank for each row within a partition as per the specified column value without any gaps. 
  -- It always specifies ranking in consecutive order. 
  -- If we get a duplicate value, this function will assign it with the same rank, and the next rank being the next sequential number. 

  select *, DENSE_RANK() over ( order by Age desc ) as Dense_Rank from Ranking

-- RANK:

  -- This function is used to determine the rank for each row in the result set.
  -- It assigns the rank to each row as one plus the previous row rank. 
  -- When the RANK function finds two values that are identical within the same partition, it assigns them with the same rank number. 
  -- In addition, the next number in the ranking will be the previous rank plus duplicate numbers. 
  -- Therefore, this function does not always assign the ranking of rows in consecutive order.

  select *, RANK () over ( order by Age desc ) as Rank_No from Ranking

  -- EXAMPLE:

  select *, 
  ROW_NUMBER () over ( order by Age desc ) as Rank_No, 
  DENSE_RANK() over ( order by Age desc ) as Dence_Rank, 
  RANK() over ( order by Age desc ) as Rank_No 
  from Ranking

  -- ------------------------------------------------------------------------------------------------------------------------------------------------------------

  with Dense as ( select *, DENSE_RANK() over ( order by Age desc ) Age_Dense from Ranking )
  select * from Dense where Age_Dense = 2

  -- ------------------------------------------------------------------------------------------------------------------------------------------------------------

  -- QUE.: Dense rank is 3 to 6

  with Q_Dense as ( select *, DENSE_RANK() over ( order by Age desc ) Q_Age_Dense from Ranking )
  select * from Q_Dense where Q_Age_Dense between 3 and 6

  -- QUE.: Dense rank top 5

  with Q_Dense as ( select *, DENSE_RANK() over ( order by Age desc ) Q_Age_Dense from Ranking )
  select * from Q_Dense where Q_Age_Dense < 6

-- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻



