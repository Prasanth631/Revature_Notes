<div align="center">

![SQL](https://img.shields.io/badge/SQL-MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![Day 4 Advanced SQL](https://img.shields.io/badge/Day_4-CTEs_%26_Stored_Programs-4CAF50?style=for-the-badge)
![Level](https://img.shields.io/badge/Level-Advanced-F44336?style=for-the-badge)

# Day 4 Advanced SQL: CTEs, Transactions, Procedures, Functions, Triggers & Indexes

**Comprehensive SQL study guide covering Common Table Expressions (CTEs), ACID Transactions (`SAVEPOINT`, `ROLLBACK`), DCL Security (`GRANT`, `REVOKE`), Stored Procedures (`IN`, `OUT`, `INOUT`), User-Defined Functions (`UDF`), Triggers (`BEFORE/AFTER`, `NEW/OLD`), and Performance Tuning (`CREATE INDEX`, `EXPLAIN`).**

---

</div>

## 📚 Overview

This module covers **Advanced Database Engineering Concepts**:
1. **Common Table Expressions (CTEs)**: `WITH` clause, modularizing complex queries, row deduplication
2. **Transaction Control Language (TCL)**: `START TRANSACTION`, `SAVEPOINT`, `ROLLBACK TO SAVEPOINT`, `COMMIT`
3. **Data Control Language (DCL)**: `CREATE USER`, `GRANT`, `REVOKE`
4. **Stored Procedures & Functions**: `DELIMITER`, `IN`/`OUT`/`INOUT` parameters, procedural logic (`IF-ELSE`, `WHILE`), `DETERMINISTIC` functions
5. **Database Triggers**: Event-driven execution (`BEFORE/AFTER` `INSERT/UPDATE/DELETE`), `NEW` and `OLD` pseudorow references
6. **Query Performance Tuning**: B-Tree Indexes (`CREATE INDEX`), `EXPLAIN` execution plans

---

## 🎯 Key Interview Concepts & Comparison Tables

### 1. Stored Procedure vs Stored Function

| Feature | Stored Procedure | Stored Function |
|---------|------------------|-----------------|
| **Execution Command** | Executed using `CALL procedure_name()` | Invoked directly inside SQL expressions (`SELECT func()`) |
| **Return Value** | Does **not** require a `RETURN` statement (uses `OUT`/`INOUT` parameters) | **MUST** contain a `RETURN` clause specifying return type |
| **DML Support** | Can execute all DML (`INSERT`, `UPDATE`, `DELETE`) and DDL | Primarily used for calculations (DML operations are restricted inside functions) |
| **Parameters** | Supports `IN`, `OUT`, and `INOUT` parameters | Supports only `IN` input parameters |

---

### 2. Triggers: `NEW` vs `OLD` Pseudorows

| Operation | `OLD` Pseudorow | `NEW` Pseudorow |
|-----------|-----------------|-----------------|
| **`INSERT`** | `NULL` (No prior record exists) | Contains incoming values to be inserted |
| **`UPDATE`** | Contains values **before** modification | Contains values **after** modification |
| **`DELETE`** | Contains values of row being deleted | `NULL` (No new record created) |

---

## 🔍 Detailed Query-by-Query Analysis

---

### Query 1: CTE for Modular Calculations (`WITH` Clause)
```sql
WITH total_sal AS (
    SELECT
        empno, ename, sal,
        IFNULL(comm, 0) AS commission
    FROM emp
)
SELECT empno, ename, sal, commission, sal + commission AS total
FROM total_sal;
```
* **What is this query?** Common Table Expression (CTE) statement.
* **What does it do?** Creates a temporary named result set `total_sal` that prepares `commission`, then calculates total earnings in the main query.
* **How keyword works:** `WITH cte_name AS (SELECT ...)` defines a temporary view valid only during execution of the primary query.

---

### Query 2: CTE for Deduplicating Rows using `ROW_NUMBER()`
```sql
WITH emp_rowno AS (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY ename ORDER BY empno) AS row_num 
    FROM emp
)
DELETE FROM emp 
WHERE empno IN (SELECT empno FROM emp_rowno WHERE row_num > 1);
```
* **What is this query?** Advanced CTE row deduplication query.
* **What does it do?** Identifies duplicate employee records by name using `ROW_NUMBER()`, then deletes rows where `row_num > 1`.
* **How keyword works:** Assigns sequential numbers per duplicate group, allowing precise target deletion of duplicates.

---

### Query 3: Savepoint Transaction Control (`SAVEPOINT` & `ROLLBACK`)
```sql
SET AUTOCOMMIT = 0;
START TRANSACTION;
INSERT INTO dept VALUES (70, 'Production', 'Boston');
INSERT INTO dept VALUES (80, 'QC', 'Boston');
SAVEPOINT before_update;
UPDATE dept SET loc = 'Chennai' WHERE deptno = 40;
ROLLBACK TO SAVEPOINT before_update;
COMMIT;
```
* **What is this query?** TCL Transaction management statement set.
* **What does it do?** Starts explicit transaction, sets a `SAVEPOINT`, updates department 40, rolls back to savepoint, and commits.
* **How keyword works:** `SAVEPOINT` sets an intermediate rollback marker; `ROLLBACK TO SAVEPOINT` undoes changes made after the savepoint without cancelling the entire transaction.

---

### Query 4: Stored Procedure with `IN` & `OUT` Parameters
```sql
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
SELECT @TOTAL;
```
* **What is this query?** DDL Stored Procedure creation with `IN` and `OUT` parameters.
* **What does it do?** Calculates total salary for input `dept_no` and populates output user variable `@TOTAL`.
* **How keyword works:** `IN` passes data into procedure; `OUT` returns data to calling session via `SELECT SUM(sal) INTO total_sal`.

---

### Query 5: User-Defined Function (`UDF`)
```sql
DELIMITER $$
CREATE FUNCTION get_salary_grade(sal INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE grade VARCHAR(20);
    IF sal >= 5000 THEN SET grade = 'HIGH';
    ELSEIF sal BETWEEN 3000 AND 4999 THEN SET grade = 'MEDIUM';
    ELSE SET grade = 'LOW';
    END IF;
    RETURN grade;
END $$
DELIMITER ;

SELECT ename, sal, get_salary_grade(sal) AS category FROM emp;
```
* **What is this query?** DDL User-Defined Stored Function statement.
* **What does it do?** Creates a function returning salary categories usable directly inside `SELECT` queries.
* **How keyword works:** `RETURNS` specifies return data type; `DETERMINISTIC` declares fixed mapping; `RETURN` sends value back.

---

### Query 6: Audit Trigger (`BEFORE UPDATE ON dept`)
```sql
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
```
* **What is this query?** DDL Audit Trigger creation statement.
* **What does it do?** Intercepts update operations on `dept` table and logs old row values to `DEPT_BACKUP` audit table.
* **How keyword works:** `OLD.col` captures values prior to update; `CURDATE()` and `CURRENT_USER()` record audit metadata.

---

### Query 7: Index Creation & Execution Plan Analysis (`EXPLAIN`)
```sql
CREATE INDEX EMP_ID ON emp(job);
EXPLAIN SELECT * FROM emp WHERE job = 'MANAGER';
```
* **What is this query?** Index creation and Query Performance Analysis query.
* **What does it do?** Builds a B-Tree index on `emp(job)` and uses `EXPLAIN` to verify execution strategy.
* **How keyword works:** `CREATE INDEX` creates a B-Tree index structure; `EXPLAIN` outputs query plan metadata showing index range scan instead of full table scan.

---

<div align="center">

[![Previous Notes](https://img.shields.io/badge/←_Previous-Day_3_Joins_Subqueries_Notes-4CAF50?style=for-the-badge)](./Day_3_Joins.md)
[![Next Notes](https://img.shields.io/badge/Next-SQL_Commands_Master_Notes-2196F3?style=for-the-badge)](./SQL_Commands.md)

</div>
