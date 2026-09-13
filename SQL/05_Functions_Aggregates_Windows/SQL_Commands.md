<div align="center">

![SQL](https://img.shields.io/badge/SQL-MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![SQL Commands](https://img.shields.io/badge/Master_Ref-SQL_Commands-4CAF50?style=for-the-badge)
![Level](https://img.shields.io/badge/Level-Intermediate-FF9800?style=for-the-badge)

# SQL Commands Master Reference Notes

**Comprehensive study guide covering Schema Creation, Sample Data Seeding (`dept`, `emp`, `salgrade`), Comparison Operators (`=`, `<>`, `IN`, `LIKE`), Range & Null Filters (`BETWEEN`, `IS NULL`), String Functions, and Numeric Functions.**

---

</div>

## 📚 Overview

This reference guide provides a complete overview of **Core Data Querying & Built-in Functions**:
1. **Schema & Data Initialization**: `dept`, `emp`, and `salgrade` sample datasets
2. **Comparison & Filtering**: `=`, `<>`, `!=`, `>`, `<`, `>=`, `<=`, `IN`, `NOT IN`
3. **Pattern Matching & Range Filtering**: `LIKE '%'`, `LIKE '_'`, `BETWEEN ... AND ...`
4. **Null Handling**: `IS NULL` vs `IS NOT NULL` (Why `col = NULL` fails in SQL)
5. **Built-in Functions**:
   - **String**: `UPPER()`, `LOWER()`, `LENGTH()`, `SUBSTR()`, `INSTR()`, `CONCAT()`, `REPLACE()`, `TRIM()`, `LPAD()`, `RPAD()`
   - **Numeric**: `ROUND()`, `TRUNCATE()`, `MOD()`, `POWER()`, `SQRT()`, `ABS()`, `CEIL()`, `FLOOR()`

---

## 🎯 Key Interview Concepts & Comparison Tables

### 1. `LIKE` Wildcards (`%` vs `_`)

| Wildcard | Meaning | Example Pattern | Matching Example |
|:--------:|---------|-----------------|------------------|
| **`%`** | Matches **0 or more** characters | `'A%'` | `'ALLEN'`, `'ADAMS'`, `'A'` |
| **`_`** | Matches **exactly 1** character | `'_A%'` | `'MARTIN'`, `'JAMES'`, `'WARD'` (A is 2nd letter) |

---

### 2. Evaluating `NULL` Values in SQL

> [!CAUTION]
> **Common Interview Mistake**: Writing `WHERE comm = NULL`  
> In SQL standard ternary logic:
> - `NULL = NULL` evaluates to `UNKNOWN` (not `TRUE`).
> - Therefore, `WHERE comm = NULL` will **NEVER** return any rows!
> - You **MUST** use `WHERE comm IS NULL` or `WHERE comm IS NOT NULL`.

---

## 🔍 Detailed Query-by-Query Analysis

---

### Query 1: Filter Rows by Exact Equality (`=`)
```sql
SELECT empno, ename, sal, job, deptno, hiredate 
FROM emp 
WHERE deptno = 10;
```
* **What is this query?** Basic DML `WHERE` clause equality selection query.
* **What does it do?** Selects employees belonging to department 10.
* **How keyword works:** `WHERE deptno = 10` evaluates equality row by row.

---

### Query 2: Filter Rows Using `IN` / `NOT IN`
```sql
SELECT empno, ename, sal, job, deptno FROM emp WHERE deptno IN (10, 30);
SELECT empno, ename, sal, job, deptno FROM emp WHERE deptno NOT IN (10, 30);
```
* **What is this query?** List membership comparison query.
* **What does it do?** `IN (10, 30)` selects employees in department 10 or 30; `NOT IN (10, 30)` selects employees outside departments 10 and 30.
* **How keyword works:** `IN (val1, val2)` replaces multiple `OR` conditions (`deptno = 10 OR deptno = 30`).

---

### Query 3: Pattern Matching Wildcards (`LIKE '%'`, `'_'`)
```sql
SELECT empno, ename FROM emp WHERE ename LIKE 'A%';
SELECT empno, ename FROM emp WHERE ename LIKE '_A%';
```
* **What is this query?** String pattern matching query using wildcards.
* **What does it do?** `LIKE 'A%'` finds names starting with 'A'; `LIKE '_A%'` finds names with 'A' as the second character.
* **How keyword works:** `%` matches zero or more characters; `_` matches exactly one character.

---

### Query 4: Inclusive Range Filtering (`BETWEEN ... AND ...`)
```sql
SELECT empno, ename, sal FROM emp 
WHERE sal BETWEEN 1000 AND 3000;
```
* **What is this query?** Inclusive range evaluation query.
* **What does it do?** Selects employees earning between 1000 and 3000 inclusive.
* **How keyword works:** `sal BETWEEN 1000 AND 3000` is equivalent to `sal >= 1000 AND sal <= 3000`.

---

### Query 5: Null Value Evaluation (`IS NULL` / `IS NOT NULL`)
```sql
SELECT empno, ename, comm FROM emp WHERE comm IS NULL;
SELECT empno, ename, comm FROM emp WHERE comm IS NOT NULL;
```
* **What is this query?** Null state evaluation statement.
* **What does it do?** `IS NULL` finds employees with no commission; `IS NOT NULL` finds employees receiving commission.
* **How keyword works:** Evaluates the presence or absence of a `NULL` state.

---

### Query 6: String Functions (`SUBSTR`, `INSTR`, `CONCAT`, `REPLACE`)
```sql
SELECT 
    ename,
    LOWER(ename) AS lower_name,
    LENGTH(ename) AS name_len,
    SUBSTR(ename, 1, 3) AS first_3_chars,
    INSTR(ename, 'A') AS pos_of_a,
    CONCAT(ename, ' is a ', job) AS emp_info,
    REPLACE(job, 'SALESMAN', 'SALES_REP') AS new_job_title
FROM emp;
```
* **What is this query?** Built-in string transformation query.
* **What does it do?** Demonstrates case conversion, string length, substring extraction, string positioning, concatenation, and text replacement.
* **How keyword works:** Executes scalar string manipulation functions per row.

---

### Query 7: Numeric Functions (`ROUND`, `TRUNCATE`, `MOD`, `CEIL`, `FLOOR`)
```sql
SELECT 
    sal,
    ROUND(sal / 3, 2) AS rounded_div_3,
    TRUNCATE(sal / 3, 2) AS truncated_div_3,
    MOD(sal, 1000) AS mod_1000,
    SQRT(sal) AS sqrt_sal,
    CEIL(sal / 300) AS ceil_val,
    FLOOR(sal / 300) AS floor_val
FROM emp;
```
* **What is this query?** Built-in numeric math function query.
* **What does it do?** Calculates rounding, truncation, remainder (modulo), square root, ceiling, and floor values on salaries.
* **How keyword works:** Executes scalar mathematical functions per row.

---

<div align="center">

[![Previous Notes](https://img.shields.io/badge/←_Previous-Day_4_CTEs_Transactions_Notes-4CAF50?style=for-the-badge)](./Day_4.md)
[![Master Index](https://img.shields.io/badge/↑_Home-Master_SQL_Index-2196F3?style=for-the-badge)](./README.md)

</div>
