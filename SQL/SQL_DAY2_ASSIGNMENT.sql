/* ============================================================================
   SQL DAY 2 ASSIGNMENT - COMPLETE SOLVED EXERCISES & EXPLANATIONS
   ============================================================================
   Author: Prasanth Golla
   Description: Complete solved SQL solutions for Day 2 Assignment covering:
                Part 1: DDL & Constraints Alterations (20 Exercises)
                Part 2: String Functions & Pattern Matching (30 Exercises)
                Part 3: Number & Math Functions (25 Exercises)
                Part 4: Date & Time Functions (Core Date Exercises)
   ============================================================================ */

CREATE DATABASE IF NOT EXISTS Day2_AssignmentDB;
USE Day2_AssignmentDB;

-- Create base sample table for DDL alterations
CREATE TABLE IF NOT EXISTS employee (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(30),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    city VARCHAR(50),
    gender VARCHAR(20)
);

-- ============================================================================
-- PART 1: DDL & CONSTRAINTS ALTERATIONS (EXERCISES 1 - 20)
-- ============================================================================

/* Ex 1: Add column age of type INT */
ALTER TABLE employee ADD COLUMN age INT;

/* Ex 2: Add column experience after salary */
ALTER TABLE employee ADD COLUMN experience INT AFTER salary;

/* Ex 3: Add column country with default value 'India' */
ALTER TABLE employee ADD COLUMN country VARCHAR(50) DEFAULT 'India';

/* Ex 4: Modify salary column to DECIMAL(12,2) */
ALTER TABLE employee MODIFY COLUMN salary DECIMAL(12,2);

/* Ex 5: Change phone column size to VARCHAR(20) */
ALTER TABLE employee MODIFY COLUMN phone VARCHAR(20);

/* Ex 6: Rename column city to location */
ALTER TABLE employee RENAME COLUMN city TO location;

/* Ex 7: Rename column bonus to annual_bonus */
ALTER TABLE employee RENAME COLUMN bonus TO annual_bonus;

/* Ex 8: Rename table employee to employees */
ALTER TABLE employee RENAME TO employees;

/* Ex 9: Rename table back to employee */
ALTER TABLE employees RENAME TO employee;

/* Ex 10: Drop experience column */
ALTER TABLE employee DROP COLUMN experience;

/* Ex 11: Add NOT NULL constraint to department */
ALTER TABLE employee MODIFY COLUMN department VARCHAR(50) NOT NULL;

/* Ex 12: Remove default value from country */
ALTER TABLE employee MODIFY COLUMN country VARCHAR(50) DEFAULT NULL;

/* Ex 13: Add UNIQUE constraint on email */
ALTER TABLE employee ADD CONSTRAINT uk_email UNIQUE (email);

/* Ex 14: Drop UNIQUE constraint from email */
ALTER TABLE employee DROP INDEX uk_email;

/* Ex 15: Add CHECK constraint to ensure salary > 10000 */
ALTER TABLE employee ADD CONSTRAINT chk_salary CHECK (salary > 10000);

/* Ex 16: Add column status with default value 'Active' */
ALTER TABLE employee ADD COLUMN status VARCHAR(20) DEFAULT 'Active';

/* Ex 17: Change datatype of gender to VARCHAR(10) */
ALTER TABLE employee MODIFY COLUMN gender VARCHAR(10);

/* Ex 18: Move country column after location */
ALTER TABLE employee MODIFY COLUMN country VARCHAR(50) AFTER location;

/* Ex 19: Add column manager_id */
ALTER TABLE employee ADD COLUMN manager_id INT;

/* Ex 20: Drop both manager_id and country */
ALTER TABLE employee DROP COLUMN manager_id, DROP COLUMN country;


-- ============================================================================
-- PART 2: STRING FUNCTIONS (EXERCISES 21 - 50)
-- ============================================================================

/* Ex 21: Display employee first names in uppercase */
SELECT UPPER(first_name) AS uppercase_first_name FROM employee;

/* Ex 22: Display employee last names in lowercase */
SELECT LOWER(last_name) AS lowercase_last_name FROM employee;

/* Ex 23: Display the length of each first name */
SELECT first_name, LENGTH(first_name) AS name_length FROM employee;

/* Ex 24: Show the first three characters of every first name */
SELECT SUBSTRING(first_name, 1, 3) AS first_3_chars FROM employee;

/* Ex 25: Show the last four characters of every email */
SELECT RIGHT(email, 4) AS email_suffix FROM employee;

/* Ex 26: Concatenate first name and last name */
SELECT CONCAT(first_name, last_name) AS concatenated_name FROM employee;

/* Ex 27: Display full name with a space between names */
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employee;

/* Ex 28: Replace "gmail.com" with "company.com" */
SELECT REPLACE(email, 'gmail.com', 'company.com') AS company_email FROM employee;

/* Ex 29: Find the position of '@' in each email */
SELECT email, INSTR(email, '@') AS at_position FROM employee;

/* Ex 30: Display employee names with leading spaces removed */
SELECT LTRIM(first_name) AS ltrimmed_name FROM employee;

/* Ex 31: Display employee names with trailing spaces removed */
SELECT RTRIM(first_name) AS rtrimmed_name FROM employee;

/* Ex 32: Remove leading and trailing spaces from a string */
SELECT TRIM(first_name) AS clean_name FROM employee;

/* Ex 33: Reverse every employee's first name */
SELECT REVERSE(first_name) AS reversed_name FROM employee;

/* Ex 34: Repeat the first name three times */
SELECT REPEAT(first_name, 3) AS repeated_name FROM employee;

/* Ex 35: Display first names padded with '*' to 15 characters */
SELECT RPAD(first_name, 15, '*') AS right_padded_name FROM employee;

/* Ex 36: Display last names padded on the left with '#' */
SELECT LPAD(last_name, 15, '#') AS left_padded_name FROM employee;

/* Ex 37: Extract the domain name from email addresses */
SELECT SUBSTRING_INDEX(email, '@', -1) AS email_domain FROM employee;

/* Ex 38: Display only the username from email addresses */
SELECT SUBSTRING_INDEX(email, '@', 1) AS email_username FROM employee;

/* Ex 39: Convert department name to uppercase */
SELECT UPPER(department) AS uppercase_dept FROM employee;

/* Ex 40: Convert location name to lowercase */
SELECT LOWER(location) AS lowercase_location FROM employee;

/* Ex 41: Find employees whose first name starts with 'A' */
SELECT * FROM employee WHERE first_name LIKE 'A%';

/* Ex 42: Find employees whose last name ends with 'n' */
SELECT * FROM employee WHERE last_name LIKE '%n';

/* Ex 43: Find employees whose email contains "gmail" */
SELECT * FROM employee WHERE email LIKE '%gmail%';

/* Ex 44: Display the first occurrence of letter 'a' in each first name */
SELECT first_name, INSTR(LOWER(first_name), 'a') AS pos_a FROM employee;

/* Ex 45: Replace all occurrences of 'a' with '*' */
SELECT REPLACE(LOWER(first_name), 'a', '*') AS masked_name FROM employee;

/* Ex 46: Display the first 5 characters of department names */
SELECT LEFT(department, 5) AS short_dept FROM employee;

/* Ex 47: Display employee initials */
SELECT CONCAT(LEFT(first_name, 1), '.', LEFT(last_name, 1), '.') AS initials FROM employee;

/* Ex 48: Count the number of characters in each email */
SELECT email, LENGTH(email) AS email_length FROM employee;

/* Ex 49: Remove "@" from email addresses */
SELECT REPLACE(email, '@', '') AS no_at_email FROM employee;

/* Ex 50: Display full name in format: Smith, John */
SELECT CONCAT(last_name, ', ', first_name) AS formatted_name FROM employee;


-- ============================================================================
-- PART 3: NUMBER & MATH FUNCTIONS (EXERCISES 51 - 75)
-- ============================================================================

/* Ex 51: Round every salary */
SELECT ROUND(salary) AS rounded_salary FROM employee;

/* Ex 52: Round salary to two decimal places */
SELECT ROUND(salary, 2) AS salary_2dec FROM employee;

/* Ex 53: Round salary to nearest thousand */
SELECT ROUND(salary, -3) AS salary_nearest_1000 FROM employee;

/* Ex 54: Find the ceiling value of salary */
SELECT CEIL(salary) AS ceil_salary FROM employee;

/* Ex 55: Find the floor value of salary */
SELECT FLOOR(salary) AS floor_salary FROM employee;

/* Ex 56: Find the absolute value of -150 */
SELECT ABS(-150) AS abs_val;

/* Ex 57: Display salary divided by 3 rounded to two decimals */
SELECT ROUND(salary / 3, 2) AS div_3_salary FROM employee;

/* Ex 58: Calculate salary raised to the power of 2 */
SELECT POWER(salary, 2) AS salary_squared FROM employee;

/* Ex 59: Find the square root of salary */
SELECT SQRT(salary) AS sqrt_salary FROM employee;

/* Ex 60: Find remainder when salary is divided by 1000 */
SELECT MOD(salary, 1000) AS salary_mod_1000 FROM employee;

/* Ex 61: Generate a random number */
SELECT RAND() AS random_value;

/* Ex 62: Generate a random number between 1 and 100 */
SELECT FLOOR(1 + RAND() * 100) AS random_1_100;

/* Ex 63: Display PI value */
SELECT PI() AS pi_constant;

/* Ex 64: Convert degrees to radians */
SELECT RADIANS(180) AS rad_val;

/* Ex 65: Convert radians to degrees */
SELECT DEGREES(PI()) AS deg_val;

/* Ex 66: Find greatest among salary, annual_bonus, 100000 */
SELECT GREATEST(salary, IFNULL(annual_bonus, 0), 100000) AS greatest_val FROM employee;

/* Ex 67: Find least among salary, annual_bonus, 5000 */
SELECT LEAST(salary, IFNULL(annual_bonus, 0), 5000) AS least_val FROM employee;

/* Ex 68: Display salary truncated to one decimal place */
SELECT TRUNCATE(salary, 1) AS truncated_salary FROM employee;

/* Ex 69: Find the sign of salary */
SELECT SIGN(salary) AS salary_sign FROM employee;

/* Ex 70: Calculate monthly salary */
SELECT salary / 12 AS monthly_salary FROM employee;

/* Ex 71: Calculate annual salary including bonus */
SELECT (salary * 12) + IFNULL(annual_bonus, 0) AS total_annual_earnings FROM employee;

/* Ex 72: Increase salary by 12% */
SELECT salary * 1.12 AS salary_after_hike FROM employee;

/* Ex 73: Find average of salary and annual_bonus */
SELECT (salary + IFNULL(annual_bonus, 0)) / 2 AS avg_pay FROM employee;

/* Ex 74: Find salary divided equally into 12 months */
SELECT salary / 12 AS monthly_split FROM employee;

/* Ex 75: Display salary rounded to nearest hundred */
SELECT ROUND(salary, -2) AS rounded_hundred FROM employee;


-- ============================================================================
-- PART 4: DATE FUNCTIONS (EXERCISES 76 - 83)
-- ============================================================================

/* Ex 76: Display today's date */
SELECT CURDATE() AS todays_date;

/* Ex 77: Display current date and time */
SELECT NOW() AS current_timestamp_val;

/* Ex 78: Display current time only */
SELECT CURTIME() AS current_time_val;

/* Ex 79: Display current year */
SELECT YEAR(CURDATE()) AS current_year;

/* Ex 80: Display current month */
SELECT MONTH(CURDATE()) AS current_month_num;

/* Ex 81: Display current day */
SELECT DAY(CURDATE()) AS current_day_num;

/* Ex 82: Display current month name */
SELECT MONTHNAME(CURDATE()) AS current_month_name;

/* Ex 83: Display current day name */
SELECT DAYNAME(CURDATE()) AS current_day_name;
