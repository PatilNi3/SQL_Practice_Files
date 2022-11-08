-- SET Operator - 29/07/2022 - Friday - 07:10am to 08:00am

-- Set operators are used to combine results from two or more SELECT statements. 
-- They combine the same type of data from two or more tables. 
-- SQL joins are used to combine columns whereas Set operators are used to join rows from multiple SELECT queries. 
-- There are the following 4 set operators in SQL Server:
	-- 1. Union
	-- 2. Union All
	-- 3. Intersect
	-- 4. Except

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

create table S1 (Fruits varchar(15), Alphabets varchar(1) )

insert into S1 (Fruits, Alphabets) values ('Apple', 'A'), ('Banana', 'B'), ('Cherry', 'C'), ('Dragon Fruits', 'D'), ('Eggfruit', 'E')

select * from S1
 
-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table S2 (Fruits varchar(15), Alphabets varchar(1) )

insert into S2 (Fruits, Alphabets) values ('Finger Lime', 'F'), ('Grapes', 'G'), ('Apple', '1'), ('Hackberry', 'H'), ('Banana', '2'), ('Imbe', 'I'), ('Cherry', '3'), ('Jackfruit', 'J'), ('Dragon Fruits', '4'), ('Kiwi', 'K')
select * from S1
select * from S2

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

-- 1. UNION:

-- The UNION operator combines two or more result sets into a single result set, without duplications.

select Fruits from S1 union select Fruits from S2

-- 2. UNION ALL:

-- Like the UNION operator the UNION ALL operator also combines two or more result sets into a single result set. 
-- The only difference between a UNION and UNION ALL is that the UNION ALL allows duplicate rows.

select Fruits from S1 union all select Fruits from S2

-- 3. INTERSECT:

-- It returns only unique rows.
-- The intersection of two queries gives the rows that are present in both result sets.

select Fruits from S1 intersect select Fruits from S2

-- 4. EXCEPT:

-- The EXCEPT operator returns all distinct the rows that are present in the result set of the first query, but not in the result set of the second query.

select Fruits from S1 except select Fruits from S2
select Fruits from S2 except select Fruits from S1

-- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻

