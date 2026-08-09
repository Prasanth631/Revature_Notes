<div align="center">

![SQL](https://img.shields.io/badge/SQL-MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![Day 1 DDL Alter](https://img.shields.io/badge/Day_1-ALTER_TABLE_%26_Updates-4CAF50?style=for-the-badge)
![Level](https://img.shields.io/badge/Level-Intermediate-FF9800?style=for-the-badge)

# Day 1 DDL Advanced ALTER TABLE & UPDATE Practice Notes

**Comprehensive study guide covering `ALTER TABLE` modifications (`MODIFY COLUMN`, `ADD COLUMN`, `DROP COLUMN`, `RENAME COLUMN`, `RENAME TO`), `TRUNCATE TABLE` vs `DELETE`, `UPDATE` variations, and Transaction Control (`ROLLBACK`).**

---

</div>

## 📚 Overview

This module covers **Advanced Table Schema Modifications & Data Updates**:
1. **Column Modifications**: `MODIFY COLUMN` (data types, lengths, default removal, NOT NULL attachment/removal)
2. **Column Expansion & Removal**: `ADD COLUMN`, `DROP COLUMN`
3. **Table & Column Renaming**: `RENAME COLUMN`, `RENAME TO`
4. **Data Reset & Cleanup**: `TRUNCATE TABLE` (DDL, Fast, Auto-commit) vs `DELETE` (DML, Transactional)
5. **Data Modifications**: Single/multi-column `UPDATE` statements and percentage calculations

---

## 🎯 Key Interview Concepts & Comparison Tables

### 1. `TRUNCATE TABLE` vs `DELETE`

| Feature | `TRUNCATE TABLE` | `DELETE FROM` |
|---------|------------------|---------------|
| **Command Type** | DDL (Data Definition Language) | DML (Data Manipulation Language) |
| **Speed / Performance** | Extremely fast (drops & recreates table allocation) | Slower (deletes rows one by one and logs row-level undo logs) |
| **Transaction Rollback** | **Auto-committed** (Cannot be rolled back in MySQL) | Transactional (Can be rolled back with `ROLLBACK`) |
| **`WHERE` Clause** | **Not allowed** (always empties whole table) | **Supported** (can delete specific conditional rows) |
| **`AUTO_INCREMENT` Reset** | Resets `AUTO_INCREMENT` sequence counter to `1` | Does **not** reset `AUTO_INCREMENT` sequence counter |

---

## 🔍 Detailed Query-by-Query Analysis

---

### Query 1: Modify Column Data Type
```sql
ALTER TABLE employees 
MODIFY COLUMN id FLOAT;
```
* **What is this query?** DDL schema alteration statement.
* **What does it do?** Changes `id` column data type to `FLOAT`.
* **How keyword works:** `ALTER TABLE ... MODIFY COLUMN` re-defines existing column attributes.

---

### Query 2: Expand Column Character Length
```sql
ALTER TABLE employees 
MODIFY COLUMN first_name VARCHAR(40);
```
* **What is this query?** DDL column size alteration statement.
* **What does it do?** Expands `first_name` maximum size from `VARCHAR(30)` to `VARCHAR(40)`.
* **How keyword works:** `MODIFY COLUMN` increases max string storage limit.

---

### Query 3: Add `NOT NULL` Constraint to Existing Column
```sql
ALTER TABLE employees 
MODIFY COLUMN id FLOAT NOT NULL;
```
* **What is this query?** DDL constraint attachment statement.
* **What does it do?** Configures `id` column to reject NULL values.
* **How keyword works:** `MODIFY COLUMN ... NOT NULL` attaches mandatory constraint to existing table columns.

---

### Query 4: Add New Column (`ADD COLUMN`)
```sql
ALTER TABLE employees 
ADD COLUMN email VARCHAR(30);
```
* **What is this query?** DDL table expansion query.
* **What does it do?** Adds a new `email VARCHAR(30)` column to `employees`.
* **How keyword works:** `ALTER TABLE ... ADD COLUMN` appends a new column to table schema.

---

### Query 5: Drop Column (`DROP COLUMN`)
```sql
ALTER TABLE employees 
DROP COLUMN email;
```
* **What is this query?** DDL column deletion query.
* **What does it do?** Permanently removes `email` column and its stored data from `employees`.
* **How keyword works:** `ALTER TABLE ... DROP COLUMN` deletes a column from table metadata.

---

### Query 6: Disable Safe Updates Mode
```sql
SET SQL_SAFE_UPDATES = 0;
```
* **What is this query?** Session configuration command.
* **What does it do?** Permits `UPDATE` and `DELETE` queries that do not filter by a primary key column in `WHERE`.
* **How keyword works:** `SET SQL_SAFE_UPDATES = 0` disables safe update protection for current connection session.

---

### Query 7: Rename Column (`RENAME COLUMN`)
```sql
ALTER TABLE employees 
RENAME COLUMN id TO emp_id;
```
* **What is this query?** DDL column renaming query.
* **What does it do?** Renames column `id` to `emp_id`.
* **How keyword works:** `RENAME COLUMN old TO new` updates column name in table dictionary.

---

### Query 8: Rename Table (`RENAME TO`)
```sql
ALTER TABLE employees 
RENAME TO employee_test;
```
* **What is this query?** DDL table renaming statement.
* **What does it do?** Renames table `employees` to `employee_test`.
* **How keyword works:** `RENAME TO new_name` updates database relation identifier.

---

### Query 9: Reset Table Data (`TRUNCATE TABLE`)
```sql
TRUNCATE TABLE employee_test;
```
* **What is this query?** DDL table data reset statement.
* **What does it do?** Instantly deletes all rows from `employee_test` and resets `AUTO_INCREMENT` sequence counters.
* **How keyword works:** `TRUNCATE TABLE` drops and recreates table allocation (Fast, Auto-committed, Cannot Rollback).

---

### Query 10: Percentage Calculation `UPDATE`
```sql
UPDATE employees_bak 
SET salary = salary * 1.1 
WHERE id < 5 AND salary >= 3000;
```
* **What is this query?** Multi-condition mathematical DML bulk update.
* **What does it do?** Increases salary by 10% (`salary * 1.1`) for employees where `id < 5` AND `salary >= 3000`.
* **How keyword works:** Arithmetic expression `salary * 1.1` evaluates current column value and stores updated value.

---

<div align="center">

[![Previous Notes](https://img.shields.io/badge/←_Previous-Day_1_DDL_Notes-4CAF50?style=for-the-badge)](./Day_1_DDL.md)
[![Next Notes](https://img.shields.io/badge/Next-Day_3_Date_Aggregate_Window_Notes-2196F3?style=for-the-badge)](./Day_3.md)

</div>
