# 04 — Joins, Subqueries & Views

> **Topics Covered:** `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `SELF JOIN`, Non-Equi Join, `UNION` / `UNION ALL`, Correlated Subqueries, `CREATE VIEW`, `CASE WHEN`

---

## 📌 Quick Reference

| Concept | Purpose |
|---------|---------|
| `INNER JOIN` | Only rows matching on both sides |
| `LEFT JOIN` | All left rows + matched right rows (NULL if no match) |
| `RIGHT JOIN` | All right rows + matched left rows (NULL if no match) |
| `SELF JOIN` | Join a table to itself (e.g., employee → manager) |
| Non-Equi Join | Join using `BETWEEN`, `<`, `>` instead of `=` |
| `UNION ALL` | Stack results vertically — keeps duplicates |
| `UNION` | Stack results vertically — removes duplicates |
| Correlated Subquery | Subquery referencing outer query column (row-by-row) |
| `CREATE VIEW` | Save a query as a reusable virtual table |
| `CASE WHEN` | Conditional logic inline in SELECT |

---

## 🎯 Key Concepts

### JOIN Types Comparison

| Join Type | Description | Result |
|-----------|-------------|--------|
| **`INNER JOIN`** | Matching rows only | Rows where condition is TRUE in **both** tables |
| **`LEFT JOIN`** | All left + matching right | Left rows without match → `NULL` for right columns |
| **`RIGHT JOIN`** | All right + matching left | Right rows without match → `NULL` for left columns |
| **`SELF JOIN`** | Same table twice with aliases | Used for hierarchical data (employee → manager) |
| **Non-Equi Join** | Join condition uses `BETWEEN`, `<`, `>` | Salary grade lookups, date range lookups |

---

### Regular Subquery vs Correlated Subquery

| Feature | Regular Subquery | Correlated Subquery |
|---------|-----------------|---------------------|
| **Execution** | Runs **ONCE** | Runs **ONCE PER ROW** of outer query |
| **Outer Reference** | Independent | References outer query column |
| **Performance** | Faster | Slower on large tables |

---

### UNION vs UNION ALL

| Feature | `UNION` | `UNION ALL` |
|---------|---------|-------------|
| **Duplicates** | Removed | Kept |
| **Performance** | Slower (deduplication step) | Faster |
| **Use when** | Need distinct combined rows | Need all rows including duplicates |

---

## 🔍 Query-by-Query Analysis

### Q1: INNER JOIN — Employees with Departments
```sql
SELECT e.empno, e.ename, e.sal, d.deptno, d.dname
FROM emp e
INNER JOIN dept d ON d.deptno = e.deptno
ORDER BY e.empno;
```
- Returns only employees who belong to an existing department.
- `INNER JOIN ... ON` returns rows where the join condition is TRUE in both tables.

---

### Q2: LEFT JOIN — All Employees (with or without Department)
```sql
SELECT e.empno, e.ename, e.sal, e.deptno, d.dname, d.loc
FROM emp e
LEFT OUTER JOIN dept d ON e.deptno = d.deptno
ORDER BY e.deptno;
```
- Preserves **all** employee rows from left table `emp`.
- If no matching department, `dname` and `loc` show `NULL`.

---

### Q3: SELF JOIN — Employee to Manager Lookup
```sql
SELECT e.empno, e.ename, e.sal, e.deptno, m.ename AS Manager_Name
FROM emp e
JOIN emp m ON e.mgr = m.empno;
```
- Aliases `emp` as `e` (worker) and `m` (manager).
- Joins worker's `mgr` column to manager's `empno` — same table, different roles.

---

### Q4: Non-Equi Join — Salary Grade Lookup
```sql
SELECT e.empno, e.ename, e.sal, s.grade
FROM emp e
JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal;
```
- Uses `BETWEEN` instead of `=` as the join condition.
- Maps each employee's salary to a numeric grade range in `salgrade`.

---

### Q5: UNION ALL vs UNION
```sql
-- Keeps duplicate rows:
SELECT * FROM fruit1 UNION ALL SELECT * FROM fruit2;

-- Removes duplicate rows:
SELECT * FROM fruit1 UNION SELECT * FROM fruit2;
```
- `UNION ALL` = stack all rows (faster).
- `UNION` = stack + deduplicate (slower).

---

### Q6: Correlated Subquery — Employees Earning Above Their Dept Average
```sql
SELECT * FROM emp e
WHERE sal > (
    SELECT AVG(sal)
    FROM emp
    WHERE deptno = e.deptno    -- references outer query alias
)
ORDER BY deptno ASC;
```
- Inner subquery re-evaluates `AVG(sal)` **for each employee's department**.
- `e.deptno` is the outer query reference that makes it correlated.

---

### Q7: CREATE VIEW — Department Salary Summary
```sql
CREATE VIEW EMP_V4 AS
SELECT
    d.dname,
    MAX(e.sal) AS max_sal,
    MIN(e.sal) AS min_sal,
    AVG(e.sal) AS avg_sal,
    SUM(e.sal) AS sum_sal,
    COUNT(e.sal) AS nofemp
FROM emp e
JOIN dept d ON e.deptno = d.deptno
GROUP BY d.dname;
```
- Saves the complex JOIN + GROUP BY query as a virtual table `EMP_V4`.
- Query it later like a normal table: `SELECT * FROM EMP_V4;`

---

### Q8: CASE WHEN — Salary Category Label
```sql
SELECT
    empno, ename, sal,
    CASE
        WHEN sal >= 5000 THEN 'EXCELLENT'
        WHEN sal >= 3000 THEN 'AVERAGE'
        ELSE 'POOR'
    END AS sal_desc
FROM emp;
```
- Evaluates conditions in **sequential order** — first match wins.
- `ELSE` is the default fallback if no condition matches.

---

## 💡 Interview Tips

- **INNER JOIN** = intersection; **LEFT JOIN** = left table dominant.
- **SELF JOIN** requires two different aliases for the same table.
- **Non-Equi Join** — use `BETWEEN` to range-lookup salary grades, date ranges.
- **Correlated subquery** runs per row — use `EXISTS` or `JOIN` for better performance on large datasets.
- **UNION vs UNION ALL**: prefer `UNION ALL` when duplicates don't matter — it's faster.
- **Views** do not store data — they store the query definition. Data is fetched live on access.
- **CASE WHEN** evaluates conditions in order — put the most restrictive condition first.
