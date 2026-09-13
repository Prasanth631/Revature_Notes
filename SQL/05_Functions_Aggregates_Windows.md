# 05 — Functions, Aggregates & Window Functions

> **Topics Covered:** Date Functions, `IFNULL`/`NULLIF`, `GROUP BY`, `HAVING`, `LIKE`, `BETWEEN`, `IS NULL`, String Functions, Numeric Functions, `RANK()`, `DENSE_RANK()`, `ROW_NUMBER()`, `LAG()`, `LEAD()`, Running Totals

---

## 📌 Quick Reference

| Category | Functions |
|----------|-----------|
| **Date** | `YEAR()`, `EXTRACT()`, `DATE_ADD()`, `DATE_SUB()`, `DATEDIFF()`, `LAST_DAY()`, `DATE_FORMAT()` |
| **NULL Handling** | `IFNULL(col, default)`, `NULLIF(a, b)`, `IS NULL`, `IS NOT NULL` |
| **Aggregation** | `COUNT()`, `SUM()`, `AVG()`, `MAX()`, `MIN()` |
| **String** | `UPPER()`, `LOWER()`, `LENGTH()`, `SUBSTR()`, `INSTR()`, `CONCAT()`, `REPLACE()`, `TRIM()`, `LPAD()`, `RPAD()` |
| **Numeric** | `ROUND()`, `TRUNCATE()`, `MOD()`, `POWER()`, `SQRT()`, `ABS()`, `CEIL()`, `FLOOR()` |
| **Window** | `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `LAG()`, `LEAD()`, `SUM() OVER()` |

---

## 🎯 Key Concepts

### WHERE vs HAVING

| Feature | `WHERE` | `HAVING` |
|---------|---------|---------|
| **Timing** | Filters rows **BEFORE** `GROUP BY` | Filters groups **AFTER** `GROUP BY` |
| **Aggregate Functions** | **Cannot** use `SUM`, `AVG`, etc. | **Can** use aggregate functions |
| **Performance** | Faster — reduces rows before grouping | Applied after grouping |

---

### RANK vs DENSE_RANK vs ROW_NUMBER

| Function | Duplicate Handling | Output for ties at #2 |
|----------|-------------------|----------------------|
| `ROW_NUMBER()` | Unique sequential — ignores ties | `1, 2, 3, 4` |
| `RANK()` | Leaves **gaps** after ties | `1, 2, 2, 4` |
| `DENSE_RANK()` | **No gaps** after ties | `1, 2, 2, 3` |

---

### LIKE Wildcards

| Wildcard | Matches | Example | Results |
|----------|---------|---------|---------|
| `%` | 0 or more characters | `'A%'` | `'ALLEN'`, `'ADAMS'`, `'A'` |
| `_` | Exactly 1 character | `'_A%'` | `'MARTIN'`, `'JAMES'` (A is 2nd letter) |

---

### NULL Evaluation Rules

> [!CAUTION]
> **`WHERE comm = NULL` will NEVER return rows!**
> `NULL = NULL` evaluates to `UNKNOWN` in SQL ternary logic.
> Always use `IS NULL` or `IS NOT NULL`.

In arithmetic: `number + NULL = NULL` — always use `IFNULL(col, 0)` before math.

---

## 🔍 Query-by-Query Analysis

### Part 1 — Date Functions

#### Q1: Extract Year from Date
```sql
SELECT
    EXTRACT(YEAR FROM hiredate) AS hire_year,
    YEAR(hiredate) AS h_year,
    hiredate
FROM emp;
```
- `EXTRACT(YEAR FROM date)` — standard ANSI SQL.
- `YEAR(date)` — MySQL shorthand. Both return the 4-digit year.

#### Q2: Date Arithmetic — Add Days
```sql
SELECT DATE_ADD(NOW(), INTERVAL 10 DAY) AS future_date_10_days;
SELECT NOW() + INTERVAL 10 DAY AS future_date_plus_10;
```
- Both forms add 10 calendar days to the current timestamp.

#### Q3: Date Difference in Days
```sql
SELECT DATEDIFF(NOW(), hiredate) AS days_worked FROM emp;
```
- `DATEDIFF(date1, date2)` = `date1 - date2` in integer days.

---

### Part 2 — NULL Handling

#### Q4: IFNULL for Safe Arithmetic
```sql
SELECT empno, ename, sal, comm,
       sal + IFNULL(comm, 0) AS total_sal
FROM emp;
```
- `sal + NULL = NULL` — `IFNULL(comm, 0)` replaces NULL commission with 0.

---

### Part 3 — Filtering & WHERE Operators

#### Q5: Exact Equality Filter
```sql
SELECT empno, ename, sal, job, deptno
FROM emp WHERE deptno = 10;
```

#### Q6: IN / NOT IN List Filter
```sql
SELECT empno, ename, deptno FROM emp WHERE deptno IN (10, 30);
SELECT empno, ename, deptno FROM emp WHERE deptno NOT IN (10, 30);
```
- `IN (10, 30)` = shorthand for `deptno = 10 OR deptno = 30`.

#### Q7: LIKE Pattern Matching
```sql
SELECT empno, ename FROM emp WHERE ename LIKE 'A%';   -- starts with A
SELECT empno, ename FROM emp WHERE ename LIKE '_A%';  -- A is 2nd character
```

#### Q8: BETWEEN Inclusive Range
```sql
SELECT empno, ename, sal FROM emp WHERE sal BETWEEN 1000 AND 3000;
```
- Equivalent to `sal >= 1000 AND sal <= 3000` (inclusive on both ends).

#### Q9: IS NULL / IS NOT NULL
```sql
SELECT empno, ename, comm FROM emp WHERE comm IS NULL;
SELECT empno, ename, comm FROM emp WHERE comm IS NOT NULL;
```

---

### Part 4 — Aggregates & GROUP BY

#### Q10: Multi-Column GROUP BY with All Aggregates
```sql
SELECT
    deptno, job,
    MAX(sal)   AS max_sal,
    MIN(sal)   AS min_sal,
    SUM(sal)   AS total_sal,
    AVG(sal)   AS avg_sal,
    COUNT(sal) AS no_of_emp
FROM emp
GROUP BY deptno, job
ORDER BY deptno;
```
- `GROUP BY deptno, job` collapses rows into one summary row per dept+job combination.

#### Q11: HAVING — Filter Groups After Aggregation
```sql
SELECT deptno, COUNT(*) AS number_of_emp
FROM emp
GROUP BY deptno
HAVING COUNT(*) >= 3;
```
- `HAVING COUNT(*) >= 3` keeps only departments with 3 or more employees.

---

### Part 5 — String & Numeric Functions

#### Q12: String Functions
```sql
SELECT
    ename,
    LOWER(ename)                  AS lower_name,
    LENGTH(ename)                 AS name_len,
    SUBSTR(ename, 1, 3)           AS first_3_chars,
    INSTR(ename, 'A')             AS pos_of_a,
    CONCAT(ename, ' is a ', job)  AS emp_info,
    REPLACE(job, 'SALESMAN', 'SALES_REP') AS new_job_title
FROM emp;
```
- Scalar functions — execute once per row.

#### Q13: Numeric Functions
```sql
SELECT
    sal,
    ROUND(sal / 3, 2)    AS rounded_div_3,
    TRUNCATE(sal / 3, 2) AS truncated_div_3,
    MOD(sal, 1000)       AS mod_1000,
    SQRT(sal)            AS sqrt_sal,
    CEIL(sal / 300)      AS ceil_val,
    FLOOR(sal / 300)     AS floor_val
FROM emp;
```

---

### Part 6 — Window Functions

#### Q14: RANK vs DENSE_RANK
```sql
SELECT
    empno, ename, sal, deptno,
    RANK()       OVER(ORDER BY sal DESC) AS emp_rank,
    DENSE_RANK() OVER(ORDER BY sal DESC) AS emp_dense_rank
FROM emp;
```
- `RANK()` leaves gaps after ties (`1, 2, 2, 4`).
- `DENSE_RANK()` does not leave gaps (`1, 2, 2, 3`).

#### Q15: LAG & LEAD — Previous/Next Row Values
```sql
SELECT
    empno, ename, sal,
    LAG(sal)  OVER(ORDER BY empno) AS prev_sal,
    LEAD(sal) OVER(ORDER BY empno) AS next_sal
FROM emp;
```
- `LAG(col)` looks back 1 row; `LEAD(col)` looks forward 1 row.
- Avoids the need for a self-join to access adjacent row values.

#### Q16: Cumulative Running Total
```sql
SELECT
    empno, ename, sal,
    SUM(sal) OVER(
        ORDER BY empno
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM emp;
```
- `ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW` = expanding window from row 1 to current.
- Calculates cumulative salary from the first record up to the current row.

#### Q17: Partitioned Ranking (Rank Within Each Department)
```sql
SELECT
    empno, ename, deptno, sal,
    ROW_NUMBER() OVER(PARTITION BY deptno ORDER BY sal DESC) AS dept_rank
FROM emp;
```
- `PARTITION BY deptno` resets the window for each department independently.

---

## 💡 Interview Tips

- **WHERE vs HAVING**: `WHERE` filters rows before grouping; `HAVING` filters after.
- **NULL arithmetic**: any expression with `NULL` returns `NULL` — always use `IFNULL`.
- **`col = NULL` never works** — always use `IS NULL`.
- **RANK gaps** after ties (`1, 2, 2, 4`); **DENSE_RANK** no gaps (`1, 2, 2, 3`).
- **LAG/LEAD** avoid self-joins for accessing previous/next row values.
- **Running total** = `SUM() OVER(... ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)`.
- **`PARTITION BY`** inside `OVER()` resets window per group — like GROUP BY for window functions.
