/* ============================================================================
   TOPIC 2 & 3: DEFAULT VALUES & AUTO_INCREMENT MECHANISM
   ============================================================================
   Author: Prasanth Golla
   Description: Comprehensive SQL Notes & Assignments covering DEFAULT constraint
                values, dynamic default expressions (CURRENT_DATE), and AUTO_INCREMENT
                primary key generation.
   ============================================================================ */

-- ============================================================================
-- CONCEPT OVERVIEW & INTERVIEW NOTES: DEFAULT & AUTO_INCREMENT
-- ============================================================================
/*
   WHAT IS THE DEFAULT CONSTRAINT?
   - The DEFAULT constraint provides a fallback value for a column when an INSERT 
     statement does not supply an explicit value for that column.
   - It prevents NULL values from populating columns where a sensible default exists 
     (e.g., Status = 'Active', Quantity = 0, City = 'Hyderabad').
   - In MySQL 8.0+, DEFAULT can also evaluate dynamic expressions enclosed in 
     parentheses, such as `DEFAULT (CURRENT_DATE)` or `DEFAULT (CURRENT_TIMESTAMP)`.

   WHAT IS AUTO_INCREMENT?
   - AUTO_INCREMENT allows a unique integer to be generated automatically whenever 
     a new row is inserted into a table.
   - Rules for AUTO_INCREMENT in MySQL:
     1. There can be ONLY ONE AUTO_INCREMENT column per table.
     2. The AUTO_INCREMENT column MUST be defined as a KEY (usually PRIMARY KEY or UNIQUE KEY).
     3. The column data type MUST be an integer or floating-point type.
     4. Default starting value is 1, incrementing by 1 for each new row.

   INTERVIEW POINT: Gaps in AUTO_INCREMENT Sequence
   - Failed INSERT statements or rolled-back transactions do NOT reset or reuse 
     AUTO_INCREMENT sequence numbers. This leaves intentional "gaps" in IDs, 
     which is standard DBMS behavior to avoid concurrency locks.

   INTERVIEW POINT: Inserting Explicit Values in AUTO_INCREMENT Columns
   - If you explicitly insert NULL or 0 into an AUTO_INCREMENT column, MySQL automatically 
     generates the next sequential integer ID.
   - If you manually insert a specific ID (e.g., 100), MySQL sets the internal counter 
     to 101 for subsequent automated insertions.
*/

-- ============================================================================
-- QUERY 1: Create Database
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL statement to initialize the topic database schema.

   WHAT DOES THIS QUERY DO?
   - Creates a database named 'topic2' to isolate topic 2 and 3 tables.

   SOLUTION / LOGIC:
   - Instantiates a clean database environment.

   WHY THESE KEYWORDS ARE USED:
   - CREATE DATABASE: Standard DDL statement for database creation.

   EXPECTED RESULT:
   - Query OK, 1 row affected. Schema 'topic2' created.
*/
CREATE DATABASE topic2;


-- ============================================================================
-- QUERY 2: Select Active Database
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - Environment context setting statement.

   WHAT DOES THIS QUERY DO?
   - Switches the active session focus to 'topic2'.

   SOLUTION / LOGIC:
   - Directs all subsequent DDL operations into 'topic2'.

   WHY THESE KEYWORDS ARE USED:
   - USE: MySQL database selection keyword.

   EXPECTED RESULT:
   - Database changed. Active database is now 'topic2'.
*/
USE topic2;


-- ============================================================================
-- QUERY 3: Create Employees Table with Static String DEFAULT
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL query creating 'Employees' with a DEFAULT constraint on the City column.

   WHAT DOES THIS QUERY DO?
   - Creates an 'Employees' table where the City column defaults to 'Hyderabad' if omitted during INSERT.

   SOLUTION / LOGIC:
   - `City VARCHAR(30) DEFAULT 'Hyderabad'` ensures that any employee inserted without 
     specifying a city will automatically be assigned 'Hyderabad'.

   WHY THESE KEYWORDS ARE USED:
   - DEFAULT 'Hyderabad': Assigns a fallback string value to unsupplied rows.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'Employees' created with default city logic.
*/
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(30),
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    JoiningDate DATE,
    City VARCHAR(30) DEFAULT 'Hyderabad'
);


-- ============================================================================
-- QUERY 4: Create Products Table with Numeric DEFAULT
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL table creation query for inventory with a numeric default quantity.

   WHAT DOES THIS QUERY DO?
   - Creates a 'Products' table where Quantity defaults to 0 if not supplied.

   SOLUTION / LOGIC:
   - In e-commerce/inventory schemas, newly listed products start with 0 stock by default.

   WHY THESE KEYWORDS ARE USED:
   - Quantity INT DEFAULT 0: Specifies integer fallback value 0 for missing inputs.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'Products' created.
*/
CREATE TABLE Products (
    ProductID INT,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    Quantity INT DEFAULT 0
);


-- ============================================================================
-- QUERY 5: Create Student Table with Default Course Assignment
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL statement defining student enrollment table with default course logic.

   WHAT DOES THIS QUERY DO?
   - Defines a 'student' table where the Course column defaults to 'Python'.

   SOLUTION / LOGIC:
   - Ensures that students enrolling without choosing an elective automatically 
     default to the primary course 'Python'.

   WHY THESE KEYWORDS ARE USED:
   - Course VARCHAR(30) DEFAULT 'Python': Supplies 'Python' as default string value.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'student' created.
*/
CREATE TABLE student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(30),
    Age INT,
    city VARCHAR(30),
    Course VARCHAR(30) DEFAULT 'Python'
);


-- ============================================================================
-- QUERY 6: Create Users Table with Default Status
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL command creating user accounts table with default status tracking.

   WHAT DOES THIS QUERY DO?
   - Creates a 'users' table where User_Status defaults to 'Active'.

   SOLUTION / LOGIC:
   - New user accounts should automatically receive an 'Active' flag upon creation.

   WHY THESE KEYWORDS ARE USED:
   - User_Status VARCHAR(10) DEFAULT 'Active': Assigns 'Active' state unless overridden.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'users' created.
*/
CREATE TABLE users (
    ID INT,
    UserName VARCHAR(30),
    User_Status VARCHAR(10) DEFAULT 'Active'
);


-- ============================================================================
-- QUERY 7: Create Orders Table with Dynamic Date DEFAULT
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL table creation statement utilizing MySQL dynamic expression default.

   WHAT DOES THIS QUERY DO?
   - Creates an 'Orders' table where OrderDate defaults to the current system date via CURRENT_DATE.

   SOLUTION / LOGIC:
   - Enclosing `(CURRENT_DATE)` in parentheses allows MySQL 8.0+ to dynamically evaluate 
     the current date at the moment of INSERT.

   WHY THESE KEYWORDS ARE USED:
   - DEFAULT (CURRENT_DATE): Evaluates current system date dynamically for new records.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'Orders' created with date auto-stamping.
*/
CREATE TABLE Orders (
    OrderID INT,
    CustomerName VARCHAR(30),
    OrderDate DATE DEFAULT (CURRENT_DATE),
    TotalAmount DECIMAL(10,2)
);


-- ============================================================================
-- QUERY 8: Create Customer Table with AUTO_INCREMENT Primary Key
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL statement introducing automated surrogate primary key generation.

   WHAT DOES THIS QUERY DO?
   - Creates a 'Customer' table where CustomerID increments automatically (1, 2, 3...).

   SOLUTION / LOGIC:
   - CustomerID is defined as INT PRIMARY KEY AUTO_INCREMENT, eliminating the need 
     for users to manually calculate or pass sequential IDs.

   WHY THESE KEYWORDS ARE USED:
   - AUTO_INCREMENT: Instructs the database engine to auto-generate unique sequential integers.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'Customer' created.
*/
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT
);


-- ============================================================================
-- QUERY 9: Create Product Table with AUTO_INCREMENT Primary Key
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL command creating product table with auto-generated surrogate key.

   WHAT DOES THIS QUERY DO?
   - Creates a 'product' table with AUTO_INCREMENT ProductID primary key.

   SOLUTION / LOGIC:
   - Guarantees unique ProductID sequence starting at 1.

   WHY THESE KEYWORDS ARE USED:
   - PRIMARY KEY AUTO_INCREMENT: Combines uniqueness, non-nullability, and automated sequence logic.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'product' created.
*/
CREATE TABLE product (
    ProductID INT PRIMARY KEY AUTO_INCREMENT
);


-- ============================================================================
-- QUERY 10: Create Employees Table with AUTO_INCREMENT Primary Key
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL statement creating employee table with auto-incrementing ID.

   WHAT DOES THIS QUERY DO?
   - Defines an 'employees' table with automatically generated EmployeeID values.

   SOLUTION / LOGIC:
   - Automated workforce ID assignment.

   WHY THESE KEYWORDS ARE USED:
   - AUTO_INCREMENT: Generates sequential employee identifiers.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'employees' created.
*/
CREATE TABLE employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT
);


-- ============================================================================
-- QUERY 11: Create Orders Table with AUTO_INCREMENT Primary Key
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL statement creating orders table with auto-incrementing OrderID.

   WHAT DOES THIS QUERY DO?
   - Creates an 'orders' table where OrderID increments automatically for each new sale.

   SOLUTION / LOGIC:
   - Order management tables rely on AUTO_INCREMENT for rapid transaction recording.

   WHY THESE KEYWORDS ARE USED:
   - OrderID INT PRIMARY KEY AUTO_INCREMENT: Ensures unique sequential order numbers.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'orders' created.
*/
CREATE TABLE orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT
);


-- ============================================================================
-- QUERY 12: Create Library Table with AUTO_INCREMENT Primary Key
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL command creating library catalog table with auto-generated BookID.

   WHAT DOES THIS QUERY DO?
   - Creates a 'library' table where BookID auto-increments with each new acquisition.

   SOLUTION / LOGIC:
   - Provides sequential catalog tracking for library books.

   WHY THESE KEYWORDS ARE USED:
   - BookID INT PRIMARY KEY AUTO_INCREMENT: Assigns auto-incrementing integer key.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Table 'library' created.
*/
CREATE TABLE library (
    BookID INT PRIMARY KEY AUTO_INCREMENT
);
