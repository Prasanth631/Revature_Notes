<div align="center">

![SQL](https://img.shields.io/badge/SQL-MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![Status](https://img.shields.io/badge/Status-100%25_Complete-success?style=for-the-badge)
![Files](https://img.shields.io/badge/Files-32_Total_Files-blue?style=for-the-badge)

# Master SQL Learning Notes & Assignment Reference

**Exhaustive, topic-wise SQL reference notes, DDL & DML assignments, relational joins, subqueries, database views, stored procedures, triggers, performance tuning, and interview preparation guide.**

---

</div>

## 📌 Repository Overview

This repository contains **comprehensive, topic-wise SQL notes and solved assignment scripts** covering all core and advanced MySQL topics.

Every SQL query across all `.sql` and `.md` files is formatted using **UPPERCASE SQL keywords**, formatted with standard indentation, and fully annotated with 4-point/5-point explanations:
1. **What is this query?**
2. **What does this query do?**
3. **What is the solution/logic behind it?**
4. **Why are these particular SQL clauses or keywords used / How keyword works?**

---

## 🗺️ Master Table of Contents

### 1. Topic-Wise Fundamental DDL Notes (Topics 1 - 8)

| Topic # | Markdown Study Guide | SQL Script | Core Topics Covered | Level |
|:-------:|----------------------|------------|---------------------|:-----:|
| **Topic 1** | [Topic_1.md](./Topic_1.md) | [Topic_1.sql](./Topic_1.sql) | DDL Commands (`CREATE`, `USE`, `DESC`), Data Types (`INT`, `VARCHAR`, `DECIMAL`, `FLOAT`, `DATE`) | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| **Topic 2 & 3** | [Topic_2_3.md](./Topic_2_3.md) | [Topic_2_3.sql](./Topic_2_3.sql) | `DEFAULT` Constraint, Dynamic Defaults (`CURRENT_DATE`), `AUTO_INCREMENT` Primary Keys | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| **Topic 4** | [Topic_4.md](./Topic_4.md) | [Topic_4.sql](./Topic_4.sql) | `NOT NULL` Constraint, Column Type Refactoring (`ALTER TABLE ... MODIFY COLUMN`) | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| **Topic 5** | [Topic_5.md](./Topic_5.md) | [Topic_5.sql](./Topic_5.sql) | `PRIMARY KEY` Constraint, Entity Integrity, Clustered B-Tree Indexing | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| **Topic 6** | [Topic_6.md](./Topic_6.md) | [Topic_6.sql](./Topic_6.sql) | `UNIQUE` Key Constraint, Multiple `NULL` handling, `VARCHAR` Phone Numbers, `ALTER TABLE RENAME` | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| **Topic 7** | [Topic_7.md](./Topic_7.md) | [Topic_7.sql](./Topic_7.sql) | `CHECK` Constraint, Range (`>=`, `>`), Enum Choice Lists (`IN`), Intervals (`BETWEEN`) | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| **Topic 8** | [Topic_8.md](./Topic_8.md) | [Topic_8.sql](./Topic_8.sql) | `FOREIGN KEY` Constraint, Parent-Child Relationships, Referential Integrity, Cascade Rules | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |

---

### 2. Core & Advanced Practice Modules

| Module Name | Markdown Study Guide | SQL Script | Key Concepts & Functions Covered | Level |
|-------------|----------------------|------------|----------------------------------|:-----:|
| **Day 1 DDL Basics** | [Day_1_DDL.md](./Day_1_DDL.md) | [Day_1_DDL.sql](./Day_1_DDL.sql) | Server Inspection, CTAS (`CREATE TABLE AS SELECT`), `DEFAULT`, `AUTO_INCREMENT`, Constraints | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| **Day 1 DDL Advanced** | [Day_1_DDL_.md](./Day_1_DDL_.md) | [Day_1_DDL_.sql](./Day_1_DDL_.sql) | `ALTER TABLE` (`MODIFY`, `ADD`, `DROP`, `RENAME`), `TRUNCATE` vs `DELETE`, Multi-column `UPDATE` | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| **Day 3 Date & Window** | [Day_3.md](./Day_3.md) | [Day_3.sql](./Day_3.sql) | Date Arithmetic (`DATE_ADD`, `DATEDIFF`), `IFNULL`, `GROUP BY`, `HAVING`, Window Functions (`RANK`, `LAG`, `LEAD`) | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| **Day 3 Joins & Subqueries** | [Day_3_Joins.md](./Day_3_Joins.md) | [Day_3_Joins.sql](./Day_3_Joins.sql) | `INNER`/`LEFT`/`RIGHT`/`SELF` Joins, Non-Equi Joins, `UNION ALL`, Subqueries, Correlated Subqueries, `VIEW`s, `CASE` | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| **Day 4 CTEs & Procedures** | [Day_4.md](./Day_4.md) | [Day_4.sql](./Day_4.sql) | CTEs (`WITH`), ACID Transactions (`SAVEPOINT`), DCL (`GRANT`/`REVOKE`), Procedures, Functions, Triggers, Indexes | ![Advanced](https://img.shields.io/badge/-Advanced-F44336?style=flat-square) |
| **SQL Commands Master** | [SQL_Commands.md](./SQL_Commands.md) | [SQL_Commands.sql](./SQL_Commands.sql) | Master Reference: `WHERE` Operators (`=`, `<>`, `IN`, `LIKE '%'`), String Functions, Math Functions | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |

---

### 3. Solved Assignment Sets

| Assignment Set | Solved Markdown Guide | Solved SQL Script | Question Count | Topics Covered |
|----------------|-----------------------|-------------------|:--------------:|----------------|
| **Day 1 Assignment** | [SQL_DAY1_ASSIGNMENT.md](./SQL_DAY1_ASSIGNMENT.md) | [SQL_DAY1_ASSIGNMENT.sql](./SQL_DAY1_ASSIGNMENT.sql) | 35 Exercises | Solved exercises for Topics 1 through 8 |
| **Day 2 Assignment** | [SQL_DAY2_ASSIGNMENT.md](./SQL_DAY2_ASSIGNMENT.md) | [SQL_DAY2_ASSIGNMENT.sql](./SQL_DAY2_ASSIGNMENT.sql) | 83 Exercises | DDL Alterations, String Functions, Number Functions, Date Functions |
| **Day 3 Assignment** | [SQL_DAY3_ASSIGNMENT.md](./SQL_DAY3_ASSIGNMENT.md) | [SQL_DAY3_ASSIGNMENT.sql](./SQL_DAY3_ASSIGNMENT.sql) | 35 Questions | SalesDB schema: Subqueries, JOIN Aggregation, Views, Analytical queries |

---

<div align="center">

**Created by [Prasanth Golla](https://github.com/Prasanth631)**

</div>
