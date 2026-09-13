# 03 — DML & Table Alterations

> **Topics Covered:** `ALTER TABLE` (`MODIFY COLUMN`, `ADD COLUMN`, `DROP COLUMN`, `RENAME COLUMN`, `RENAME TO`), `TRUNCATE` vs `DELETE`, `UPDATE` variations, Transaction Control

---

## 📌 Quick Reference

| Command | Type | Purpose |
|---------|------|---------|
| `ALTER TABLE ... MODIFY COLUMN` | DDL | Change data type or constraints of existing column |
| `ALTER TABLE ... ADD COLUMN` | DDL | Add new column to existing table |
| `ALTER TABLE ... DROP COLUMN` | DDL | Permanently remove a column |
| `ALTER TABLE ... RENAME COLUMN` | DDL | Rename a column |
| `ALTER TABLE ... RENAME TO` | DDL | Rename a table |
| `TRUNCATE TABLE` | DDL | Remove all rows fast, reset AUTO_INCREMENT |
| `DELETE FROM` | DML | Remove rows conditionally, transactional |
| `UPDATE` | DML | Modify existing row values |

---

## 🎯 Key Concepts

### TRUNCATE TABLE vs DELETE

| Feature | `TRUNCATE TABLE` | `DELETE FROM` |
|---------|------------------|----------------|
| **Command Type** | DDL | DML |
| **Speed** | Extremely fast (drops & recreates allocation) | Slower (row-by-row with undo logs) |
| **Transaction Rollback** | **Auto-committed — CANNOT rollback** | Transactional — can rollback |
| **`WHERE` Clause** | **Not allowed** — empties entire table | **Supported** — conditional row removal |
| **AUTO_INCREMENT Reset** | **Resets to 1** | Does **not** reset |

---

## 🔍 Query-by-Query Analysis

### Part 1 — ALTER TABLE Modifications

#### Q1: Modify Column Data Type
```sql
ALTER TABLE employees
MODIFY COLUMN id FLOAT;
```
- Re-defines `id` column from its original type to `FLOAT`.

#### Q2: Expand Column Character Length
```sql
ALTER TABLE employees
MODIFY COLUMN first_name VARCHAR(40);
```
- Increases `first_name` max size from `VARCHAR(30)` to `VARCHAR(40)`.

#### Q3: Add NOT NULL to Existing Column
```sql
ALTER TABLE employees
MODIFY COLUMN id FLOAT NOT NULL;
```
- Attaches `NOT NULL` constraint to an existing column via `MODIFY COLUMN`.

#### Q4: Add New Column
```sql
ALTER TABLE employees
ADD COLUMN email VARCHAR(30);
```
- Appends a new `email` column to the `employees` table schema.

#### Q5: Drop Column Permanently
```sql
ALTER TABLE employees
DROP COLUMN email;
```
- Permanently removes `email` column and all its stored data — **irreversible**.

#### Q6: Rename a Column
```sql
ALTER TABLE employees
RENAME COLUMN id TO emp_id;
```
- Updates column name in table data dictionary from `id` → `emp_id`.

#### Q7: Rename a Table
```sql
ALTER TABLE employees
RENAME TO employee_test;
```
- Updates the table name in the database from `employees` → `employee_test`.

---

### Part 2 — Session Configuration

#### Disable Safe Updates Mode
```sql
SET SQL_SAFE_UPDATES = 0;
```
- Permits `UPDATE` and `DELETE` without a `WHERE` clause filtering by primary key.
- **Only use in controlled/dev environments** — leaving this off in production is risky.

---

### Part 3 — TRUNCATE vs DELETE

#### Truncate (DDL — fast, irreversible)
```sql
TRUNCATE TABLE employee_test;
```
- Instantly empties all rows and resets `AUTO_INCREMENT` to 1.
- Cannot be rolled back.

#### Delete with Condition (DML — transactional)
```sql
DELETE FROM employees WHERE department = 'HR';
```
- Removes specific rows matching the `WHERE` clause.
- Can be rolled back within a transaction.

---

### Part 4 — UPDATE Variations

#### Single Column Update
```sql
UPDATE employees
SET salary = 5000
WHERE id = 3;
```

#### Multi-Column Update
```sql
UPDATE employees
SET salary = 6000, department = 'IT'
WHERE id = 4;
```

#### Bulk Percentage Calculation Update
```sql
UPDATE employees_bak
SET salary = salary * 1.1
WHERE id < 5 AND salary >= 3000;
```
- `salary * 1.1` = 10% salary increase for employees with `id < 5` AND `salary >= 3000`.

#### Update All Rows (No WHERE)
```sql
SET SQL_SAFE_UPDATES = 0;
UPDATE employees SET department = 'General';
```
- Updates every row in the table — use only when intentional.

---

## 💡 Interview Tips

- **ALTER TABLE is DDL** — changes are committed immediately, no rollback.
- **TRUNCATE vs DELETE**: Use `TRUNCATE` for fast full-table reset; use `DELETE` when you need conditions or rollback capability.
- **TRUNCATE resets AUTO_INCREMENT**; `DELETE` does not.
- **DROP COLUMN is permanent** — always backup before dropping.
- **`MODIFY COLUMN`** can change type, size, nullability, and defaults — but data type changes may fail if existing data is incompatible.
- **`SQL_SAFE_UPDATES = 0`** should never be left off in production environments.
