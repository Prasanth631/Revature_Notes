/* ============================================================================
   DAY 1 DDL & CONSTRAINTS COMPREHENSIVE PRACTICE
   ============================================================================
   Author: Prasanth Golla
   Description: Fundamental DDL operations, database selection, table creation,
                CTAS (Create Table As Select), DEFAULT values, AUTO_INCREMENT,
                NOT NULL, UNIQUE, PRIMARY KEY, CHECK, and FOREIGN KEY constraints.
   ============================================================================ */

-- ============================================================================
-- SECTION 1: DATABASE CONTEXT & ENVIRONMENT INSPECTION
-- ============================================================================

/*
   QUERY 1: Check Database Server Version
   - WHAT IS THIS QUERY? System metadata query.
   - WHAT DOES IT DO? Returns the installed MySQL database server version string.
   - HOW KEYWORD WORKS: `VERSION()` is a built-in MySQL information function.
   - RESULT: e.g., '8.0.35'.
*/
SELECT VERSION();

/*
   QUERY 2: List All Databases
   - WHAT IS THIS QUERY? Administrative inspection query.
   - WHAT DOES IT DO? Displays all databases accessible to the current user on the server.
   - HOW KEYWORD WORKS: `SHOW DATABASES` queries the system information catalog.
   - RESULT: List of database names.
*/
SHOW DATABASES;

/*
   QUERY 3: Create Training Database
   - WHAT IS THIS QUERY? DDL database creation query.
   - WHAT DOES IT DO? Creates a database named 'trainingdb'.
   - HOW KEYWORD WORKS: `CREATE DATABASE` instantiates a new database schema namespace.
   - RESULT: Database 'trainingdb' created.
*/
CREATE DATABASE IF NOT EXISTS trainingdb;

/*
   QUERY 4: Select Active Database
   - WHAT IS THIS QUERY? Session context selection statement.
   - WHAT DOES IT DO? Sets 'trainingdb' as the active working database.
   - HOW KEYWORD WORKS: `USE` directs the active session schema pointer.
   - RESULT: Active database set to 'trainingdb'.
*/
USE trainingdb;

/*
   QUERY 5: Verify Active Database Name
   - WHAT IS THIS QUERY? Context inspection query.
   - WHAT DOES IT DO? Displays the currently selected database name.
   - HOW KEYWORD WORKS: `DATABASE()` returns the active schema name or NULL if none selected.
   - RESULT: 'trainingdb'.
*/
SELECT DATABASE();

/*
   QUERY 6: Get Current Session User
   - WHAT IS THIS QUERY? Security inspection query.
   - WHAT DOES IT DO? Displays the authenticated username and client host connecting to MySQL.
   - HOW KEYWORD WORKS: `CURRENT_USER()` returns 'user@host' security context.
   - RESULT: e.g., 'root@localhost'.
*/
SELECT CURRENT_USER();


-- ============================================================================
-- SECTION 2: TABLE CREATION, MULTI-ROW INSERTS & NULL HANDLING
-- ============================================================================

/*
   QUERY 7: Create Base Employees Table
   - WHAT IS THIS QUERY? DDL table creation query.
   - WHAT DOES IT DO? Creates 'EMPLOYEES' with ID (INT), FIRST_NAME (VARCHAR), SALARY (FLOAT).
   - HOW KEYWORD WORKS: `CREATE TABLE` defines column data types and structural layout.
   - RESULT: Table 'EMPLOYEES' created.
*/
CREATE TABLE EMPLOYEES (
    ID INT,
    FIRST_NAME VARCHAR(30),
    SALARY FLOAT
);

/*
   QUERY 8: List Tables in Active Database
   - WHAT IS THIS QUERY? Schema inspection statement.
   - WHAT DOES IT DO? Displays all tables inside 'trainingdb'.
   - HOW KEYWORD WORKS: `SHOW TABLES` lists relation names in active database.
   - RESULT: Lists 'EMPLOYEES'.
*/
SHOW TABLES;

/*
   QUERY 9: Insert Single Row
   - WHAT IS THIS QUERY? DML insertion statement.
   - WHAT DOES IT DO? Adds employee Ram with ID 1 and Salary 3000.
   - HOW KEYWORD WORKS: `INSERT INTO ... VALUES` appends a row to the table.
   - RESULT: 1 row inserted.
*/
INSERT INTO EMPLOYEES VALUES (1, 'RAM', 3000);

/*
   QUERY 10: Insert Multiple Rows in Single Query
   - WHAT IS THIS QUERY? Multi-row DML insert statement.
   - WHAT DOES IT DO? Inserts 3 employee records (Sham, Sudheer, Rakesh) in a single database transaction.
   - HOW KEYWORD WORKS: Comma-separated value tuples `(...), (...)` optimize insert performance.
   - RESULT: 3 rows inserted.
*/
INSERT INTO EMPLOYEES VALUES 
(2, 'SHAM', 5000),
(3, 'SUDHEER', 3000),
(4, 'RAKESH', 6000);

/*
   QUERY 11: Insert Row with Explicit NULL
   - WHAT IS THIS QUERY? DML insert demonstrating NULL insertion.
   - WHAT DOES IT DO? Adds employee ID 5 with a NULL FIRST_NAME and Salary 3000.
   - HOW KEYWORD WORKS: `NULL` represents missing or unassigned data.
   - RESULT: 1 row inserted with NULL first_name.
*/
INSERT INTO EMPLOYEES VALUES (5, NULL, 3000);


-- ============================================================================
-- SECTION 3: TABLE COPYING (CTAS - CREATE TABLE AS SELECT)
-- ============================================================================

/*
   QUERY 12: Copy Table Structure & All Data
   - WHAT IS THIS QUERY? DDL + DML Table Duplication (CTAS).
   - WHAT DOES IT DO? Creates 'employees_bak' and copies all schema structure AND rows from 'employees'.
   - HOW KEYWORD WORKS: `CREATE TABLE ... AS SELECT` evaluates the query and materializes results into a new table.
   - RESULT: 'employees_bak' created with 5 duplicated rows.
*/
CREATE TABLE employees_bak AS 
SELECT * FROM employees;

/*
   QUERY 13: Verify Copied Table Data
   - WHAT IS THIS QUERY? DML retrieval query.
   - WHAT DOES IT DO? Returns all rows from 'employees_bak'.
   - HOW KEYWORD WORKS: `SELECT * FROM` fetches all columns and rows.
   - RESULT: Displays 5 employee backup rows.
*/
SELECT * FROM employees_bak;

/*
   QUERY 14: Copy Table Structure Only (Empty Copy via False Condition)
   - WHAT IS THIS QUERY? CTAS Schema-only duplication technique.
   - WHAT DOES IT DO? Creates 'employees_bak1' with identical column definitions as 'employees', but ZERO data rows.
   - HOW KEYWORD WORKS: `WHERE 10 = 20` evaluates to FALSE for all rows, causing 0 rows to copy while cloning the schema.
   - RESULT: Empty table 'employees_bak1' created.
*/
CREATE TABLE employees_bak1 AS 
SELECT * FROM employees WHERE 10 = 20;

/*
   QUERY 15: Inspect Empty Copy Schema
   - WHAT IS THIS QUERY? Schema inspection command.
   - WHAT DOES IT DO? Displays column structure of 'employees_bak1'.
   - HOW KEYWORD WORKS: `DESC` outputs field definitions.
   - RESULT: Displays ID, FIRST_NAME, SALARY column metadata.
*/
DESC employees_bak1;

/*
   QUERY 16: Populate Empty Table Copy Using INSERT INTO SELECT
   - WHAT IS THIS QUERY? DML bulk data copy statement.
   - WHAT DOES IT DO? Copies all rows from 'employees' into the empty 'employees_bak1' table.
   - HOW KEYWORD WORKS: `INSERT INTO ... SELECT` bulk inserts query results into an existing target table.
   - RESULT: 5 rows inserted into 'employees_bak1'.
*/
INSERT INTO employees_bak1 
SELECT * FROM employees;


-- ============================================================================
-- SECTION 4: DEFAULT CONSTRAINT & AUTO_INCREMENT MECHANICS
-- ============================================================================

/*
   QUERY 17: Create Table with DEFAULT Constraint
   - WHAT IS THIS QUERY? DDL table creation with column default value.
   - WHAT DOES IT DO? Creates 'student' table where `city` defaults to 'Chennai' if omitted.
   - HOW KEYWORD WORKS: `DEFAULT 'Chennai'` supplies fallback value for missing column inputs.
   - RESULT: Table 'student' created.
*/
CREATE TABLE student (
    id INT,
    name VARCHAR(30),
    city VARCHAR(30) DEFAULT 'Chennai'
);

/*
   QUERY 18: Insert Omitting Column to Trigger DEFAULT
   - WHAT IS THIS QUERY? DML insert testing DEFAULT fallback.
   - WHAT DOES IT DO? Inserts students 1, 2, 3 without specifying city; MySQL automatically assigns 'Chennai'.
   - HOW KEYWORD WORKS: Explicitly listing `(id, name)` in INSERT causes omitted `city` column to use DEFAULT value.
   - RESULT: 3 rows inserted with city = 'Chennai'.
*/
INSERT INTO student (id, name) VALUES 
(1, 'ram'),
(2, 'sham'),
(3, 'shyam');

/*
   QUERY 19: Insert Explicit City Overriding DEFAULT
   - WHAT IS THIS QUERY? DML insert overriding DEFAULT.
   - WHAT DOES IT DO? Inserts student 4 with explicit city 'Mumbai', bypassing the default 'Chennai'.
   - HOW KEYWORD WORKS: Supplying an explicit value ('Mumbai') overrides the DEFAULT constraint.
   - RESULT: 1 row inserted with city = 'Mumbai'.
*/
INSERT INTO student VALUES (4, 'sai', 'Mumbai');

/*
   QUERY 20: Create Table with AUTO_INCREMENT Primary Key
   - WHAT IS THIS QUERY? DDL table creation with automated surrogate key.
   - WHAT DOES IT DO? Creates 'person' table where `id` increments automatically (1, 2, 3...).
   - HOW KEYWORD WORKS: `AUTO_INCREMENT` automatically generates unique sequential integer IDs.
   - RESULT: Table 'person' created.
*/
CREATE TABLE person (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30),
    city VARCHAR(20)
);

/*
   QUERY 21: Insert Rows Omitting AUTO_INCREMENT Column
   - WHAT IS THIS QUERY? DML insert testing AUTO_INCREMENT sequence.
   - WHAT DOES IT DO? Inserts 'ram' and 'ramesh' without specifying `id`; MySQL assigns IDs 1 and 2 automatically.
   - HOW KEYWORD WORKS: Leaving out `id` triggers auto-generation starting at 1.
   - RESULT: Rows inserted with IDs 1 and 2.
*/
INSERT INTO person (name, city) VALUES 
('ram', 'chennai'),
('ramesh', 'mumbai');

/*
   QUERY 22: Manually Insert Specific High ID in AUTO_INCREMENT Column
   - WHAT IS THIS QUERY? DML insert specifying explicit AUTO_INCREMENT value.
   - WHAT DOES IT DO? Inserts 'babjee' with an explicit ID of 100.
   - HOW KEYWORD WORKS: Manually inserting an ID (100) resets the database engine's internal counter to 101.
   - RESULT: 1 row inserted with ID = 100.
*/
INSERT INTO person VALUES (100, 'babjee', 'chennai');

/*
   QUERY 23: Insert Following Manual ID Reset
   - WHAT IS THIS QUERY? DML insert verifying AUTO_INCREMENT sequence jump.
   - WHAT DOES IT DO? Inserts 'pradeep' without specifying ID; MySQL assigns ID 101.
   - HOW KEYWORD WORKS: Sequence resumes automatically from max(ID) + 1 = 101.
   - RESULT: 1 row inserted with ID = 101.
*/
INSERT INTO person (name, city) VALUES ('pradeep', 'chennai');


-- ============================================================================
-- SECTION 5: NOT NULL, UNIQUE & COMPOSITE CONSTRAINTS
-- ============================================================================

/*
   QUERY 24: Create Table with NOT NULL Constraints
   - WHAT IS THIS QUERY? DDL table creation specifying mandatory fields.
   - WHAT DOES IT DO? Creates 'items' table where `id` and `item_name` cannot be NULL.
   - HOW KEYWORD WORKS: `NOT NULL` enforces column mandatory status.
   - RESULT: Table 'items' created.
*/
CREATE TABLE items (
    id INT NOT NULL,
    item_name VARCHAR(30) NOT NULL,
    price FLOAT
);

/*
   QUERY 25: Valid Insert into NOT NULL Table
   - WHAT IS THIS QUERY? DML insert satisfying NOT NULL.
   - WHAT DOES IT DO? Adds item 1, 'pen', 30.
   - HOW KEYWORD WORKS: Supplying valid values for `id` and `item_name` passes constraint checks.
   - RESULT: 1 row inserted.
*/
INSERT INTO items VALUES (1, 'pen', 30);

/*
   QUERY 26: Create Table with Named UNIQUE Constraint
   - WHAT IS THIS QUERY? DDL table creation with named UNIQUE constraint.
   - WHAT DOES IT DO? Creates 'product' table where `id` must be unique across all rows.
   - HOW KEYWORD WORKS: `CONSTRAINT product_uk UNIQUE(id)` defines a named unique key index.
   - RESULT: Table 'product' created.
*/
CREATE TABLE product (
    id INT,
    product_name VARCHAR(30),
    price INT,
    CONSTRAINT product_uk UNIQUE(id)
);

/*
   QUERY 27: Query Constraint Metadata from Information Schema
   - WHAT IS THIS QUERY? System data dictionary query.
   - WHAT DOES IT DO? Displays constraint names and types defined on table 'product' in 'trainingdb'.
   - HOW KEYWORD WORKS: Queries `information_schema.table_constraints` system catalog.
   - RESULT: Displays 'product_uk' as UNIQUE constraint type.
*/
SELECT constraint_name, constraint_type 
FROM information_schema.table_constraints
WHERE table_schema = 'trainingdb' AND table_name = 'product';

/*
   QUERY 28: Insert NULLs into UNIQUE Column
   - WHAT IS THIS QUERY? DML insert testing NULLs in UNIQUE columns.
   - WHAT DOES IT DO? Inserts two product rows both having NULL for `id`.
   - HOW KEYWORD WORKS: In SQL standards and MySQL, `NULL != NULL`, so multiple NULL entries are permitted in UNIQUE columns.
   - RESULT: 2 rows inserted successfully with NULL IDs.
*/
INSERT INTO product VALUES (NULL, 'market', 20);
INSERT INTO product VALUES (NULL, 'duster', 20);

/*
   QUERY 29: Composite UNIQUE Constraint (Multiple Columns)
   - WHAT IS THIS QUERY? DDL table creation with composite unique constraint.
   - WHAT DOES IT DO? Creates 'product2' where the COMBINATION of (brand, color) must be unique.
   - HOW KEYWORD WORKS: `UNIQUE(brand, color)` allows repeated brand or repeated color individually, but blocks exact duplicate pairs.
   - RESULT: Table 'product2' created.
*/
CREATE TABLE product2 (
    brand VARCHAR(30),
    color VARCHAR(20),
    UNIQUE(brand, color)
);


-- ============================================================================
-- SECTION 6: PRIMARY KEY & COMPOSITE PRIMARY KEY
-- ============================================================================

/*
   QUERY 30: Create Table with Single PRIMARY KEY
   - WHAT IS THIS QUERY? DDL table creation with Primary Key.
   - WHAT DOES IT DO? Creates 'product3' where `id` is the PRIMARY KEY.
   - HOW KEYWORD WORKS: `PRIMARY KEY` forces column to be UNIQUE and NOT NULL, establishing a clustered index.
   - RESULT: Table 'product3' created.
*/
CREATE TABLE product3 (
    id INT PRIMARY KEY,
    name VARCHAR(30),
    price FLOAT
);

/*
   QUERY 31: Composite PRIMARY KEY
   - WHAT IS THIS QUERY? DDL statement defining composite primary key across multiple columns.
   - WHAT DOES IT DO? Creates 'brand2' table where the combined pair (brand, color) forms the PRIMARY KEY.
   - HOW KEYWORD WORKS: `PRIMARY KEY (brand, color)` guarantees no duplicate (brand, color) combinations exist and neither column contains NULL.
   - RESULT: Table 'brand2' created.
*/
CREATE TABLE brand2 (
    brand VARCHAR(30),
    color VARCHAR(30),
    PRIMARY KEY (brand, color)
);


-- ============================================================================
-- SECTION 7: CHECK CONSTRAINT & FOREIGN KEY RELATIONSHIPS
-- ============================================================================

/*
   QUERY 32: Create Table with CHECK Constraint
   - WHAT IS THIS QUERY? DDL table creation enforcing a numeric validation check.
   - WHAT DOES IT DO? Creates 'employees2' requiring `sal` to be >= 5000.
   - HOW KEYWORD WORKS: `CHECK (sal >= 5000)` enforces domain validation, rejecting salaries below 5000.
   - RESULT: Table 'employees2' created.
*/
CREATE TABLE employees2 (
    id INT,
    name VARCHAR(30),
    sal INT CHECK (sal >= 5000)
);

/*
   QUERY 33: Create Parent Department Table
   - WHAT IS THIS QUERY? DDL parent table creation.
   - WHAT DOES IT DO? Creates 'dept' table with `deptno` PRIMARY KEY.
   - HOW KEYWORD WORKS: Parent tables must be created first before child tables reference their primary key.
   - RESULT: Parent table 'dept' created.
*/
CREATE TABLE dept (
    deptno INT PRIMARY KEY,
    dname VARCHAR(30)
);

/*
   QUERY 34: Populate Parent Department Records
   - WHAT IS THIS QUERY? DML insert populating parent lookup data.
   - WHAT DOES IT DO? Adds departments 10 ('cse'), 20 ('it'), 30 ('civil').
   - HOW KEYWORD WORKS: Provides valid parent keys for foreign key references.
   - RESULT: 3 department rows inserted.
*/
INSERT INTO dept VALUES 
(10, 'cse'),
(20, 'it'),
(30, 'civil');

/*
   QUERY 35: Create Child Student Table with FOREIGN KEY
   - WHAT IS THIS QUERY? DDL child table creation linking Foreign Key to Parent Primary Key.
   - WHAT DOES IT DO? Creates 'student' table where `deptno` references `dept(deptno)`.
   - HOW KEYWORD WORKS: `FOREIGN KEY (deptno) REFERENCES dept(deptno)` enforces referential integrity.
   - RESULT: Child table 'student' created.
*/
CREATE TABLE student (
    student_id INT,
    student_name VARCHAR(30),
    deptno INT,
    FOREIGN KEY (deptno) REFERENCES dept(deptno)
);

/*
   QUERY 36: Valid Foreign Key Insert
   - WHAT IS THIS QUERY? DML insert satisfying referential integrity.
   - WHAT DOES IT DO? Inserts students referencing valid department numbers 10 and 30.
   - HOW KEYWORD WORKS: Succeeds because deptno values 10 and 30 exist in parent table 'dept'.
   - RESULT: 3 student rows inserted.
*/
INSERT INTO student VALUES 
(1, 'ram', 10),
(2, 'sham', 10),
(3, 'sunil', 30);