<div align="center">

![SQL](https://img.shields.io/badge/SQL-MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![SQL Module](https://img.shields.io/badge/Module-SQL_Complete_Notes-blue?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Complete-success?style=for-the-badge)

# MySQL Database Engineering — Master Index

**Complete study guides, executable SQL scripts, solved assignment sets, and interview preparation guides for MySQL Database Engineering.**

---

</div>

## 📌 How to Use This Module

This directory contains **structured SQL topic notes, core practice modules, and solved assignment sets**.  
Each entry includes two direct clickable links:
1. **Markdown Study Guide (`.md`)**: Comprehensive explanations, 5-point query breakdowns, comparison tables, and interview tips.
2. **Executable SQL Script (`.sql`)**: Clean, formatted uppercase SQL queries with inline documentation comments ready to execute in MySQL Workbench / CLI.

---

## 🗺️ Master Table of Contents & Direct File Links

| # | Topic / Script Name | Markdown Study Guide | Executable SQL Script | Core Concepts Covered | Level |
|:-:|---------------------|----------------------|-----------------------|-----------------------|:-----:|
| 01 | **Topic 1** | [Topic_1.md](./Topic_1.md) | [Topic_1.sql](./Topic_1.sql) | DDL (`CREATE`, `USE`, `DESC`), Data Types (`INT`, `VARCHAR`, `DECIMAL`, `FLOAT`, `DATE`), Table creation | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 02 | **Topic 2 & 3** | [Topic_2_3.md](./Topic_2_3.md) | [Topic_2_3.sql](./Topic_2_3.sql) | `DEFAULT` constraint, Dynamic defaults (`CURRENT_DATE`), `AUTO_INCREMENT` primary keys & sequence rules | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 03 | **Topic 4** | [Topic_4.md](./Topic_4.md) | [Topic_4.sql](./Topic_4.sql) | `NOT NULL` constraint, Column data type refactoring using `ALTER TABLE ... MODIFY COLUMN` | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 04 | **Topic 5** | [Topic_5.md](./Topic_5.md) | [Topic_5.sql](./Topic_5.sql) | `PRIMARY KEY` entity integrity, Uniqueness + Non-nullability, Clustered B-Tree Indexing | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 05 | **Topic 6** | [Topic_6.md](./Topic_6.md) | [Topic_6.sql](./Topic_6.sql) | `UNIQUE` key constraint, Multiple `NULL` handling, `VARCHAR` phone number design, `ALTER TABLE RENAME` | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 06 | **Topic 7** | [Topic_7.md](./Topic_7.md) | [Topic_7.sql](./Topic_7.sql) | `CHECK` domain validation, Numeric ranges (`>=`, `>`), Enum choice lists (`IN`), Closed intervals (`BETWEEN`) | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 07 | **Topic 8** | [Topic_8.md](./Topic_8.md) | [Topic_8.sql](./Topic_8.sql) | `FOREIGN KEY` constraint, Parent-Child tables, Referential integrity, `ON DELETE` / `ON UPDATE CASCADE` | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 08 | **Day 1 DDL** | [Day_1_DDL.md](./Day_1_DDL.md) | [Day_1_DDL.sql](./Day_1_DDL.sql) | Server Inspection (`VERSION()`, `SHOW DATABASES`), CTAS (`CREATE TABLE AS SELECT`), Multi-row inserts | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 09 | **Day 1 DDL (Advanced)** | [Day_1_DDL_.md](./Day_1_DDL_.md) | [Day_1_DDL_.sql](./Day_1_DDL_.sql) | Advanced `ALTER TABLE` (`MODIFY`, `ADD`, `DROP`, `RENAME`), `TRUNCATE` vs `DELETE`, `UPDATE` variations | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 10 | **Day 3 Date & Windows** | [Day_3.md](./Day_3.md) | [Day_3.sql](./Day_3.sql) | Date math (`DATE_ADD`, `DATEDIFF`), `IFNULL`, `GROUP BY`, `HAVING`, Window Functions (`RANK`, `LAG`, `LEAD`, Running Totals) | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 11 | **Day 3 Joins & Views** | [Day_3_Joins.md](./Day_3_Joins.md) | [Day_3_Joins.sql](./Day_3_Joins.sql) | `INNER`/`LEFT`/`RIGHT`/`SELF` Joins, Non-Equi Joins, `UNION ALL`, Subqueries, Correlated Subqueries, `VIEW`s, `CASE` | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 12 | **Day 4 Advanced SQL** | [Day_4.md](./Day_4.md) | [Day_4.sql](./Day_4.sql) | CTEs (`WITH`), ACID Transactions (`SAVEPOINT`), DCL Security, Stored Procedures, Functions, Triggers, Indexes | ![Advanced](https://img.shields.io/badge/-Advanced-F44336?style=flat-square) |
| 13 | **SQL Commands Reference** | [SQL_Commands.md](./SQL_Commands.md) | [SQL_Commands.sql](./SQL_Commands.sql) | Master reference: `WHERE` operators (`=`, `<>`, `IN`, `LIKE '%'`), Range `BETWEEN`, `IS NULL`, String & Math functions | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 14 | **SQL Assignment Day 1** | [SQL_DAY1_ASSIGNMENT.md](./SQL_DAY1_ASSIGNMENT.md) | [SQL_DAY1_ASSIGNMENT.sql](./SQL_DAY1_ASSIGNMENT.sql) | Complete solved solutions for 35 exercises across Topics 1 to 8 (`CREATE TABLE`, Constraints) | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 15 | **SQL Assignment Day 2** | [SQL_DAY2_ASSIGNMENT.md](./SQL_DAY2_ASSIGNMENT.md) | [SQL_DAY2_ASSIGNMENT.sql](./SQL_DAY2_ASSIGNMENT.sql) | Complete solved solutions for 83 exercises covering DDL Alterations, String Functions & Math Functions | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 16 | **SQL Assignment Day 3 (SalesDB)** | [SQL_DAY3_ASSIGNMENT.md](./SQL_DAY3_ASSIGNMENT.md) | [SQL_DAY3_ASSIGNMENT.sql](./SQL_DAY3_ASSIGNMENT.sql) | Complete solved solutions for 35 analytical questions using SalesDB: Subqueries, JOIN Aggregations, Views & CTEs | ![Advanced](https://img.shields.io/badge/-Advanced-F44336?style=flat-square) |

---

<div align="center">

**[Return to Master Repository Index](../README.md)**

</div>
