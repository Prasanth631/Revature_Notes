/* ============================================================================
   TOPIC 4: NOT NULL CONSTRAINT & ALTER TABLE COLUMN MODIFICATION
   ============================================================================
   Author: Prasanth Golla
   Description: Comprehensive SQL Notes & Assignments covering NOT NULL data
                integrity constraints and modifying column data types using ALTER TABLE.
   ============================================================================ */

-- ============================================================================
-- CONCEPT OVERVIEW & INTERVIEW NOTES: NOT NULL & ALTER TABLE
-- ============================================================================
/*
   WHAT IS THE NOT NULL CONSTRAINT?
   - The NOT NULL constraint enforces that a column CANNOT contain NULL (missing/unknown) values.
   - Any attempt to insert or update a row with a NULL value in a NOT NULL column 
     will be rejected by the database with an error (Error 1048: Column cannot be null).

   WHAT IS ALTER TABLE ... MODIFY COLUMN?
   - The ALTER TABLE command modifies the schema of an existing table without dropping 
     the table or losing data.
   - `MODIFY COLUMN` changes the data type, size, or constraints of an existing column.

   INTERVIEW POINT: NULL vs Empty String ('') vs 0
   - `NULL`: Represents missing, unknown, or unassigned data.
   - `''` (Empty String): Represents a valid string value with length 0.
   - `0`: Represents a valid numeric integer value 0.
   - A NOT NULL column CAN store empty strings (`''`) or `0`, but CANNOT store `NULL`.

   INTERVIEW POINT: Modifying Column Data Types with Existing Data
   - When modifying a column's data type (e.g., from VARCHAR to DECIMAL), MySQL attempts 
     implicit type conversion.
   - If existing text data cannot be parsed as a number (e.g., 'Five Thousand' to DECIMAL), 
     the `ALTER TABLE` statement will fail with a data conversion error.
*/

-- ============================================================================
-- QUERY 1: Create Database
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL command initializing topic database container.

   WHAT DOES THIS QUERY DO?
   - Creates a database named 'topic4'.

   SOLUTION / LOGIC:
   - Sets up schema environment for topic 4 assignments.

   WHY THESE KEYWORDS ARE USED:
   - CREATE DATABASE: DDL statement to build database.

   EXPECTED RESULT:
   - Query OK, 1 row affected. Database 'topic4' created.
*/
CREATE DATABASE topic4;


-- ============================================================================
-- QUERY 2: Select Active Database
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - Session context command.

   WHAT DOES THIS QUERY DO?
   - Activates 'topic4' database session.

   SOLUTION / LOGIC:
   - Directs DDL execution into 'topic4'.

   WHY THESE KEYWORDS ARE USED:
   - USE: Sets active schema context.

   EXPECTED RESULT:
   - Database changed.
*/
USE topic4;


-- ============================================================================
-- QUERY 3: Create Student Table with Mandatory StudentName
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL table creation query enforcing mandatory text input via NOT NULL.

   WHAT DOES THIS QUERY DO?
   - Creates a 'student' table where StudentName is required and cannot be NULL.

   SOLUTION / LOGIC:
   - `StudentName VARCHAR(30) NOT NULL` guarantees every student record has a name.

   WHY THESE KEYWORDS ARE USED:
   - NOT NULL: Column-level constraint preventing NULL value insertions.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'student' created.
*/
CREATE TABLE student (
    StudentID INT,
    StudentName VARCHAR(30) NOT NULL
);


-- ============================================================================
-- QUERY 4: Create Employee Table with Multiple NOT NULL Columns
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL table creation query enforcing NOT NULL on department and salary fields.

   WHAT DOES THIS QUERY DO?
   - Creates an 'employee' table requiring both department and salary to be non-null.

   SOLUTION / LOGIC:
   - Demonstrates initially defining salary as VARCHAR(30) NOT NULL (which will be modified later).

   WHY THESE KEYWORDS ARE USED:
   - NOT NULL: Applied to department and salary fields to make them mandatory.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'employee' created.
*/
CREATE TABLE employee (
    EmpId INT,
    department VARCHAR(30) NOT NULL,
    salary VARCHAR(30) NOT NULL
);


-- ============================================================================
-- QUERY 5: Create Product Table with Mandatory ProductName
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL query creating product table requiring product names.

   WHAT DOES THIS QUERY DO?
   - Creates a 'product' table where pname cannot be NULL.

   SOLUTION / LOGIC:
   - Ensures inventory records always contain a product title.

   WHY THESE KEYWORDS ARE USED:
   - pname VARCHAR(30) NOT NULL: Restricts NULL entries for product name.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'product' created.
*/
CREATE TABLE product (
    pid INT,
    pname VARCHAR(30) NOT NULL
);


-- ============================================================================
-- QUERY 6: Alter Table Employee - Modify Column Salary Data Type
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL schema alteration statement modifying column data type.

   WHAT DOES THIS QUERY DO?
   - Alters 'employee' table to change salary from VARCHAR(30) to DECIMAL(10,2).

   SOLUTION / LOGIC:
   - Storing numeric salary as text (VARCHAR) is bad database design because mathematical 
     operations (e.g., SUM, AVG, salary > 50000) fail or run inefficiently.
   - `ALTER TABLE ... MODIFY COLUMN` fixes the schema by re-defining salary as DECIMAL(10,2).

   WHY THESE KEYWORDS ARE USED:
   - ALTER TABLE: DDL keyword to change existing table structure.
   - MODIFY COLUMN: Clause specifying the column to re-define.
   - DECIMAL(10,2): Exact monetary data type replacing VARCHAR(30).

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Column 'salary' in table 'employee' is re-typed to DECIMAL(10,2).
*/
ALTER TABLE employee
MODIFY COLUMN salary DECIMAL(10,2);


-- ============================================================================
-- QUERY 7: Create Customer Table with Mandatory Email
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL statement creating customer records with mandatory contact information.

   WHAT DOES THIS QUERY DO?
   - Creates a 'Customer' table where email is required (NOT NULL).

   SOLUTION / LOGIC:
   - Mandates customer communication contact data.

   WHY THESE KEYWORDS ARE USED:
   - email VARCHAR(30) NOT NULL: Rejects customer creations lacking email addresses.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'Customer' created.
*/
CREATE TABLE Customer (
    email VARCHAR(30) NOT NULL
);


-- ============================================================================
-- QUERY 8: Create Course Table with Mandatory CourseName
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL query defining catalog table with mandatory course names.

   WHAT DOES THIS QUERY DO?
   - Creates a 'Course' table where CourseName cannot be NULL.

   SOLUTION / LOGIC:
   - Ensures educational catalog items are explicitly named.

   WHY THESE KEYWORDS ARE USED:
   - CourseName VARCHAR(30) NOT NULL: Prevents null course titles.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'Course' created.
*/
CREATE TABLE Course (
    CourseName VARCHAR(30) NOT NULL
);
