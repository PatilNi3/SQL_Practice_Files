-- DELETE CONSTRAINT - 19/08/2022 - Friday - 07:10am to 07:30am

-- Deleting constraints removes the limitation of that perticular column that are accepted in the table.
-- Types of constraint that we know is, Primary Key, Unique, Not Null, Check, Default, Foreign Key, Identity
-- Syntax:
	-- alter table <table_name> drop constraint <constraint_id_from_object_explorer>

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

select * from T_Four					-- Primary Key constraint table

alter table T_Four drop constraint [PK__T_Four__3214EC27DDF95870]

insert into T_Four values (5, 'Nitin')
insert into T_Four values (5, 'Neha')
insert into T_Four values (null, 'Ankita')

select * from T_Five					-- Primary Key constraint table

alter table T_Five drop constraint [PK__T_Five__737584F70CF3843E]

insert into T_Five values (51, null)
insert into T_Five values (52, 'Neha')
insert into T_Five values (52, 'Rucha')

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

select * from T_Six					-- Unique constraint table

alter table T_Six drop constraint [UQ__T_Six__3214EC2628F26F3C]

insert into T_Six values (1, 'Neha')

-- ○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○○

select * from Student

alter table Student drop constraint [FK__Student__D_ID__60924D76]

insert into Student values (109, 'Kaka', 6)

-- ☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻☺☻
















