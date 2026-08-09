/* ============================================================================
   SQL COMMANDS MASTER REFERENCE - DDL, DML, OPERATORS & BUILT-IN FUNCTIONS
   ============================================================================
   Author: Prasanth Golla
   Description: Complete reference script covering Table Creation, Data Seeding,
                WHERE Clause Filters, Comparison Operators, Pattern Matching (LIKE),
                Range Filtering (BETWEEN), Null Handling (IS NULL), String Functions,
                and Numeric Functions.
   ============================================================================ */

-- ============================================================================
-- SECTION 1: SCHEMA SETUP & DATA SEEDING (DEPT, EMP, SALGRADE)
-- ============================================================================

/*
   QUERY 1: Select Active Database
   - WHAT IS THIS QUERY? Session context setting statement.
   - WHAT DOES IT DO? Sets 'trainingdb' as the working database.
   - HOW KEYWORD WORKS: `USE` directs session schema context.
   - RESULT: Database changed.
*/
USE trainingdb;

/*
   QUERY 2: Create Department Table
   - WHAT IS THIS QUERY? DDL table creation statement.
   - WHAT DOES IT DO? Creates 'dept' parent table storing department details.
   - HOW KEYWORD WORKS: `deptno INT PRIMARY KEY` defines primary lookup key.
   - RESULT: Table 'dept' created.
*/
CREATE TABLE IF NOT EXISTS dept (
    deptno INT PRIMARY KEY,
    dname VARCHAR(30) NOT NULL,
    loc VARCHAR(30)
);

/*
   QUERY 3: Create Employee Table
   - WHAT IS THIS QUERY? DDL table creation query.
   - WHAT DOES IT DO? Creates 'emp' table storing employee workforce details.
   - HOW KEYWORD WORKS: Defines columns `empno`, `ename`, `job`, `mgr`, `hiredate`, `sal`, `comm`, `deptno`.
   - RESULT: Table 'emp' created.
*/
CREATE TABLE IF NOT EXISTS emp (
    empno INT PRIMARY KEY,
    ename VARCHAR(30) NOT NULL,
    job VARCHAR(30),
    mgr INT,
    hiredate DATE,
    sal DECIMAL(10,2) NOT NULL,
    comm DECIMAL(10,2),
    deptno INT
);

/*
   QUERY 4: Create Salary Grade Table
   - WHAT IS THIS QUERY? DDL lookup table creation query.
   - WHAT DOES IT DO? Creates 'salgrade' table storing salary range bands (grade 1 to 5).
   - HOW KEYWORD WORKS: `grade INT PRIMARY KEY` defines lookup key for low/high salary bounds.
   - RESULT: Table 'salgrade' created.
*/
CREATE TABLE IF NOT EXISTS salgrade (
    grade INT PRIMARY KEY,
    losal DECIMAL(10,2) NOT NULL,
    hisal DECIMAL(10,2) NOT NULL
);


-- ============================================================================
-- SECTION 2: WHERE CLAUSE COMPARISON OPERATORS (=, !=, <>, >, <, >=, <=)
-- ============================================================================

/*
   QUERY 5: Filter Rows by Exact Value Match (=)
   - WHAT IS THIS QUERY? Basic DML WHERE clause selection query.
   - WHAT DOES IT DO? Selects employees belonging to department 10.
   - HOW KEYWORD WORKS: `WHERE deptno = 10` evaluates equality row by row.
   - RESULT: Employees in dept 10 (KING, CLARK, etc.).
*/
SELECT empno, ename, sal, job, deptno, hiredate 
FROM emp 
WHERE deptno = 10;

/*
   QUERY 6: Filter Rows by String Match
   - WHAT IS THIS QUERY? String equality comparison query.
   - WHAT DOES IT DO? Selects employees with job title 'MANAGER'.
   - HOW KEYWORD WORKS: `WHERE job = 'MANAGER'` performs case-insensitive string comparison in MySQL.
   - RESULT: Managers (BLAKE, CLARK, JONES).
*/
SELECT empno, ename, sal, job, deptno, hiredate 
FROM emp 
WHERE job = 'MANAGER';

/*
   QUERY 7: Filter Rows by Inequality (<> and !=)
   - WHAT IS THIS QUERY? Inequality comparison query.
   - WHAT DOES IT DO? Selects all employees whose job is NOT 'MANAGER'.
   - HOW KEYWORD WORKS: Both `<>` and `!=` represent 'Not Equal To' operator in SQL standards.
   - RESULT: Non-manager employees.
*/
SELECT empno, ename, sal, job, deptno, hiredate 
FROM emp 
WHERE job <> 'MANAGER';

/*
   QUERY 8: Filter Rows by Greater Than / Less Than Operators
   - WHAT IS THIS QUERY? Numeric relational operator query.
   - WHAT DOES IT DO? Selects employees earning salary > 3000, >= 3000, < 3000, and <= 3000.
   - HOW KEYWORD WORKS: `>`, `>=`, `<`, `<=` evaluate numeric relational inequalities.
   - RESULT: Filtered employee sets.
*/
SELECT empno, ename, sal, job, deptno FROM emp WHERE sal > 3000;
SELECT empno, ename, sal, job, deptno FROM emp WHERE sal >= 3000;
SELECT empno, ename, sal, job, deptno FROM emp WHERE sal < 3000;
SELECT empno, ename, sal, job, deptno FROM emp WHERE sal <= 3000;


-- ============================================================================
-- SECTION 3: LIST MEMBERSHIP (IN, NOT IN) & PATTERN MATCHING (LIKE)
-- ============================================================================

/*
   QUERY 9: Filter Rows Using IN / NOT IN Operators
   - WHAT IS THIS QUERY? List membership comparison query.
   - WHAT DOES IT DO? `IN (10, 30)` selects employees in dept 10 or 30; `NOT IN (10, 30)` selects employees outside depts 10 and 30.
   - HOW KEYWORD WORKS: `IN (val1, val2)` replaces multiple `OR` conditions (`deptno = 10 OR deptno = 30`).
   - RESULT: Filtered employee records.
*/
SELECT empno, ename, sal, job, deptno FROM emp WHERE deptno IN (10, 30);
SELECT empno, ename, sal, job, deptno FROM emp WHERE deptno NOT IN (10, 30);

/*
   QUERY 10: Pattern Matching Wildcards (LIKE '%', '_')
   - WHAT IS THIS QUERY? String pattern matching query using wildcards.
   - WHAT DOES IT DO?
     - `LIKE 'A%'`: Names starting with 'A'.
     - `LIKE '%N'`: Names ending with 'N'.
     - `LIKE '%A%'`: Names containing letter 'A' anywhere.
     - `LIKE '_A%'`: Names with 'A' as second character.
   - HOW KEYWORD WORKS: `%` matches 0 or more characters; `_` matches exactly 1 character.
   - RESULT: Pattern-matched employee records.
*/
SELECT empno, ename FROM emp WHERE ename LIKE 'A%';
SELECT empno, ename FROM emp WHERE ename LIKE '%N';
SELECT empno, ename FROM emp WHERE ename LIKE '%A%';
SELECT empno, ename FROM emp WHERE ename LIKE '_A%';


-- ============================================================================
-- SECTION 4: RANGE FILTERING (BETWEEN) & NULL HANDLING (IS NULL)
-- ============================================================================

/*
   QUERY 11: Inclusive Range Filtering (BETWEEN ... AND ...)
   - WHAT IS THIS QUERY? Range evaluation query.
   - WHAT DOES IT DO? Selects employees earning between 1000 and 3000 inclusive.
   - HOW KEYWORD WORKS: `sal BETWEEN 1000 AND 3000` is equivalent to `sal >= 1000 AND sal <= 3000`.
   - RESULT: Employees with salary in range [1000, 3000].
*/
SELECT empno, ename, sal FROM emp 
WHERE sal BETWEEN 1000 AND 3000;

/*
   QUERY 12: Null Value Testing (IS NULL / IS NOT NULL)
   - WHAT IS THIS QUERY? Null evaluation statement.
   - WHAT DOES IT DO? `IS NULL` finds employees with no commission; `IS NOT NULL` finds employees receiving commission.
   - HOW KEYWORD WORKS: In SQL, `column = NULL` is invalid! You MUST use `IS NULL` or `IS NOT NULL` to evaluate missing values.
   - RESULT: Filtered commission records.
*/
SELECT empno, ename, comm FROM emp WHERE comm IS NULL;
SELECT empno, ename, comm FROM emp WHERE comm IS NOT NULL;


-- ============================================================================
-- SECTION 5: STRING FUNCTIONS & NUMERIC MATH FUNCTIONS
-- ============================================================================

/*
   QUERY 13: String Manipulation Functions
   - WHAT IS THIS QUERY? Built-in string transform function query.
   - WHAT DOES IT DO? Demonstrates `UPPER()`, `LOWER()`, `LENGTH()`, `SUBSTR()`, `INSTR()`, `CONCAT()`, `REPLACE()`, `TRIM()`, `LPAD()`.
   - HOW KEYWORD WORKS:
     - `UPPER(str)` / `LOWER(str)`: Case conversion.
     - `LENGTH(str)`: Returns character count.
     - `SUBSTR(str, pos, len)`: Extracts substring.
     - `INSTR(str, sub)`: Returns 1-based position of substring.
     - `CONCAT(s1, s2)`: Joins text strings.
     - `REPLACE(str, from, to)`: Replaces text occurrences.
   - RESULT: Transformed text fields.
*/
SELECT 
    ename,
    LOWER(ename) AS lower_name,
    LENGTH(ename) AS name_len,
    SUBSTR(ename, 1, 3) AS first_3_chars,
    INSTR(ename, 'A') AS pos_of_a,
    CONCAT(ename, ' is a ', job) AS emp_info,
    REPLACE(job, 'SALESMAN', 'SALES_REP') AS new_job_title
FROM emp;

/*
   QUERY 14: Numeric Mathematical Functions
   - WHAT IS THIS QUERY? Built-in numeric math function query.
   - WHAT DOES IT DO? Demonstrates `ROUND()`, `TRUNCATE()`, `MOD()`, `POWER()`, `SQRT()`, `ABS()`, `CEIL()`, `FLOOR()`.
   - HOW KEYWORD WORKS:
     - `ROUND(val, d)`: Rounds to d decimal places.
     - `TRUNCATE(val, d)`: Truncates decimals without rounding.
     - `MOD(n, m)`: Returns remainder of division.
     - `CEIL(val)` / `FLOOR(val)`: Rounds up / down to nearest integer.
   - RESULT: Mathematical function outputs.
*/
SELECT 
    sal,
    ROUND(sal / 3, 2) AS rounded_div_3,
    TRUNCATE(sal / 3, 2) AS truncated_div_3,
    MOD(sal, 1000) AS mod_1000,
    SQRT(sal) AS sqrt_sal,
    CEIL(sal / 300) AS ceil_val,
    FLOOR(sal / 300) AS floor_val
FROM emp;
