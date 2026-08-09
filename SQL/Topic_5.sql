/* ============================================================================
   TOPIC 5: PRIMARY KEY CONSTRAINT & ENTITY INTEGRITY
   ============================================================================
   Author: Prasanth Golla
   Description: Comprehensive SQL Notes & Assignments covering PRIMARY KEY constraints,
                entity integrity rules, and unique record identification.
   ============================================================================ */

-- ============================================================================
-- CONCEPT OVERVIEW & INTERVIEW NOTES: PRIMARY KEY
-- ============================================================================
/*
   WHAT IS A PRIMARY KEY?
   - A PRIMARY KEY is a column (or set of columns) that uniquely identifies each row in a table.
   - Primary Key Characteristics:
     1. Uniqueness: No two rows can have the same primary key value.
     2. Non-nullability: Primary key columns implicitly enforce NOT NULL (cannot store NULL).
     3. Single Primary Key Rule: A table can have AT MOST ONE Primary Key constraint.
     4. Indexing: DBMS automatically creates a Clustered Index (B-Tree) on the Primary Key.

   COMPOSITE PRIMARY KEY:
   - A primary key composed of two or more columns (e.g., PRIMARY KEY (OrderID, ProductID)).

   INTERVIEW POINT: Why every table should have a Primary Key
   - Without a primary key, tables risk containing exact duplicate rows (violating 1st Normal Form).
   - Primary keys accelerate row lookups via B-Tree clustered indexing.
   - Primary keys serve as parent keys referenced by Foreign Keys in related tables.
*/

-- ============================================================================
-- QUERY 1: Create Database
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL command creating topic database.

   WHAT DOES THIS QUERY DO?
   - Creates a database named 'topic5'.

   SOLUTION / LOGIC:
   - Sets up schema for topic 5 assignments.

   WHY THESE KEYWORDS ARE USED:
   - CREATE DATABASE: Standard DDL keyword.

   EXPECTED RESULT:
   - Query OK, 1 row affected. Schema 'topic5' created.
*/
CREATE DATABASE topic5;


-- ============================================================================
-- QUERY 2: Select Active Database
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - Session context selection statement.

   WHAT DOES THIS QUERY DO?
   - Activates 'topic5' database.

   SOLUTION / LOGIC:
   - Directs queries into 'topic5'.

   WHY THESE KEYWORDS ARE USED:
   - USE: Sets active schema context.

   EXPECTED RESULT:
   - Database changed.
*/
USE topic5;


-- ============================================================================
-- QUERY 3: Create Student Table with Primary Key
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL table creation query enforcing unique student entity identification.

   WHAT DOES THIS QUERY DO?
   - Creates a 'student' table where StudentID is the PRIMARY KEY.

   SOLUTION / LOGIC:
   - StudentID uniquely identifies each student and blocks duplicate or NULL student IDs.

   WHY THESE KEYWORDS ARE USED:
   - PRIMARY KEY: Enforces uniqueness, non-nullability, and clustered indexing.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'student' created with StudentID primary key.
*/
CREATE TABLE student (
    StudentID INT PRIMARY KEY
);


-- ============================================================================
-- QUERY 4: Create Employee Table with Primary Key
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL table creation query setting primary key on EmployeeID.

   WHAT DOES THIS QUERY DO?
   - Creates an 'employee' table where EmployeeID is the PRIMARY KEY.

   SOLUTION / LOGIC:
   - Ensures each employee record has a unique ID.

   WHY THESE KEYWORDS ARE USED:
   - EmployeeID INT PRIMARY KEY: Column-level primary key constraint.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'employee' created.
*/
CREATE TABLE employee (
    EmployeeID INT PRIMARY KEY
);


-- ============================================================================
-- QUERY 5: Create Product Table with Primary Key
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL statement setting product primary key constraint.

   WHAT DOES THIS QUERY DO?
   - Creates a 'product' table with ProductID as PRIMARY KEY.

   SOLUTION / LOGIC:
   - Guarantees product inventory code uniqueness.

   WHY THESE KEYWORDS ARE USED:
   - PRIMARY KEY: Prevents duplicate or missing product codes.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'product' created.
*/
CREATE TABLE product (
    ProductID INT PRIMARY KEY
);


-- ============================================================================
-- QUERY 6: Create Orders Table with Primary Key
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL table creation query for transaction identification.

   WHAT DOES THIS QUERY DO?
   - Creates an 'orders' table where OrderID is the PRIMARY KEY.

   SOLUTION / LOGIC:
   - Ensures sales transaction numbers are unique and searchable.

   WHY THESE KEYWORDS ARE USED:
   - OrderID INT PRIMARY KEY: Enforces entity integrity for orders.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'orders' created.
*/
CREATE TABLE orders (
    OrderID INT PRIMARY KEY
);


-- ============================================================================
-- QUERY 7: Create Department Table with Primary Key
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL query defining organizational units with primary keys.

   WHAT DOES THIS QUERY DO?
   - Creates a 'department' table where DepartmentID is the PRIMARY KEY.

   SOLUTION / LOGIC:
   - Prepares department lookup table for parent-child foreign key relationships.

   WHY THESE KEYWORDS ARE USED:
   - DepartmentID INT PRIMARY KEY: Primary key constraint on department code.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'department' created.
*/
CREATE TABLE department (
    DepartmentID INT PRIMARY KEY
);