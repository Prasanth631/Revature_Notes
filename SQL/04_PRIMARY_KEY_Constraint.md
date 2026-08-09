<div align="center">

![SQL](https://img.shields.io/badge/SQL-MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![Topic 5](https://img.shields.io/badge/Topic_5-PRIMARY__KEY_Constraint-4CAF50?style=for-the-badge)
![Level](https://img.shields.io/badge/Level-Beginner-blue?style=for-the-badge)

# Topic 5: PRIMARY KEY Constraint & Entity Integrity

**Comprehensive study guide covering `PRIMARY KEY` constraints, entity integrity rules, clustered indexes, and unique record identification.**

---

</div>

## 📚 Topic Overview

A **`PRIMARY KEY`** is the foundational building block of relational database design. It uniquely identifies each record/row in a table, ensuring **Entity Integrity**.

---

## 🎯 Key Interview Concepts & Comparison Tables

### 1. Primary Key Characteristics & Rules

1. **Uniqueness**: No two rows can have identical Primary Key values.
2. **Implicit `NOT NULL`**: A Primary Key column automatically rejects `NULL` values.
3. **Single Primary Key Limit**: A table can have **only one** Primary Key constraint (though it can span multiple columns as a Composite Primary Key).
4. **Clustered Index Creation**: MySQL InnoDB automatically creates a **Clustered Index** on the Primary Key column, physically sorting table rows on disk by primary key values for fast lookups.

---

### 2. Single Column vs Composite Primary Key

```sql
-- Single Column Primary Key:
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(30)
);

-- Composite Primary Key (Multiple Columns):
CREATE TABLE OrderItems (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (OrderID, ProductID)  -- Combination of OrderID + ProductID must be unique!
);
```

---

## 🔍 Query-by-Query Detailed Analysis

---

### Query 1: Create Database `topic5`

```sql
CREATE DATABASE topic5;
```

* **What is this query?**  
  DDL command creating the database namespace.
* **What does this query do?**  
  Creates a database named `topic5`.
* **What is the solution/logic behind it?**  
  Initializes an isolated environment for Primary Key assignment tables.
* **Why are these particular SQL clauses or keywords used?**  
  - `CREATE DATABASE`: Standard DDL statement.
* **What will be the result/output?**  
  `Query OK, 1 row affected.`

---

### Query 2: Select Active Database `topic5`

```sql
USE topic5;
```

* **What is this query?**  
  Session database selection command.
* **What does this query do?**  
  Sets `topic5` as the active schema.
* **What is the solution/logic behind it?**  
  Directs subsequent DDL queries into `topic5`.
* **Why are these particular SQL clauses or keywords used?**  
  - `USE`: Directs session context.
* **What will be the result/output?**  
  `Database changed.`

---

### Query 3: Create `student` Table with Primary Key

```sql
CREATE TABLE student (
    StudentID INT PRIMARY KEY
);
```

* **What is this query?**  
  A DDL table creation query setting a Primary Key constraint on student records.
* **What does this query do?**  
  Creates a `student` table with `StudentID` as the `PRIMARY KEY`.
* **What is the solution/logic behind it?**  
  Guarantees that every student has a unique, non-null numeric ID.
* **Why are these particular SQL clauses or keywords used?**  
  - `PRIMARY KEY`: Enforces uniqueness, non-nullability, and creates a clustered B-Tree index.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `student` created.

---

### Query 4: Create `employee` Table with Primary Key

```sql
CREATE TABLE employee (
    EmployeeID INT PRIMARY KEY
);
```

* **What is this query?**  
  A DDL statement creating employee table entity integrity.
* **What does this query do?**  
  Creates an `employee` table with `EmployeeID` as `PRIMARY KEY`.
* **What is the solution/logic behind it?**  
  Ensures every employee record is uniquely identifiable.
* **Why are these particular SQL clauses or keywords used?**  
  - `EmployeeID INT PRIMARY KEY`: Column-level Primary Key definition.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `employee` created.

---

### Query 5: Create `product` Table with Primary Key

```sql
CREATE TABLE product (
    ProductID INT PRIMARY KEY
);
```

* **What is this query?**  
  A DDL query defining inventory item identification.
* **What does this query do?**  
  Creates a `product` table with `ProductID` as `PRIMARY KEY`.
* **What is the solution/logic behind it?**  
  Prevents duplicate product inventory entries.
* **Why are these particular SQL clauses or keywords used?**  
  - `PRIMARY KEY`: Restricts duplicate or null product identifiers.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `product` created.

---

### Query 6: Create `orders` Table with Primary Key

```sql
CREATE TABLE orders (
    OrderID INT PRIMARY KEY
);
```

* **What is this query?**  
  A DDL query establishing order transaction keys.
* **What does this query do?**  
  Creates an `orders` table with `OrderID` as `PRIMARY KEY`.
* **What is the solution/logic behind it?**  
  Guarantees transaction order numbers are unique and fast to look up.
* **Why are these particular SQL clauses or keywords used?**  
  - `OrderID INT PRIMARY KEY`: Enforces primary key constraint on order ID.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `orders` created.

---

### Query 7: Create `department` Table with Primary Key

```sql
CREATE TABLE department (
    DepartmentID INT PRIMARY KEY
);
```

* **What is this query?**  
  A DDL query creating organizational department lookup keys.
* **What does this query do?**  
  Creates a `department` table with `DepartmentID` as `PRIMARY KEY`.
* **What is the solution/logic behind it?**  
  Prepares a parent table suitable for reference by foreign keys in employee tables.
* **Why are these particular SQL clauses or keywords used?**  
  - `DepartmentID INT PRIMARY KEY`: Specifies Primary Key for department lookup records.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `department` created.

---

<div align="center">

[![Previous Topic](https://img.shields.io/badge/←_Previous-Topic_4:_NOT__NULL_%26_ALTER-4CAF50?style=for-the-badge)](./Topic_4.md)
[![Next Topic](https://img.shields.io/badge/Next-Topic_6:_UNIQUE_Constraint-2196F3?style=for-the-badge)](./Topic_6.md)

</div>
