<div align="center">

![SQL](https://img.shields.io/badge/SQL-MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![Topic 1](https://img.shields.io/badge/Topic_1-Basic_DDL_&_Data_Types-4CAF50?style=for-the-badge)
![Level](https://img.shields.io/badge/Level-Beginner-blue?style=for-the-badge)

# Topic 1: Basic DDL - Database Creation, Table Definition & Data Types

**Complete SQL guide covering DDL commands (`CREATE`, `USE`, `DESC`), data types (`INT`, `VARCHAR`, `DECIMAL`, `FLOAT`, `DATE`), and schema design fundamentals.**

---

</div>

## 📚 Topic Overview

Data Definition Language (DDL) is the foundational subset of SQL commands used to create, modify, and delete database structures (schemas, databases, tables, indexes).

### Core Concepts Covered
1. **Database Operations**: `CREATE DATABASE`, `USE database_name`
2. **Table Definition**: `CREATE TABLE` with column specifications
3. **Data Types**: `INT`, `VARCHAR`, `CHAR`, `DECIMAL`, `FLOAT`, `DATE`
4. **Schema Inspection**: `DESC` / `DESCRIBE`

---

## 🎯 Key Interview Concepts & Comparison Tables

### 1. DDL vs DML

| Feature | DDL (Data Definition Language) | DML (Data Manipulation Language) |
|---------|--------------------------------|----------------------------------|
| **Commands** | `CREATE`, `ALTER`, `DROP`, `TRUNCATE`, `RENAME` | `SELECT`, `INSERT`, `UPDATE`, `DELETE` |
| **Purpose** | Defines/modifies table structures and database schemas | Manipulates/manages actual data rows inside tables |
| **Auto-Commit** | **Auto-committed** (cannot be rolled back) | Transactional (can be rolled back using `ROLLBACK`) |

> [!IMPORTANT]
> **Interview Point**: DDL commands commit automatically in MySQL. Running `DROP TABLE` or `TRUNCATE TABLE` cannot be undone with `ROLLBACK`.

---

### 2. VARCHAR vs CHAR Data Types

| Attribute | `CHAR(size)` | `VARCHAR(size)` |
|-----------|-------------|-----------------|
| **Type** | Fixed-Length String | Variable-Length String |
| **Storage** | Always uses full `size` bytes (right-padded with spaces) | Uses actual string bytes + 1 or 2 length bytes |
| **Performance** | Faster access (fixed offset calculations) | Slightly slower due to dynamic length calculation |
| **Best Use Case** | Fixed code lengths (`CountryCode` e.g., `'US'`, `'IN'`, `Gender` `'M'/'F'`) | Names, emails, addresses, descriptions |

---

### 3. DECIMAL vs FLOAT Data Types

| Attribute | `DECIMAL(M, D)` | `FLOAT` / `DOUBLE` |
|-----------|-----------------|--------------------|
| **Precision Type** | Exact Numeric (Fixed-Point) | Approximate Numeric (Floating-Point) |
| **Calculation Errors** | **Zero rounding errors** | Potential binary floating-point rounding errors |
| **Best Use Case** | Financial totals, currency, salary, product prices | Scientific metrics, sensor data, coordinates |

> [!TIP]
> **Best Practice**: Always use `DECIMAL(10,2)` for financial fields like `Price`, `Salary`, or `TotalAmount`.

---

## 🔍 Query-by-Query Detailed Analysis

---

### Query 1: Create Database `practicesql`

```sql
CREATE DATABASE practicesql;
```

* **What is this query?**  
  A DDL command that creates a new database container.
* **What does this query do?**  
  Allocates a new, empty relational database named `practicesql` within the database server.
* **What is the solution/logic behind it?**  
  Before creating tables, a database namespace must exist to hold the table schemas and metadata.
* **Why are these particular SQL clauses or keywords used?**  
  - `CREATE DATABASE`: Standard SQL DDL keyword to instantiate a new database.
  - `practicesql`: Identifier name given to the database.
* **What will be the result/output?**  
  `Query OK, 1 row affected.` A new database schema named `practicesql` is created.

---

### Query 2: Select Active Database `practicesql`

```sql
USE practicesql;
```

* **What is this query?**  
  A context-switching SQL command.
* **What does this query do?**  
  Sets `practicesql` as the current default database for all subsequent queries.
* **What is the solution/logic behind it?**  
  Database servers host multiple databases. `USE` tells the server which schema to execute table creation and data manipulation queries against.
* **Why are these particular SQL clauses or keywords used?**  
  - `USE`: Command to set the active database session context.
* **What will be the result/output?**  
  `Database changed.` All future queries will target `practicesql`.

---

### Query 3: Create `student` Table

```sql
CREATE TABLE student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(30),
    Age INT,
    city VARCHAR(30)
);
```

* **What is this query?**  
  A DDL command to create the structural schema for student records.
* **What does this query do?**  
  Defines a table named `student` with 4 columns: `StudentID`, `StudentName`, `Age`, and `city`.
* **What is the solution/logic behind it?**  
  - `StudentID` is designated as `PRIMARY KEY` to uniquely identify each student.
  - `StudentName` and `city` use `VARCHAR(30)` to accommodate variable text up to 30 characters.
  - `Age` uses `INT` for storing integer age values.
* **Why are these particular SQL clauses or keywords used?**  
  - `CREATE TABLE`: DDL directive to build a table entity.
  - `PRIMARY KEY`: Constraint ensuring uniqueness and non-nullability for row identification.
  - `VARCHAR(30)`: Variable-length character data type.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table structure `student` is stored in the database catalog.

---

### Query 4: Describe `student` Table Schema

```sql
DESC student;
```

* **What is this query?**  
  A schema inspection utility command.
* **What does this query do?**  
  Displays column details for `student` including field names, data types, nullability, key constraints, defaults, and extra properties.
* **What is the solution/logic behind it?**  
  Retrieves metadata from MySQL's internal data dictionary (`information_schema`).
* **Why are these particular SQL clauses or keywords used?**  
  - `DESC` (short for `DESCRIBE`): Inspects table definitions.
* **What will be the result/output?**  
  A metadata table displaying 4 fields: `StudentID`, `StudentName`, `Age`, `city`.

---

### Query 5: Create `Employees` Table

```sql
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(30),
    Department VARCHAR(30),
    Salary FLOAT,
    JoiningDate DATE
);
```

* **What is this query?**  
  A DDL table creation statement for workforce tracking.
* **What does this query do?**  
  Creates an `Employees` table with columns: `EmployeeID`, `EmployeeName`, `Department`, `Salary`, and `JoiningDate`.
* **What is the solution/logic behind it?**  
  - `EmployeeID` is the `PRIMARY KEY`.
  - `Salary` uses `FLOAT` to handle floating-point numeric values.
  - `JoiningDate` uses `DATE` to store calendar dates in `'YYYY-MM-DD'` format.
* **Why are these particular SQL clauses or keywords used?**  
  - `FLOAT`: Single-precision floating point number type.
  - `DATE`: Data type dedicated to storing year, month, and day.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `Employees` is created.

---

### Query 6: Describe `Employees` Table Schema

```sql
DESC Employees;
```

* **What is this query?**  
  Schema verification command.
* **What does this query do?**  
  Displays the metadata layout for `Employees`.
* **What is the solution/logic behind it?**  
  Queries `information_schema` for column structures.
* **Why are these particular SQL clauses or keywords used?**  
  - `DESC`: Summarizes table column definitions.
* **What will be the result/output?**  
  Tabular schema showing 5 columns: `EmployeeID`, `EmployeeName`, `Department`, `Salary`, `JoiningDate`.

---

### Query 7: Create `products` Table

```sql
CREATE TABLE products (
    ProductID INT,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    Quantity INT
);
```

* **What is this query?**  
  A DDL table creation query for product inventory.
* **What does this query do?**  
  Creates a `products` table containing `ProductID`, `ProductName`, `Price`, and `Quantity`.
* **What is the solution/logic behind it?**  
  - `Price` uses `DECIMAL(10,2)` to store exact monetary amounts up to `99,999,999.99` with 2 decimal digits.
  - `ProductName` uses `VARCHAR(100)` for detailed product titles.
* **Why are these particular SQL clauses or keywords used?**  
  - `DECIMAL(10,2)`: Specifies 10 total digits of precision with 2 scale digits (after decimal point).
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `products` created.

---

### Query 8: Describe `products` Table Schema

```sql
DESC products;
```

* **What is this query?**  
  Schema verification command for `products`.
* **What does this query do?**  
  Lists the column structures of `products`.
* **What is the solution/logic behind it?**  
  Displays data dictionary output for column attributes.
* **Why are these particular SQL clauses or keywords used?**  
  - `DESC`: Inspects structure.
* **What will be the result/output?**  
  Grid showing `ProductID` (INT), `ProductName` (VARCHAR(100)), `Price` (DECIMAL(10,2)), `Quantity` (INT).

---

### Query 9: Create `Orders` Table

```sql
CREATE TABLE Orders (
    OrderID INT,
    CustomerName VARCHAR(30),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2)
);
```

* **What is this query?**  
  A DDL statement to build an e-commerce order table.
* **What does this query do?**  
  Creates `Orders` with columns `OrderID`, `CustomerName`, `OrderDate`, and `TotalAmount`.
* **What is the solution/logic behind it?**  
  - `OrderDate` uses `DATE` for recording transaction dates.
  - `TotalAmount` uses `DECIMAL(10,2)` to prevent financial rounding inaccuracies.
* **Why are these particular SQL clauses or keywords used?**  
  - `TotalAmount DECIMAL(10,2)`: Guarantees exact representation of currency values.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `Orders` created.

---

### Query 10: Create `Books` Table

```sql
CREATE TABLE Books (
    BookID INT,
    Author VARCHAR(30),
    BookTitle VARCHAR(100),
    Price DECIMAL(10,2),
    PublishedYear INT
);
```

* **What is this query?**  
  A DDL query for creating a book catalog table.
* **What does this query do?**  
  Defines `Books` with `BookID`, `Author`, `BookTitle`, `Price`, and `PublishedYear`.
* **What is the solution/logic behind it?**  
  - `PublishedYear` uses `INT` to store 4-digit numeric publication years (e.g., `2024`).
  - `BookTitle` uses `VARCHAR(100)` to allow longer literary titles.
* **Why are these particular SQL clauses or keywords used?**  
  - `PublishedYear INT`: Integer data type suitable for numeric year storage.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `Books` created.

---

<div align="center">

[![Next Topic](https://img.shields.io/badge/Next-Topic_2_&_3:_DEFAULT_&_AUTO__INCREMENT-2196F3?style=for-the-badge)](./Topic_2_3.md)

</div>
