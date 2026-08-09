<div align="center">

![SQL](https://img.shields.io/badge/SQL-MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![Day 3 Functions](https://img.shields.io/badge/Day_3-Aggregates_%26_Window_Functions-4CAF50?style=for-the-badge)
![Level](https://img.shields.io/badge/Level-Intermediate-FF9800?style=for-the-badge)

# Day 3 Date, Aggregate, HAVING & Window Functions Notes

**Comprehensive SQL study guide covering Date & Time arithmetic, Type Casting, `NULL` handling (`IFNULL`, `NULLIF`), `GROUP BY` aggregations, `HAVING` filtering, and Analytic Window Functions (`ROW_NUMBER`, `RANK`, `DENSE_RANK`, `LAG`, `LEAD`, Running Totals).**

---

</div>

## 📚 Overview

This module covers **Advanced Analytic & Aggregation Queries**:
1. **Date & Time Operations**: `YEAR()`, `EXTRACT()`, `DATE_ADD()`, `DATE_SUB()`, `DATEDIFF()`, `LAST_DAY()`, `DATE_FORMAT()`
2. **Type Casting & Null Handling**: `CAST()`, `IFNULL()`, `NULLIF()`, `COUNT(*)` vs `COUNT(col)`
3. **Aggregations**: `GROUP BY`, `HAVING` vs `WHERE`
4. **Analytic Window Functions**: `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `LAG()`, `LEAD()`, `SUM() OVER(ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)`

---

## 🎯 Key Interview Concepts & Comparison Tables

### 1. `WHERE` Clause vs `HAVING` Clause

| Feature | `WHERE` Clause | `HAVING` Clause |
|---------|----------------|-----------------|
| **Execution Timing** | Filters individual rows **BEFORE** `GROUP BY` aggregation | Filters grouped summary rows **AFTER** `GROUP BY` aggregation |
| **Aggregate Functions** | **Cannot** use aggregate functions (`SUM`, `AVG`, `COUNT` in `WHERE` raise error) | **Can** use aggregate functions (`HAVING COUNT(*) > 5`) |
| **Performance** | Faster (reduces rows before grouping) | Applied after grouping completes |

---

### 2. `RANK()` vs `DENSE_RANK()` vs `ROW_NUMBER()`

| Window Function | Duplicate Values Handling | Sequence Output Example (Ties at #2) |
|-----------------|---------------------------|-------------------------------------|
| **`ROW_NUMBER()`** | Assigns unique sequential numbers regardless of ties | `1, 2, 3, 4` |
| **`RANK()`** | Leaves gaps in sequence after duplicate ties | `1, 2, 2, 4` (skips 3) |
| **`DENSE_RANK()`** | Does **NOT** leave gaps in sequence after ties | `1, 2, 2, 3` (no skip) |

---

## 🔍 Detailed Query-by-Query Analysis

---

### Query 1: Date Component Extraction
```sql
SELECT 
    EXTRACT(YEAR FROM hiredate) AS hire_year,
    YEAR(hiredate) AS h_year,
    hiredate
FROM emp;
```
* **What is this query?** Date component extraction query.
* **What does it do?** Extracts calendar year from `hiredate`.
* **How keyword works:** `EXTRACT(YEAR FROM date)` standard ANSI SQL function; `YEAR(date)` MySQL shorthand.

---

### Query 2: Date Addition & Interval Math
```sql
SELECT DATE_ADD(NOW(), INTERVAL 10 DAY) AS future_date_10_days;
SELECT NOW() + INTERVAL 10 DAY AS future_date_plus_10;
```
* **What is this query?** Date arithmetic query.
* **What does it do?** Adds 10 calendar days to the current timestamp.
* **How keyword works:** `DATE_ADD(date, INTERVAL n UNIT)` or operator `+ INTERVAL n UNIT` performs date math.

---

### Query 3: Date Interval Difference (`DATEDIFF`)
```sql
SELECT DATEDIFF(NOW(), hiredate) AS days_worked FROM emp;
```
* **What is this query?** Date interval calculation query.
* **What does it do?** Calculates total elapsed days between current timestamp and `hiredate`.
* **How keyword works:** `DATEDIFF(date1, date2)` computes `date1 - date2` in integer days.

---

### Query 4: Null Addition Handling (`IFNULL`)
```sql
SELECT empno, ename, sal, comm, sal + IFNULL(comm, 0) AS total_sal 
FROM emp;
```
* **What is this query?** Null value substitution math query.
* **What does it do?** Calculates total compensation (`sal + comm`), replacing `NULL` commission with `0`.
* **How keyword works:** In SQL, `number + NULL = NULL`. `IFNULL(comm, 0)` replaces `NULL` with `0` to prevent calculation corruption.

---

### Query 5: Group By & Aggregate Metrics
```sql
SELECT 
    deptno, job,
    MAX(sal) AS max_sal,
    MIN(sal) AS min_sal,
    SUM(sal) AS total_sal,
    AVG(sal) AS avg_sal,
    COUNT(sal) AS no_of_emp
FROM emp
GROUP BY deptno, job
ORDER BY deptno;
```
* **What is this query?** Multi-column grouped summary aggregation.
* **What does it do?** Calculates maximum, minimum, total, average salary, and employee count grouped by department and job title.
* **How keyword works:** `GROUP BY deptno, job` collapses rows matching department and job into single summary rows.

---

### Query 6: Group Filtering with `HAVING`
```sql
SELECT deptno, COUNT(*) AS number_of_emp
FROM emp
GROUP BY deptno
HAVING COUNT(*) >= 3;
```
* **What is this query?** Grouped summary filtering query.
* **What does it do?** Displays department numbers that employ 3 or more workers.
* **How keyword works:** `HAVING COUNT(*) >= 3` filters aggregated group records after `GROUP BY` runs.

---

### Query 7: Ranking Window Functions (`RANK` vs `DENSE_RANK`)
```sql
SELECT 
    empno, ename, sal, deptno,
    RANK() OVER(ORDER BY sal DESC) AS emp_rank,
    DENSE_RANK() OVER(ORDER BY sal DESC) AS emp_dense_rank
FROM emp;
```
* **What is this query?** Comparative salary ranking query.
* **What does it do?** Ranks employees by salary descending. `RANK()` leaves gaps after ties; `DENSE_RANK()` ranks continuously without gaps.
* **How keyword works:** `OVER(ORDER BY sal DESC)` defines window sorting order.

---

### Query 8: Positional Window Functions (`LAG` & `LEAD`)
```sql
SELECT 
    empno, ename, sal,
    LAG(sal) OVER(ORDER BY empno) AS prev_sal,
    LEAD(sal) OVER(ORDER BY empno) AS next_sal
FROM emp;
```
* **What is this query?** Positional window query.
* **What does it do?** Fetches the salary of the previous employee (`LAG`) and next employee (`LEAD`) without self-joining.
* **How keyword works:** `LAG(col)` looks back 1 row; `LEAD(col)` looks forward 1 row in the ordered window frame.

---

### Query 9: Cumulative Running Total (`SUM() OVER`)
```sql
SELECT 
    empno, ename, sal,
    SUM(sal) OVER(ORDER BY empno ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM emp;
```
* **What is this query?** Cumulative running total window query.
* **What does it do?** Calculates cumulative total salary from row 1 up to the current row.
* **How keyword works:** `ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW` defines an expanding window frame.

---

<div align="center">

[![Previous Notes](https://img.shields.io/badge/←_Previous-Day_1_DDL_Alter_Notes-4CAF50?style=for-the-badge)](./Day_1_DDL_.md)
[![Next Notes](https://img.shields.io/badge/Next-Day_3_Joins_Subqueries_Notes-2196F3?style=for-the-badge)](./Day_3_Joins.md)

</div>
