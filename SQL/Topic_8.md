<div align="center">

![SQL](https://img.shields.io/badge/SQL-MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![Topic 8](https://img.shields.io/badge/Topic_8-FOREIGN__KEY_Constraint-4CAF50?style=for-the-badge)
![Level](https://img.shields.io/badge/Level-Intermediate-FF9800?style=for-the-badge)

# Topic 8: FOREIGN KEY Constraint & Referential Integrity

**Comprehensive SQL study guide covering `FOREIGN KEY` constraints, parent-child table relationships, referential integrity rules, and cascade actions.**

---

</div>

## 📚 Topic Overview

A **`FOREIGN KEY`** establishes a link between two tables by enforcing **Referential Integrity**. It ensures that values in a child table's column must correspond to existing, valid values in a referenced parent table's `PRIMARY KEY` or `UNIQUE` key.

---

## 🎯 Key Interview Concepts & Relationship Architecture

### 1. Parent vs Child Table Definitions

- **Parent Table**: The table holding the referenced primary key (e.g., `departments`, `Customers`, `Authors`, `categories`, `Teachers`).
- **Child Table**: The table containing the foreign key referencing the parent key (e.g., `Employees`, `Orders`, `Books`, `products`, `Students`).

```sql
-- Syntax:
CREATE TABLE ChildTable (
    ChildID INT PRIMARY KEY,
    ParentID INT,
    FOREIGN KEY (ParentID) REFERENCES ParentTable(ParentID)
);
```

---

### 2. Referential Integrity & Deletion/Update Rules (`ON DELETE` / `ON UPDATE`)

What happens when a record in a parent table is deleted or updated?

| Action | Behavior |
|--------|----------|
| **`RESTRICT` / `NO ACTION` (Default)** | Blocks deletion/update of parent row if child rows reference it (raises Error 1451). |
| **`CASCADE`** | Automatically **deletes/updates all child rows** when the parent row is deleted/updated. |
| **`SET NULL`** | Sets the child foreign key column to `NULL` when the parent row is deleted. |

> [!IMPORTANT]
> **Interview Point: Order of Execution for Table Creation & Deletion**
> - **Creation Order**: Parent tables **MUST be created first** before Child tables can reference them.
> - **Drop Order**: Child tables **MUST be dropped first** before Parent tables can be dropped (or set `SET FOREIGN_KEY_CHECKS = 0;`).

---

## 🔍 Query-by-Query Detailed Analysis

---

### Query 1: Create Database `topic8`

```sql
CREATE DATABASE topic8;
```

* **What is this query?**  
  DDL command creating database namespace.
* **What does this query do?**  
  Creates database `topic8`.
* **What is the solution/logic behind it?**  
  Sets up isolated schema container for Topic 8.
* **Why are these particular SQL clauses or keywords used?**  
  - `CREATE DATABASE`: Standard DDL statement.
* **What will be the result/output?**  
  `Query OK, 1 row affected.`

---

### Query 2: Select Active Database `topic8`

```sql
USE topic8;
```

* **What is this query?**  
  Session database selection command.
* **What does this query do?**  
  Activates `topic8` schema.
* **What is the solution/logic behind it?**  
  Routes future queries into `topic8`.
* **Why are these particular SQL clauses or keywords used?**  
  - `USE`: Directs session context.
* **What will be the result/output?**  
  `Database changed.`

---

### Query 3: Create Parent Table `departments`

```sql
CREATE TABLE departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(30)
);
```

* **What is this query?**  
  A DDL query defining the Parent entity for organizational departments.
* **What does this query do?**  
  Creates `departments` table with `DepartmentID` as `PRIMARY KEY`.
* **What is the solution/logic behind it?**  
  Parent tables must be created first before child tables can reference their primary key.
* **Why are these particular SQL clauses or keywords used?**  
  - `DepartmentID INT PRIMARY KEY`: Primary key for parent lookup.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Parent table `departments` created.

---

### Query 4: Create Child Table `Employees` with Foreign Key

```sql
CREATE TABLE Employees (
    EmployeeID INT,
    EmployeeName VARCHAR(30),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES departments(DepartmentID)
);
```

* **What is this query?**  
  A DDL query establishing a relationship between `Employees` and `departments`.
* **What does this query do?**  
  Creates `Employees` table where `DepartmentID` is a `FOREIGN KEY` referencing `departments(DepartmentID)`.
* **What is the solution/logic behind it?**  
  Enforces referential integrity by preventing insertion of an employee into a non-existent `DepartmentID`.
* **Why are these particular SQL clauses or keywords used?**  
  - `FOREIGN KEY (DepartmentID)`: Designates foreign key column.
  - `REFERENCES departments(DepartmentID)`: Specifies parent table and key column.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Child table `Employees` created with foreign key relationship.

---

### Query 5: Describe `departments` Table Schema

```sql
DESC departments;
```

* **What is this query?**  
  Schema verification command.
* **What does this query do?**  
  Displays the structure of parent table `departments`.
* **What is the solution/logic behind it?**  
  Inspects data dictionary output for column definitions.
* **Why are these particular SQL clauses or keywords used?**  
  - `DESC`: Summarizes table layout.
* **What will be the result/output?**  
  Grid showing `DepartmentID` (PRIMARY KEY) and `DepartmentName`.

---

### Query 6: Create Parent Table `Customers`

```sql
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(30)
);
```

* **What is this query?**  
  A DDL query defining the Parent entity for e-commerce customers.
* **What does this query do?**  
  Creates `Customers` table with `CustomerID` as `PRIMARY KEY`.
* **What is the solution/logic behind it?**  
  Provides parent primary key for order link references.
* **Why are these particular SQL clauses or keywords used?**  
  - `CustomerID INT PRIMARY KEY`: Parent key column.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Parent table `Customers` created.

---

### Query 7: Create Child Table `Orders` with Foreign Key

```sql
CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
```

* **What is this query?**  
  A DDL query creating a relationship between `Orders` and `Customers`.
* **What does this query do?**  
  Creates `Orders` table where `CustomerID` references `Customers(CustomerID)`.
* **What is the solution/logic behind it?**  
  Ensures orders cannot be logged for non-existent customer accounts.
* **Why are these particular SQL clauses or keywords used?**  
  - `FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)`: Foreign key relational link.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Child table `Orders` created.

---

### Query 8: Describe `Orders` Table Schema

```sql
DESC Orders;
```

* **What is this query?**  
  Schema verification command for `Orders`.
* **What does this query do?**  
  Displays columns for `Orders` showing `CustomerID` with `Key = MUL` (multiple occurrences index for Foreign Key).
* **What is the solution/logic behind it?**  
  Retrieves information schema metadata.
* **Why are these particular SQL clauses or keywords used?**  
  - `DESC`: Inspects table definition.
* **What will be the result/output?**  
  Metadata layout showing `CustomerID` with `Key = MUL`.

---

### Query 9: Create Parent Table `Authors`

```sql
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(30)
);
```

* **What is this query?**  
  A DDL query defining Parent table for library authors.
* **What does this query do?**  
  Creates `Authors` table with `AuthorID` as `PRIMARY KEY`.
* **What is the solution/logic behind it?**  
  Acts as parent table for book attribution.
* **Why are these particular SQL clauses or keywords used?**  
  - `AuthorID INT PRIMARY KEY`: Parent primary key.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Parent table `Authors` created.

---

### Query 10: Create Child Table `Books` with Foreign Key

```sql
CREATE TABLE Books (
    BookID INT,
    BookTitle VARCHAR(30),
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);
```

* **What is this query?**  
  A DDL statement linking `Books` to `Authors`.
* **What does this query do?**  
  Creates `Books` table where `AuthorID` references `Authors(AuthorID)`.
* **What is the solution/logic behind it?**  
  Ensures books link only to valid author records in the library system.
* **Why are these particular SQL clauses or keywords used?**  
  - `FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)`: Enforces author lookup integrity.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Child table `Books` created.

---

### Query 11: Create Parent Table `categories`

```sql
CREATE TABLE categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(30)
);
```

* **What is this query?**  
  A DDL query defining Parent table for inventory categories.
* **What does this query do?**  
  Creates `categories` table with `CategoryID` as `PRIMARY KEY`.
* **What is the solution/logic behind it?**  
  Acts as parent classification master table.
* **Why are these particular SQL clauses or keywords used?**  
  - `CategoryID INT PRIMARY KEY`: Parent primary key.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Parent table `categories` created.

---

### Query 12: Create Child Table `products` with Foreign Key

```sql
CREATE TABLE products (
    ProductID INT,
    ProductName VARCHAR(30),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES categories(CategoryID)
);
```

* **What is this query?**  
  A DDL statement linking `products` to `categories`.
* **What does this query do?**  
  Creates `products` table where `CategoryID` references `categories(CategoryID)`.
* **What is the solution/logic behind it?**  
  Prevents assigning products to non-existent inventory categories.
* **Why are these particular SQL clauses or keywords used?**  
  - `FOREIGN KEY (CategoryID) REFERENCES categories(CategoryID)`: Category link integrity.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Child table `products` created.

---

### Query 13: Create Parent Table `Teachers`

```sql
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    TeacherName VARCHAR(30)
);
```

* **What is this query?**  
  A DDL query defining Parent table for academic teachers.
* **What does this query do?**  
  Creates `Teachers` table with `TeacherID` as `PRIMARY KEY`.
* **What is the solution/logic behind it?**  
  Parent lookup table for student mentor assignment.
* **Why are these particular SQL clauses or keywords used?**  
  - `TeacherID INT PRIMARY KEY`: Parent key column.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Parent table `Teachers` created.

---

### Query 14: Create Child Table `Students` with Foreign Key

```sql
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(30),
    TeacherID INT,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);
```

* **What is this query?**  
  A DDL query linking `Students` to `Teachers`.
* **What does this query do?**  
  Creates `Students` table with `StudentID` PRIMARY KEY and `TeacherID` referencing `Teachers(TeacherID)`.
* **What is the solution/logic behind it?**  
  Demonstrates a child table having its own `PRIMARY KEY` (`StudentID`) while also containing a `FOREIGN KEY` (`TeacherID`).
* **Why are these particular SQL clauses or keywords used?**  
  - `StudentID INT PRIMARY KEY`: Child table primary key.
  - `FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)`: Relational link to teacher parent records.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Child table `Students` created.

---

<div align="center">

[![Previous Topic](https://img.shields.io/badge/←_Previous-Topic_7:_CHECK_Constraint-4CAF50?style=for-the-badge)](./Topic_7.md)
[![Home Index](https://img.shields.io/badge/↑_Home-Master_SQL_Index-2196F3?style=for-the-badge)](./README.md)

</div>
