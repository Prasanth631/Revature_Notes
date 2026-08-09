/* ============================================================================
   DAY 1 DDL ADVANCED ALTER TABLE, TRUNCATE, UPDATE & TRANSACTIONS
   ============================================================================
   Author: Prasanth Golla
   Description: Advanced ALTER TABLE operations (MODIFY, ADD, DROP, RENAME COLUMN, 
                RENAME TABLE, ADD CONSTRAINT), TRUNCATE TABLE vs DELETE, SQL Safe 
                Updates mode, UPDATE statement variations, and ROLLBACK mechanics.
   ============================================================================ */

-- ============================================================================
-- SECTION 1: ALTER TABLE - COLUMN MODIFICATIONS & CONSTRAINTS
-- ============================================================================

/*
   QUERY 1: Select Active Database
   - WHAT IS THIS QUERY? Session context setting statement.
   - WHAT DOES IT DO? Sets 'trainingdb' as active schema.
   - HOW KEYWORD WORKS: `USE` directs session database focus.
   - RESULT: Active database changed to 'trainingdb'.
*/
USE trainingdb;

/*
   QUERY 2: Inspect Table Schema Before Alteration
   - WHAT IS THIS QUERY? Utility schema inspection query.
   - WHAT DOES IT DO? Displays column layout for 'employees'.
   - HOW KEYWORD WORKS: `DESC` outputs information_schema metadata.
   - RESULT: Displays fields ID, FIRST_NAME, SALARY.
*/
DESC employees;

/*
   QUERY 3: Modify Column Data Type
   - WHAT IS THIS QUERY? DDL schema alteration statement.
   - WHAT DOES IT DO? Changes `id` column data type to `FLOAT`.
   - HOW KEYWORD WORKS: `ALTER TABLE ... MODIFY COLUMN` re-defines column data type.
   - RESULT: Column 'id' data type changed to FLOAT.
*/
ALTER TABLE employees 
MODIFY COLUMN id FLOAT;

/*
   QUERY 4: Expand Column Length
   - WHAT IS THIS QUERY? DDL column size alteration statement.
   - WHAT DOES IT DO? Expands `first_name` size from `VARCHAR(30)` to `VARCHAR(40)`.
   - HOW KEYWORD WORKS: `MODIFY COLUMN` increases max string storage limit.
   - RESULT: Column 'first_name' max size increased to 40 characters.
*/
ALTER TABLE employees 
MODIFY COLUMN first_name VARCHAR(40);

/*
   QUERY 5: Add Default Value to Existing Column
   - WHAT IS THIS QUERY? DDL default constraint addition.
   - WHAT DOES IT DO? Sets default value of `salary` to 10000 for future inserts.
   - HOW KEYWORD WORKS: `MODIFY COLUMN ... DEFAULT 10000` attaches default constraint.
   - RESULT: Default value 10000 attached to salary.
*/
ALTER TABLE employees 
MODIFY COLUMN salary FLOAT DEFAULT 10000;

/*
   QUERY 6: Add NOT NULL Constraint to Existing Column
   - WHAT IS THIS QUERY? DDL column constraint application.
   - WHAT DOES IT DO? Alters `id` column to reject NULL values (`NOT NULL`).
   - HOW KEYWORD WORKS: `MODIFY COLUMN ... NOT NULL` adds mandatory constraint to existing column.
   - RESULT: 'id' column configured as NOT NULL.
*/
ALTER TABLE employees 
MODIFY COLUMN id FLOAT NOT NULL;

/*
   QUERY 7: Remove Default Value Constraint
   - WHAT IS THIS QUERY? DDL constraint removal statement.
   - WHAT DOES IT DO? Removes default value from `salary` (resets to DEFAULT NULL).
   - HOW KEYWORD WORKS: `MODIFY COLUMN ... DEFAULT NULL` removes previous default value.
   - RESULT: Default value constraint removed.
*/
ALTER TABLE employees 
MODIFY COLUMN salary FLOAT DEFAULT NULL;

/*
   QUERY 8: Allow NULL Values on Column
   - WHAT IS THIS QUERY? DDL constraint relaxation query.
   - WHAT DOES IT DO? Relaxes `id` column to permit NULL entries.
   - HOW KEYWORD WORKS: `MODIFY COLUMN ... NULL` removes NOT NULL constraint.
   - RESULT: 'id' column now accepts NULL values.
*/
ALTER TABLE employees 
MODIFY COLUMN id FLOAT NULL;


-- ============================================================================
-- SECTION 2: ALTER TABLE - ADDING & DROPPING COLUMNS
-- ============================================================================

/*
   QUERY 9: Add Single New Column
   - WHAT IS THIS QUERY? DDL table expansion query.
   - WHAT DOES IT DO? Adds a new `email VARCHAR(30)` column to 'employees'.
   - HOW KEYWORD WORKS: `ALTER TABLE ... ADD COLUMN` appends a new attribute to table structure.
   - RESULT: Column 'email' added to table.
*/
ALTER TABLE employees 
ADD COLUMN email VARCHAR(30);

/*
   QUERY 10: Add Multiple Columns Simultaneously
   - WHAT IS THIS QUERY? DDL multi-column expansion query.
   - WHAT DOES IT DO? Adds both `phone_no INT` and `city VARCHAR(30)` in a single statement.
   - HOW KEYWORD WORKS: `ADD COLUMN (col1 type1, col2 type2)` adds multiple attributes.
   - RESULT: Columns 'phone_no' and 'city' added.
*/
ALTER TABLE employees 
ADD COLUMN (phone_no INT, city VARCHAR(30));

/*
   QUERY 11: Drop Column
   - WHAT IS THIS QUERY? DDL column deletion query.
   - WHAT DOES IT DO? Permanently removes `email` column and its stored data from 'employees'.
   - HOW KEYWORD WORKS: `ALTER TABLE ... DROP COLUMN` deletes a column definition and data.
   - RESULT: Column 'email' dropped.
*/
ALTER TABLE employees 
DROP COLUMN email;

/*
   QUERY 12: Drop Another Column
   - WHAT IS THIS QUERY? DDL column removal statement.
   - WHAT DOES IT DO? Permanently drops `city` column.
   - HOW KEYWORD WORKS: `DROP COLUMN` removes attribute from schema.
   - RESULT: Column 'city' dropped.
*/
ALTER TABLE employees 
DROP COLUMN city;


-- ============================================================================
-- SECTION 3: SAFE UPDATES, ADDING CONSTRAINTS & RENAMING
-- ============================================================================

/*
   QUERY 13: Disable MySQL Safe Updates Mode
   - WHAT IS THIS QUERY? Session configuration command.
   - WHAT DOES IT DO? Allows UPDATE/DELETE queries without WHERE clause on primary key columns.
   - HOW KEYWORD WORKS: `SET SQL_SAFE_UPDATES = 0` disables safe update protection.
   - RESULT: Safe updates mode disabled for current session.
*/
SET SQL_SAFE_UPDATES = 0;

/*
   QUERY 14: Add Named Primary Key Constraint via ALTER TABLE
   - WHAT IS THIS QUERY? DDL constraint addition to existing table.
   - WHAT DOES IT DO? Adds a primary key constraint named 'emp_pk' on `first_name`.
   - HOW KEYWORD WORKS: `ALTER TABLE ... ADD CONSTRAINT constraint_name PRIMARY KEY(column)` attaches primary key.
   - RESULT: Primary Key constraint 'emp_pk' added to 'first_name'.
*/
ALTER TABLE employees 
ADD CONSTRAINT emp_pk PRIMARY KEY (first_name);

/*
   QUERY 15: Add Named CHECK Constraint via ALTER TABLE
   - WHAT IS THIS QUERY? DDL domain validation constraint addition.
   - WHAT DOES IT DO? Adds a CHECK constraint named 'salary_check' enforcing `salary > 0`.
   - HOW KEYWORD WORKS: `ADD CONSTRAINT ... CHECK (condition)` attaches validation rule to existing table.
   - RESULT: Constraint 'salary_check' attached.
*/
ALTER TABLE employees 
ADD CONSTRAINT salary_check CHECK (salary > 0);

/*
   QUERY 16: Rename Column
   - WHAT IS THIS QUERY? DDL column renaming statement.
   - WHAT DOES IT DO? Renames column `id` to `emp_id`.
   - HOW KEYWORD WORKS: `ALTER TABLE ... RENAME COLUMN old TO new` updates column name in metadata.
   - RESULT: Column 'id' renamed to 'emp_id'.
*/
ALTER TABLE employees 
RENAME COLUMN id TO emp_id;

/*
   QUERY 17: Rename Table
   - WHAT IS THIS QUERY? DDL table entity renaming query.
   - WHAT DOES IT DO? Renames table 'employees' to 'employee_test'.
   - HOW KEYWORD WORKS: `ALTER TABLE ... RENAME TO new_table_name` renames database relation entity.
   - RESULT: Table 'employees' renamed to 'employee_test'.
*/
ALTER TABLE employees 
RENAME TO employee_test;

/*
   QUERY 18: Inspect Renamed Table Schema
   - WHAT IS THIS QUERY? Schema verification query.
   - WHAT DOES IT DO? Displays column definitions for 'employee_test'.
   - HOW KEYWORD WORKS: `DESC` outputs metadata for renamed table.
   - RESULT: Displays 'employee_test' column structure.
*/
DESC employee_test;


-- ============================================================================
-- SECTION 4: TRUNCATE TABLE vs DELETE & TRANSACTION ROLLBACK
-- ============================================================================

/*
   QUERY 19: Truncate Table
   - WHAT IS THIS QUERY? DDL Table Data Reset Command.
   - WHAT DOES IT DO? Instantly deletes ALL rows from 'employee_test' and resets storage space.
   - HOW KEYWORD WORKS: `TRUNCATE TABLE` drops and recreates table structure (Fast, DDL, Auto-committed, Cannot Rollback).
   - RESULT: Table emptied completely.
*/
TRUNCATE TABLE employee_test;

/*
   QUERY 20: Delete Specific Row from Backup Table
   - WHAT IS THIS QUERY? DML Conditional Row Deletion.
   - WHAT DOES IT DO? Deletes row where `id = 1` from 'employees_bak'.
   - HOW KEYWORD WORKS: `DELETE FROM ... WHERE` removes matching rows (DML, Transactional, Can Rollback).
   - RESULT: 1 row deleted.
*/
DELETE FROM employees_bak 
WHERE id = 1;

/*
   QUERY 21: Test Rollback (Transaction Control)
   - WHAT IS THIS QUERY? TCL Transaction Rollback Statement.
   - WHAT DOES IT DO? Reverts uncommitted DML changes in current transaction.
   - HOW KEYWORD WORKS: `ROLLBACK` restores data to previous COMMIT state (works if autocommit is disabled or in explicit transaction).
   - RESULT: Uncommitted DML edits reverted.
*/
ROLLBACK;


-- ============================================================================
-- SECTION 5: UPDATE STATEMENT VARIATIONS
-- ============================================================================

/*
   QUERY 22: Update Single Field on Single Row
   - WHAT IS THIS QUERY? Basic DML Update Query.
   - WHAT DOES IT DO? Sets `salary = 10000` for employee where `id = 2` in 'employees_bak'.
   - HOW KEYWORD WORKS: `UPDATE ... SET ... WHERE` modifies column values for matching rows.
   - RESULT: Salary set to 10000 for id = 2.
*/
UPDATE employees_bak 
SET salary = 10000 
WHERE id = 2;

/*
   QUERY 23: Update Multiple Columns Simultaneously
   - WHAT IS THIS QUERY? Multi-column DML Update Statement.
   - WHAT DOES IT DO? Sets `salary = 10000` AND `first_name = 'SHAM KUMAR'` for `id = 2`.
   - HOW KEYWORD WORKS: `SET col1 = val1, col2 = val2` updates multiple fields in a single query.
   - RESULT: Salary and first_name updated for id = 2.
*/
UPDATE employees_bak 
SET salary = 10000, first_name = 'SHAM KUMAR' 
WHERE id = 2;

/*
   QUERY 24: Update Calculated Percentage Increase
   - WHAT IS THIS QUERY? Mathematical Expression DML Update.
   - WHAT DOES IT DO? Increases salary by 10% (`salary * 1.1`) for employee `id = 1`.
   - HOW KEYWORD WORKS: Arithmetic expression `salary * 1.1` evaluates previous value and calculates new salary.
   - RESULT: Salary increased by 10% for id = 1.
*/
UPDATE employees_bak 
SET salary = salary * 1.1 
WHERE id = 1;

/*
   QUERY 25: Conditional Bulk Update Across Multiple Rows
   - WHAT IS THIS QUERY? Multi-condition DML Bulk Update.
   - WHAT DOES IT DO? Increases salary by 10% for all employees where `id < 5` AND `salary >= 3000`.
   - HOW KEYWORD WORKS: Compound `WHERE ... AND ...` condition filters target rows before applying percentage increase.
   - RESULT: Qualifying employee salaries increased by 10%.
*/
UPDATE employees_bak 
SET salary = salary * 1.1 
WHERE id < 5 AND salary >= 3000;

/*
   QUERY 26: Retrieve Final Updated Backup Records
   - WHAT IS THIS QUERY? DML Selection Query.
   - WHAT DOES IT DO? Displays all records from 'employees_bak' to verify final update results.
   - HOW KEYWORD WORKS: `SELECT * FROM` retrieves all data rows.
   - RESULT: Displays final updated backup table rows.
*/
SELECT * FROM employees_bak;
