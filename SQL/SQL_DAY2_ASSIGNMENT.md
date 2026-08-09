<div align="center">

![SQL](https://img.shields.io/badge/SQL-MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![Day 2 Assignment](https://img.shields.io/badge/Assignment-Day_2_Solved-4CAF50?style=for-the-badge)
![Level](https://img.shields.io/badge/Level-Intermediate-FF9800?style=for-the-badge)

# SQL Day 2 Assignment — Solved Guide & Detailed Explanations

**Complete solutions for all 83 exercises in `SQL_DAY2_ASSIGNMENT.txt` covering DDL Alterations, String Functions, Numeric Math Functions, and Date/Time Functions.**

---

</div>

## 📚 Section Breakdown

| Section | Topic | Exercise Count | Core Concepts Covered |
|:-------:|-------|:--------------:|-----------------------|
| **Part 1** | DDL & Constraints Alterations | 20 | `ADD`, `MODIFY`, `DROP`, `RENAME COLUMN`, `RENAME TO`, `DEFAULT`, `UNIQUE`, `CHECK` |
| **Part 2** | String Functions | 30 | `UPPER`, `LOWER`, `LENGTH`, `SUBSTR`, `CONCAT`, `REPLACE`, `TRIM`, `RPAD`, `LPAD`, `SUBSTRING_INDEX` |
| **Part 3** | Number & Math Functions | 25 | `ROUND`, `CEIL`, `FLOOR`, `POWER`, `SQRT`, `MOD`, `RAND`, `GREATEST`, `LEAST`, `TRUNCATE` |
| **Part 4** | Date & Time Functions | 8 | `CURDATE`, `NOW`, `CURTIME`, `YEAR`, `MONTH`, `DAY`, `MONTHNAME`, `DAYNAME` |

---

## 🔍 Solved Exercises Highlights & Key Explanations

---

### 🟢 Part 1: DDL & Constraints Alterations

```sql
-- Ex 2: Add column experience after salary
ALTER TABLE employee ADD COLUMN experience INT AFTER salary;

-- Ex 4: Modify salary column to DECIMAL(12,2)
ALTER TABLE employee MODIFY COLUMN salary DECIMAL(12,2);

-- Ex 6: Rename column city to location
ALTER TABLE employee RENAME COLUMN city TO location;

-- Ex 11: Add NOT NULL constraint to department
ALTER TABLE employee MODIFY COLUMN department VARCHAR(50) NOT NULL;

-- Ex 15: Add CHECK constraint to ensure salary > 10000
ALTER TABLE employee ADD CONSTRAINT chk_salary CHECK (salary > 10000);
```

* **Explanation**:  
  - `AFTER column_name` repositions new columns physically in table layout.
  - `RENAME COLUMN old TO new` updates column metadata without dropping data.
  - `ADD CONSTRAINT ... CHECK` attaches domain range rules to existing tables.

---

### 🔵 Part 2: String Functions

```sql
-- Ex 28: Replace "gmail.com" with "company.com"
SELECT REPLACE(email, 'gmail.com', 'company.com') AS company_email FROM employee;

-- Ex 37: Extract the domain name from email addresses
SELECT SUBSTRING_INDEX(email, '@', -1) AS email_domain FROM employee;

-- Ex 38: Display only the username from email addresses
SELECT SUBSTRING_INDEX(email, '@', 1) AS email_username FROM employee;

-- Ex 47: Display employee initials (e.g., J.S.)
SELECT CONCAT(LEFT(first_name, 1), '.', LEFT(last_name, 1), '.') AS initials FROM employee;

-- Ex 50: Display full name in format: Smith, John
SELECT CONCAT(last_name, ', ', first_name) AS formatted_name FROM employee;
```

* **Explanation**:  
  - `SUBSTRING_INDEX(str, delim, count)` extracts text before (count=1) or after (count=-1) a delimiter character.
  - `LEFT(str, n)` extracts the first `n` characters from a string for initials creation.

---

### 🟡 Part 3: Number & Math Functions

```sql
-- Ex 53: Round salary to nearest thousand
SELECT ROUND(salary, -3) AS salary_nearest_1000 FROM employee;

-- Ex 62: Generate a random integer between 1 and 100
SELECT FLOOR(1 + RAND() * 100) AS random_1_100;

-- Ex 66: Find greatest among salary, annual_bonus, 100000
SELECT GREATEST(salary, IFNULL(annual_bonus, 0), 100000) AS greatest_val FROM employee;

-- Ex 68: Display salary truncated to one decimal place
SELECT TRUNCATE(salary, 1) AS truncated_salary FROM employee;
```

* **Explanation**:  
  - Negative decimals in `ROUND(val, -3)` round to left of the decimal point (nearest thousand).
  - `GREATEST(a, b, c)` selects the maximum value among multiple arguments horizontally across columns.

---

### 🟣 Part 4: Date Functions

```sql
-- Ex 76: Display today's date
SELECT CURDATE() AS todays_date;

-- Ex 77: Display current timestamp
SELECT NOW() AS current_timestamp_val;

-- Ex 82: Display current month name
SELECT MONTHNAME(CURDATE()) AS current_month_name;

-- Ex 83: Display current day name
SELECT DAYNAME(CURDATE()) AS current_day_name;
```

* **Explanation**:  
  - `CURDATE()` returns current date `'YYYY-MM-DD'`.
  - `MONTHNAME()` and `DAYNAME()` extract human-readable month and weekday strings.

---

<div align="center">

[![Previous Notes](https://img.shields.io/badge/←_Previous-Day_1_Assignment_Solved-4CAF50?style=for-the-badge)](./SQL_DAY1_ASSIGNMENT.md)
[![Next Notes](https://img.shields.io/badge/Next-Day_3_Assignment_Solved-2196F3?style=for-the-badge)](./SQL_DAY3_ASSIGNMENT.md)

</div>
