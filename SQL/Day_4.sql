/* ============================================================================
   DAY 4 CTES, TRANSACTIONS, SECURITY, PROCEDURES, FUNCTIONS, TRIGGERS & INDEXES
   ============================================================================
   Author: Prasanth Golla
   Description: Advanced SQL topics covering Common Table Expressions (CTEs),
                Transaction Control (START TRANSACTION, SAVEPOINT, ROLLBACK, COMMIT),
                DCL Security (CREATE USER, GRANT, REVOKE), Stored Procedures (IN, OUT, INOUT),
                Stored Functions, Database Triggers (BEFORE INSERT/UPDATE/DELETE),
                and Query Performance Tuning using Indexes & EXPLAIN.
   ============================================================================ */

-- ============================================================================
-- SECTION 1: COMMON TABLE EXPRESSIONS (CTES) & DEDUPLICATION
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
   QUERY 2: Basic CTE (Common Table Expression) for Calculated Columns
   - WHAT IS THIS QUERY? CTE (WITH clause) query.
   - WHAT DOES IT DO? Defines a temporary named result set `total_sal` that calculates commission, then selects total earnings (`sal + commission`).
   - HOW KEYWORD WORKS: `WITH cte_name AS (SELECT ...)` defines a temporary view scope available only during execution of the primary query.
   - RESULT: Clean calculation of total earnings.
*/
WITH total_sal AS (
    SELECT
        empno,
        ename,
        sal,
        IFNULL(comm, 0) AS commission
    FROM emp
)
SELECT
    empno,
    ename,
    sal,
    commission,
    sal + commission AS total
FROM total_sal;

/*
   QUERY 3: CTE for Department Aggregations & Filtering
   - WHAT IS THIS QUERY? CTE with Group By aggregation.
   - WHAT DOES IT DO? Pre-aggregates department employee counts in `emp_agg` CTE, then filters departments having more than 3 employees.
   - HOW KEYWORD WORKS: Encapsulates aggregate calculation in CTE so outer query can filter with `WHERE emp_cnt > 3` instead of HAVING.
   - RESULT: Departments with > 3 employees.
*/
WITH emp_agg AS (
    SELECT 
        deptno,
        COUNT(*) AS emp_cnt
    FROM emp
    GROUP BY deptno
)
SELECT * FROM emp_agg
WHERE emp_cnt > 3;

/*
   QUERY 4: CTE Join to Find Employees Earning Above Department Average
   - WHAT IS THIS QUERY? CTE Join query.
   - WHAT DOES IT DO? Calculates department average salaries in `dept_avg` CTE, then joins back to `emp` to find above-average earners.
   - HOW KEYWORD WORKS: `WITH dept_avg AS (...) SELECT ... FROM emp e JOIN dept_avg d ON ...` joins main table to aggregated CTE.
   - RESULT: Employees earning above their department average.
*/
WITH dept_avg AS (
    SELECT 
        deptno,
        AVG(sal) AS avg_sal
    FROM emp
    GROUP BY deptno
)
SELECT e.empno, e.ename, e.sal, d.deptno, d.avg_sal
FROM emp e
JOIN dept_avg d ON e.deptno = d.deptno AND e.sal > d.avg_sal;

/*
   QUERY 5: CTE Window Function for Row Deduplication
   - WHAT IS THIS QUERY? Advanced Row Deduplication CTE query.
   - WHAT DOES IT DO? Uses `ROW_NUMBER() OVER(PARTITION BY ename)` inside a CTE to identify and delete duplicate employee records.
   - HOW KEYWORD WORKS: Assigns `row_num > 1` to duplicates, allowing precise target deletion.
   - RESULT: Deletes duplicate employee rows.
*/
WITH emp_rowno AS (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY ename ORDER BY empno) AS row_num 
    FROM emp
)
DELETE FROM emp 
WHERE empno IN (SELECT empno FROM emp_rowno WHERE row_num > 1);


-- ============================================================================
-- SECTION 2: TRANSACTIONS & SAVEPOINTS (TCL)
-- ============================================================================

/*
   QUERY 6: Transaction Control with SAVEPOINT and ROLLBACK
   - WHAT IS THIS QUERY? TCL Transaction management statement set.
   - WHAT DOES IT DO? Disables autocommit, starts explicit transaction, inserts 2 departments, sets savepoint, updates department 40, rolls back to savepoint, and commits.
   - HOW KEYWORD WORKS:
     - `SET AUTOCOMMIT = 0`: Disables automatic statement commit.
     - `START TRANSACTION`: Begins explicit ACID transaction.
     - `SAVEPOINT point_name`: Sets rollback checkpoint marker.
     - `ROLLBACK TO SAVEPOINT point_name`: Undoes changes made AFTER the savepoint.
     - `COMMIT`: Saves transaction edits permanently.
   - RESULT: Depts 70 and 80 inserted; update on Dept 40 undone via savepoint rollback.
*/
SET AUTOCOMMIT = 0;
START TRANSACTION;
INSERT INTO dept VALUES (70, 'Production', 'Boston');
INSERT INTO dept VALUES (80, 'QC', 'Boston');
SAVEPOINT before_update;
UPDATE dept SET loc = 'Chennai' WHERE deptno = 40;
ROLLBACK TO SAVEPOINT before_update;
COMMIT;
SET AUTOCOMMIT = 1;


-- ============================================================================
-- SECTION 3: DATABASE SECURITY & PRIVILEGES (DCL)
-- ============================================================================

/*
   QUERY 7: Create User Accounts & Manage Privileges (DCL)
   - WHAT IS THIS QUERY? DCL Security Administration statement set.
   - WHAT DOES IT DO? Creates database user accounts, grants DML privileges on `trainingdb.emp`, and revokes UPDATE privilege.
   - HOW KEYWORD WORKS:
     - `CREATE USER 'user'@'host' IDENTIFIED BY 'pass'`: Instantiates user credentials.
     - `GRANT privs ON db.table TO 'user'`: Gives specified access rights.
     - `REVOKE priv FROM 'user'`: Removes access rights.
   - RESULT: User 'user1' configured with SELECT, INSERT, DELETE permissions.
*/
CREATE USER IF NOT EXISTS 'user1'@'localhost' IDENTIFIED BY 'admin123';
GRANT SELECT, INSERT, UPDATE, DELETE ON trainingdb.emp TO 'user1'@'localhost';
REVOKE UPDATE ON trainingdb.emp FROM 'user1'@'localhost';


-- ============================================================================
-- SECTION 4: STORED PROCEDURES (IN, OUT, INOUT, IF-ELSE, WHILE)
-- ============================================================================

/*
   QUERY 8: Simple Stored Procedure (No Parameters)
   - WHAT IS THIS QUERY? DDL Procedure Creation query.
   - WHAT DOES IT DO? Creates a reusable stored procedure `get_all_employees` returning all rows from `emp`.
   - HOW KEYWORD WORKS: `DELIMITER $$` changes statement delimiter to allow semicolon inside body; `CREATE PROCEDURE` compiles procedural code in database catalog.
   - RESULT: Procedure created and callable via `CALL get_all_employees()`.
*/
DELIMITER $$
CREATE PROCEDURE get_all_employees()
BEGIN
    SELECT * FROM emp;
END $$
DELIMITER ;

CALL get_all_employees();

/*
   QUERY 9: Stored Procedure with IN Parameter
   - WHAT IS THIS QUERY? DDL Procedure with Input Parameter.
   - WHAT DOES IT DO? Fetches employee details matching input `emp_id`.
   - HOW KEYWORD WORKS: `IN emp_id INT` defines an input parameter passed into the procedure.
   - RESULT: Returns employee 7499 details via `CALL get_employee(7499)`.
*/
DELIMITER $$
CREATE PROCEDURE get_employee(IN emp_id INT)
BEGIN
    SELECT * FROM emp WHERE empno = emp_id;
END $$
DELIMITER ;

CALL get_employee(7499);

/*
   QUERY 10: Stored Procedure with OUT Parameter
   - WHAT IS THIS QUERY? DDL Procedure with Output Parameter.
   - WHAT DOES IT DO? Calculates total salary for input `dept_no` and assigns result to output variable `total_sal`.
   - HOW KEYWORD WORKS: `OUT total_sal DECIMAL(10,2)` defines return variable populated via `SELECT SUM(sal) INTO total_sal`.
   - RESULT: Populates session user variable `@TOTAL`.
*/
DELIMITER $$
CREATE PROCEDURE get_total_salary(
    IN dept_no INT,
    OUT total_sal DECIMAL(10,2)
)
BEGIN 
    SELECT SUM(sal) INTO total_sal
    FROM emp
    WHERE deptno = dept_no;
END $$
DELIMITER ;

SET @TOTAL = 0;
CALL get_total_salary(20, @TOTAL);
SELECT @TOTAL AS total_dept_20_salary;

/*
   QUERY 11: Stored Procedure with INOUT Parameter
   - WHAT IS THIS QUERY? DDL Procedure with Bidirectional Parameter.
   - WHAT DOES IT DO? Takes a salary value, increases it by a given percentage, and returns updated value in the same variable.
   - HOW KEYWORD WORKS: `INOUT salary DECIMAL(10,2)` allows a variable to pass data IN and receive updated data OUT.
   - RESULT: Increases 5000 by 10% returning 5500.
*/
DELIMITER $$
CREATE PROCEDURE increase_salary(
    INOUT salary DECIMAL(10,2),
    IN percent INT
)
BEGIN
    SET salary = salary + (salary * percent / 100);
END $$
DELIMITER ;

SET @sal = 5000;
CALL increase_salary(@sal, 10);
SELECT @sal AS salary_after_increase;

/*
   QUERY 12: Stored Procedure with IF-ELSEIF Control Logic
   - WHAT IS THIS QUERY? Procedural Control Flow query.
   - WHAT DOES IT DO? Classifies input salary into 'High Salary', 'Medium Salary', or 'Low Salary'.
   - HOW KEYWORD WORKS: `IF ... THEN ... ELSEIF ... THEN ... ELSE ... END IF` executes conditional branches inside procedure.
   - RESULT: Returns grade label.
*/
DELIMITER $$
CREATE PROCEDURE check_salary(IN sal INT)
BEGIN
    IF sal > 5000 THEN
        SELECT 'High Salary' AS grade;
    ELSEIF sal BETWEEN 3000 AND 5000 THEN
        SELECT 'Medium Salary' AS grade;
    ELSE
        SELECT 'Low Salary' AS grade;
    END IF;
END $$
DELIMITER ;

CALL check_salary(6000);

/*
   QUERY 13: Stored Procedure with WHILE Loop
   - WHAT IS THIS QUERY? Procedural Loop Iteration statement.
   - WHAT DOES IT DO? Loops from 1 to `num`, selecting counter `i` during each iteration.
   - HOW KEYWORD WORKS: `WHILE condition DO ... SET i = i + 1; END WHILE` loops until condition becomes FALSE.
   - RESULT: Outputs numbers 1 to 10.
*/
DELIMITER $$
CREATE PROCEDURE print_numbers(IN num INT)
BEGIN 
    DECLARE i INT DEFAULT 1;
    WHILE i <= num DO
        SELECT i;
        SET i = i + 1;
    END WHILE;
END $$
DELIMITER ;

CALL print_numbers(10);


-- ============================================================================
-- SECTION 5: STORED FUNCTIONS
-- ============================================================================

/*
   QUERY 14: User-Defined Stored Function (UDF)
   - WHAT IS THIS QUERY? DDL Stored Function creation statement.
   - WHAT DOES IT DO? Creates a function `get_salary_grade(sal)` returning 'HIGH', 'MEDIUM', or 'LOW'.
   - HOW KEYWORD WORKS:
     - `RETURNS varchar(20)`: Defines return data type.
     - `DETERMINISTIC`: Declares function produces identical output for identical input values.
     - `RETURN value`: Sends result back to calling query.
   - RESULT: Function usable directly inside SELECT statements.
*/
DELIMITER $$
CREATE FUNCTION get_salary_grade(sal INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE grade VARCHAR(20);
    IF sal >= 5000 THEN
        SET grade = 'HIGH';
    ELSEIF sal BETWEEN 3000 AND 4999 THEN
        SET grade = 'MEDIUM';
    ELSE 
        SET grade = 'LOW';
    END IF;
    RETURN grade;
END $$
DELIMITER ;

SELECT ename, sal, get_salary_grade(sal) AS sal_category FROM emp;


-- ============================================================================
-- SECTION 6: DATABASE TRIGGERS (BEFORE INSERT, BEFORE UPDATE, BEFORE DELETE)
-- ============================================================================

/*
   QUERY 15: BEFORE INSERT Trigger for Data Validation
   - WHAT IS THIS QUERY? DDL Trigger creation statement.
   - WHAT DOES IT DO? Automatically intercepts new `emp` row insertions; if `sal < 0`, forces `sal = 0`.
   - HOW KEYWORD WORKS: `CREATE TRIGGER ... BEFORE INSERT ON table FOR EACH ROW` runs code before row is saved; `NEW.col` refers to incoming row values.
   - RESULT: Negative salary inputs automatically converted to 0.
*/
DELIMITER $$
CREATE TRIGGER before_insert_emp
BEFORE INSERT ON emp
FOR EACH ROW
BEGIN 
    IF NEW.sal < 0 THEN
        SET NEW.sal = 0;
    END IF;
END $$
DELIMITER ;

/*
   QUERY 16: Audit Trigger Logging Changes to Backup Table
   - WHAT IS THIS QUERY? Audit logging trigger set.
   - WHAT DOES IT DO? Creates audit table `DEPT_BACKUP` and `DEPT_UPDATE` trigger to log old department values whenever `dept` is updated.
   - HOW KEYWORD WORKS: `OLD.col` accesses values prior to UPDATE/DELETE operation.
   - RESULT: Automatically writes audit record to `DEPT_BACKUP` upon department modification.
*/
CREATE TABLE IF NOT EXISTS DEPT_BACKUP (
    DEPTNO INT,
    DNAME VARCHAR(30),
    LOC VARCHAR(30),
    MODIFIED_DATE DATE,
    MODIFIED_BY VARCHAR(30),
    OPERATION VARCHAR(30)
);

DELIMITER $$
CREATE TRIGGER DEPT_UPDATE
BEFORE UPDATE ON dept
FOR EACH ROW
BEGIN
    INSERT INTO DEPT_BACKUP VALUES (
        OLD.deptno, OLD.dname, OLD.loc, 
        CURDATE(), CURRENT_USER(), 'UPDATE'
    );
END $$
DELIMITER ;


-- ============================================================================
-- SECTION 7: INDEXES & EXPLAIN PERFORMANCE TUNING
-- ============================================================================

/*
   QUERY 17: Create Non-Clustered Index & Analyze Execution Plan (`EXPLAIN`)
   - WHAT IS THIS QUERY? Index creation and Query Performance Analysis.
   - WHAT DOES IT DO? Creates a B-Tree index `EMP_ID` on `emp(job)`, then uses `EXPLAIN` to inspect query execution strategy.
   - HOW KEYWORD WORKS: `CREATE INDEX index_name ON table(column)` builds a B-Tree lookup index; `EXPLAIN` displays query execution plan (table scans vs index lookups).
   - RESULT: Speeds up `WHERE job = 'MANAGER'` queries from full table scan to fast index lookup.
*/
CREATE INDEX EMP_ID ON emp(job);
EXPLAIN SELECT * FROM emp WHERE job = 'MANAGER';