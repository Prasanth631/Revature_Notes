# 07 — Assignments (Solved)

> **Topics Covered:** Solved exercises for Day 1 (DDL + Constraints), Day 2 (Alterations + Functions), Day 3 (Analytical Queries — Subqueries, JOINs, Views, CTEs)

---

## 📌 Overview

| Assignment | Level | Focus | Exercises |
|------------|-------|-------|-----------|
| [Day 1](#day-1-assignment--ddl--constraints) | 🟢 Beginner | CREATE TABLE, All Constraints | 35 |
| [Day 2](#day-2-assignment--ddl-alterations--functions) | 🟠 Intermediate | ALTER TABLE, String & Math Functions | 83 |
| [Day 3](#day-3-assignment--analytical-sql-salesdb) | 🔴 Advanced | Subqueries, JOIN Aggregations, Views, CTEs | 35 |

---

## Day 1 Assignment — DDL & Constraints

### Assignment 1: Create `student` Table
```sql
CREATE DATABASE day1_assignment;
USE day1_assignment;

CREATE TABLE student (
    StudentID   INT PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(30) NOT NULL,
    Age         INT CHECK (Age >= 5 AND Age <= 100),
    City        VARCHAR(30) DEFAULT 'Chennai',
    Course      VARCHAR(30) DEFAULT 'Python'
);
```

### Assignment 2: Create `employee` Table with Full Constraints
```sql
CREATE TABLE employee (
    EmpID      INT PRIMARY KEY AUTO_INCREMENT,
    EmpName    VARCHAR(50) NOT NULL,
    Department VARCHAR(30) NOT NULL,
    Salary     DECIMAL(10,2) CHECK (Salary > 0),
    Email      VARCHAR(100) UNIQUE,
    JoinDate   DATE DEFAULT (CURRENT_DATE),
    Status     VARCHAR(10) DEFAULT 'Active'
);
```

### Assignment 3: Create `products` with Category Foreign Key
```sql
-- Parent table:
CREATE TABLE categories (
    CategoryID   INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(30) NOT NULL UNIQUE
);

-- Child table:
CREATE TABLE products (
    ProductID   INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    Price       DECIMAL(10,2) CHECK (Price > 0),
    Quantity    INT DEFAULT 0,
    CategoryID  INT,
    FOREIGN KEY (CategoryID) REFERENCES categories(CategoryID)
);
```

### Assignment 4: Create `orders` Table
```sql
CREATE TABLE orders (
    OrderID      INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(50) NOT NULL,
    OrderDate    DATE DEFAULT (CURRENT_DATE),
    TotalAmount  DECIMAL(10,2) CHECK (TotalAmount >= 0),
    Status       VARCHAR(20) DEFAULT 'Pending'
);
```

### Assignment 5: Create `exam_results` with Score Validation
```sql
CREATE TABLE exam_results (
    ResultID    INT PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR(50) NOT NULL,
    Subject     VARCHAR(30) NOT NULL,
    Score       INT CHECK (Score BETWEEN 0 AND 100),
    Grade       VARCHAR(5)
);
```

### Assignment 6: Create `users` Table (No Reserved Word Collision)
```sql
CREATE TABLE users (
    UserID      INT PRIMARY KEY AUTO_INCREMENT,
    Username    VARCHAR(30) NOT NULL UNIQUE,
    Email       VARCHAR(100) NOT NULL UNIQUE,
    Password    VARCHAR(255) NOT NULL,
    MobileNo    VARCHAR(15) UNIQUE,
    CreatedAt   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    AccountType VARCHAR(20) CHECK (AccountType IN ('Admin', 'User', 'Guest'))
);
```

### Assignment 7: Composite Primary Key — OrderItems
```sql
CREATE TABLE order_items (
    OrderID   INT,
    ProductID INT,
    Quantity  INT NOT NULL CHECK (Quantity > 0),
    UnitPrice DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (OrderID, ProductID)
);
```

---

## Day 2 Assignment — DDL Alterations & Functions

### Assignment 8: Add and Drop Columns
```sql
-- Add columns:
ALTER TABLE employee ADD COLUMN Bonus DECIMAL(10,2) DEFAULT 0;
ALTER TABLE employee ADD COLUMN ManagerID INT;

-- Drop column:
ALTER TABLE employee DROP COLUMN ManagerID;
```

### Assignment 9: Modify Column Types
```sql
-- Expand string column:
ALTER TABLE employee MODIFY COLUMN EmpName VARCHAR(100);

-- Fix wrong type:
ALTER TABLE employee MODIFY COLUMN Department VARCHAR(50) NOT NULL;

-- Add constraint to existing column:
ALTER TABLE products MODIFY COLUMN ProductName VARCHAR(150) NOT NULL;
```

### Assignment 10: Rename Column and Table
```sql
ALTER TABLE employee RENAME COLUMN EmpName TO FullName;
ALTER TABLE employee RENAME TO staff;
```

### Assignment 11: String Function Exercises
```sql
-- Convert names to uppercase:
SELECT UPPER(ename) AS upper_name FROM emp;

-- Get first 3 characters:
SELECT SUBSTR(ename, 1, 3) AS short_name FROM emp;

-- Concatenate name and job:
SELECT CONCAT(ename, ' works as ', job) AS emp_info FROM emp;

-- Replace job title:
SELECT REPLACE(job, 'CLERK', 'ASSOCIATE') AS new_title FROM emp;

-- Find length of name:
SELECT ename, LENGTH(ename) AS name_length FROM emp ORDER BY name_length DESC;

-- Pad name to 15 chars:
SELECT LPAD(ename, 15, '*') AS padded_name FROM emp;
```

### Assignment 12: Numeric Function Exercises
```sql
-- Round salary to nearest 100:
SELECT ename, sal, ROUND(sal, -2) AS rounded_sal FROM emp;

-- Salary remainder after dividing by 1000:
SELECT ename, sal, MOD(sal, 1000) AS remainder FROM emp;

-- Square root of salary:
SELECT ename, sal, ROUND(SQRT(sal), 2) AS sqrt_sal FROM emp;

-- Ceiling and Floor on sal/300:
SELECT ename, sal, CEIL(sal/300) AS ceil_val, FLOOR(sal/300) AS floor_val FROM emp;
```

### Assignment 13: Date Function Exercises
```sql
-- Years of service:
SELECT ename, hiredate,
       YEAR(NOW()) - YEAR(hiredate) AS years_of_service
FROM emp;

-- Employees hired in 1981:
SELECT ename, hiredate FROM emp WHERE YEAR(hiredate) = 1981;

-- Days since hired:
SELECT ename, hiredate, DATEDIFF(NOW(), hiredate) AS days_worked FROM emp;

-- Format hire date:
SELECT ename, DATE_FORMAT(hiredate, '%d-%b-%Y') AS formatted_date FROM emp;
```

---

## Day 3 Assignment — Analytical SQL (SalesDB)

### Assignment 14: Subquery — Employees Earning Above Average
```sql
SELECT ename, sal
FROM emp
WHERE sal > (SELECT AVG(sal) FROM emp)
ORDER BY sal DESC;
```

### Assignment 15: Subquery — Highest Paid Per Department
```sql
SELECT ename, deptno, sal
FROM emp
WHERE sal IN (
    SELECT MAX(sal) FROM emp GROUP BY deptno
);
```

### Assignment 16: Subquery — Second Highest Salary
```sql
SELECT MAX(sal) AS second_highest
FROM emp
WHERE sal < (SELECT MAX(sal) FROM emp);
```

### Assignment 17: JOIN with Aggregation — Department Summary
```sql
SELECT
    d.dname,
    COUNT(e.empno)    AS headcount,
    SUM(e.sal)        AS total_salary,
    ROUND(AVG(e.sal), 2) AS avg_salary,
    MAX(e.sal)        AS max_salary
FROM emp e
JOIN dept d ON e.deptno = d.deptno
GROUP BY d.dname
ORDER BY total_salary DESC;
```

### Assignment 18: JOIN — Employees with Manager Name
```sql
SELECT
    e.empno,
    e.ename AS employee,
    e.sal,
    m.ename AS manager
FROM emp e
LEFT JOIN emp m ON e.mgr = m.empno
ORDER BY e.deptno;
```

### Assignment 19: Window Function — Rank by Salary per Department
```sql
SELECT
    empno, ename, deptno, sal,
    RANK()       OVER(PARTITION BY deptno ORDER BY sal DESC) AS dept_rank,
    DENSE_RANK() OVER(PARTITION BY deptno ORDER BY sal DESC) AS dept_dense_rank
FROM emp;
```

### Assignment 20: Create View — Department Salary Report
```sql
CREATE VIEW dept_salary_report AS
SELECT
    d.deptno,
    d.dname,
    COUNT(e.empno)       AS total_employees,
    ROUND(AVG(e.sal), 2) AS avg_salary,
    SUM(e.sal)           AS total_payroll
FROM emp e
JOIN dept d ON e.deptno = d.deptno
GROUP BY d.deptno, d.dname;

-- Query the view:
SELECT * FROM dept_salary_report ORDER BY total_payroll DESC;
```

### Assignment 21: CTE — Top Earner per Department
```sql
WITH ranked_emp AS (
    SELECT
        empno, ename, deptno, sal,
        ROW_NUMBER() OVER(PARTITION BY deptno ORDER BY sal DESC) AS rn
    FROM emp
)
SELECT empno, ename, deptno, sal
FROM ranked_emp
WHERE rn = 1;
```

### Assignment 22: CTE — Running Total of Salary by Hire Date
```sql
WITH ordered_emp AS (
    SELECT empno, ename, hiredate, sal
    FROM emp
    ORDER BY hiredate
)
SELECT
    empno, ename, hiredate, sal,
    SUM(sal) OVER(ORDER BY hiredate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM ordered_emp;
```

### Assignment 23: CASE — Salary Classification
```sql
SELECT
    empno, ename, deptno, sal,
    CASE
        WHEN sal >= 5000 THEN 'SENIOR'
        WHEN sal >= 3000 THEN 'MID-LEVEL'
        WHEN sal >= 1500 THEN 'JUNIOR'
        ELSE 'ENTRY'
    END AS salary_band
FROM emp
ORDER BY sal DESC;
```

### Assignment 24: EXISTS — Departments with Employees
```sql
SELECT deptno, dname
FROM dept d
WHERE EXISTS (
    SELECT 1 FROM emp e WHERE e.deptno = d.deptno
);
```

### Assignment 25: Deduplicate using CTE + ROW_NUMBER
```sql
WITH dupes AS (
    SELECT *,
           ROW_NUMBER() OVER(PARTITION BY ename, job ORDER BY empno) AS rn
    FROM emp
)
SELECT * FROM dupes WHERE rn > 1;  -- Show duplicates (before deleting)
```

---

## 💡 Key Assignment Patterns to Remember

| Pattern | When to Use |
|---------|-------------|
| `ROW_NUMBER() + CTE` | Deduplication, top-N per group |
| `MAX(sal)` in subquery | Find second highest — `WHERE sal < (SELECT MAX...)` |
| `LEFT JOIN` to self | Hierarchical lookups (emp → manager) |
| `EXISTS` vs `IN` | `EXISTS` is more efficient for large datasets |
| `PARTITION BY` in `OVER()` | Reset ranking/aggregation per group |
| `VIEWS` | Reuse complex joins — don't repeat them |
