<div align="center">

![SQL](https://img.shields.io/badge/SQL-MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![Day 3 Joins](https://img.shields.io/badge/Day_3-Joins_%26_Subqueries-4CAF50?style=for-the-badge)
![Level](https://img.shields.io/badge/Level-Intermediate-FF9800?style=for-the-badge)

# Day 3 Joins, Subqueries, Views & CASE Statements Notes

**Comprehensive SQL study guide covering Relational Joins (`INNER`, `LEFT`, `RIGHT`, `NATURAL`, `SELF`, Non-Equi Joins), Set Operators (`UNION`, `UNION ALL`, `EXISTS`), Subqueries (Single-row, Multi-row, Correlated), Database `VIEW`s, and `CASE WHEN` conditional expressions.**

---

</div>

## 📚 Overview

This module covers **Advanced Relational Queries**:
1. **Relational Joins**: `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `NATURAL JOIN`, `SELF JOIN`, Non-Equi `BETWEEN` joins
2. **Set Operators & Semi-Joins**: `UNION ALL`, `UNION`, `EXISTS`, `NOT EXISTS`
3. **Subqueries**: Scalar subqueries, multi-row `IN`/`NOT IN`, `ALL`/`ANY` quantifiers, and row-by-row Correlated Subqueries
4. **Database Objects & Expressions**: `CREATE VIEW`, `CASE WHEN ... THEN ... ELSE ... END`

---

## 🎯 Key Interview Concepts & Comparison Tables

### 1. `INNER JOIN` vs `LEFT JOIN` vs `RIGHT JOIN`

| Join Type | Description | Result Set Behavior |
|-----------|-------------|---------------------|
| **`INNER JOIN`** | Returns only matching rows | Rows where join condition is TRUE in **BOTH** tables |
| **`LEFT OUTER JOIN`** | Returns **ALL left table rows** + matching right rows | Left rows without a match display `NULL` for right table columns |
| **`RIGHT OUTER JOIN`** | Returns **ALL right table rows** + matching left rows | Right rows without a match display `NULL` for left table columns |

---

### 2. Regular Subquery vs Correlated Subquery

| Feature | Regular (Independent) Subquery | Correlated Subquery |
|---------|--------------------------------|---------------------|
| **Execution Frequency** | Executes **ONCE** before the outer query runs | Executes **ONCE PER ROW** processed by the outer query |
| **Outer Query Reference** | Independent of outer query columns | References columns from the outer query (e.g., `WHERE deptno = outer.deptno`) |
| **Performance** | Faster for static lookups | Can be slower on large tables due to repeated execution |

---

## 🔍 Detailed Query-by-Query Analysis

---

### Query 1: Inner Join (`INNER JOIN ... ON`)
```sql
SELECT e.empno, e.ename, e.sal, d.deptno, d.dname
FROM emp e
INNER JOIN dept d ON d.deptno = e.deptno
ORDER BY e.empno;
```
* **What is this query?** Relational Inner Join statement.
* **What does it do?** Matches employees with their department names where `deptno` values exist in both tables.
* **How keyword works:** `INNER JOIN ... ON condition` returns rows only when the join condition evaluates to TRUE in both relations.

---

### Query 2: Left Outer Join (`LEFT JOIN ... ON`)
```sql
SELECT e.empno, e.ename, e.sal, e.deptno, d.dname, d.loc
FROM emp e
LEFT OUTER JOIN dept d ON e.deptno = d.deptno
ORDER BY e.deptno;
```
* **What is this query?** Left Outer Join statement.
* **What does it do?** Preserves all employee rows from left table `emp`, attaching department details if matched, or `NULL` if unmatched.
* **How keyword works:** `LEFT OUTER JOIN` retains all records from the left relation.

---

### Query 3: Self Join (Hierarchical Manager Lookup)
```sql
SELECT e.empno, e.ename, e.sal, e.deptno, m.ename AS Manager_Name
FROM emp e
JOIN emp m ON e.mgr = m.empno;
```
* **What is this query?** Self-referential join statement.
* **What does it do?** Matches each worker (`e`) with their manager (`m`) within the same `emp` table.
* **How keyword works:** Aliasing `emp` as `e` (worker) and `m` (manager) joins worker's `mgr` column to manager's `empno`.

---

### Query 4: Non-Equi Join Using Range (`BETWEEN`)
```sql
SELECT e.empno, e.ename, e.sal, s.grade 
FROM emp e 
JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal;
```
* **What is this query?** Non-equality condition join statement.
* **What does it do?** Matches employee salaries against low/high salary bounds in `salgrade` table to assign numeric salary grades.
* **How keyword works:** `ON e.sal BETWEEN s.losal AND s.hisal` joins tables using range conditions instead of equality (`=`).

---

### Query 5: Set Operator (`UNION ALL` vs `UNION`)
```sql
SELECT * FROM fruit1 UNION ALL SELECT * FROM fruit2; -- Retains duplicates
SELECT * FROM fruit1 UNION SELECT * FROM fruit2;     -- Removes duplicates
```
* **What is this query?** Vertical result set combining queries.
* **What does it do?** `UNION ALL` stacks datasets retaining duplicate rows; `UNION` stacks datasets performing duplicate removal.
* **How keyword works:** `UNION ALL` preserves all rows; `UNION` applies distinct filtering vertically across query results.

---

### Query 6: Correlated Subquery
```sql
SELECT * FROM emp e
WHERE sal > (
    SELECT AVG(sal) 
    FROM emp 
    WHERE deptno = e.deptno
)
ORDER BY deptno ASC;
```
* **What is this query?** Correlated subquery filtering statement.
* **What does it do?** Selects employees whose salary is greater than the average salary of **their own department**.
* **How keyword works:** Inner subquery references outer alias `e.deptno`, re-calculating the department mean for every outer table row.

---

### Query 7: Create Database View (`CREATE VIEW`)
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
* **What is this query?** DDL Aggregate View creation statement.
* **What does it do?** Saves a complex `JOIN` + `GROUP BY` query definition as a virtual view table named `EMP_V4`.
* **How keyword works:** `CREATE VIEW view_name AS SELECT` creates a virtual table representation stored in database metadata.

---

### Query 8: Searched `CASE` Expression
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
* **What is this query?** Searched `CASE` conditional statement.
* **What does it do?** Categorizes employee salaries into 'EXCELLENT', 'AVERAGE', or 'POOR' labels.
* **How keyword works:** `CASE WHEN condition THEN value ... ELSE default END` evaluates conditions in sequential order.

---

<div align="center">

[![Previous Notes](https://img.shields.io/badge/←_Previous-Day_3_Date_Aggregate_Notes-4CAF50?style=for-the-badge)](./Day_3.md)
[![Next Notes](https://img.shields.io/badge/Next-Day_4_CTEs_Transactions_Procedures_Notes-2196F3?style=for-the-badge)](./Day_4.md)

</div>
