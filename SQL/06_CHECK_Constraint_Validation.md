<div align="center">

![SQL](https://img.shields.io/badge/SQL-MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![Topic 7](https://img.shields.io/badge/Topic_7-CHECK_Constraint-4CAF50?style=for-the-badge)
![Level](https://img.shields.io/badge/Level-Intermediate-FF9800?style=for-the-badge)

# Topic 7: CHECK Constraint & Domain Integrity Validation Rules

**Detailed SQL study guide covering the `CHECK` constraint, validation expressions (`>=`, `>`, `IN`, `BETWEEN`), and domain integrity rules.**

---

</div>

## 📚 Topic Overview

A **`CHECK` constraint** limits the allowable values that can be inserted or updated in a table column. It enforces **Domain Integrity** by ensuring all entries satisfy a specified Boolean expression.

---

## 🎯 Key Interview Concepts & Validation Patterns

### 1. Types of `CHECK` Expressions

1. **Numeric Range Comparisons**:  
   `CHECK (age >= 18)`, `CHECK (price > 0)`, `CHECK (salary > 10000)`
2. **List Membership (`IN` Operator)**:  
   `CHECK (gender IN ('Male', 'Female', 'Other'))`
3. **Closed Interval (`BETWEEN ... AND` Operator)**:  
   `CHECK (marks BETWEEN 0 AND 100)`

---

### 2. MySQL Version Behavior Notice

> [!WARNING]
> **Important Interview Distinction**:
> - **MySQL 5.7 and earlier**: Parsed `CHECK` constraints syntactically BUT **ignored them silently** during insertions/updates.
> - **MySQL 8.0.16 and later**: **Fully enforces** `CHECK` constraints natively. Violating a `CHECK` condition raises `Error 3819 (HY000): Check constraint is violated.`

---

## 🔍 Query-by-Query Detailed Analysis

---

### Query 1: Create Database `Topic7`

```sql
CREATE DATABASE Topic7;
```

* **What is this query?**  
  DDL command creating database namespace.
* **What does this query do?**  
  Creates database `Topic7`.
* **What is the solution/logic behind it?**  
  Provides isolated schema container for Topic 7.
* **Why are these particular SQL clauses or keywords used?**  
  - `CREATE DATABASE`: Standard DDL statement.
* **What will be the result/output?**  
  `Query OK, 1 row affected.`

---

### Query 2: Select Active Database `Topic7`

```sql
USE Topic7;
```

* **What is this query?**  
  Session database selection command.
* **What does this query do?**  
  Activates `Topic7` schema.
* **What is the solution/logic behind it?**  
  Routes future queries into `Topic7`.
* **Why are these particular SQL clauses or keywords used?**  
  - `USE`: Directs session context.
* **What will be the result/output?**  
  `Database changed.`

---

### Query 3: Create `student` Table with Minimum Age Validation

```sql
CREATE TABLE student (
    sid INT,
    sname VARCHAR(30),
    age INT CHECK (age >= 18)
);
```

* **What is this query?**  
  A DDL table creation query enforcing minimum age verification via `CHECK`.
* **What does this query do?**  
  Creates a `student` table where `age` must be greater than or equal to 18.
* **What is the solution/logic behind it?**  
  Enforces domain integrity by rejecting student records under 18 years old.
* **Why are these particular SQL clauses or keywords used?**  
  - `CHECK (age >= 18)`: Column-level constraint validating that `age` meets or exceeds 18.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `student` created.

---

### Query 4: Create `employee` Table with Minimum Salary Validation

```sql
CREATE TABLE employee (
    eid INT,
    ename VARCHAR(30),
    salary DECIMAL(10,2) CHECK (salary > 10000)
);
```

* **What is this query?**  
  A DDL statement enforcing minimum wage threshold validation.
* **What does this query do?**  
  Creates an `employee` table requiring `salary` to be strictly greater than 10000.
* **What is the solution/logic behind it?**  
  Rejects employee entries with a salary of 10000 or below.
* **Why are these particular SQL clauses or keywords used?**  
  - `CHECK (salary > 10000)`: Relational comparison operator enforcing a minimum numeric threshold.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `employee` created.

---

### Query 5: Create `product` Table with Positive Price Validation

```sql
CREATE TABLE product (
    pid INT,
    pname VARCHAR(30),
    price DECIMAL(10,2) CHECK (price > 0)
);
```

* **What is this query?**  
  A DDL query preventing zero or negative product prices.
* **What does this query do?**  
  Creates a `product` table requiring `price` to be greater than 0.
* **What is the solution/logic behind it?**  
  Prevents invalid free or negative commercial product pricing.
* **Why are these particular SQL clauses or keywords used?**  
  - `CHECK (price > 0)`: Restricts prices to strictly positive values.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `product` created.

---

### Query 6: Create `Customer` Table with Gender Enumeration List

```sql
CREATE TABLE Customer (
    cid INT,
    cname VARCHAR(30),
    gender VARCHAR(30) CHECK (gender IN ('Male', 'Female', 'Other'))
);
```

* **What is this query?**  
  A DDL statement enforcing discrete value list validation using the `IN` operator.
* **What does this query do?**  
  Creates a `Customer` table where `gender` must match `'Male'`, `'Female'`, or `'Other'`.
* **What is the solution/logic behind it?**  
  Blocks arbitrary or misspelled gender strings (e.g., `'M'`, `'xyz'`).
* **Why are these particular SQL clauses or keywords used?**  
  - `IN ('Male', 'Female', 'Other')`: List membership operator inside `CHECK`.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `Customer` created.

---

### Query 7: Create `exam_marks` Table with Score Range Validation

```sql
CREATE TABLE exam_marks (
    eid INT,
    ename VARCHAR(30),
    marks INT CHECK (marks BETWEEN 0 AND 100)
);
```

* **What is this query?**  
  A DDL table creation query enforcing a closed score interval via `BETWEEN`.
* **What does this query do?**  
  Creates an `exam_marks` table where `marks` must be between 0 and 100 inclusive.
* **What is the solution/logic behind it?**  
  Prevents invalid test mark entries outside the 0–100 range (e.g., `-10` or `105`).
* **Why are these particular SQL clauses or keywords used?**  
  - `BETWEEN 0 AND 100`: Inclusive range validation operator.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `exam_marks` created.

---

<div align="center">

[![Previous Topic](https://img.shields.io/badge/←_Previous-Topic_6:_UNIQUE_Constraint-4CAF50?style=for-the-badge)](./Topic_6.md)
[![Next Topic](https://img.shields.io/badge/Next-Topic_8:_FOREIGN__KEY_Constraint-2196F3?style=for-the-badge)](./Topic_8.md)

</div>
