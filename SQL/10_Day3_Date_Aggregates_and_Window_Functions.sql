/* ============================================================================
   DAY 3 DATE FUNCTIONS, NULL HANDLING, AGGREGATION & WINDOW FUNCTIONS
   ============================================================================
   Author: Prasanth Golla
   Description: Advanced SQL functions covering Date extraction & interval math,
                Type Casting, Null handling (IFNULL, NULLIF), Group By Aggregations,
                HAVING clause filtering, and Analytic Window Functions (ROW_NUMBER,
                RANK, DENSE_RANK, LAG, LEAD, Running Totals).
   ============================================================================ */

-- ============================================================================
-- SECTION 1: DATE EXTRACTION & INTERVAL ARITHMETIC
-- ============================================================================

/*
   QUERY 1: Select Active Database Context
   - WHAT IS THIS QUERY? Session context selection statement.
   - WHAT DOES IT DO? Sets 'trainingdb' as the working database.
   - HOW KEYWORD WORKS: `USE` directs current session schema focus.
   - RESULT: Database changed.
*/
USE trainingdb;

/*
   QUERY 2: Extract Year from Date Field
   - WHAT IS THIS QUERY? Date component extraction query.
   - WHAT DOES IT DO? Extracts calendar year from `hiredate` column using EXTRACT and YEAR functions.
   - HOW KEYWORD WORKS: `EXTRACT(YEAR FROM date)` standard SQL function; `YEAR(date)` MySQL shorthand.
   - RESULT: Returns numeric year (e.g., 1981).
*/
SELECT 
    EXTRACT(YEAR FROM hiredate) AS hire_year,
    YEAR(hiredate) AS h_year,
    hiredate
FROM emp;

/*
   QUERY 3: Add Days to Current Date
   - WHAT IS THIS QUERY? Date addition query.
   - WHAT DOES IT DO? Adds 10 days to the current timestamp.
   - HOW KEYWORD WORKS: `DATE_ADD(NOW(), INTERVAL 10 DAY)` or `NOW() + INTERVAL 10 DAY` performs date arithmetic.
   - RESULT: Future date 10 days from today.
*/
SELECT DATE_ADD(NOW(), INTERVAL 10 DAY) AS future_date_10_days;
SELECT NOW() + INTERVAL 10 DAY AS future_date_plus_10;

/*
   QUERY 4: Add Months & Minutes to Current Date
   - WHAT IS THIS QUERY? Date/Time addition with different units.
   - WHAT DOES IT DO? Calculates date 1 month from now and timestamp 10 minutes from now.
   - HOW KEYWORD WORKS: `INTERVAL 1 MONTH` adds calendar months; `INTERVAL 10 MINUTE` adds minutes.
   - RESULT: Future timestamps.
*/
SELECT DATE_ADD(NOW(), INTERVAL 1 MONTH) AS next_month;
SELECT DATE_ADD(NOW(), INTERVAL 10 MINUTE) AS in_10_minutes;

/*
   QUERY 5: Subtract Months from Current Date
   - WHAT IS THIS QUERY? Date subtraction query.
   - WHAT DOES IT DO? Subtracts 10 months from current timestamp.
   - HOW KEYWORD WORKS: `DATE_SUB(NOW(), INTERVAL 10 MONTH)` or `NOW() - INTERVAL 10 MONTH`.
   - RESULT: Past timestamp 10 months ago.
*/
SELECT DATE_SUB(NOW(), INTERVAL 10 MONTH) AS past_10_months;
SELECT NOW() - INTERVAL 10 MONTH AS past_10_months_minus;

/*
   QUERY 6: Calculate Difference Between Dates
   - WHAT IS THIS QUERY? Date interval difference calculation.
   - WHAT DOES IT DO? Calculates number of days between current date and employee `hiredate`.
   - HOW KEYWORD WORKS: `DATEDIFF(date1, date2)` returns (date1 - date2) in total days.
   - RESULT: Days elapsed since hire date.
*/
SELECT DATEDIFF(NOW(), hiredate) AS days_worked FROM emp;

/*
   QUERY 7: Get Last Day of Current Month
   - WHAT IS THIS QUERY? Month-end date calculation query.
   - WHAT DOES IT DO? Returns the last calendar date of current month.
   - HOW KEYWORD WORKS: `LAST_DAY(date)` calculates month-end date (e.g., '2026-08-31').
   - RESULT: Month-end date.
*/
SELECT LAST_DAY(NOW()) AS end_of_month;

/*
   QUERY 8: Filter Rows by Dynamic Date Interval
   - WHAT IS THIS QUERY? Date filtering query in WHERE clause.
   - WHAT DOES IT DO? Selects employees hired within the last 30 days.
   - HOW KEYWORD WORKS: `WHERE hiredate >= NOW() - INTERVAL 30 DAY` filters recent hire records dynamically.
   - RESULT: Employees hired in last 30 days.
*/
SELECT * FROM emp
WHERE hiredate >= NOW() - INTERVAL 30 DAY;


-- ============================================================================
-- SECTION 2: DATE FORMATTING, TYPE CASTING & NULL HANDLING
-- ============================================================================

/*
   QUERY 9: Format Date into Custom String Layouts
   - WHAT IS THIS QUERY? Date-to-string formatting query.
   - WHAT DOES IT DO? Formats current timestamp into 'DD-MM-YYYY' and timestamp formats.
   - HOW KEYWORD WORKS: `DATE_FORMAT(date, format_specifier)` converts dates into formatted text strings.
   - RESULT: Formatted date strings.
*/
SELECT DATE_FORMAT(NOW(), '%d-%m-%Y') AS formatted_date;
SELECT DATE_FORMAT(NOW(), '%d/%m/%Y %H:%i:%S:%p') AS timestamp_str;

/*
   QUERY 10: Explicit Data Type Casting
   - WHAT IS THIS QUERY? Type conversion query.
   - WHAT DOES IT DO? Converts string literals into FLOAT, DECIMAL, and CHAR types.
   - HOW KEYWORD WORKS: `CAST(expression AS target_type)` explicitly converts data types.
   - RESULT: Casted values.
*/
SELECT CAST('1' AS FLOAT) AS float_val;
SELECT CAST('1' AS DECIMAL(10,2)) AS decimal_val;
SELECT CAST(1 AS CHAR(1)) AS char_val;

/*
   QUERY 11: Handle NULL Values with IFNULL
   - WHAT IS THIS QUERY? Null substitution math query.
   - WHAT DOES IT DO? Calculates total salary (`sal + comm`) substituting 0 for NULL commission.
   - HOW KEYWORD WORKS: `IFNULL(expression, alt_value)` returns alt_value if expression is NULL, avoiding NULL addition results.
   - RESULT: Total earnings without NULL calculation errors.
*/
SELECT empno, ename, sal, comm, sal + IFNULL(comm, 0) AS total_sal 
FROM emp;

/*
   QUERY 12: Count All vs Count Non-Null vs Count IFNULL
   - WHAT IS THIS QUERY? Aggregate count comparative inspection query.
   - WHAT DOES IT DO? Compares total row count `COUNT(*)`, non-null commission count `COUNT(comm)`, and NULL-handled count `COUNT(IFNULL(comm,0))`.
   - HOW KEYWORD WORKS: `COUNT(*)` counts all rows; `COUNT(col)` ignores NULLs; `COUNT(IFNULL(col,0))` counts all rows.
   - RESULT: Displays 14 rows, 4 non-null comms, 14 handling nulls.
*/
SELECT 
    COUNT(*) AS total_rows,
    COUNT(comm) AS non_null_comms,
    COUNT(IFNULL(comm, 0)) AS all_comms_handled
FROM emp;

/*
   QUERY 13: Substitute Values using NULLIF
   - WHAT IS THIS QUERY? Conditional null transformation query.
   - WHAT DOES IT DO? Replaces ENAME with NULL if ENAME equals 'ALLEN'.
   - HOW KEYWORD WORKS: `NULLIF(expr1, expr2)` returns NULL if expr1 = expr2, otherwise returns expr1.
   - RESULT: ALLEN's ename displays as NULL.
*/
SELECT empno, ename, NULLIF(ename, 'ALLEN') AS ename_x 
FROM emp;


-- ============================================================================
-- SECTION 3: GROUP BY AGGREGATIONS & HAVING CLAUSE
-- ============================================================================

/*
   QUERY 14: Multi-Column Group By with Aggregate Functions
   - WHAT IS THIS QUERY? Multi-column aggregate summary query.
   - WHAT DOES IT DO? Groups employees by `deptno` and `job` to calculate MAX, MIN, SUM, AVG salary and employee count.
   - HOW KEYWORD WORKS: `GROUP BY deptno, job` creates summary groups; `MAX()`, `MIN()`, `SUM()`, `AVG()`, `COUNT()` calculate metrics.
   - RESULT: Aggregated summary rows ordered by department.
*/
SELECT 
    deptno,
    job,
    MAX(sal) AS max_sal,
    MIN(sal) AS min_sal,
    SUM(sal) AS total_sal,
    AVG(sal) AS avg_sal,
    COUNT(sal) AS no_of_emp
FROM emp
GROUP BY deptno, job
ORDER BY deptno;

/*
   QUERY 15: Group By Date Components (Year and Month)
   - WHAT IS THIS QUERY? Date-based aggregation query.
   - WHAT DOES IT DO? Counts employee hires grouped by hiring year and month.
   - HOW KEYWORD WORKS: `GROUP BY YEAR(hiredate), MONTH(hiredate)` aggregates rows by year and month.
   - RESULT: Monthly hire distribution.
*/
SELECT 
    YEAR(hiredate) AS Year,
    MONTH(hiredate) AS Month,
    COUNT(*) AS TotalEmployees
FROM emp
GROUP BY YEAR(hiredate), MONTH(hiredate);

/*
   QUERY 16: Filter Grouped Aggregates Using HAVING Clause
   - WHAT IS THIS QUERY? Grouped data filtering query.
   - WHAT DOES IT DO? Displays departments having 3 or more employees.
   - HOW KEYWORD WORKS: `HAVING COUNT(*) >= 3` filters groups AFTER `GROUP BY` aggregation (unlike `WHERE` which filters before grouping).
   - RESULT: Departments with 3+ employees.
*/
SELECT 
    deptno, 
    COUNT(*) AS number_of_emp
FROM emp
GROUP BY deptno
HAVING COUNT(*) >= 3;

/*
   QUERY 17: Filter Departments by Aggregate Max Salary
   - WHAT IS THIS QUERY? HAVING clause aggregate comparison query.
   - WHAT DOES IT DO? Displays departments whose maximum salary is >= 5000.
   - HOW KEYWORD WORKS: `HAVING MAX(sal) >= 5000` filters aggregated department groups.
   - RESULT: Departments meeting max salary threshold.
*/
SELECT 
    deptno, 
    MAX(sal) AS max_sal
FROM emp
GROUP BY deptno
HAVING MAX(sal) >= 5000;


-- ============================================================================
-- SECTION 4: WINDOW FUNCTIONS (ANALYTIC & RANKING FUNCTIONS)
-- ============================================================================

/*
   QUERY 18: Generate Sequential Row Numbers (`ROW_NUMBER()`)
   - WHAT IS THIS QUERY? Ranking window function query.
   - WHAT DOES IT DO? Assigns a unique sequential row number (1, 2, 3...) ordered by `empno`.
   - HOW KEYWORD WORKS: `ROW_NUMBER() OVER(ORDER BY empno)` assigns unique numbers without grouping rows.
   - RESULT: Sequential row indices.
*/
SELECT 
    ROW_NUMBER() OVER(ORDER BY empno) AS serial_no,
    empno, ename, sal 
FROM emp;

/*
   QUERY 19: Partitioned Row Numbers (`ROW_NUMBER() OVER PARTITION BY`)
   - WHAT IS THIS QUERY? Partitioned window function query.
   - WHAT DOES IT DO? Assigns sequential row numbers resetting to 1 for each department.
   - HOW KEYWORD WORKS: `PARTITION BY deptno` resets the window counter for each department group.
   - RESULT: Department-wise row numbers (1,2,3 for dept 10; 1,2,3 for dept 20...).
*/
SELECT 
    ROW_NUMBER() OVER(PARTITION BY deptno ORDER BY empno) AS dept_serial_no,
    deptno, empno, ename, sal
FROM emp;

/*
   QUERY 20: Rank Employees by Salary (`RANK()` vs `DENSE_RANK()`)
   - WHAT IS THIS QUERY? Salary ranking comparison query.
   - WHAT DOES IT DO? Ranks employees by salary descending. `RANK()` leaves gaps after ties; `DENSE_RANK()` does not leave gaps.
   - HOW KEYWORD WORKS: `RANK() OVER(ORDER BY sal DESC)` skips ranks after ties (1, 2, 2, 4); `DENSE_RANK()` ranks sequentially (1, 2, 2, 3).
   - RESULT: Salary ranking metrics.
*/
SELECT 
    empno, ename, sal, deptno,
    RANK() OVER(ORDER BY sal DESC) AS emp_rank,
    DENSE_RANK() OVER(ORDER BY sal DESC) AS emp_dense_rank
FROM emp;

/*
   QUERY 21: Access Previous & Next Row Values (`LAG()` & `LEAD()`)
   - WHAT IS THIS QUERY? Value positional window function query.
   - WHAT DOES IT DO? Displays previous employee's salary (`LAG`) and next employee's salary (`LEAD`).
   - HOW KEYWORD WORKS: `LAG(col)` fetches value from previous row; `LEAD(col)` fetches value from next row in window frame.
   - RESULT: Current, previous, and next salary values displayed together.
*/
SELECT 
    empno, ename, sal,
    LAG(sal) OVER(ORDER BY empno) AS prev_sal,
    LEAD(sal) OVER(ORDER BY empno) AS next_sal
FROM emp;

/*
   QUERY 22: Cumulative Running Total Salary (`SUM() OVER`)
   - WHAT IS THIS QUERY? Cumulative window aggregation query.
   - WHAT DOES IT DO? Calculates cumulative running total salary row by row.
   - HOW KEYWORD WORKS: `SUM(sal) OVER(ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)` sums from first row up to current row.
   - RESULT: Cumulative running salary total.
*/
SELECT 
    empno, ename, sal,
    SUM(sal) OVER(ORDER BY empno ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM emp;

/*
   QUERY 23: Company Overall Average vs Department Average
   - WHAT IS THIS QUERY? Multi-level window aggregation query.
   - WHAT DOES IT DO? Displays each employee's salary alongside company-wide average salary and department average salary.
   - HOW KEYWORD WORKS: `AVG(sal) OVER()` calculates company average; `AVG(sal) OVER(PARTITION BY deptno)` calculates department average.
   - RESULT: Compares individual salary against company and department averages without losing individual row detail.
*/
SELECT 
    empno, ename, sal, deptno,
    AVG(sal) OVER() AS company_average,
    AVG(sal) OVER(PARTITION BY deptno) AS dept_average
FROM emp;
