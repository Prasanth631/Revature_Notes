/* ============================================================================
   TOPIC 1: BASIC DDL - DATABASE CREATION, TABLE DEFINITION & DATA TYPES
   ============================================================================
   Author: Prasanth Golla
   Description: Comprehensive SQL Notes & Assignments on DDL commands, Database
                Creation, Table Creation, Data Types, and Schema Inspection.
   ============================================================================ */

-- ============================================================================
-- CONCEPT OVERVIEW & INTERVIEW NOTES: DDL & DATA TYPES
-- ============================================================================
/*
   WHAT IS DDL (Data Definition Language)?
   - DDL commands are used to define, alter, and manage database structures/schemas.
   - Core DDL Commands: CREATE, ALTER, DROP, TRUNCATE, RENAME.
   - DDL statements are AUTO-COMMITTED in MySQL (changes are saved permanently 
     and cannot be rolled back using ROLLBACK).

   KEY DATA TYPES COVERED:
   1. INT: Stores whole numbers (-2,147,483,648 to 2,147,483,647).
   2. VARCHAR(size): Variable-length character string. Allocates only the space 
      used plus 1-2 bytes for length prefix.
   3. CHAR(size): Fixed-length character string. Always pads space up to defined length.
   4. DECIMAL(M, D): Exact numeric type. M is total precision (digits), D is scale 
      (digits after decimal). Ideal for financial values (e.g., DECIMAL(10,2)).
   5. FLOAT: Approximate floating-point number. May suffer from precision loss.
   6. DATE: Stores dates in 'YYYY-MM-DD' format.

   INTERVIEW POINT: VARCHAR vs CHAR
   - CHAR is faster for fixed-length data (e.g., Country Codes 'US', Gender 'M/F').
   - VARCHAR saves storage space for variable-length text (e.g., Names, Emails).

   INTERVIEW POINT: DECIMAL vs FLOAT
   - DECIMAL guarantees exact precision for currency/money.
   - FLOAT uses binary floating-point representation which can introduce minor rounding errors.
*/

-- ============================================================================
-- QUERY 1: Create Database
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL command to initialize a new relational database container.

   WHAT DOES THIS QUERY DO?
   - Creates a logical database named 'practicesql' in the MySQL server.

   SOLUTION / LOGIC:
   - Evaluates if the database name exists; if not, allocates storage space 
     and metadata structures for the new database.

   WHY THESE KEYWORDS ARE USED:
   - CREATE DATABASE: Standard SQL statement to instantiate a new database.
   - practicesql: The identifier name given to the database.

   EXPECTED RESULT:
   - Query OK, 1 row affected. A new database schema named 'practicesql' is created.
*/
CREATE DATABASE practicesql;


-- ============================================================================
-- QUERY 2: Select Active Database
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - Environment context command to set the current working database.

   WHAT DOES THIS QUERY DO?
   - Directs all subsequent SQL operations (tables, views, indexes) to run 
     inside the 'practicesql' database.

   SOLUTION / LOGIC:
   - Switches the active session schema pointer to 'practicesql'.

   WHY THESE KEYWORDS ARE USED:
   - USE: MySQL command to set the default active database context.

   EXPECTED RESULT:
   - Database changed. Active database is now 'practicesql'.
*/
USE practicesql;


-- ============================================================================
-- QUERY 3: Create Student Table
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL command to create the 'student' table structure with primary key constraint.

   WHAT DOES THIS QUERY DO?
   - Creates a table named 'student' with columns StudentID, StudentName, Age, and city.

   SOLUTION / LOGIC:
   - StudentID is defined as INT PRIMARY KEY to uniquely identify each student row.
   - StudentName and city use VARCHAR(30) for variable-length text.
   - Age uses INT to store integer numeric values.

   WHY THESE KEYWORDS ARE USED:
   - CREATE TABLE: DDL command to create a new entity relation.
   - PRIMARY KEY: Enforces uniqueness and non-nullability on StudentID.
   - VARCHAR(30): Allocates variable character storage up to 30 chars.
   - INT: Stores 4-byte integer values.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'student' is instantiated in schema.
*/
CREATE TABLE student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(30),
    Age INT,
    city VARCHAR(30)
);


-- ============================================================================
-- QUERY 4: Describe Student Table Schema
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - Utility command to inspect table column definitions and metadata.

   WHAT DOES THIS QUERY DO?
   - Returns column names, data types, nullability, key constraints, defaults, and extra flags for 'student'.

   SOLUTION / LOGIC:
   - Queries the database data dictionary (information_schema) for table structure details.

   WHY THESE KEYWORDS ARE USED:
   - DESC / DESCRIBE: Utility command to display table schema overview.

   EXPECTED RESULT:
   - A tabular layout displaying 4 columns (Field, Type, Null, Key, Default, Extra).
*/
DESC student;


-- ============================================================================
-- QUERY 5: Create Employees Table
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL command to create the 'Employees' table for workforce management.

   WHAT DOES THIS QUERY DO?
   - Creates an 'Employees' table with EmployeeID, EmployeeName, Department, Salary, and JoiningDate.

   SOLUTION / LOGIC:
   - EmployeeID serves as the PRIMARY KEY.
   - Salary is defined as FLOAT (approximate floating point number).
   - JoiningDate is defined as DATE ('YYYY-MM-DD').

   WHY THESE KEYWORDS ARE USED:
   - FLOAT: Stores single-precision floating point numbers.
   - DATE: Stores calendar dates without time components.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'Employees' created.
*/
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(30),
    Department VARCHAR(30),
    Salary FLOAT,
    JoiningDate DATE
);


-- ============================================================================
-- QUERY 6: Describe Employees Table Schema
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - Schema inspection command for the 'Employees' table.

   WHAT DOES THIS QUERY DO?
   - Displays the structure and data types of 'Employees'.

   SOLUTION / LOGIC:
   - Reads information_schema metadata for table 'Employees'.

   WHY THESE KEYWORDS ARE USED:
   - DESC: Shortcut for DESCRIBE command.

   EXPECTED RESULT:
   - Metadata table listing 5 fields: EmployeeID, EmployeeName, Department, Salary, JoiningDate.
*/
DESC Employees;


-- ============================================================================
-- QUERY 7: Create Products Table
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL command to create the 'products' inventory table.

   WHAT DOES THIS QUERY DO?
   - Defines a table with ProductID, ProductName, Price, and Quantity.

   SOLUTION / LOGIC:
   - Uses DECIMAL(10,2) for Price to guarantee exact monetary precision up to 99,999,999.99.
   - ProductName uses VARCHAR(100) to allow longer product titles.

   WHY THESE KEYWORDS ARE USED:
   - DECIMAL(10,2): Fixed-point data type with 10 total digits and 2 decimal places.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'products' created.
*/
CREATE TABLE products (
    ProductID INT,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    Quantity INT
);


-- ============================================================================
-- QUERY 8: Describe Products Table Schema
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - Schema verification command for 'products' table.

   WHAT DOES THIS QUERY DO?
   - Verifies column data types and precision for 'products'.

   SOLUTION / LOGIC:
   - Retrieves metadata from system dictionary.

   WHY THESE KEYWORDS ARE USED:
   - DESC: Inspects table structure.

   EXPECTED RESULT:
   - Displays ProductID (INT), ProductName (VARCHAR(100)), Price (DECIMAL(10,2)), Quantity (INT).
*/
DESC products;


-- ============================================================================
-- QUERY 9: Create Orders Table
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL command to create the 'Orders' transactional table.

   WHAT DOES THIS QUERY DO?
   - Creates an 'Orders' table storing OrderID, CustomerName, OrderDate, and TotalAmount.

   SOLUTION / LOGIC:
   - OrderDate uses DATE for transaction timestamping.
   - TotalAmount uses DECIMAL(10,2) for accurate financial totals.

   WHY THESE KEYWORDS ARE USED:
   - TotalAmount DECIMAL(10,2): Ensures exact financial calculation without floating-point rounding errors.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'Orders' created.
*/
CREATE TABLE Orders (
    OrderID INT,
    CustomerName VARCHAR(30),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2)
);


-- ============================================================================
-- QUERY 10: Create Books Table
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL command to create the 'Books' library catalog table.

   WHAT DOES THIS QUERY DO?
   - Defines a table with BookID, Author, BookTitle, Price, and PublishedYear.

   SOLUTION / LOGIC:
   - PublishedYear uses INT to store 4-digit calendar year values (e.g., 2024).
   - BookTitle uses VARCHAR(100) to support long titles.

   WHY THESE KEYWORDS ARE USED:
   - PublishedYear INT: Numeric column suited for year storage or integer calculations.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'Books' created.
*/
CREATE TABLE Books (
    BookID INT,
    Author VARCHAR(30),
    BookTitle VARCHAR(100),
    Price DECIMAL(10,2),
    PublishedYear INT
);
