<div align="center">

![SQL](https://img.shields.io/badge/SQL-MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![Topic 2 & 3](https://img.shields.io/badge/Topic_2_%26_3-DEFAULT_%26_AUTO__INCREMENT-4CAF50?style=for-the-badge)
![Level](https://img.shields.io/badge/Level-Beginner-blue?style=for-the-badge)

# Topic 2 & 3: DEFAULT Constraint & AUTO_INCREMENT Mechanism

**Comprehensive SQL guide covering static default values, dynamic default expressions (`CURRENT_DATE`), and automated surrogate key generation via `AUTO_INCREMENT`.**

---

</div>

## 📚 Topic Overview

Column constraints enforce rules on the data entered into tables. This topic focuses on two essential column behaviors:
1. **`DEFAULT` Constraint**: Supplies fallback values automatically when an explicit value is omitted during an `INSERT`.
2. **`AUTO_INCREMENT` Attribute**: Automatically generates sequential numeric IDs for surrogate primary keys.

---

## 🎯 Key Interview Concepts & Deep Dive

### 1. Understanding the `DEFAULT` Constraint

The `DEFAULT` keyword assigns a default value to a column when an `INSERT` statement does not specify a value for that column.

```sql
-- Syntax:
COLUMN_NAME DATA_TYPE DEFAULT default_value
```

#### Static vs Dynamic Defaults (MySQL 8.0+)
- **Static Default**: Fixed literal value, e.g., `City VARCHAR(30) DEFAULT 'Hyderabad'`, `Quantity INT DEFAULT 0`.
- **Dynamic Expression Default**: Enclosed in parentheses to evaluate functions dynamically at insertion time, e.g., `OrderDate DATE DEFAULT (CURRENT_DATE)` or `CreatedAt TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)`.

---

### 2. `AUTO_INCREMENT` Rules & Behavior

`AUTO_INCREMENT` allows a unique integer to be generated automatically whenever a new row is inserted.

```sql
-- Syntax:
COLUMN_NAME INT PRIMARY KEY AUTO_INCREMENT
```

#### Critical Rules for `AUTO_INCREMENT`
1. **Single Column Limit**: A table can have **only one** `AUTO_INCREMENT` column.
2. **Key Constraint Required**: The `AUTO_INCREMENT` column **must be defined as an index/key** (typically `PRIMARY KEY` or `UNIQUE`).
3. **Data Type Requirement**: Must be a numeric type (`INT`, `BIGINT`, `SMALLINT`, etc.).
4. **Behavior with `NULL` or `0`**: Inserting `NULL` or `0` into an `AUTO_INCREMENT` column triggers automated generation of the next integer sequence value (`1, 2, 3...`).

> [!WARNING]
> **Interview Question: Gaps in `AUTO_INCREMENT` Sequences**  
> If an `INSERT` fails due to a constraint error (e.g., duplicate unique key) or is rolled back inside a transaction, the generated `AUTO_INCREMENT` ID is **lost forever**. MySQL does not recalculate or rewind sequence counters to prevent performance bottlenecks.

---

## 🔍 Query-by-Query Detailed Analysis

---

### Query 1: Create Database `topic2`

```sql
CREATE DATABASE topic2;
```

* **What is this query?**  
  A DDL command initializing a new database namespace.
* **What does this query do?**  
  Creates a database named `topic2`.
* **What is the solution/logic behind it?**  
  Provides a separate schema container for Topic 2 & 3 table assignments.
* **Why are these particular SQL clauses or keywords used?**  
  - `CREATE DATABASE`: Standard SQL command to instantiate a database.
* **What will be the result/output?**  
  `Query OK, 1 row affected.` Database `topic2` is created.

---

### Query 2: Select Active Database `topic2`

```sql
USE topic2;
```

* **What is this query?**  
  Session context selection command.
* **What does this query do?**  
  Sets `topic2` as the working database.
* **What is the solution/logic behind it?**  
  Ensures all subsequent DDL table creations occur within `topic2`.
* **Why are these particular SQL clauses or keywords used?**  
  - `USE`: Directs session context.
* **What will be the result/output?**  
  `Database changed.`

---

### Query 3: Create `Employees` Table with Default City

```sql
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(30),
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    JoiningDate DATE,
    City VARCHAR(30) DEFAULT 'Hyderabad'
);
```

* **What is this query?**  
  A DDL table creation query demonstrating a string `DEFAULT` constraint.
* **What does this query do?**  
  Creates `Employees` table where `City` automatically populates with `'Hyderabad'` if no city is provided during an `INSERT`.
* **What is the solution/logic behind it?**  
  - `City VARCHAR(30) DEFAULT 'Hyderabad'` eliminates redundant data entry for the company's primary office location.
* **Why are these particular SQL clauses or keywords used?**  
  - `DEFAULT 'Hyderabad'`: Defines a static default fallback value.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `Employees` instantiated with default city behavior.

---

### Query 4: Create `Products` Table with Default Quantity

```sql
CREATE TABLE Products (
    ProductID INT,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    Quantity INT DEFAULT 0
);
```

* **What is this query?**  
  A DDL query setting a numeric fallback default for inventory.
* **What does this query do?**  
  Creates a `Products` table where `Quantity` defaults to `0` if unspecified.
* **What is the solution/logic behind it?**  
  Prevents `Quantity` from becoming `NULL`, ensuring inventory math calculations (e.g., `Quantity * Price`) do not return `NULL`.
* **Why are these particular SQL clauses or keywords used?**  
  - `DEFAULT 0`: Numeric default value assignment.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `Products` created.

---

### Query 5: Create `student` Table with Default Course

```sql
CREATE TABLE student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(30),
    Age INT,
    city VARCHAR(30),
    Course VARCHAR(30) DEFAULT 'Python'
);
```

* **What is this query?**  
  A DDL table creation query with default course assignment.
* **What does this query do?**  
  Defines a `student` table where `Course` defaults to `'Python'`.
* **What is the solution/logic behind it?**  
  If a student registers without specifying an elective course, the system automatically assigns them to `'Python'`.
* **Why are these particular SQL clauses or keywords used?**  
  - `DEFAULT 'Python'`: String literal default value.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `student` created.

---

### Query 6: Create `users` Table with Default User Status

```sql
CREATE TABLE users (
    ID INT,
    UserName VARCHAR(30),
    User_Status VARCHAR(10) DEFAULT 'Active'
);
```

* **What is this query?**  
  A DDL statement defining user accounts with status management.
* **What does this query do?**  
  Creates a `users` table where `User_Status` defaults to `'Active'`.
* **What is the solution/logic behind it?**  
  Newly created accounts default to `'Active'` status, eliminating manual status flag insertion during user registration.
* **Why are these particular SQL clauses or keywords used?**  
  - `DEFAULT 'Active'`: Ensures new accounts are enabled immediately by default.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `users` created.

---

### Query 7: Create `Orders` Table with Dynamic Date Default

```sql
CREATE TABLE Orders (
    OrderID INT,
    CustomerName VARCHAR(30),
    OrderDate DATE DEFAULT (CURRENT_DATE),
    TotalAmount DECIMAL(10,2)
);
```

* **What is this query?**  
  A DDL query demonstrating MySQL dynamic expression defaults.
* **What does this query do?**  
  Creates an `Orders` table where `OrderDate` automatically records the system execution date via `(CURRENT_DATE)`.
* **What is the solution/logic behind it?**  
  Enclosing `(CURRENT_DATE)` in parentheses allows MySQL 8.0+ to dynamically generate today's timestamp for every new order.
* **Why are these particular SQL clauses or keywords used?**  
  - `DEFAULT (CURRENT_DATE)`: Dynamic expression default for date stamping.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `Orders` created with automatic order date capture.

---

### Query 8: Create `Customer` Table with `AUTO_INCREMENT`

```sql
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT
);
```

* **What is this query?**  
  A DDL query defining a table with automated surrogate key generation.
* **What does this query do?**  
  Creates a `Customer` table where `CustomerID` automatically increments (`1, 2, 3...`) for each inserted row.
* **What is the solution/logic behind it?**  
  `CustomerID` is specified as `PRIMARY KEY AUTO_INCREMENT`, delegating primary key generation to the database engine.
* **Why are these particular SQL clauses or keywords used?**  
  - `AUTO_INCREMENT`: MySQL attribute for automated primary key sequence incrementation.
  - `PRIMARY KEY`: Required constraint for `AUTO_INCREMENT` columns.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `Customer` created.

---

### Query 9: Create `product` Table with `AUTO_INCREMENT`

```sql
CREATE TABLE product (
    ProductID INT PRIMARY KEY AUTO_INCREMENT
);
```

* **What is this query?**  
  A DDL query for product table surrogate primary key creation.
* **What does this query do?**  
  Creates a `product` table with auto-incrementing `ProductID`.
* **What is the solution/logic behind it?**  
  Ensures every newly created product receives an auto-generated unique ID.
* **Why are these particular SQL clauses or keywords used?**  
  - `PRIMARY KEY AUTO_INCREMENT`: Combines unique key identification with automated sequence generation.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `product` created.

---

### Query 10: Create `employees` Table with `AUTO_INCREMENT`

```sql
CREATE TABLE employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT
);
```

* **What is this query?**  
  A DDL table creation query for automated workforce ID generation.
* **What does this query do?**  
  Creates an `employees` table with auto-incrementing `EmployeeID`.
* **What is the solution/logic behind it?**  
  Streamlines record insertion by letting the database handle employee ID numbering.
* **Why are these particular SQL clauses or keywords used?**  
  - `AUTO_INCREMENT`: Auto-generates `1, 2, 3...` identifiers.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `employees` created.

---

### Query 11: Create `orders` Table with `AUTO_INCREMENT`

```sql
CREATE TABLE orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT
);
```

* **What is this query?**  
  A DDL query for transaction tracking with auto-incrementing order numbers.
* **What does this query do?**  
  Creates an `orders` table where `OrderID` increments automatically.
* **What is the solution/logic behind it?**  
  Auto-generates clean, sequential order numbers for incoming e-commerce sales.
* **Why are these particular SQL clauses or keywords used?**  
  - `PRIMARY KEY AUTO_INCREMENT`: Guarantees unique sequential order IDs.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `orders` created.

---

### Query 12: Create `library` Table with `AUTO_INCREMENT`

```sql
CREATE TABLE library (
    BookID INT PRIMARY KEY AUTO_INCREMENT
);
```

* **What is this query?**  
  A DDL query for library catalog tracking.
* **What does this query do?**  
  Creates a `library` table where `BookID` increments automatically.
* **What is the solution/logic behind it?**  
  Auto-assigns catalog accession numbers to new book records.
* **Why are these particular SQL clauses or keywords used?**  
  - `BookID INT PRIMARY KEY AUTO_INCREMENT`: Unique auto-generated book identifier.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `library` created.

---

<div align="center">

[![Previous Topic](https://img.shields.io/badge/←_Previous-Topic_1:_Basic_DDL-4CAF50?style=for-the-badge)](./Topic_1.md)
[![Next Topic](https://img.shields.io/badge/Next-Topic_4:_NOT__NULL_%26_ALTER-2196F3?style=for-the-badge)](./Topic_4.md)

</div>
