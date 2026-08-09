/* ============================================================================
   TOPIC 8: FOREIGN KEY CONSTRAINT & REFERENTIAL INTEGRITY
   ============================================================================
   Author: Prasanth Golla
   Description: Comprehensive SQL Notes & Assignments covering FOREIGN KEY constraints,
                parent-child table relationships, candidate keys, and referential
                integrity enforcement.
   ============================================================================ */

-- ============================================================================
-- CONCEPT OVERVIEW & INTERVIEW NOTES: FOREIGN KEY & REFERENTIAL INTEGRITY
-- ============================================================================
/*
   WHAT IS A FOREIGN KEY?
   - A FOREIGN KEY is a column (or combination of columns) in one table (child table) 
     that references a PRIMARY KEY or UNIQUE KEY in another table (parent table).
   - Purpose: Enforces Referential Integrity — ensuring that relationships between 
     tables remain valid and preventing orphan records.

   PARENT vs CHILD TABLE:
   - Parent Table: The table containing the PRIMARY KEY (e.g., `departments`, `Customers`).
   - Child Table: The table containing the FOREIGN KEY referencing the parent (e.g., `Employees`, `Orders`).

   RULES & BEHAVIORS:
   1. The Foreign Key data type MUST match the referenced Parent Primary Key data type.
   2. Insertion Rule: You CANNOT insert a value into a Foreign Key column if that value 
      does NOT exist in the parent table's Primary Key.
   3. Deletion/Update Actions (`ON DELETE` / `ON UPDATE`):
      - RESTRICT / NO ACTION (Default): Blocks deletion of parent row if child rows reference it.
      - CASCADE: Automatically deletes/updates child rows when the parent row is deleted/updated.
      - SET NULL: Sets the child foreign key column to NULL when the parent row is deleted.

   INTERVIEW POINT: Parent Table Creation Order
   - Parent tables MUST be created BEFORE child tables that reference them.
   - Conversely, child tables MUST be dropped BEFORE parent tables can be dropped (unless FOREIGN_KEY_CHECKS = 0).
*/

-- ============================================================================
-- QUERY 1: Create Database
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL statement creating database namespace.

   WHAT DOES THIS QUERY DO?
   - Creates database 'topic8'.

   SOLUTION / LOGIC:
   - Sets up isolated schema for topic 8 foreign key assignment tables.

   WHY THESE KEYWORDS ARE USED:
   - CREATE DATABASE: Standard DDL statement.

   EXPECTED RESULT:
   - Query OK, 1 row affected. Schema 'topic8' created.
*/
CREATE DATABASE topic8;


-- ============================================================================
-- QUERY 2: Select Active Database
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - Database context selection statement.

   WHAT DOES THIS QUERY DO?
   - Activates 'topic8' database.

   SOLUTION / LOGIC:
   - Directs queries into 'topic8'.

   WHY THESE KEYWORDS ARE USED:
   - USE: Sets active schema context.

   EXPECTED RESULT:
   - Database changed.
*/
USE topic8;


-- ============================================================================
-- QUERY 3: Create Parent Table - Departments
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL table creation query defining the Parent entity for organizational departments.

   WHAT DOES THIS QUERY DO?
   - Creates a 'departments' table with DepartmentID as PRIMARY KEY and DepartmentName.

   SOLUTION / LOGIC:
   - DepartmentID acts as the parent primary key referenced by employees.

   WHY THESE KEYWORDS ARE USED:
   - DepartmentID INT PRIMARY KEY: Defines parent key for referential lookup.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Parent table 'departments' created.
*/
CREATE TABLE departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(30)
);


-- ============================================================================
-- QUERY 4: Create Child Table - Employees with Foreign Key Referencing Departments
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL table creation query linking Employees to Departments via Foreign Key.

   WHAT DOES THIS QUERY DO?
   - Creates an 'Employees' table where `DepartmentID` references `departments(DepartmentID)`.

   SOLUTION / LOGIC:
   - Prevents assigning an employee to a non-existent DepartmentID.

   WHY THESE KEYWORDS ARE USED:
   - FOREIGN KEY (DepartmentID) REFERENCES departments(DepartmentID): Enforces referential integrity link to parent.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Child table 'Employees' created.
*/
CREATE TABLE Employees (
    EmployeeID INT,
    EmployeeName VARCHAR(30),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES departments(DepartmentID)
);


-- ============================================================================
-- QUERY 5: Describe Departments Table Schema
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - Schema verification command for 'departments'.

   WHAT DOES THIS QUERY DO?
   - Displays the structure of parent table 'departments'.

   SOLUTION / LOGIC:
   - Queries system dictionary metadata.

   WHY THESE KEYWORDS ARE USED:
   - DESC: Inspects table columns.

   EXPECTED RESULT:
   - Display grid for 'departments' (DepartmentID, DepartmentName).
*/
DESC departments;


-- ============================================================================
-- QUERY 6: Create Parent Table - Customers
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL statement creating Parent table for e-commerce customers.

   WHAT DOES THIS QUERY DO?
   - Creates a 'Customers' table with CustomerID as PRIMARY KEY and CustomerName.

   SOLUTION / LOGIC:
   - CustomerID serves as the parent key for order links.

   WHY THESE KEYWORDS ARE USED:
   - CustomerID INT PRIMARY KEY: Parent primary key.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Parent table 'Customers' created.
*/
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(30)
);


-- ============================================================================
-- QUERY 7: Create Child Table - Orders with Foreign Key Referencing Customers
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL statement linking Orders to Customers via Foreign Key.

   WHAT DOES THIS QUERY DO?
   - Creates an 'Orders' table where `CustomerID` references `Customers(CustomerID)`.

   SOLUTION / LOGIC:
   - Ensures an order cannot be placed under a non-existent CustomerID.

   WHY THESE KEYWORDS ARE USED:
   - FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID): Links child order rows to parent customer.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Child table 'Orders' created.
*/
CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


-- ============================================================================
-- QUERY 8: Describe Orders Table Schema
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - Schema verification command for 'Orders'.

   WHAT DOES THIS QUERY DO?
   - Displays columns and key references for 'Orders' (showing CustomerID Key = MUL).

   SOLUTION / LOGIC:
   - Retrieves information_schema metadata. 'MUL' indicates multiple occurrences allowed (non-unique index for Foreign Key).

   WHY THESE KEYWORDS ARE USED:
   - DESC: Inspects schema metadata.

   EXPECTED RESULT:
   - Display grid showing OrderID and CustomerID (Key: MUL).
*/
DESC Orders;


-- ============================================================================
-- QUERY 9: Create Parent Table - Authors
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL query creating Parent table for library authors.

   WHAT DOES THIS QUERY DO?
   - Creates an 'Authors' table with AuthorID as PRIMARY KEY and AuthorName.

   SOLUTION / LOGIC:
   - AuthorID serves as parent key for book publications.

   WHY THESE KEYWORDS ARE USED:
   - AuthorID INT PRIMARY KEY: Parent primary key.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Parent table 'Authors' created.
*/
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(30)
);


-- ============================================================================
-- QUERY 10: Create Child Table - Books with Foreign Key Referencing Authors
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL statement establishing relationship between Books and Authors.

   WHAT DOES THIS QUERY DO?
   - Creates a 'Books' table where `AuthorID` references `Authors(AuthorID)`.

   SOLUTION / LOGIC:
   - Ensures catalog books are attributed to valid registered authors.

   WHY THESE KEYWORDS ARE USED:
   - FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID): Enforces referential integrity.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Child table 'Books' created.
*/
CREATE TABLE Books (
    BookID INT,
    BookTitle VARCHAR(30),
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);


-- ============================================================================
-- QUERY 11: Create Parent Table - Categories
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL query defining Parent table for product categories.

   WHAT DOES THIS QUERY DO?
   - Creates a 'categories' table with CategoryID as PRIMARY KEY and CategoryName.

   SOLUTION / LOGIC:
   - CategoryID acts as parent classification key for catalog products.

   WHY THESE KEYWORDS ARE USED:
   - CategoryID INT PRIMARY KEY: Parent primary key.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Parent table 'categories' created.
*/
CREATE TABLE categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(30)
);


-- ============================================================================
-- QUERY 12: Create Child Table - Products with Foreign Key Referencing Categories
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL statement linking Products to Categories via Foreign Key.

   WHAT DOES THIS QUERY DO?
   - Creates a 'products' table where `CategoryID` references `categories(CategoryID)`.

   SOLUTION / LOGIC:
   - Prevents assigning products to non-existent inventory categories.

   WHY THESE KEYWORDS ARE USED:
   - FOREIGN KEY (CategoryID) REFERENCES categories(CategoryID): Enforces category lookup integrity.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Child table 'products' created.
*/
CREATE TABLE products (
    ProductID INT,
    ProductName VARCHAR(30),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES categories(CategoryID)
);


-- ============================================================================
-- QUERY 13: Create Parent Table - Teachers
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL query defining Parent table for academic teachers.

   WHAT DOES THIS QUERY DO?
   - Creates a 'Teachers' table with TeacherID as PRIMARY KEY and TeacherName.

   SOLUTION / LOGIC:
   - TeacherID is the primary parent identifier for mentor assignment.

   WHY THESE KEYWORDS ARE USED:
   - TeacherID INT PRIMARY KEY: Parent primary key.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Parent table 'Teachers' created.
*/
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    TeacherName VARCHAR(30)
);


-- ============================================================================
-- QUERY 14: Create Child Table - Students with Foreign Key Referencing Teachers
-- ============================================================================
/*
   WHAT IS THIS QUERY?
   - DDL statement assigning Students to Teachers via Foreign Key.

   WHAT DOES THIS QUERY DO?
   - Creates a 'Students' table with StudentID PRIMARY KEY and `TeacherID` referencing `Teachers(TeacherID)`.

   SOLUTION / LOGIC:
   - Ensures student records link only to valid teacher IDs in the institution.

   WHY THESE KEYWORDS ARE USED:
   - StudentID INT PRIMARY KEY: Child table's own primary key.
   - FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID): Referential link to teacher parent table.

   EXPECTED RESULT:
   - Query OK, 0 rows affected. Child table 'Students' created.
*/
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(30),
    TeacherID INT,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);
