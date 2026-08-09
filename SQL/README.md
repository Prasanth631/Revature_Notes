<div align="center">

![SQL](https://img.shields.io/badge/SQL-MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![SQL Module](https://img.shields.io/badge/Module-SQL_Complete_Notes-blue?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Complete-success?style=for-the-badge)

# MySQL Database Engineering — Master Index

**Complete study guides, executable SQL scripts, solved assignment sets, and interview preparation guides for MySQL Database Engineering.**

---

</div>

## 📌 How to Use This Module

This directory contains **16 structured SQL topics and solved assignment sets**.  
Each entry includes two direct clickable links:
1. **Markdown Study Guide (`.md`)**: Comprehensive explanations, 5-point query breakdowns, comparison tables, and interview tips.
2. **Executable SQL Script (`.sql`)**: Clean, formatted uppercase SQL queries with inline documentation comments ready to execute in MySQL Workbench / CLI.

---

## 🗺️ Master Table of Contents & Direct File Links

| # | Topic / Module Name | Markdown Study Guide | Executable SQL Script | Core Concepts Covered | Level |
|:-:|---------------------|----------------------|-----------------------|-----------------------|:-----:|
| 01 | **Basic DDL & Data Types** | [01_Basic_DDL_and_Data_Types.md](./01_Basic_DDL_and_Data_Types.md) | [01_Basic_DDL_and_Data_Types.sql](./01_Basic_DDL_and_Data_Types.sql) | DDL (`CREATE`, `USE`, `DESC`), Data Types (`INT`, `VARCHAR`, `DECIMAL`, `FLOAT`, `DATE`), Table creation | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 02 | **DEFAULT & AUTO_INCREMENT** | [02_DEFAULT_and_AUTO_INCREMENT.md](./02_DEFAULT_and_AUTO_INCREMENT.md) | [02_DEFAULT_and_AUTO_INCREMENT.sql](./02_DEFAULT_and_AUTO_INCREMENT.sql) | `DEFAULT` constraint, Dynamic defaults (`CURRENT_DATE`), `AUTO_INCREMENT` primary keys & sequence rules | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 03 | **NOT NULL & Alter Table** | [03_NOT_NULL_and_Alter_Table.md](./03_NOT_NULL_and_Alter_Table.md) | [03_NOT_NULL_and_Alter_Table.sql](./03_NOT_NULL_and_Alter_Table.sql) | `NOT NULL` constraint, Column data type refactoring using `ALTER TABLE ... MODIFY COLUMN` | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 04 | **PRIMARY KEY Constraint** | [04_PRIMARY_KEY_Constraint.md](./04_PRIMARY_KEY_Constraint.md) | [04_PRIMARY_KEY_Constraint.sql](./04_PRIMARY_KEY_Constraint.sql) | `PRIMARY KEY` entity integrity, Uniqueness + Non-nullability, Clustered B-Tree Indexing | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 05 | **UNIQUE Constraint & Rename** | [05_UNIQUE_Constraint_and_Rename.md](./05_UNIQUE_Constraint_and_Rename.md) | [05_UNIQUE_Constraint_and_Rename.sql](./05_UNIQUE_Constraint_and_Rename.sql) | `UNIQUE` key constraint, Multiple `NULL` handling, `VARCHAR` phone number design, `ALTER TABLE RENAME` | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 06 | **CHECK Constraint Validation** | [06_CHECK_Constraint_Validation.md](./06_CHECK_Constraint_Validation.md) | [06_CHECK_Constraint_Validation.sql](./06_CHECK_Constraint_Validation.sql) | `CHECK` domain validation, Numeric ranges (`>=`, `>`), Enum choice lists (`IN`), Closed intervals (`BETWEEN`) | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 07 | **FOREIGN KEY & Referential Integrity** | [07_FOREIGN_KEY_Referential_Integrity.md](./07_FOREIGN_KEY_Referential_Integrity.md) | [07_FOREIGN_KEY_Referential_Integrity.sql](./07_FOREIGN_KEY_Referential_Integrity.sql) | `FOREIGN KEY` constraint, Parent-Child tables, Referential integrity, `ON DELETE` / `ON UPDATE CASCADE` | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 08 | **Day 1 DDL Basics & CTAS** | [08_Day1_DDL_Basics_and_CTAS.md](./08_Day1_DDL_Basics_and_CTAS.md) | [08_Day1_DDL_Basics_and_CTAS.sql](./08_Day1_DDL_Basics_and_CTAS.sql) | Server Inspection (`VERSION()`, `SHOW DATABASES`), CTAS (`CREATE TABLE AS SELECT`), Multi-row inserts | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 09 | **Day 1 DDL Alter & Updates** | [09_Day1_DDL_Alter_and_Updates.md](./09_Day1_DDL_Alter_and_Updates.md) | [09_Day1_DDL_Alter_and_Updates.sql](./09_Day1_DDL_Alter_and_Updates.sql) | Advanced `ALTER TABLE` (`MODIFY`, `ADD`, `DROP`, `RENAME`), `TRUNCATE` vs `DELETE`, `UPDATE` variations | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 10 | **Day 3 Date, Aggregates & Windows** | [10_Day3_Date_Aggregates_and_Window_Functions.md](./10_Day3_Date_Aggregates_and_Window_Functions.md) | [10_Day3_Date_Aggregates_and_Window_Functions.sql](./10_Day3_Date_Aggregates_and_Window_Functions.sql) | Date math (`DATE_ADD`, `DATEDIFF`), `IFNULL`, `GROUP BY`, `HAVING`, Window Functions (`RANK`, `LAG`, `LEAD`, Running Totals) | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 11 | **Day 3 Joins, Subqueries & Views** | [11_Day3_Joins_Subqueries_Views.md](./11_Day3_Joins_Subqueries_Views.md) | [11_Day3_Joins_Subqueries_Views.sql](./11_Day3_Joins_Subqueries_Views.sql) | `INNER`/`LEFT`/`RIGHT`/`SELF` Joins, Non-Equi Joins, `UNION ALL`, Subqueries, Correlated Subqueries, `VIEW`s, `CASE` | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 12 | **Day 4 CTEs, Procedures & Triggers** | [12_Day4_CTEs_Transactions_Procedures_Triggers.md](./12_Day4_CTEs_Transactions_Procedures_Triggers.md) | [12_Day4_CTEs_Transactions_Procedures_Triggers.sql](./12_Day4_CTEs_Transactions_Procedures_Triggers.sql) | CTEs (`WITH`), ACID Transactions (`SAVEPOINT`), DCL Security, Stored Procedures, Functions, Triggers, Indexes | ![Advanced](https://img.shields.io/badge/-Advanced-F44336?style=flat-square) |
| 13 | **Master SQL Commands Reference** | [13_Master_SQL_Commands_Reference.md](./13_Master_SQL_Commands_Reference.md) | [13_Master_SQL_Commands_Reference.sql](./13_Master_SQL_Commands_Reference.sql) | Master reference: `WHERE` operators (`=`, `<>`, `IN`, `LIKE '%'`), Range `BETWEEN`, `IS NULL`, String & Math functions | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 14 | **Assignment Day 1 Solved** | [14_Assignment_Day1_Solved.md](./14_Assignment_Day1_Solved.md) | [14_Assignment_Day1_Solved.sql](./14_Assignment_Day1_Solved.sql) | Complete solved solutions for 35 exercises across Topics 1 to 8 (`CREATE TABLE`, Constraints) | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 15 | **Assignment Day 2 Solved** | [15_Assignment_Day2_Solved.md](./15_Assignment_Day2_Solved.md) | [15_Assignment_Day2_Solved.sql](./15_Assignment_Day2_Solved.sql) | Complete solved solutions for 83 exercises covering DDL Alterations, String Functions & Math Functions | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 16 | **Assignment Day 3 SalesDB Solved** | [16_Assignment_Day3_SalesDB_Solved.md](./16_Assignment_Day3_SalesDB_Solved.md) | [16_Assignment_Day3_SalesDB_Solved.sql](./16_Assignment_Day3_SalesDB_Solved.sql) | Complete solved solutions for 35 analytical questions using SalesDB: Subqueries, JOIN Aggregations, Views & CTEs | ![Advanced](https://img.shields.io/badge/-Advanced-F44336?style=flat-square) |

---

<div align="center">

**[Return to Master Repository Index](../README.md)**

</div>
