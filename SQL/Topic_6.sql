/* ============================================================================
   TOPIC 6: UNIQUE CONSTRAINT & TABLE RENAMING (ALTER TABLE RENAME)
   ============================================================================
   Author: Prasanth Golla
   Description: Comprehensive SQL Notes & Assignments covering UNIQUE key constraints,
                handling NULL values in UNIQUE columns, modifying column types with UNIQUE,
                and table renaming via ALTER TABLE RENAME.
   ============================================================================ */

-- ============================================================================
-- CONCEPT OVERVIEW & INTERVIEW NOTES: UNIQUE CONSTRAINT & RENAME
-- ============================================================================
/*
   WHAT IS A UNIQUE CONSTRAINT?
   - The UNIQUE constraint prevents duplicate values in a column or set of columns.
   - Unlike PRIMARY KEY:
     1. Multiple UNIQUE constraints can exist on a single table.
     2. In MySQL, a UNIQUE column CAN accept multiple NULL values (because NULL != NULL in SQL logic).

   INTERVIEW COMPARISON: PRIMARY KEY vs UNIQUE KEY
   +-----------------------+-----------------------------+-----------------------------+
   | Feature               | PRIMARY KEY                 | UNIQUE KEY                  |
   +-----------------------+-----------------------------+-----------------------------+
   | Purpose               | Uniquely identify each row  | Prevent duplicate values    |
   | Limit per table       | Exactly ONE                 | MULTIPLE per table          |
   | NULL values allowed?  | NO (implicitly NOT NULL)    | YES (multiple NULLs in MySQL)|
   | Clustered Index       | YES (Primary Clustered Index)| NO (Non-Clustered Index)   |
   +-----------------------+-----------------------------+-----------------------------+

   WHY STORE MOBILE NUMBERS AS VARCHAR INSTEAD OF INT?
   - Storing phone/mobile numbers as `INT` causes multiple issues:
     1. Loss of leading zeros (e.g., '0987654321' becomes '987654321').
     2. Integer overflow for 10+ digit numbers with country codes (e.g., '+919876543210').
     3. Mobile numbers are identifiers, not mathematical quantities (we never perform math on phone numbers).
   - Solution: Use `VARCHAR(15)` for mobile numbers.

   WHAT IS ALTER TABLE RENAME / RENAME TABLE?
   - Renames an existing table entity in the database catalog without destroying data.
   - Syntax options:
     `ALTER TABLE old_name RENAME TO new_name;`
     `RENAME TABLE old_name TO new_name;`
*/

-- ============================================================================
-- QUERY 1: Create Database
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL statement creating schema container.

   WHAT DOES THIS QUERY DO?
   - Creates database 'topic6'.

   SOLUTION / LOGIC:
   - Sets up isolated schema for topic 6 assignments.

   WHY THESE KEYWORDS ARE USED:
   - CREATE DATABASE: Standard DDL statement.

   EXPECTED RESULT:
   - Query OK, 1 row affected. Schema 'topic6' created.
*/
CREATE DATABASE topic6;


-- ============================================================================
-- QUERY 2: Select Active Database
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - Database context selection statement.

   WHAT DOES THIS QUERY DO?
   - Switches active session database to 'topic6'.

   SOLUTION / LOGIC:
   - Directs queries into 'topic6'.

   WHY THESE KEYWORDS ARE USED:
   - USE: Sets active schema context.

   EXPECTED RESULT:
   - Database changed.
*/
USE topic6;


-- ============================================================================
-- QUERY 3: Create Customer Table with UNIQUE Email
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL table creation query enforcing unique customer email addresses.

   WHAT DOES THIS QUERY DO?
   - Creates a 'customer' table where email must be unique across all rows.

   SOLUTION / LOGIC:
   - Prevents two customers from registering with the exact same email address.

   WHY THESE KEYWORDS ARE USED:
   - UNIQUE: Creates a unique non-clustered index on email column.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'customer' created.
*/
CREATE TABLE customer (
    email VARCHAR(30) UNIQUE
);


-- ============================================================================
-- QUERY 4: Create Employee Table with INT Mobile Number (Initial Design)
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL table creation query with an intentional phone number data type flaw.

   WHAT DOES THIS QUERY DO?
   - Creates an 'employee' table with `mobile_no INT(10) UNIQUE`.

   SOLUTION / LOGIC:
   - Demonstrates creating mobile_no as INT, which suffers from integer overflow and leading zero truncation.

   WHY THESE KEYWORDS ARE USED:
   - INT(10) UNIQUE: Defines integer column with unique constraint.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'employee' created.
*/
CREATE TABLE employee (
    mobile_no INT(10) UNIQUE
);


-- ============================================================================
-- QUERY 5: Alter Table Employee - Fix Mobile Number Data Type to VARCHAR
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL schema modification statement altering data type and maintaining UNIQUE constraint.

   WHAT DOES THIS QUERY DO?
   - Alters 'employee' table, modifying `mobile_no` from `INT(10)` to `VARCHAR(15) UNIQUE`.

   SOLUTION / LOGIC:
   - Fixes the integer data type flaw by expanding mobile_no to `VARCHAR(15)`, preserving leading zeros 
     and international country codes (e.g., '+919876543210').

   WHY THESE KEYWORDS ARE USED:
   - ALTER TABLE ... MODIFY COLUMN: Re-defines existing column attributes.
   - VARCHAR(15) UNIQUE: Correct data type for phone numbers maintaining unique index constraint.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Column 'mobile_no' is modified to VARCHAR(15) UNIQUE.
*/
ALTER TABLE employee
MODIFY COLUMN mobile_no VARCHAR(15) UNIQUE;


-- ============================================================================
-- QUERY 6: Create Student Table with UNIQUE Roll Number
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL query enforcing unique academic roll numbers.

   WHAT DOES THIS QUERY DO?
   - Creates a 'student' table where roll_no must be unique.

   SOLUTION / LOGIC:
   - Prevents duplicate roll number assignments.

   WHY THESE KEYWORDS ARE USED:
   - roll_no INT UNIQUE: Ensures integer roll numbers are distinct.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'student' created.
*/
CREATE TABLE student (
    roll_no INT UNIQUE
);


-- ============================================================================
-- QUERY 7: Create Product Table with UNIQUE Product Code
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL statement ensuring unique product SKU / codes.

   WHAT DOES THIS QUERY DO?
   - Creates a 'product' table where product_code is UNIQUE.

   SOLUTION / LOGIC:
   - Guarantees product codes (barcodes/SKUs) cannot be duplicated.

   WHY THESE KEYWORDS ARE USED:
   - product_code INT UNIQUE: Applies UNIQUE constraint on product code.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'product' created.
*/
CREATE TABLE product (
    product_code INT UNIQUE
);


-- ============================================================================
-- QUERY 8: Create User Table with UNIQUE Username
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL query creating user accounts table with unique usernames.

   WHAT DOES THIS QUERY DO?
   - Creates a 'user' table where user_name is UNIQUE.

   SOLUTION / LOGIC:
   - Ensures no two users can register identical account handles.

   WHY THESE KEYWORDS ARE USED:
   - user_name VARCHAR(30) UNIQUE: Enforces distinct usernames.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'user' created.
*/
CREATE TABLE user (
    user_name VARCHAR(30) UNIQUE
);


-- ============================================================================
-- QUERY 9: Rename Table User to Users
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL table renaming statement.

   WHAT DOES THIS QUERY DO?
   - Renames table 'user' to 'users'.

   SOLUTION / LOGIC:
   - 'USER' is a reserved keyword in many SQL dialects. Renaming the table to plural 'users' 
     conforms to SQL naming conventions and prevents syntax conflicts.

   WHY THESE KEYWORDS ARE USED:
   - ALTER TABLE user RENAME TO users (or RENAME TABLE user TO users): Renames the table entity in database metadata.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'user' is renamed to 'users'.
*/
ALTER TABLE user RENAME TO users;


-- ============================================================================
-- QUERY 10: Describe Employee Table Schema
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - Utility command to inspect table column metadata.

   WHAT DOES THIS QUERY DO?
   - Verifies that mobile_no in 'employee' is now VARCHAR(15) with a UNIQUE key (UNI).

   SOLUTION / LOGIC:
   - Displays table structure from information_schema dictionary.

   WHY THESE KEYWORDS ARE USED:
   - DESC employee: Displays column details.

   EXPECTED RESULT:
   - Tabular schema showing mobile_no (VARCHAR(15), Key: UNI).
*/
DESC employee;