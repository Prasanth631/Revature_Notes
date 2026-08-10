<div align="center">

![SQL](https://img.shields.io/badge/SQL-MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![Day 1 DDL](https://img.shields.io/badge/Day_1-DDL_&_Constraints-4CAF50?style=for-the-badge)
![Level](https://img.shields.io/badge/Level-Beginner-blue?style=for-the-badge)

# Day 1 DDL & Constraints Practice Notes

**Comprehensive SQL study guide covering database inspection, CTAS (Create Table As Select), `DEFAULT` fallback values, `AUTO_INCREMENT` sequence logic, `NOT NULL`, `UNIQUE`, `PRIMARY KEY`, `CHECK`, and `FOREIGN KEY` referential integrity.**

---

</div>

## 📚 Overview

This module covers **Day 1 DDL Operations and Table Constraints**:
1. **System & Session Inspection**: `VERSION()`, `SHOW DATABASES`, `DATABASE()`, `CURRENT_USER()`
2. **Table Duplication (CTAS)**: `CREATE TABLE AS SELECT ...` (full vs empty copy)
3. **Data Integrity Constraints**:
   - `DEFAULT`: Fallback value for omitted columns.
   - `AUTO_INCREMENT`: Automated surrogate primary keys.
   - `NOT NULL`: Enforces mandatory fields.
   - `UNIQUE`: Prevents duplicate entries (permits `NULL`s).
   - `PRIMARY KEY`: Unique + Non-null clustered index.
   - `CHECK`: Domain range and condition validation.
   - `FOREIGN KEY`: Parent-child referential integrity.

---

## 🔍 Detailed Query-by-Query Analysis

---

### Query 1: Check Database Server Version
```sql
SELECT VERSION();
```
* **What is this query?** System metadata retrieval function.
* **What does it do?** Returns the active MySQL database server version string (e.g., `'8.0.35'`).
* **How keyword works:** `VERSION()` is a built-in scalar function returning server build information.

---

### Query 2: List Databases
```sql
SHOW DATABASES;
```
* **What is this query?** Administrative catalog inspection query.
* **What does it do?** Lists all database schemas available on the server.
* **How keyword works:** `SHOW DATABASES` queries internal system catalogs (`information_schema`).

---

### Query 3: Create Database `trainingdb`
```sql
CREATE DATABASE IF NOT EXISTS trainingdb;
```
* **What is this query?** DDL database creation query.
* **What does it do?** Creates a database named `trainingdb` if it does not already exist.
* **How keyword works:** `CREATE DATABASE` allocates a schema namespace. `IF NOT EXISTS` prevents error throwing if the database already exists.

---

### Query 4: Select Working Database
```sql
USE trainingdb;
```
* **What is this query?** Session context configuration statement.
* **What does it do?** Sets `trainingdb` as the default database for subsequent commands.
* **How keyword works:** `USE` redirects session context to the named schema.

---

### Query 5: Verify Active Database
```sql
SELECT DATABASE();
```
* **What is this query?** Session metadata inspection query.
* **What does it do?** Displays the name of the currently selected database (`'trainingdb'`).
* **How keyword works:** `DATABASE()` returns the active schema name or `NULL`.

---

### Query 6: Get Current Session User
```sql
SELECT CURRENT_USER();
```
* **What is this query?** Security context query.
* **What does it do?** Returns the authenticated client user and host (e.g., `'root@localhost'`).
* **How keyword works:** `CURRENT_USER()` retrieves authentication details.

---

### Query 7: Create Base `EMPLOYEES` Table
```sql
CREATE TABLE EMPLOYEES (
    ID INT,
    FIRST_NAME VARCHAR(30),
    SALARY FLOAT
);
```
* **What is this query?** DDL table structure statement.
* **What does it do?** Creates `EMPLOYEES` with `ID` (integer), `FIRST_NAME` (string), and `SALARY` (float).
* **How keyword works:** `CREATE TABLE` specifies column names and physical storage types.

---

### Query 8: Insert Multiple Rows in Single Statement
```sql
INSERT INTO EMPLOYEES VALUES 
(2, 'SHAM', 5000),
(3, 'SUDHEER', 3000),
(4, 'RAKESH', 6000);
```
* **What is this query?** Multi-row DML insert statement.
* **What does it do?** Inserts 3 employee rows in a single database round-trip.
* **How keyword works:** Comma-separated value tuples reduce network overhead and transaction commit times.

---

### Query 9: Copy Table Structure & All Data (CTAS)
```sql
CREATE TABLE employees_bak AS 
SELECT * FROM employees;
```
* **What is this query?** DDL + DML Table Duplication (CTAS).
* **What does it do?** Creates `employees_bak` and populates it with all rows from `employees`.
* **How keyword works:** `CREATE TABLE ... AS SELECT` dynamically builds a new table from a query result set.

---

### Query 10: Copy Table Structure Only (Empty Copy via False Condition)
```sql
CREATE TABLE employees_bak1 AS 
SELECT * FROM employees WHERE 10 = 20;
```
* **What is this query?** CTAS Schema-only cloning technique.
* **What does it do?** Creates `employees_bak1` with the same columns as `employees`, but 0 data rows.
* **How keyword works:** `WHERE 10 = 20` evaluates to FALSE for all rows, causing 0 rows to copy while duplicating column definitions.

---

### Query 11: Bulk Copy Data into Existing Table (`INSERT INTO SELECT`)
```sql
INSERT INTO employees_bak1 
SELECT * FROM employees;
```
* **What is this query?** DML bulk data migration query.
* **What does it do?** Copies all rows from `employees` into the existing `employees_bak1` table.
* **How keyword works:** `INSERT INTO ... SELECT` inserts query results directly into an existing target table.

---

### Query 12: Create Table with `DEFAULT` Constraint
```sql
CREATE TABLE student (
    id INT,
    name VARCHAR(30),
    city VARCHAR(30) DEFAULT 'Chennai'
);
```
* **What is this query?** DDL statement specifying a column fallback value.
* **What does it do?** Creates `student` table where `city` defaults to `'Chennai'` if omitted during insertion.
* **How keyword works:** `DEFAULT 'Chennai'` supplies automatic fallback data when `city` is unsupplied.

---

### Query 13: Create Table with `AUTO_INCREMENT` Primary Key
```sql
CREATE TABLE person (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30),
    city VARCHAR(20)
);
```
* **What is this query?** DDL query defining automated surrogate key generation.
* **What does it do?** Creates `person` table where `id` increments automatically (`1, 2, 3...`).
* **How keyword works:** `AUTO_INCREMENT` delegates primary key sequence generation to the database engine.

---

### Query 14: Manually Insert High ID in `AUTO_INCREMENT` Column
```sql
INSERT INTO person VALUES (100, 'babjee', 'chennai');
```
* **What is this query?** DML insert with explicit sequence override.
* **What does it do?** Inserts a record with an explicit `id` of `100`.
* **How keyword works:** Manually inserting `100` resets the engine's internal `AUTO_INCREMENT` counter so subsequent automated inserts start at `101`.

---

### Query 15: Create Table with `NOT NULL` Constraints
```sql
CREATE TABLE items (
    id INT NOT NULL,
    item_name VARCHAR(30) NOT NULL,
    price FLOAT
);
```
* **What is this query?** DDL table creation specifying mandatory fields.
* **What does it do?** Creates `items` table requiring `id` and `item_name` to be non-null.
* **How keyword works:** `NOT NULL` rejects any row insertion lacking values for these fields.

---

### Query 16: Create Table with Composite `UNIQUE` Constraint
```sql
CREATE TABLE product2 (
    brand VARCHAR(30),
    color VARCHAR(20),
    UNIQUE(brand, color)
);
```
* **What is this query?** DDL query creating a multi-column unique key constraint.
* **What does it do?** Ensures the combined pair of `(brand, color)` is unique across all rows.
* **How keyword works:** `UNIQUE(brand, color)` permits individual repeating brands or colors, but blocks duplicate `(brand, color)` combinations.

---

### Query 17: Create Table with Composite `PRIMARY KEY`
```sql
CREATE TABLE brand2 (
    brand VARCHAR(30),
    color VARCHAR(30),
    PRIMARY KEY (brand, color)
);
```
* **What is this query?** DDL statement enforcing composite Primary Key.
* **What does it do?** Creates `brand2` where `(brand, color)` together form the Primary Key.
* **How keyword works:** `PRIMARY KEY (brand, color)` forces unique non-null combinations and creates a multi-column clustered index.

---

### Query 18: Create Table with `CHECK` Constraint
```sql
CREATE TABLE employees2 (
    id INT,
    name VARCHAR(30),
    sal INT CHECK (sal >= 5000)
);
```
* **What is this query?** DDL table creation with domain range validation.
* **What does it do?** Creates `employees2` requiring `sal` to be greater than or equal to 5000.
* **How keyword works:** `CHECK (sal >= 5000)` enforces domain validation, rejecting insertions with salary < 5000.

---

### Query 19: Create Parent-Child Table Relationship (`FOREIGN KEY`)
```sql
CREATE TABLE dept (
    deptno INT PRIMARY KEY,
    dname VARCHAR(30)
);

CREATE TABLE student (
    student_id INT,
    student_name VARCHAR(30),
    deptno INT,
    FOREIGN KEY (deptno) REFERENCES dept(deptno)
);
```
* **What is this query?** DDL queries establishing referential integrity.
* **What does it do?** Creates parent table `dept` and child table `student` linked via `FOREIGN KEY (deptno)`.
* **How keyword works:** `FOREIGN KEY ... REFERENCES` ensures child rows reference only existing parent primary keys in `dept`.

---

<div align="center">

[![Next Notes](https://img.shields.io/badge/Next-Day_1_DDL_Alter_Notes-2196F3?style=for-the-badge)](./Day_1_DDL_.md)

</div>
