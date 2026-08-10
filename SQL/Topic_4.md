<div align="center">

![SQL](https://img.shields.io/badge/SQL-MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![Topic 4](https://img.shields.io/badge/Topic_4-NOT__NULL_%26_ALTER_TABLE-4CAF50?style=for-the-badge)
![Level](https://img.shields.io/badge/Level-Beginner-blue?style=for-the-badge)

# Topic 4: NOT NULL Constraint & ALTER TABLE Column Modification

**Detailed SQL study guide covering the `NOT NULL` data integrity constraint and column modification using `ALTER TABLE ... MODIFY COLUMN`.**

---

</div>

## 📚 Topic Overview

Maintaining data quality requires enforcing rules on table fields. 
1. **`NOT NULL` Constraint**: Guarantees that a field must contain a valid value when a record is created or updated.
2. **`ALTER TABLE ... MODIFY COLUMN`**: Allows modifying column attributes (data type, size, constraints) on existing database tables.

---

## 🎯 Key Interview Concepts & Comparison Tables

### 1. `NULL` vs Empty String (`''`) vs Zero (`0`)

| Value | Meaning | Is Allowed in `NOT NULL` Column? |
|-------|---------|----------------------------------|
| `NULL` | Absence of value / Unknown / Unassigned | **NO** (Triggers Error 1048) |
| `''` (Empty String) | Valid string literal of zero length | **YES** |
| `0` | Valid integer number equal to zero | **YES** |

> [!IMPORTANT]
> **Interview Question**: Does `NOT NULL` prevent empty strings `''` or `0`?  
> **No.** `NOT NULL` only blocks SQL `NULL` values. To prevent empty strings or zeros, combine `NOT NULL` with a `CHECK` constraint (e.g., `CHECK (length(name) > 0)`).

---

### 2. Modifying Existing Columns with `ALTER TABLE`

```sql
ALTER TABLE table_name
MODIFY COLUMN column_name NEW_DATA_TYPE CONSTRAINTS;
```

#### Why modify a column's data type?
- **Bad Initial Design**: Storing numeric data (e.g., `salary`, `price`) as text (`VARCHAR`) prevents proper mathematical computations (`SUM`, `AVG`, `>` comparisons).
- **Size Adjustments**: Increasing `VARCHAR(30)` to `VARCHAR(100)` as data requirements grow.

---

## 🔍 Query-by-Query Detailed Analysis

---

### Query 1: Create Database `topic4`

```sql
CREATE DATABASE topic4;
```

* **What is this query?**  
  DDL command creating the database namespace.
* **What does this query do?**  
  Creates a database named `topic4`.
* **What is the solution/logic behind it?**  
  Sets up isolated schema container.
* **Why are these particular SQL clauses or keywords used?**  
  - `CREATE DATABASE`: Standard DDL statement.
* **What will be the result/output?**  
  `Query OK, 1 row affected.`

---

### Query 2: Select Active Database `topic4`

```sql
USE topic4;
```

* **What is this query?**  
  Session database selection command.
* **What does this query do?**  
  Sets `topic4` as the default schema.
* **What is the solution/logic behind it?**  
  Routes future queries into `topic4`.
* **Why are these particular SQL clauses or keywords used?**  
  - `USE`: Directs session context.
* **What will be the result/output?**  
  `Database changed.`

---

### Query 3: Create `student` Table with `NOT NULL` StudentName

```sql
CREATE TABLE student (
    StudentID INT,
    StudentName VARCHAR(30) NOT NULL
);
```

* **What is this query?**  
  A DDL query enforcing mandatory student names.
* **What does this query do?**  
  Creates `student` table requiring `StudentName` to be non-null.
* **What is the solution/logic behind it?**  
  Every student record must have an identified name.
* **Why are these particular SQL clauses or keywords used?**  
  - `NOT NULL`: Column-level integrity constraint.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `student` created.

---

### Query 4: Create `employee` Table with Multiple `NOT NULL` Columns

```sql
CREATE TABLE employee (
    EmpId INT,
    department VARCHAR(30) NOT NULL,
    salary VARCHAR(30) NOT NULL
);
```

* **What is this query?**  
  A DDL statement demonstrating initial creation of `salary` as text.
* **What does this query do?**  
  Creates an `employee` table requiring `department` and `salary`.
* **What is the solution/logic behind it?**  
  Prepares an intentional design flaw (`salary VARCHAR(30)`) to demonstrate schema refactoring using `ALTER TABLE`.
* **Why are these particular SQL clauses or keywords used?**  
  - `NOT NULL`: Ensures data mandatory check.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `employee` created.

---

### Query 5: Create `product` Table with `NOT NULL` ProductName

```sql
CREATE TABLE product (
    pid INT,
    pname VARCHAR(30) NOT NULL
);
```

* **What is this query?**  
  A DDL query enforcing product name requirement.
* **What does this query do?**  
  Creates `product` table requiring `pname`.
* **What is the solution/logic behind it?**  
  Inventory items must have names for catalog searchability.
* **Why are these particular SQL clauses or keywords used?**  
  - `pname VARCHAR(30) NOT NULL`: Disallows NULL product titles.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `product` created.

---

### Query 6: Alter `employee` Table - Modify `salary` Data Type

```sql
ALTER TABLE employee
MODIFY COLUMN salary DECIMAL(10,2);
```

* **What is this query?**  
  A DDL schema refactoring command.
* **What does this query do?**  
  Modifies `employee.salary` from `VARCHAR(30)` to `DECIMAL(10,2)`.
* **What is the solution/logic behind it?**  
  Storing salary as text (`VARCHAR`) prevents mathematical aggregation functions (`SUM`, `AVG`). Changing data type to `DECIMAL(10,2)` restores numeric integrity.
* **Why are these particular SQL clauses or keywords used?**  
  - `ALTER TABLE`: Keyword to modify existing schema.
  - `MODIFY COLUMN`: Specifies column modifications.
  - `DECIMAL(10,2)`: Correct numeric data type for currency values.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Column `salary` is re-typed to `DECIMAL(10,2)`.

---

### Query 7: Create `Customer` Table with Mandatory Email

```sql
CREATE TABLE Customer (
    email VARCHAR(30) NOT NULL
);
```

* **What is this query?**  
  A DDL table creation query for customer email tracking.
* **What does this query do?**  
  Creates a `Customer` table where `email` is required.
* **What is the solution/logic behind it?**  
  Mandates email address collection for customer communication.
* **Why are these particular SQL clauses or keywords used?**  
  - `email VARCHAR(30) NOT NULL`: Rejects NULL email inputs.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `Customer` created.

---

### Query 8: Create `Course` Table with Mandatory CourseName

```sql
CREATE TABLE Course (
    CourseName VARCHAR(30) NOT NULL
);
```

* **What is this query?**  
  A DDL statement for course catalog setup.
* **What does this query do?**  
  Creates a `Course` table where `CourseName` cannot be NULL.
* **What is the solution/logic behind it?**  
  Ensures every catalog entry has an explicit course title.
* **Why are these particular SQL clauses or keywords used?**  
  - `CourseName VARCHAR(30) NOT NULL`: Enforces mandatory title entry.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `Course` created.

---

<div align="center">

[![Previous Topic](https://img.shields.io/badge/←_Previous-Topic_2_%26_3:_DEFAULT_%26_AUTO__INCREMENT-4CAF50?style=for-the-badge)](./Topic_2_3.md)
[![Next Topic](https://img.shields.io/badge/Next-Topic_5:_PRIMARY__KEY-2196F3?style=for-the-badge)](./Topic_5.md)

</div>
