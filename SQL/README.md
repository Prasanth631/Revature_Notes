<div align="center">

![SQL](https://img.shields.io/badge/SQL-MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![SQL Module](https://img.shields.io/badge/Module-SQL_Complete_Notes-blue?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Complete-success?style=for-the-badge)

# MySQL Database Engineering — Master Index

**Structured topic-wise SQL study guides and executable scripts for MySQL Database Engineering.**

---

</div>

## 📁 Folder Structure

```
SQL/
├── 01_DDL_and_Data_Types/          → CREATE, USE, DESC, Data Types
├── 02_Constraints/                 → DEFAULT, AUTO_INCREMENT, NOT NULL, PRIMARY KEY, UNIQUE, CHECK, FOREIGN KEY
├── 03_DML_and_Alterations/        → ALTER TABLE, TRUNCATE, UPDATE, DELETE
├── 04_Joins_Subqueries_Views/     → INNER/LEFT/RIGHT/SELF Joins, Subqueries, UNION, CASE, VIEWs
├── 05_Functions_Aggregates_Windows/ → Date Functions, GROUP BY, HAVING, Window Functions, WHERE Operators
├── 06_Transactions_DCL_Advanced/  → CTEs, ACID, Transactions, DCL, Stored Procedures, Functions, Triggers, Indexes
└── 07_Assignments/                 → Solved Day 1, Day 2, Day 3 Assignments
```

---

## 🗺️ Topic-wise Contents

### 📂 01 — DDL and Data Types
> `CREATE DATABASE`, `USE`, `CREATE TABLE`, `DESC`, `INT`, `VARCHAR`, `DECIMAL`, `FLOAT`, `DATE`, CTAS, Multi-row Inserts

| File | Type | Description |
|------|------|-------------|
| [Topic_1.md](./01_DDL_and_Data_Types/Topic_1.md) | 📖 Notes | Basic DDL — Database creation, table definition, data types |
| [Topic_1.sql](./01_DDL_and_Data_Types/Topic_1.sql) | ⚙️ Script | Executable DDL queries for Topic 1 |
| [Day_1_DDL.md](./01_DDL_and_Data_Types/Day_1_DDL.md) | 📖 Notes | Server inspection (`VERSION()`, `SHOW DATABASES`), CTAS, multi-row inserts |
| [Day_1_DDL.sql](./01_DDL_and_Data_Types/Day_1_DDL.sql) | ⚙️ Script | Executable Day 1 DDL queries |

---

### 📂 02 — Constraints
> `DEFAULT`, `AUTO_INCREMENT`, `NOT NULL`, `PRIMARY KEY`, `UNIQUE`, `CHECK`, `FOREIGN KEY`, Referential Integrity, `ON DELETE CASCADE`

| File | Type | Description |
|------|------|-------------|
| [Topic_2_3.md](./02_Constraints/Topic_2_3.md) | 📖 Notes | `DEFAULT` constraint, `CURRENT_DATE`, `AUTO_INCREMENT` & sequence rules |
| [Topic_2_3.sql](./02_Constraints/Topic_2_3.sql) | ⚙️ Script | Executable queries for Topic 2 & 3 |
| [Topic_4.md](./02_Constraints/Topic_4.md) | 📖 Notes | `NOT NULL` constraint, `ALTER TABLE MODIFY COLUMN` |
| [Topic_4.sql](./02_Constraints/Topic_4.sql) | ⚙️ Script | Executable queries for Topic 4 |
| [Topic_5.md](./02_Constraints/Topic_5.md) | 📖 Notes | `PRIMARY KEY` — entity integrity, uniqueness, B-Tree indexing |
| [Topic_5.sql](./02_Constraints/Topic_5.sql) | ⚙️ Script | Executable queries for Topic 5 |
| [Topic_6.md](./02_Constraints/Topic_6.md) | 📖 Notes | `UNIQUE` constraint, NULL handling, `ALTER TABLE RENAME` |
| [Topic_6.sql](./02_Constraints/Topic_6.sql) | ⚙️ Script | Executable queries for Topic 6 |
| [Topic_7.md](./02_Constraints/Topic_7.md) | 📖 Notes | `CHECK` constraint — numeric ranges, enum lists, `BETWEEN` |
| [Topic_7.sql](./02_Constraints/Topic_7.sql) | ⚙️ Script | Executable queries for Topic 7 |
| [Topic_8.md](./02_Constraints/Topic_8.md) | 📖 Notes | `FOREIGN KEY` — parent-child tables, `ON DELETE/UPDATE CASCADE` |
| [Topic_8.sql](./02_Constraints/Topic_8.sql) | ⚙️ Script | Executable queries for Topic 8 |

---

### 📂 03 — DML and Alterations
> `ALTER TABLE` (`MODIFY`, `ADD`, `DROP`, `RENAME`), `TRUNCATE` vs `DELETE`, `UPDATE` variations

| File | Type | Description |
|------|------|-------------|
| [Day_1_DDL_.md](./03_DML_and_Alterations/Day_1_DDL_.md) | 📖 Notes | Advanced `ALTER TABLE`, `TRUNCATE` vs `DELETE`, `UPDATE` patterns |
| [Day_1_DDL_.sql](./03_DML_and_Alterations/Day_1_DDL_.sql) | ⚙️ Script | Executable DML & alteration queries |

---

### 📂 04 — Joins, Subqueries & Views
> `INNER`, `LEFT`, `RIGHT`, `SELF` Joins, Non-Equi Joins, `UNION ALL`, Subqueries, Correlated Subqueries, `VIEW`, `CASE`

| File | Type | Description |
|------|------|-------------|
| [Day_3_Joins.md](./04_Joins_Subqueries_Views/Day_3_Joins.md) | 📖 Notes | All join types, subqueries, UNION, CASE, CREATE VIEW |
| [Day_3_Joins.sql](./04_Joins_Subqueries_Views/Day_3_Joins.sql) | ⚙️ Script | Executable join & view queries |

---

### 📂 05 — Functions, Aggregates & Window Functions
> `DATE_ADD`, `DATEDIFF`, `IFNULL`, `GROUP BY`, `HAVING`, `RANK()`, `LAG()`, `LEAD()`, Running Totals, `WHERE` operators

| File | Type | Description |
|------|------|-------------|
| [Day_3.md](./05_Functions_Aggregates_Windows/Day_3.md) | 📖 Notes | Date math, aggregation, window functions (RANK, LAG, LEAD, running totals) |
| [Day_3.sql](./05_Functions_Aggregates_Windows/Day_3.sql) | ⚙️ Script | Executable function & window queries |
| [SQL_Commands.md](./05_Functions_Aggregates_Windows/SQL_Commands.md) | 📖 Notes | Master reference — `WHERE` operators, `BETWEEN`, `IS NULL`, string & math functions |
| [SQL_Commands.sql](./05_Functions_Aggregates_Windows/SQL_Commands.sql) | ⚙️ Script | Executable command reference queries |

---

### 📂 06 — Transactions, DCL & Advanced SQL
> `WITH` (CTEs), ACID, `SAVEPOINT`, `COMMIT`, `ROLLBACK`, DCL Security, Stored Procedures, Functions, Triggers, Indexes

| File | Type | Description |
|------|------|-------------|
| [Day_4.md](./06_Transactions_DCL_Advanced/Day_4.md) | 📖 Notes | CTEs, ACID transactions, SAVEPOINT, DCL, stored procedures, functions, triggers, indexes |
| [Day_4.sql](./06_Transactions_DCL_Advanced/Day_4.sql) | ⚙️ Script | Executable advanced SQL queries |

---

### 📂 07 — Assignments (Solved)
> Complete solved solutions across all topics

| File | Type | Description | Level |
|------|------|-------------|-------|
| [SQL_DAY1_ASSIGNMENT.md](./07_Assignments/SQL_DAY1_ASSIGNMENT.md) | 📖 Notes | 35 solved exercises — `CREATE TABLE`, Constraints (Topics 1–8) | 🟢 Beginner |
| [SQL_DAY1_ASSIGNMENT.sql](./07_Assignments/SQL_DAY1_ASSIGNMENT.sql) | ⚙️ Script | Executable Day 1 assignment solutions |  |
| [SQL_DAY2_ASSIGNMENT.md](./07_Assignments/SQL_DAY2_ASSIGNMENT.md) | 📖 Notes | 83 solved exercises — DDL Alterations, String & Math Functions | 🟠 Intermediate |
| [SQL_DAY2_ASSIGNMENT.sql](./07_Assignments/SQL_DAY2_ASSIGNMENT.sql) | ⚙️ Script | Executable Day 2 assignment solutions |  |
| [SQL_DAY3_ASSIGNMENT.md](./07_Assignments/SQL_DAY3_ASSIGNMENT.md) | 📖 Notes | 35 solved analytical questions — Subqueries, JOIN Aggregations, Views & CTEs | 🔴 Advanced |
| [SQL_DAY3_ASSIGNMENT.sql](./07_Assignments/SQL_DAY3_ASSIGNMENT.sql) | ⚙️ Script | Executable Day 3 assignment solutions |  |

---

<div align="center">

**[Return to Master Repository Index](../README.md)**

</div>
