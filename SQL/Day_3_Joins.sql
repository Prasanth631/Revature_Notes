/* ============================================================================
   DAY 3 JOINS, SET OPERATORS, SUBQUERIES, VIEWS & CASE STATEMENTS
   ============================================================================
   Author: Prasanth Golla
   Description: Comprehensive SQL queries covering INNER JOIN, LEFT/RIGHT JOIN,
                NATURAL JOIN, SELF JOIN, Non-Equi Joins, UNION/UNION ALL, EXISTS,
                Single/Multi-row Subqueries, Correlated Subqueries, Database VIEWS,
                and CASE WHEN conditional statements.
   ============================================================================ */

-- ============================================================================
-- SECTION 1: RELATIONAL JOINS (INNER, LEFT, RIGHT, NATURAL, SELF)
-- ============================================================================

/*
   QUERY 1: Select Active Database
   - WHAT IS THIS QUERY? Session context setting.
   - WHAT DOES IT DO? Sets 'trainingdb' as active database.
   - HOW KEYWORD WORKS: `USE` directs session database focus.
   - RESULT: Database changed.
*/
USE trainingdb;

/*
   QUERY 2: Inner Join (Matches in Both Tables)
   - WHAT IS THIS QUERY? Relational Inner Join query.
   - WHAT DOES IT DO? Combines matching rows from 'emp' and 'dept' where `deptno` values match.
   - HOW KEYWORD WORKS: `INNER JOIN ... ON condition` returns only rows that satisfy the join condition in BOTH tables.
   - RESULT: Employees with their matching department names.
*/
SELECT 
    e.empno, e.ename, e.sal, d.deptno, d.dname
FROM emp e
INNER JOIN dept d ON d.deptno = e.deptno
ORDER BY e.empno;

/*
   QUERY 3: Left Outer Join (All Left Rows + Matching Right Rows)
   - WHAT IS THIS QUERY? Left Outer Join query.
   - WHAT DOES IT DO? Returns ALL employees from left table 'emp', plus department info from right table 'dept' (filling NULL if employee has no department).
   - HOW KEYWORD WORKS: `LEFT OUTER JOIN ... ON` preserves all rows from left table regardless of match in right table.
   - RESULT: All employees listed, including unassigned ones.
*/
SELECT 
    e.empno, e.ename, e.sal, e.deptno, d.dname, d.loc
FROM emp e
LEFT OUTER JOIN dept d ON e.deptno = d.deptno
ORDER BY e.deptno;

/*
   QUERY 4: Right Outer Join (All Right Rows + Matching Left Rows)
   - WHAT IS THIS QUERY? Right Outer Join query.
   - WHAT DOES IT DO? Returns ALL departments from right table 'dept', including departments with 0 assigned employees.
   - HOW KEYWORD WORKS: `RIGHT OUTER JOIN ... ON` preserves all rows from right table.
   - RESULT: All departments listed, even empty ones (e.g., Dept 40 OPERATIONS).
*/
SELECT 
    e.empno, e.ename, e.sal, d.deptno, d.dname, d.loc
FROM emp e
RIGHT OUTER JOIN dept d ON e.deptno = d.deptno
ORDER BY d.deptno;

/*
   QUERY 5: Natural Join (Auto-Join on Matching Column Names)
   - WHAT IS THIS QUERY? Automatic join query.
   - WHAT DOES IT DO? Implicitly joins 'emp' and 'dept' on their common column name (`deptno`).
   - HOW KEYWORD WORKS: `NATURAL JOIN` automatically joins on all columns with identical names in both tables.
   - RESULT: Matched rows without explicit `ON` clause.
*/
SELECT empno, ename, sal, deptno, dname
FROM emp
NATURAL JOIN dept;

/*
   QUERY 6: Self Join (Joining a Table to Itself for Hierarchical Links)
   - WHAT IS THIS QUERY? Self-referential join query.
   - WHAT DOES IT DO? Links each employee (`e`) to their manager (`m`) within the same 'emp' table.
   - HOW KEYWORD WORKS: `emp e JOIN emp m ON e.mgr = m.empno` aliases the same table twice to match worker's `mgr` to manager's `empno`.
   - RESULT: Employee name alongside Manager name.
*/
SELECT 
    e.empno, e.ename, e.sal, e.deptno, 
    m.ename AS Manager_Name
FROM emp e
JOIN emp m ON e.mgr = m.empno;

/*
   QUERY 7: Non-Equi Join Using Range Condition (`BETWEEN`)
   - WHAT IS THIS QUERY? Non-equality condition join.
   - WHAT DOES IT DO? Matches employee salaries against `salgrade` table to assign salary grade levels.
   - HOW KEYWORD WORKS: `JOIN ... ON e.sal BETWEEN s.losal AND s.hisal` joins tables using range comparisons instead of equality (`=`).
   - RESULT: Employee salary with numeric grade (1 to 5).
*/
SELECT e.empno, e.ename, e.sal, s.grade 
FROM emp e 
JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal;

/*
   QUERY 8: Multi-Table Left Join (Employees + Managers + Departments + Salgrades)
   - WHAT IS THIS QUERY? Complex 4-table join query.
   - WHAT DOES IT DO? Combines employee data, manager name, department details, and salary grade in a single result.
   - HOW KEYWORD WORKS: Chains multiple `LEFT JOIN ... ON` clauses to build complete employee profile.
   - RESULT: Complete consolidated workforce overview.
*/
SELECT 
    e.empno, e.ename, e.sal, e.mgr,
    m.ename AS manager_name,
    d.dname, d.loc, s.grade
FROM emp e 
LEFT JOIN emp m ON e.mgr = m.empno
LEFT JOIN dept d ON e.deptno = d.deptno
LEFT JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal;


-- ============================================================================
-- SECTION 2: SET OPERATORS (UNION vs UNION ALL) & EXISTS
-- ============================================================================

/*
   QUERY 9: Set Operations - UNION ALL vs UNION
   - WHAT IS THIS QUERY? Vertical result combining query.
   - WHAT DOES IT DO? `UNION ALL` combines results keeping duplicates; `UNION` combines results removing duplicates.
   - HOW KEYWORD WORKS: `UNION ALL` retains all rows; `UNION` performs distinct deduplication.
   - RESULT: Combined vertical dataset.
*/
CREATE TABLE fruit1 (name VARCHAR(30));
CREATE TABLE fruit2 (name VARCHAR(30));
INSERT INTO fruit1 VALUES ('apple'),('banana'),('fig'),('orange');
INSERT INTO fruit2 VALUES ('apple'),('banana'),('grapes'),('orange');

SELECT * FROM fruit1 UNION ALL SELECT * FROM fruit2; -- 8 rows (duplicates kept)
SELECT * FROM fruit1 UNION SELECT * FROM fruit2;     -- 5 rows (duplicates removed)

/*
   QUERY 10: Correlated Subquery EXISTS & NOT EXISTS
   - WHAT IS THIS QUERY? Semi-join set comparison query.
   - WHAT DOES IT DO? `EXISTS` finds common fruits; `NOT EXISTS` finds fruits in fruit1 not present in fruit2.
   - HOW KEYWORD WORKS: `EXISTS (subquery)` evaluates to TRUE if subquery returns 1+ rows.
   - RESULT: Filtered fruit sets.
*/
SELECT * FROM fruit1 WHERE EXISTS (SELECT * FROM fruit2 WHERE fruit1.name = fruit2.name);
SELECT * FROM fruit1 WHERE NOT EXISTS (SELECT * FROM fruit2 WHERE fruit1.name = fruit2.name);


-- ============================================================================
-- SECTION 3: SUBQUERIES (SINGLE-ROW, MULTI-ROW & CORRELATED)
-- ============================================================================

/*
   QUERY 11: Single-Row Scalar Subquery
   - WHAT IS THIS QUERY? Basic subquery in WHERE clause.
   - WHAT DOES IT DO? Finds all employees earning more than employee 'JONES'.
   - HOW KEYWORD WORKS: Subquery `(SELECT sal FROM emp WHERE ename = 'JONES')` executes first, passing value 2975 to main query.
   - RESULT: Employees with salary >= 2975.
*/
SELECT * FROM emp 
WHERE sal >= (SELECT sal FROM emp WHERE ename = 'JONES');

/*
   QUERY 12: Subquery with Aggregate Function
   - WHAT IS THIS QUERY? Subquery using aggregate mean.
   - WHAT DOES IT DO? Finds all employees earning above company average salary.
   - HOW KEYWORD WORKS: `(SELECT AVG(sal) FROM emp)` evaluates average salary first.
   - RESULT: Above-average earners.
*/
SELECT * FROM emp 
WHERE sal >= (SELECT AVG(sal) FROM emp);

/*
   QUERY 13: Find Second Highest Salary (Nth Max Subquery)
   - WHAT IS THIS QUERY? Nested maximum subquery.
   - WHAT DOES IT DO? Finds the second highest salary in the company.
   - HOW KEYWORD WORKS: Inner subquery finds `MAX(sal)` (5000); outer query finds `MAX(sal)` below 5000 (3000).
   - RESULT: 3000.
*/
SELECT MAX(sal) FROM emp 
WHERE sal < (SELECT MAX(sal) FROM emp);

/*
   QUERY 14: Multi-Row Subquery using IN / NOT IN
   - WHAT IS THIS QUERY? Multi-row list comparison subquery.
   - WHAT DOES IT DO? `IN` finds departments that have employees; `NOT IN` finds departments with zero employees.
   - HOW KEYWORD WORKS: Subquery returns a set of `deptno` values evaluated by `IN` / `NOT IN`.
   - RESULT: Active or empty department lists.
*/
SELECT * FROM dept WHERE deptno IN (SELECT DISTINCT deptno FROM emp);
SELECT * FROM dept WHERE deptno NOT IN (SELECT DISTINCT deptno FROM emp);

/*
   QUERY 15: Subquery with ALL / ANY Quantifiers
   - WHAT IS THIS QUERY? Quantified comparison subquery.
   - WHAT DOES IT DO? `> ALL` finds employees earning more than ALL department average salaries; `> ANY` finds employees earning more than at least ONE department average.
   - HOW KEYWORD WORKS: `> ALL(list)` requires condition to hold for all list items; `> ANY(list)` requires condition for at least one item.
   - RESULT: Filtered employee sets.
*/
SELECT * FROM emp WHERE sal > ALL (SELECT AVG(sal) FROM emp GROUP BY deptno);
SELECT * FROM emp WHERE sal > ANY (SELECT AVG(sal) FROM emp GROUP BY deptno);

/*
   QUERY 16: Correlated Subquery (Evaluated Row-by-Row)
   - WHAT IS THIS QUERY? Correlated subquery statement.
   - WHAT DOES IT DO? Finds employees earning more than the average salary of THEIR OWN department.
   - HOW KEYWORD WORKS: Inner query references outer query table alias `WHERE deptno = e.deptno`, re-evaluating for every outer row.
   - RESULT: High earners within each department.
*/
SELECT * FROM emp e
WHERE sal > (
    SELECT AVG(sal) 
    FROM emp 
    WHERE deptno = e.deptno
)
ORDER BY deptno ASC;


-- ============================================================================
-- SECTION 4: DATABASE VIEWS & CASE CONDITIONAL STATEMENTS
-- ============================================================================

/*
   QUERY 17: Create Simple Database View
   - WHAT IS THIS QUERY? DDL View creation query.
   - WHAT DOES IT DO? Creates a virtual view `emp_v1` renaming columns with friendly alias headers.
   - HOW KEYWORD WORKS: `CREATE VIEW view_name AS SELECT ...` stores a saved query definition in the database catalog.
   - RESULT: View 'EMP_V1' created.
*/
CREATE VIEW EMP_V1 AS
SELECT 
    EMPNO AS EMPLOYEE_NUMBER,
    ENAME AS EMPLOYEE_NAME,
    SAL AS SALARY,
    JOB AS JOB_DESC,
    MGR AS MANAGER_NAME,
    COMM AS COMMISSION,
    DEPTNO AS DEPARTMENT_NO
FROM EMP;

/*
   QUERY 18: Querying Database Views
   - WHAT IS THIS QUERY? DML query on virtual view.
   - WHAT DOES IT DO? Selects high-salary employees from the `EMP_V1` view.
   - HOW KEYWORD WORKS: Treats view as a virtual table.
   - RESULT: Returns filtered view records.
*/
SELECT EMPLOYEE_NAME, SALARY FROM EMP_V1 
WHERE SALARY >= 3000 
ORDER BY SALARY DESC;

/*
   QUERY 19: Create Complex Aggregate View
   - WHAT IS THIS QUERY? DDL Aggregate View creation.
   - WHAT DOES IT DO? Creates view `EMP_V4` summarizing department-level salary metrics.
   - HOW KEYWORD WORKS: Encapsulates complex `JOIN` and `GROUP BY` logic inside a reusable view object.
   - RESULT: View 'EMP_V4' created.
*/
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

/*
   QUERY 20: Searched CASE Expression
   - WHAT IS THIS QUERY? Conditional Logic Expression in SELECT.
   - WHAT DOES IT DO? Categorizes employee salary into 'EXCELLENT', 'AVERAGE', or 'POOR' buckets.
   - HOW KEYWORD WORKS: `CASE WHEN condition THEN result ELSE default END` evaluates conditions sequentially.
   - RESULT: Evaluated salary grade column.
*/
SELECT 
    empno, ename, sal,
    CASE
        WHEN sal >= 5000 THEN 'EXCELLENT'
        WHEN sal >= 3000 THEN 'AVERAGE'
        ELSE 'POOR'
    END AS sal_desc 
FROM emp;

/*
   QUERY 21: Simple CASE Expression
   - WHAT IS THIS QUERY? Value-matching CASE statement.
   - WHAT DOES IT DO? Maps numeric `deptno` values to human-readable department labels.
   - HOW KEYWORD WORKS: `CASE column WHEN val THEN result ... END` matches column value directly.
   - RESULT: Readable department label column.
*/
SELECT 
    empno, ename, sal,
    CASE deptno
        WHEN 10 THEN 'ACCOUNTING'
        WHEN 20 THEN 'RESEARCH'
        WHEN 30 THEN 'SALES'
        ELSE 'OTHER'
    END AS dept_name 
FROM emp;