/* ============================================================================
   TOPIC 7: CHECK CONSTRAINT & DOMAIN INTEGRITY VALIDATION RULES
   ============================================================================
   Author: Prasanth Golla
   Description: Comprehensive SQL Notes & Assignments covering CHECK constraints,
                domain validation, value ranges (BETWEEN), string choice lists (IN),
                and conditional logic.
   ============================================================================ */

-- ============================================================================
-- CONCEPT OVERVIEW & INTERVIEW NOTES: CHECK CONSTRAINT
-- ============================================================================
/*
   WHAT IS A CHECK CONSTRAINT?
   - A CHECK constraint limits the range or set of values that can be placed in a column.
   - It enforces Domain Integrity by ensuring that all data entered satisfies 
     a specified Boolean logical condition (must evaluate to TRUE).
   - If an INSERT or UPDATE statement provides a value where the CHECK expression 
     evaluates to FALSE, MySQL rejects the statement (Error 3819: Check constraint is violated).

   COMMON CHECK EXPRESSIONS:
   1. Comparison Operators: `CHECK (age >= 18)`, `CHECK (price > 0)`
   2. List Enumeration (`IN` operator): `CHECK (gender IN ('Male', 'Female', 'Other'))`
   3. Range Check (`BETWEEN` operator): `CHECK (marks BETWEEN 0 AND 100)`

   INTERVIEW POINT: MySQL Version Support for CHECK Constraints
   - MySQL 5.7 and earlier parsed `CHECK` constraints syntactically BUT IGNORED THEM silently during insertion!
   - MySQL 8.0.16 and later FULLY ENFORCES `CHECK` constraints natively.
*/

-- ============================================================================
-- QUERY 1: Create Database
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL command creating database container.

   WHAT DOES THIS QUERY DO?
   - Creates database 'Topic7'.

   SOLUTION / LOGIC:
   - Sets up schema for topic 7 validation assignment tables.

   WHY THESE KEYWORDS ARE USED:
   - CREATE DATABASE: Standard DDL statement.

   EXPECTED RESULT:
   - Query OK, 1 row affected. Schema 'Topic7' created.
*/
CREATE DATABASE Topic7;


-- ============================================================================
-- QUERY 2: Select Active Database
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - Database context selection statement.

   WHAT DOES THIS QUERY DO?
   - Activates 'Topic7' database.

   SOLUTION / LOGIC:
   - Directs queries into 'Topic7'.

   WHY THESE KEYWORDS ARE USED:
   - USE: Sets active schema context.

   EXPECTED RESULT:
   - Database changed.
*/
USE Topic7;


-- ============================================================================
-- QUERY 3: Create Student Table with Minimum Age Validation
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL table creation query enforcing minimum age verification via CHECK.

   WHAT DOES THIS QUERY DO?
   - Creates a 'student' table where `age` must be greater than or equal to 18.

   SOLUTION / LOGIC:
   - `CHECK (age >= 18)` ensures only adult students (18+) can be registered in the system.

   WHY THESE KEYWORDS ARE USED:
   - CHECK (age >= 18): Column-level validation expression restricting values under 18.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'student' created.
*/
CREATE TABLE student (
    sid INT,
    sname VARCHAR(30),
    age INT CHECK (age >= 18)
);


-- ============================================================================
-- QUERY 4: Create Employee Table with Minimum Salary Validation
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL table creation statement enforcing a minimum wage threshold.

   WHAT DOES THIS QUERY DO?
   - Creates an 'employee' table requiring `salary` to be strictly greater than 10000.

   SOLUTION / LOGIC:
   - `CHECK (salary > 10000)` rejects employee insertions with a salary of 10000 or below.

   WHY THESE KEYWORDS ARE USED:
   - CHECK (salary > 10000): Relational operator condition for wage validation.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'employee' created.
*/
CREATE TABLE employee (
    eid INT,
    ename VARCHAR(30),
    salary DECIMAL(10,2) CHECK (salary > 10000)
);


-- ============================================================================
-- QUERY 5: Create Product Table with Positive Price Validation
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL query preventing zero or negative product prices.

   WHAT DOES THIS QUERY DO?
   - Creates a 'product' table requiring `price` to be greater than 0.

   SOLUTION / LOGIC:
   - Products cannot have free (0) or negative prices in commercial catalog data.

   WHY THESE KEYWORDS ARE USED:
   - CHECK (price > 0): Ensures price values are strictly positive numerics.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'product' created.
*/
CREATE TABLE product (
    pid INT,
    pname VARCHAR(30),
    price DECIMAL(10,2) CHECK (price > 0)
);


-- ============================================================================
-- QUERY 6: Create Customer Table with Gender Enumeration Validation
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL statement enforcing discrete value list validation using IN operator.

   WHAT DOES THIS QUERY DO?
   - Creates a 'Customer' table where `gender` must be 'Male', 'Female', or 'Other'.

   SOLUTION / LOGIC:
   - `CHECK (gender IN ('Male', 'Female', 'Other'))` restricts gender string entries to an approved domain list.

   WHY THESE KEYWORDS ARE USED:
   - IN ('Male', 'Female', 'Other'): List membership operator evaluated inside CHECK constraint.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'Customer' created.
*/
CREATE TABLE Customer (
    cid INT,
    cname VARCHAR(30),
    gender VARCHAR(30) CHECK (gender IN ('Male', 'Female', 'Other'))
);


-- ============================================================================
-- QUERY 7: Create Exam Marks Table with Score Range Validation
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL table creation query enforcing a closed score interval using BETWEEN operator.

   WHAT DOES THIS QUERY DO?
   - Creates an 'exam_marks' table where `marks` must fall between 0 and 100 (inclusive).

   SOLUTION / LOGIC:
   - `CHECK (marks BETWEEN 0 AND 100)` prevents invalid test scores (e.g., -5 or 105).

   WHY THESE KEYWORDS ARE USED:
   - BETWEEN 0 AND 100: Range operator defining inclusive upper (100) and lower (0) boundaries.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'exam_marks' created.
*/
CREATE TABLE exam_marks (
    eid INT,
    ename VARCHAR(30),
    marks INT CHECK (marks BETWEEN 0 AND 100)
);
