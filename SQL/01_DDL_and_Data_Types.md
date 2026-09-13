# 01 — DDL & Data Types

> **Topics Covered:** `CREATE DATABASE`, `USE`, `CREATE TABLE`, `DESC`, Data Types (`INT`, `VARCHAR`, `CHAR`, `DECIMAL`, `FLOAT`, `DATE`), CTAS, Multi-row Inserts, Server Inspection

---

## 📌 Quick Reference

| DDL Command | Purpose |
|-------------|---------|
| `CREATE DATABASE` | Create a new database schema |
| `USE` | Switch active database |
| `CREATE TABLE` | Define table structure and columns |
| `DESC` / `DESCRIBE` | Inspect table column metadata |
| `DROP TABLE` | Remove a table permanently |

---

## 🎯 Key Concepts

### DDL vs DML

| Feature | DDL | DML |
|---------|-----|-----|
| **Commands** | `CREATE`, `ALTER`, `DROP`, `TRUNCATE` | `INSERT`, `UPDATE`, `DELETE`, `SELECT` |
| **Purpose** | Defines/modifies table structures | Manipulates data rows |
| **Auto-Commit** | **Auto-committed** — cannot rollback | Transactional — can rollback |

> [!IMPORTANT]
> `DROP TABLE` and `TRUNCATE TABLE` **cannot be undone** with `ROLLBACK` in MySQL.

---

### VARCHAR vs CHAR

| Attribute | `CHAR(size)` | `VARCHAR(size)` |
|-----------|-------------|-----------------|
| **Type** | Fixed-Length | Variable-Length |
| **Storage** | Always uses full `size` bytes | Uses actual bytes + 1-2 length bytes |
| **Performance** | Faster (fixed offset) | Slightly slower |
| **Best Use** | Fixed codes (`'US'`, `'M'/'F'`) | Names, emails, descriptions |

### DECIMAL vs FLOAT

| Attribute | `DECIMAL(M, D)` | `FLOAT` / `DOUBLE` |
|-----------|-----------------|---------------------|
| **Precision** | Exact (fixed-point) | Approximate (floating-point) |
| **Errors** | Zero rounding errors | Potential rounding errors |
| **Best Use** | Financial values, salary, price | Scientific metrics, coordinates |

> [!TIP]
> Always use `DECIMAL(10,2)` for `Price`, `Salary`, or `TotalAmount` fields.

---

## 🔍 Query-by-Query Analysis

### Part 1 — Basic Database & Table Creation

#### Q1: Create Database
```sql
CREATE DATABASE practicesql;
```
- Creates a new, empty relational database named `practicesql`.

#### Q2: Select Active Database
```sql
USE practicesql;
```
- Sets `practicesql` as the default schema for all subsequent queries.

#### Q3: Create `student` Table
```sql
CREATE TABLE student (
    StudentID   INT PRIMARY KEY,
    StudentName VARCHAR(30),
    Age         INT,
    city        VARCHAR(30)
);
```
- `StudentID` is the `PRIMARY KEY` — unique, non-null row identifier.
- `VARCHAR(30)` for variable-length text fields.

#### Q4: Inspect Table Schema
```sql
DESC student;
```
- Returns column names, data types, nullability, key type, and defaults from `information_schema`.

#### Q5: Create `Employees` Table
```sql
CREATE TABLE Employees (
    EmployeeID   INT PRIMARY KEY,
    EmployeeName VARCHAR(30),
    Department   VARCHAR(30),
    Salary       FLOAT,
    JoiningDate  DATE
);
```
- `FLOAT` for approximate salary values; `DATE` stores `'YYYY-MM-DD'` calendar dates.

#### Q6: Create `products` Table
```sql
CREATE TABLE products (
    ProductID   INT,
    ProductName VARCHAR(100),
    Price       DECIMAL(10,2),
    Quantity    INT
);
```
- `DECIMAL(10,2)` — 10 total digits, 2 after decimal. Zero rounding errors for monetary amounts.

#### Q7: Create `Orders` Table
```sql
CREATE TABLE Orders (
    OrderID      INT,
    CustomerName VARCHAR(30),
    OrderDate    DATE,
    TotalAmount  DECIMAL(10,2)
);
```

#### Q8: Create `Books` Table
```sql
CREATE TABLE Books (
    BookID        INT,
    Author        VARCHAR(30),
    BookTitle     VARCHAR(100),
    Price         DECIMAL(10,2),
    PublishedYear INT
);
```
- `PublishedYear INT` — stores 4-digit numeric years (e.g., `2024`).

---

### Part 2 — Server Inspection & Advanced DDL

#### Q9: Check Server Version
```sql
SELECT VERSION();
```
- Returns active MySQL server version string (e.g., `'8.0.35'`).

#### Q10: List All Databases
```sql
SHOW DATABASES;
```
- Lists all schemas available on the server by querying `information_schema`.

#### Q11: Create Database Safely
```sql
CREATE DATABASE IF NOT EXISTS trainingdb;
```
- `IF NOT EXISTS` prevents an error if the database already exists.

#### Q12: Verify Active Database
```sql
SELECT DATABASE();
```
- Returns current session's active schema name, or `NULL` if none selected.

#### Q13: Get Current Session User
```sql
SELECT CURRENT_USER();
```
- Returns the authenticated client user and host, e.g., `'root@localhost'`.

#### Q14: Create Base `EMPLOYEES` Table
```sql
CREATE TABLE EMPLOYEES (
    ID         INT,
    FIRST_NAME VARCHAR(30),
    SALARY     FLOAT
);
```

#### Q15: Multi-Row Insert
```sql
INSERT INTO EMPLOYEES VALUES
(2, 'SHAM',    5000),
(3, 'SUDHEER', 3000),
(4, 'RAKESH',  6000);
```
- Comma-separated tuples reduce network round-trips and improve performance.

#### Q16: CTAS — Copy Table with All Data
```sql
CREATE TABLE employees_bak AS
SELECT * FROM employees;
```
- `CREATE TABLE ... AS SELECT` builds a new table from a query result set (schema + data).

#### Q17: CTAS — Copy Table Structure Only (Empty)
```sql
CREATE TABLE employees_bak1 AS
SELECT * FROM employees WHERE 10 = 20;
```
- `WHERE 10 = 20` is always FALSE → 0 rows copied, but column definitions are duplicated.

#### Q18: Bulk Copy Data into Existing Table
```sql
INSERT INTO employees_bak1
SELECT * FROM employees;
```
- `INSERT INTO ... SELECT` migrates rows from one table into another existing table.

#### Q19: Table with `DEFAULT` Constraint
```sql
CREATE TABLE student (
    id   INT,
    name VARCHAR(30),
    city VARCHAR(30) DEFAULT 'Chennai'
);
```
- `DEFAULT 'Chennai'` supplies fallback value when `city` is omitted during `INSERT`.

#### Q20: Table with `AUTO_INCREMENT`
```sql
CREATE TABLE person (
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30),
    city VARCHAR(20)
);
```
- `AUTO_INCREMENT` delegates sequential ID generation (`1, 2, 3...`) to the database engine.

#### Q21: Manual Insert with AUTO_INCREMENT Override
```sql
INSERT INTO person VALUES (100, 'babjee', 'chennai');
```
- Manually inserting `100` resets internal counter → next auto-generated ID becomes `101`.

---

## 💡 Interview Tips

- **DDL is auto-committed** in MySQL — never wrap `DROP`/`TRUNCATE` in a transaction expecting rollback.
- **Use `DECIMAL` for money**, never `FLOAT` (rounding errors in financial math).
- **`CHAR` vs `VARCHAR`**: Use `CHAR` for fixed-length codes only (e.g., gender `'M'`/`'F'`).
- **CTAS** creates structure + data; add `WHERE 1=0` or `WHERE 10=20` for schema-only copy.
