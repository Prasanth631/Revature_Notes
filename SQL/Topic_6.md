<div align="center">

![SQL](https://img.shields.io/badge/SQL-MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![Topic 6](https://img.shields.io/badge/Topic_6-UNIQUE_Constraint_%26_RENAME-4CAF50?style=for-the-badge)
![Level](https://img.shields.io/badge/Level-Beginner-blue?style=for-the-badge)

# Topic 6: UNIQUE Constraint & Table Renaming (`ALTER TABLE RENAME`)

**Comprehensive SQL study guide covering the `UNIQUE` key constraint, handling `NULL` values, storing phone numbers as `VARCHAR`, and table renaming conventions.**

---

</div>

## 📚 Topic Overview

1. **`UNIQUE` Constraint**: Ensures that all values in a column or group of columns are distinct across rows.
2. **Phone Number Data Design**: Why mobile numbers should be stored as `VARCHAR` rather than `INT`.
3. **Table Renaming**: Renaming database tables to avoid SQL reserved keywords (e.g., `user` → `users`).

---

## 🎯 Key Interview Concepts & Comparison Tables

### 1. `PRIMARY KEY` vs `UNIQUE` Key

| Feature | `PRIMARY KEY` | `UNIQUE` Key |
|---------|---------------|--------------|
| **Purpose** | Uniquely identifies each row (Entity Integrity) | Prevents duplicate entries in specific columns |
| **Quantity per table** | **Exactly ONE** | **MULTIPLE** allowed |
| **`NULL` values allowed?** | **NO** (implicitly `NOT NULL`) | **YES** (In MySQL, multiple `NULL` values are permitted) |
| **Index Type** | Automatically creates a **Clustered Index** | Automatically creates a **Non-Clustered Index** |

> [!NOTE]
> **Interview Question: Why does MySQL allow multiple `NULL`s in a `UNIQUE` column?**  
> In SQL standard logic, `NULL` represents an unknown/missing value. Since `NULL != NULL` (unknown values cannot be compared for equality), MySQL permits multiple rows to store `NULL` in a `UNIQUE` column without triggering a duplicate key violation.

---

### 2. Why Phone / Mobile Numbers MUST be `VARCHAR` (Not `INT`)

Storing phone numbers as integer types (`INT`, `BIGINT`) introduces critical data corruption risks:
1. **Truncation of Leading Zeros**: Phone numbers like `'0987654321'` lose the leading `'0'`, storing as `987654321`.
2. **Country Code Formatting**: Cannot store international prefixes like `'+91-9876543210'` or extension numbers.
3. **Integer Overflow**: Standard `INT` max value is `2,147,483,647` (only 10 digits starting with 1 or 2). A 10-digit number like `9876543210` causes an `Out of range value` error.
4. **Domain Semantics**: Mobile numbers are **identifiers**, not mathematical quantities (we never add or multiply phone numbers).

---

## 🔍 Query-by-Query Detailed Analysis

---

### Query 1: Create Database `topic6`

```sql
CREATE DATABASE topic6;
```

* **What is this query?**  
  DDL statement initializing database namespace.
* **What does this query do?**  
  Creates database `topic6`.
* **What is the solution/logic behind it?**  
  Provides isolated schema container for Topic 6.
* **Why are these particular SQL clauses or keywords used?**  
  - `CREATE DATABASE`: Standard DDL statement.
* **What will be the result/output?**  
  `Query OK, 1 row affected.`

---

### Query 2: Select Active Database `topic6`

```sql
USE topic6;
```

* **What is this query?**  
  Session database selection command.
* **What does this query do?**  
  Activates `topic6` schema.
* **What is the solution/logic behind it?**  
  Routes future queries into `topic6`.
* **Why are these particular SQL clauses or keywords used?**  
  - `USE`: Directs session context.
* **What will be the result/output?**  
  `Database changed.`

---

### Query 3: Create `customer` Table with `UNIQUE` Email

```sql
CREATE TABLE customer (
    email VARCHAR(30) UNIQUE
);
```

* **What is this query?**  
  A DDL table creation query enforcing unique email addresses.
* **What does this query do?**  
  Creates a `customer` table where `email` must be unique across all rows.
* **What is the solution/logic behind it?**  
  Prevents duplicate customer registrations using the same email address.
* **Why are these particular SQL clauses or keywords used?**  
  - `UNIQUE`: Enforces uniqueness constraint and builds a non-clustered index on `email`.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `customer` created.

---

### Query 4: Create `employee` Table with `INT(10)` Mobile Number (Flawed Initial Design)

```sql
CREATE TABLE employee (
    mobile_no INT(10) UNIQUE
);
```

* **What is this query?**  
  A DDL table creation query illustrating an initial data type design error.
* **What does this query do?**  
  Creates `employee` table with `mobile_no INT(10) UNIQUE`.
* **What is the solution/logic behind it?**  
  Demonstrates creating a phone number column as `INT`, which will be refactored in Query 5 to fix truncation and overflow issues.
* **Why are these particular SQL clauses or keywords used?**  
  - `INT(10) UNIQUE`: Integer data type with unique key constraint.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `employee` created.

---

### Query 5: Alter `employee` Table - Fix `mobile_no` Data Type to `VARCHAR(15)`

```sql
ALTER TABLE employee
MODIFY COLUMN mobile_no VARCHAR(15) UNIQUE;
```

* **What is this query?**  
  A DDL schema refactoring command.
* **What does this query do?**  
  Modifies `mobile_no` from `INT(10)` to `VARCHAR(15) UNIQUE`.
* **What is the solution/logic behind it?**  
  Changes phone number storage from numeric to string, preserving leading zeros and international country codes (`+919876543210`), while retaining the `UNIQUE` key constraint.
* **Why are these particular SQL clauses or keywords used?**  
  - `ALTER TABLE ... MODIFY COLUMN`: Refactors column data type.
  - `VARCHAR(15) UNIQUE`: Correct data type for phone identifiers.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Column `mobile_no` modified to `VARCHAR(15) UNIQUE`.

---

### Query 6: Create `student` Table with `UNIQUE` Roll Number

```sql
CREATE TABLE student (
    roll_no INT UNIQUE
);
```

* **What is this query?**  
  A DDL query enforcing unique student roll numbers.
* **What does this query do?**  
  Creates `student` table requiring `roll_no` to be unique.
* **What is the solution/logic behind it?**  
  Prevents assigning duplicate roll numbers to students.
* **Why are these particular SQL clauses or keywords used?**  
  - `roll_no INT UNIQUE`: Unique numeric key constraint.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `student` created.

---

### Query 7: Create `product` Table with `UNIQUE` Product Code

```sql
CREATE TABLE product (
    product_code INT UNIQUE
);
```

* **What is this query?**  
  A DDL statement ensuring unique product codes/SKUs.
* **What does this query do?**  
  Creates `product` table with `UNIQUE` `product_code`.
* **What is the solution/logic behind it?**  
  Ensures product identification codes remain distinct.
* **Why are these particular SQL clauses or keywords used?**  
  - `product_code INT UNIQUE`: Uniqueness constraint on product SKU.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `product` created.

---

### Query 8: Create `user` Table with `UNIQUE` Username

```sql
CREATE TABLE user (
    user_name VARCHAR(30) UNIQUE
);
```

* **What is this query?**  
  A DDL query creating user accounts table with unique usernames.
* **What does this query do?**  
  Creates `user` table where `user_name` is `UNIQUE`.
* **What is the solution/logic behind it?**  
  Ensures no two user accounts can register identical usernames.
* **Why are these particular SQL clauses or keywords used?**  
  - `user_name VARCHAR(30) UNIQUE`: Unique handle constraint.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `user` created.

---

### Query 9: Rename Table `user` to `users`

```sql
ALTER TABLE user RENAME TO users;
```

* **What is this query?**  
  A DDL table renaming statement.
* **What does this query do?**  
  Renames table `user` to `users`.
* **What is the solution/logic behind it?**  
  `USER` is a reserved system keyword in many SQL dialects. Renaming to plural `users` avoids syntax parsing errors and follows standard SQL database object naming conventions.
* **Why are these particular SQL clauses or keywords used?**  
  - `ALTER TABLE ... RENAME TO`: Standard SQL directive to rename a table entity.
* **What will be the result/output?**  
  `Query OK, 0 rows affected.` Table `user` is renamed to `users`.

---

### Query 10: Describe `employee` Table Schema

```sql
DESC employee;
```

* **What is this query?**  
  Schema verification command.
* **What does this query do?**  
  Displays metadata for `employee`, confirming `mobile_no` is now `VARCHAR(15)` with a `UNIQUE` key (`UNI`).
* **What is the solution/logic behind it?**  
  Inspects `information_schema` data dictionary.
* **Why are these particular SQL clauses or keywords used?**  
  - `DESC`: Summarizes table column structures.
* **What will be the result/output?**  
  Schema layout listing `mobile_no` as `VARCHAR(15)` with `Key = UNI`.

---

<div align="center">

[![Previous Topic](https://img.shields.io/badge/←_Previous-Topic_5:_PRIMARY__KEY-4CAF50?style=for-the-badge)](./Topic_5.md)
[![Next Topic](https://img.shields.io/badge/Next-Topic_7:_CHECK_Constraint-2196F3?style=for-the-badge)](./Topic_7.md)

</div>
