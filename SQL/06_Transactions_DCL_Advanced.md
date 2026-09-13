# 06 — Transactions, DCL & Advanced SQL

> **Topics Covered:** CTEs (`WITH`), ACID Properties, `SAVEPOINT`, `ROLLBACK`, `COMMIT`, DCL (`GRANT`, `REVOKE`), Stored Procedures, User-Defined Functions, Triggers, Indexes, `EXPLAIN`

---

## 📌 Quick Reference

| Concept | Command / Syntax |
|---------|-----------------|
| CTE | `WITH cte_name AS (SELECT ...)` |
| Start Transaction | `START TRANSACTION;` / `SET AUTOCOMMIT = 0;` |
| Savepoint | `SAVEPOINT name;` → `ROLLBACK TO SAVEPOINT name;` |
| Grant Access | `GRANT SELECT ON db.* TO 'user'@'host';` |
| Revoke Access | `REVOKE SELECT ON db.* FROM 'user'@'host';` |
| Stored Procedure | `CREATE PROCEDURE name(IN x INT, OUT y INT) BEGIN...END` |
| User Function | `CREATE FUNCTION name(x INT) RETURNS type DETERMINISTIC BEGIN...END` |
| Trigger | `CREATE TRIGGER name BEFORE/AFTER INSERT/UPDATE/DELETE ON tbl FOR EACH ROW BEGIN...END` |
| Index | `CREATE INDEX idx_name ON table(column);` |
| Execution Plan | `EXPLAIN SELECT ...;` |

---

## 🎯 Key Concepts

### Stored Procedure vs Stored Function

| Feature | Stored Procedure | Stored Function |
|---------|-----------------|-----------------|
| **Execution** | `CALL procedure_name()` | Called inside SQL `SELECT func()` |
| **Return** | Uses `OUT`/`INOUT` params | **MUST** have `RETURN` clause |
| **DML Support** | All DML + DDL | Primarily calculations (restricted DML) |
| **Parameters** | `IN`, `OUT`, `INOUT` | `IN` only |

---

### Triggers — NEW vs OLD Pseudorows

| Operation | `OLD` | `NEW` |
|-----------|-------|-------|
| `INSERT` | `NULL` (no prior record) | Incoming values to be inserted |
| `UPDATE` | Values **before** modification | Values **after** modification |
| `DELETE` | Values of row being deleted | `NULL` (no new record) |

---

### ACID Properties

| Property | Meaning |
|----------|---------|
| **Atomicity** | All operations succeed or all are rolled back |
| **Consistency** | DB remains in valid state before and after transaction |
| **Isolation** | Concurrent transactions do not interfere |
| **Durability** | Committed changes survive system failures |

---

## 🔍 Query-by-Query Analysis

### Part 1 — CTEs (Common Table Expressions)

#### Q1: CTE for Modular Calculation
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
- `WITH cte_name AS (SELECT ...)` defines a temporary named result set.
- Valid only during execution of the primary query — no physical storage.
- Improves readability and avoids deeply nested subqueries.

#### Q2: CTE for Row Deduplication
```sql
WITH emp_rowno AS (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY ename ORDER BY empno) AS row_num
    FROM emp
)
DELETE FROM emp
WHERE empno IN (SELECT empno FROM emp_rowno WHERE row_num > 1);
```
- Assigns sequential numbers per name group.
- `row_num > 1` identifies all duplicates — deletes them while keeping first occurrence.

---

### Part 2 — Transactions & SAVEPOINT

#### Q3: Full Transaction with SAVEPOINT
```sql
SET AUTOCOMMIT = 0;
START TRANSACTION;

INSERT INTO dept VALUES (70, 'Production', 'Boston');
INSERT INTO dept VALUES (80, 'QC', 'Boston');

SAVEPOINT before_update;          -- checkpoint

UPDATE dept SET loc = 'Chennai' WHERE deptno = 40;

ROLLBACK TO SAVEPOINT before_update;  -- undo only the UPDATE, keep INSERTs

COMMIT;                           -- persist the two INSERTs
```
- `SAVEPOINT` marks an intermediate rollback point inside a transaction.
- `ROLLBACK TO SAVEPOINT` undoes only changes after the savepoint, not the full transaction.

---

### Part 3 — DCL (Data Control Language)

#### Q4: Create User & Grant Permissions
```sql
CREATE USER 'analyst'@'localhost' IDENTIFIED BY 'SecurePass!1';
GRANT SELECT, INSERT ON salesdb.* TO 'analyst'@'localhost';
FLUSH PRIVILEGES;
```

#### Q5: Revoke Permissions
```sql
REVOKE INSERT ON salesdb.* FROM 'analyst'@'localhost';
```

---

### Part 4 — Stored Procedures

#### Q6: Procedure with IN and OUT Parameters
```sql
DELIMITER $$
CREATE PROCEDURE get_total_salary(
    IN  dept_no  INT,
    OUT total_sal DECIMAL(10,2)
)
BEGIN
    SELECT SUM(sal) INTO total_sal
    FROM emp
    WHERE deptno = dept_no;
END $$
DELIMITER ;

-- Call:
SET @TOTAL = 0;
CALL get_total_salary(20, @TOTAL);
SELECT @TOTAL;
```
- `IN` — input parameter passed into procedure.
- `OUT` — output parameter returned to calling session via `SELECT ... INTO`.

#### Q7: Procedure with IF-ELSE Logic
```sql
DELIMITER $$
CREATE PROCEDURE classify_salary(IN emp_sal DECIMAL(10,2))
BEGIN
    IF emp_sal >= 5000 THEN
        SELECT 'HIGH' AS category;
    ELSEIF emp_sal >= 3000 THEN
        SELECT 'MEDIUM' AS category;
    ELSE
        SELECT 'LOW' AS category;
    END IF;
END $$
DELIMITER ;
```

---

### Part 5 — User-Defined Functions (UDFs)

#### Q8: Function Returning Salary Grade
```sql
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

-- Use in SELECT:
SELECT ename, sal, get_salary_grade(sal) AS category FROM emp;
```
- `RETURNS` specifies the return data type.
- `DETERMINISTIC` — same input always produces same output (no randomness).
- Unlike procedures, functions are called directly inside SQL expressions.

---

### Part 6 — Triggers

#### Q9: BEFORE UPDATE Audit Trigger
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
- `BEFORE UPDATE` fires before the row is modified.
- `OLD.col` captures the current (pre-update) values.
- Useful for audit logging — records who changed what and when.

#### Q10: AFTER INSERT Trigger
```sql
DELIMITER $$
CREATE TRIGGER after_emp_insert
AFTER INSERT ON emp
FOR EACH ROW
BEGIN
    INSERT INTO emp_audit(empno, action, action_date)
    VALUES (NEW.empno, 'INSERT', NOW());
END $$
DELIMITER ;
```
- `AFTER INSERT` fires after the row is committed.
- `NEW.col` accesses the newly inserted values.

---

### Part 7 — Indexes & Query Performance

#### Q11: Create Index & Analyze Query Plan
```sql
-- Create B-Tree index on job column:
CREATE INDEX EMP_ID ON emp(job);

-- Analyze execution plan:
EXPLAIN SELECT * FROM emp WHERE job = 'MANAGER';
```
- `CREATE INDEX` builds a B-Tree structure for fast lookups on `job`.
- `EXPLAIN` shows query plan — check for `type = range` or `ref` (index used) vs `ALL` (full scan).

#### Q12: Composite Index
```sql
CREATE INDEX idx_dept_sal ON emp(deptno, sal);
```
- Useful for queries filtering on both `deptno` AND `sal`.
- Column order matters — leftmost column must appear in `WHERE` for the index to be used.

---

## 💡 Interview Tips

- **CTEs** improve readability and support deduplication patterns with `ROW_NUMBER()`.
- **SAVEPOINT** allows partial rollback — very useful in multi-step batch operations.
- **Procedure** = `CALL` + `OUT` params; **Function** = used in `SELECT` + must `RETURN`.
- **Trigger `OLD`** = before state; **`NEW`** = after state.
- **`EXPLAIN`** — always check `type` column: `ALL` = full scan (bad), `ref`/`range` = index used (good).
- **Index trade-off**: speeds up reads but slows down writes and uses storage.
- **`DETERMINISTIC`** keyword is required for functions to work correctly in binary log replication.
