-- WHAT IS SQL?
/*
SQL (Structured Query Language) is a standardized programming language used to manage and manipulate relational databases. 
It allows user to create, read, update, and delete data (often called as CRUD operations) stored in databases. 
SQL is essential for interacting with database systems such as MySQL, SQL Server, PostgreSQL, Oracle, and SQLite.
*/

-- Key Features of SQL:
/*
1. Data Querying: SQL allows users to query the database to retrieve data based on specific conditions using the SELECT statement.
2. Data Manipulation: It enables the addition (INSERT), modification (UPDATE), and deletion (DELETE) of data.
3. Database Schema Definition: SQL provides commands for defining and modifying the structure of database and tables (using CREATE).
4. Data Integrity and Security: SQL includes features to enforce data integrity (such as primary key and foreign key) and to define permissions for users.
5. Data Aggregation and Grouping: SQL supports actions like counting, summing and averaging data, and can group data based on certain attributes.
*/

-- SQL Commands:
/*
1. Data Definition Language (DDL)
	1.1. CREATE
	1.2. ALTER
	1.3. DROP
	1.4. TRUNCATE
2. Data Manipulation Language (DML)
	2.1. INSERT
	2.2. UPDATE
	2.3. DELETE
3. Data Query Language (DQL)
	3.1. SELECT
4. Data Control Language (DCL)
	4.1. GRANT
	4.2. REVOKE
5. Transaction Control Language (TCL)
	5.1. COMMIT
	5.2. SAVEPOINT
	5.3. ROLLBACK
	5.4. SET TRANSACTION
	5.5. SET CONSTRAINT
*/

-- NOTE: We will see this all commands in depth as we go ahead

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- WHAT IS DATABASE?
/*
Database is a structured collection of data that is stored and managed in a way that allows for efficient retrieval, modification and management.
It is typically organized in tables, which are made up of rows and columns and can be managed by Database Management System (DBMS).
*/

-- Key Characteristics of a Database:
/*
1. Structured Data Storage: Data is stored in a tables (in a relational database) that consist of rows (records) and columns (fields).
2. Data Integrity: Databases enforce rules to ensure that the data remains accurate, consistent and reliable.
3. Security: Databases can be configured to restrict access to data by users. Different users or roles may have different permissions.
4. Data Retrieval and Management: Database allow for efficient querying and manipulation of data using specialized query languages like SQL.
5. Concurrency Control: Many modern databases allow multiple users to interact with the data simultaneously.
*/

-- Types of Databases:
/*
1. Relational Database (RDBMS): Stores data in a tables (relations) that rae linked by relationships (e.g., foreign key).
2. Non-relational Database (NoSQL): Uses flexible data models like key-value, document-based, graph structure.
3. Hierarchical Databases: Organizes data in a tree like structure, where each record has a single parent and may have multiple children.
4. Network Database:	Similar to hierarchical but allows more complex relationships between records, enabling many-to-many relationships.
5. Object-Oriented Database: Stored data in object, similar the way data is represented in object-oriented programming.
*/

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- DIFFERENCE BETWEEN DBMS AND RDBMS
/*
• DBMS:

- DBMS stands for Database Management System, it is a software used to manage databases. It allows users to perform CRUD operations.
- A DBMS can store data in various ways, not necessarily in tables. It can store data in file based system, hierarchical models, network models, etc.
- DBMS might not enforce a fixed schema.
- They do not necessarily enforce rules for data integrity.
- Data normalization may not always be a focus.
- DBMS may not necessarily provide full support for the ACID properties.
- No realtionship between data.
- Example: file-based, hierarchical, network

• RDBMS:

- RDBMS stands for Relational Database Management System, it is a type of DBMS that organizes data in the form of tables, which are linked each other using relationships.
- An RDBMS specifically stores data in tables (relations) with rows and columns.
- An RDBMS enforces a strict schema for how data is organized.
- RDBMS enforce data integrity by applying constraints like primary key, foreign key, unique, check and not null.
- RDBMS use the process of normalizations to reduce redundancy and dependancy by organizing data into multiple related tables.
- RDBMS are designed to follow ACID properties, ensuring that database transactions are processed reliably and consistently, even in the event of system failures.
- In an RDBMS, data is stored in tables and relationships between tables are explicitly defined using foreign keys.
- Example: MySQL, SQL Server, PostgreSQL, Oracle
*/

-- DIFFERENCE BETWEEN SQL AND NOSQL
/*
• SQL:

-  SQL comes under Relational Database Management System.
- SQL stores data in a tables in the form of rows and columns.
- This database have fixed or predefined schema.
- This databases are best suited for complex queries.
- Follows ACID (Atomicity, Consistency, Isolation, Durability) properties.

• NoSQL:

- NoSQL comes under Non-Relational Database Management System.
- NoSQL stores data in key-value pairs, documents, graphs, etc.
- This documents are often schema less or flexible schema.
- This databases are not good for complex queries.
- Follows CAP (Consistency, Availability, Partition Tolerance).
*/

-- NOTE: There are some conceptual similarities between the differences between DBMS vs RDBMS and SQL vs NoSQL, they are not exactly the same.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- WHAT IS SCHEMA?
/*
Schema is organizational structure of a database that defines how data is stored, organized and related to one another.
It is a container for database objects like tables, views, indexes and store procedures.
A schema helps in logically grouping database objects, making it easier to manage, maintan and grant permissions.
*/

-- To create Schema:
USE SQL_Server_DB			-- SQL_Server_DB is my database name
CREATE SCHEMA company						-- company is schema name


-- To check all schema's:

SELECT * FROM INFORMATION_SCHEMA.SCHEMATA			-- this will return a list of schema names in the current database

-- NOTE: dbo stands for Database Owner and it is a default schema.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- WHAT IS ACID PROPERTY?
/*
In SQL and relational databases, ACID properties refered to a set of four key principles, this properties ensure that database transactions are processed reliably and maintain the integrity of the database.

• Atomicity: 

	○ Definition: Automicity ensures that a transaction is treated as a single unit of work. Atomicity means that a transaction either happens entirely or not at all.
	○ Example	: If you are transferring money from one bank account to another bank account, both step must succeed together.
							: If one step fails (e.g. insufficient fund) , the entire transaction is rolled back.

• Consistency: 

	○ Definition: Consistency ensures that a transaction brings the database from one valid state to another valid state, maintaining all database rules, constraints and integrity conditions.
	○ Example: Database has rule that every order must have at least one item, consistency ensures that transaction doesn't leave the database in a state where an order exists without an item.

• Isolation: 

	○ Definition: Isolation ensures that the operations of a transaction are isolated from other concurrent transactions.
	○ Example: If two people are booking last available seat at the same time, isolation ensure that only one transaction will succeed, preventing both from booking the same seat.

• Durability:

	○ Definition: Durability ensures that once a transaction has been commited, its changes are permanent and will survive any system crashes, power failures or hardware malfunction.
	○ Example: After user successfully purchase an item oon e-commerce site, the order data is saved permanently to the database. Even if the system crashes immediatly after, the order will still exists in order database once system is restored.
*/

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------