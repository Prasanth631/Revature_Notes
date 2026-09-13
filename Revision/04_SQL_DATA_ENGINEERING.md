# 04 — SQL for Data Engineering

> **Primary focus:** SQL is one of the highest-priority interview skills. Learn both syntax and the reasoning behind data retrieval, transformation, modeling and validation.

## Part A — Curriculum Notes

### SQL/RDBMS
- SQL works with relational structures such as schemas, tables, rows and columns.
- Know DDL, DML, DQL, DCL and TCL.
- Understand primary/foreign/unique keys, referential integrity, constraints and normalization.
- Know joins, aggregates, scalar functions, clauses, aliases and subqueries.
- Understand transactions, ACID, isolation, indexes, views, procedures and UDFs.

### Data-engineering SQL
- OLTP is transaction-oriented; OLAP is analytics-oriented.
- Warehouses commonly use facts and dimensions; star schemas favor analytical simplicity.
- SCD Type 1 overwrites; Type 2 preserves historical versions.
- Incremental SQL commonly uses timestamps/keys/change indicators and MERGE-style patterns.
- Always consider duplicates, NULLs, join cardinality, filtering, aggregation grain and data quality.

### High-value patterns
```sql
-- aggregation
SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id;

-- unmatched records
SELECT a.*
FROM source a
LEFT JOIN target b ON a.id = b.id
WHERE b.id IS NULL;

-- duplicate detection
SELECT id, COUNT(*)
FROM orders
GROUP BY id
HAVING COUNT(*) > 1;
```


# Part B — Full Interview Q&A

# SQL + RDBMS — Full Interview Q&A (Curriculum-Aligned)
> Detailed Q&A covering the SQL/RDBMS curriculum topics and extending the existing notes with interview-ready examples.

### 1. What is SQL?

**Answer:**
SQL is used to define, query, manipulate, and control relational data.

**Example:**
```text
SELECT * FROM employees;
```

**Remember:** SQL works with relational data.

### 2. What is an RDBMS?

**Answer:**
An RDBMS manages related tables, constraints, transactions, and access.

**Example:**
```text
Employees linked to Departments.
```

**Remember:** RDBMS = tables + relationships + management.

### 3. What is a schema?

**Answer:**
A schema is a logical namespace that organizes database objects.

**Example:**
```text
CREATE SCHEMA sales;
```

**Remember:** Schema organizes objects.

### 4. What is a table?

**Answer:**
A table stores rows and columns; columns have types and may have constraints.

**Example:**
```text
CREATE TABLE employees(id INT, name VARCHAR(100));
```

**Remember:** Row = record, column = attribute.

### 5. What are SQL data types?

**Answer:**
Common groups include numeric, decimal, character, date/time, boolean, binary, and vendor-specific types.

**Example:**
```text
salary DECIMAL(12,2)
```

**Remember:** Choose types by meaning.

### 6. What is DDL?

**Answer:**
Data Definition Language defines or changes structures.

**Example:**
```text
CREATE, ALTER, DROP, TRUNCATE
```

**Remember:** DDL = structure.

### 7. What is DML?

**Answer:**
Data Manipulation Language changes rows.

**Example:**
```text
INSERT, UPDATE, DELETE
```

**Remember:** DML = data changes.

### 8. What is DQL?

**Answer:**
DQL is commonly used for data retrieval, especially SELECT.

**Example:**
```text
SELECT ...
```

**Remember:** DQL = query.

### 9. What is DCL?

**Answer:**
Data Control Language manages permissions.

**Example:**
```text
GRANT, REVOKE
```

**Remember:** DCL = access.

### 10. What is TCL?

**Answer:**
Transaction Control Language manages transactions where supported.

**Example:**
```text
COMMIT, ROLLBACK
```

**Remember:** TCL = transaction control.

### 11. What is a primary key?

**Answer:**
A primary key uniquely identifies a row in a table.

**Example:**
```text
employee_id INT PRIMARY KEY
```

**Remember:** Primary key = chosen identifier.

### 12. What is a composite key?

**Answer:**
A composite key uses multiple columns together to identify a row.

**Example:**
```text
PRIMARY KEY(order_id,line_id)
```

**Remember:** Useful when one column is insufficient.

### 13. What is a foreign key?

**Answer:**
A foreign key references a key in another table and supports referential integrity.

**Example:**
```text
FOREIGN KEY(dept_id) REFERENCES departments(dept_id)
```

**Remember:** Foreign key = relationship.

### 14. What is referential integrity?

**Answer:**
It keeps relationships valid so child records do not point to missing parent keys when the constraint applies.

**Example:**
```text
employee.dept_id must exist in departments.
```

**Remember:** Protect relationships.

### 15. What is a unique key?

**Answer:**
UNIQUE prevents duplicate values in the constrained column set, subject to database-specific NULL rules.

**Example:**
```text
email VARCHAR(200) UNIQUE
```

**Remember:** Unique = no duplicate business value.

### 16. What is an alternate key?

**Answer:**
A candidate key not selected as the primary key.

**Example:**
```text
employee_id PK; email alternate unique identifier.
```

**Remember:** Candidate keys can be alternatives.

### 17. What is normalization?

**Answer:**
Normalization structures relational tables to reduce redundancy and update anomalies.

**Example:**
```text
Separate departments from employee records.
```

**Remember:** Normalization reduces duplication.

### 18. What is 1NF?

**Answer:**
1NF requires atomic values and avoids repeating groups.

**Example:**
```text
Do not store multiple phone numbers in one atomic field when they are separate attributes.
```

**Remember:** 1NF = atomic.

### 19. What is 2NF?

**Answer:**
2NF builds on 1NF and removes partial dependency on part of a composite key.

**Example:**
```text
A non-key attribute must depend on the whole composite key.
```

**Remember:** Relevant to composite keys.

### 20. What is 3NF?

**Answer:**
3NF removes inappropriate transitive dependencies between non-key attributes.

**Example:**
```text
Employee → dept_id → dept_name.
```

**Remember:** 3NF reduces transitive dependency.

### 21. What is multiplicity/cardinality?

**Answer:**
It describes relationship counts such as one-to-one, one-to-many, and many-to-many.

**Example:**
```text
One department has many employees.
```

**Remember:** Cardinality describes relationships.

### 22. What is database consistency?

**Answer:**
Consistency means transactions preserve defined database rules and constraints.

**Example:**
```text
Foreign keys remain valid after a transaction.
```

**Remember:** Consistency is part of ACID.

### 23. What does CREATE do?

**Answer:**
Creates a database object.

**Example:**
```text
CREATE TABLE employees(...);
```

**Remember:** CREATE = define.

### 24. What does ALTER do?

**Answer:**
Changes the structure of an existing object.

**Example:**
```text
ALTER TABLE employees ADD COLUMN salary DECIMAL(12,2);
```

**Remember:** ALTER = modify structure.

### 25. DROP vs TRUNCATE vs DELETE?

**Answer:**
DELETE removes selected rows, TRUNCATE removes all rows while preserving the table structure, and DROP removes the object. Exact transactional behavior is database-specific.

**Example:**
```text
DELETE FROM t WHERE id=1;
TRUNCATE TABLE t;
DROP TABLE t;
```

**Remember:** Rows vs all rows vs object.

### 26. What is auto-incrementing?

**Answer:**
It is automatic generation of key values using identity/sequence mechanisms depending on the database.

**Example:**
```text
Generated employee_id
```

**Remember:** Syntax is vendor-specific.

### 27. What is CHECK?

**Answer:**
CHECK enforces a condition on inserted/updated data.

**Example:**
```text
CHECK (salary >= 0)
```

**Remember:** Constraint = data guardrail.

### 28. What is DEFAULT?

**Answer:**
DEFAULT supplies a value when an INSERT omits the column.

**Example:**
```text
status VARCHAR(20) DEFAULT 'ACTIVE'
```

**Remember:** Fallback value.

### 29. What is CASCADE?

**Answer:**
CASCADE propagates supported parent row/object changes to dependent objects or rows.

**Example:**
```text
ON DELETE CASCADE
```

**Remember:** Use carefully.

### 30. What are aggregate functions?

**Answer:**
COUNT, SUM, AVG, MIN, and MAX summarize multiple rows.

**Example:**
```text
SELECT AVG(salary) FROM employees;
```

**Remember:** Aggregate = set-level.

### 31. What are scalar functions?

**Answer:**
They return a value for each individual input value.

**Example:**
```text
UPPER(name), LENGTH(name)
```

**Remember:** Scalar = row/value-level.

### 32. What are SQL clauses?

**Answer:**
Clauses are parts of SQL statements such as FROM, WHERE, GROUP BY, HAVING, ORDER BY, and LIMIT.

**Example:**
```text
SELECT ... FROM ... WHERE ...
```

**Remember:** Know what each clause does.

### 33. What is a subquery?

**Answer:**
A subquery is a query nested inside another query.

**Example:**
```text
salary > (SELECT AVG(salary) FROM employees)
```

**Remember:** Query inside query.

### 34. What is a correlated subquery?

**Answer:**
It references columns from the outer query and is logically evaluated in relation to each outer row.

**Example:**
```text
Compare employee salary to department average.
```

**Remember:** Correlated = depends on outer row.

### 35. What is a join?

**Answer:**
A join combines rows from multiple tables using a relationship or condition.

**Example:**
```text
employees JOIN departments ON ...
```

**Remember:** Join = combine tables.

### 36. What is INNER JOIN?

**Answer:**
Returns rows with matches on both sides.

**Example:**
```text
a INNER JOIN b ON a.id=b.id
```

**Remember:** Inner = matched rows.

### 37. What is LEFT JOIN?

**Answer:**
Returns all rows from the left plus matching right rows; nonmatches on the right become NULL.

**Example:**
```text
employees LEFT JOIN departments ...
```

**Remember:** Left = keep left.

### 38. What is RIGHT JOIN?

**Answer:**
Returns all rows from the right plus matching left rows.

**Example:**
```text
employees RIGHT JOIN departments ...
```

**Remember:** Right = keep right.

### 39. What is FULL OUTER JOIN?

**Answer:**
Returns matching rows and unmatched rows from both sides.

**Example:**
```text
a FULL OUTER JOIN b ON a.id=b.id
```

**Remember:** Full = both sides.

### 40. What is CROSS JOIN?

**Answer:**
Returns the Cartesian product of the two inputs.

**Example:**
```text
colors CROSS JOIN sizes
```

**Remember:** Can create huge results.

### 41. What is an equi join?

**Answer:**
A join using equality between join expressions.

**Example:**
```text
ON a.id=b.id
```

**Remember:** Equi = equality.

### 42. What is a theta join?

**Answer:**
A join whose condition can use comparison operators such as <, >, <=, >=, or <>.

**Example:**
```text
ON a.start_date <= b.end_date
```

**Remember:** Theta = flexible comparison.

### 43. What is an alias?

**Answer:**
An alias temporarily gives a table or column a shorter or clearer name.

**Example:**
```text
FROM employees e
```

**Remember:** Aliases improve readability.

### 44. What is CRUD?

**Answer:**
Create, Read, Update, Delete describe basic data operations.

**Example:**
```text
INSERT/SELECT/UPDATE/DELETE
```

**Remember:** CRUD = basic data operations.

### 45. What is a transaction?

**Answer:**
A transaction is a logical unit of work that can be committed or rolled back as a unit under the database transaction model.

**Example:**
```text
BEGIN; UPDATE ...; COMMIT;
```

**Remember:** Transaction = unit of work.

### 46. What are ACID properties?

**Answer:**
Atomicity, Consistency, Isolation, Durability describe important transaction guarantees.

**Example:**
```text
All-or-nothing = atomicity.
```

**Remember:** Know all four.

### 47. What is COMMIT?

**Answer:**
It completes the current transaction and makes its changes durable according to database semantics.

**Example:**
```text
COMMIT;
```

**Remember:** Commit = finish.

### 48. What is ROLLBACK?

**Answer:**
It undoes uncommitted transaction changes where supported.

**Example:**
```text
ROLLBACK;
```

**Remember:** Rollback = cancel uncommitted work.

### 49. What are isolation levels?

**Answer:**
They control what concurrent transactions can observe and help balance consistency and concurrency. Common levels include Read Uncommitted, Read Committed, Repeatable Read, and Serializable.

**Example:**
```text
Serializable provides strongest isolation among the common levels.
```

**Remember:** Isolation = concurrency behavior.

### 50. What is a sequence?

**Answer:**
A sequence generates a series of values and is commonly used for keys.

**Example:**
```text
CREATE SEQUENCE employee_seq;
```

**Remember:** Sequence = generated series.

### 51. What is an index?

**Answer:**
An index can speed up selected lookups and joins but consumes storage and adds write maintenance.

**Example:**
```text
CREATE INDEX idx_dept ON employees(department_id);
```

**Remember:** Indexes have a trade-off.

### 52. What is a trigger?

**Answer:**
A trigger is database-side logic that runs automatically for supported events such as INSERT, UPDATE, or DELETE.

**Example:**
```text
AFTER INSERT audit trigger
```

**Remember:** Triggers can hide side effects.

### 53. What is a view?

**Answer:**
A view stores a query definition and exposes the result like a table.

**Example:**
```text
CREATE VIEW it_employees AS SELECT ...;
```

**Remember:** View = logical query layer.

### 54. What is a stored procedure?

**Answer:**
A stored procedure encapsulates executable database-side logic and can contain multiple statements.

**Example:**
```text
CALL refresh_sales();
```

**Remember:** Procedure = executable workflow.

### 55. What is a user-defined function?

**Answer:**
A UDF is custom reusable logic that returns a value and can be called in supported SQL contexts.

**Example:**
```text
SELECT calculate_bonus(salary) FROM employees;
```

**Remember:** UDF = reusable function.

### 56. What is schema design?

**Answer:**
It defines entities, attributes, keys, relationships, constraints, and structures based on requirements and workload.

**Example:**
```text
Customer, Order, OrderItem, Product
```

**Remember:** Design from business needs.

### 57. Why use constraints?

**Answer:**
Constraints prevent invalid data at the database layer.

**Example:**
```text
CHECK, PRIMARY KEY, FOREIGN KEY, UNIQUE
```

**Remember:** Constraints protect data quality.

### 58. Normalized vs denormalized design?

**Answer:**
Normalized design reduces redundancy and update anomalies; denormalized design intentionally duplicates or combines data to simplify or speed read-heavy workloads.

**Example:**
```text
OLTP often normalized; analytics may denormalize.
```

**Remember:** Choose for the workload.

### 59. What is OLTP?

**Answer:**
Online Transaction Processing handles operational transactions with many small reads/writes and strong transactional requirements.

**Example:**
```text
Order-entry system
```

**Remember:** OLTP = transactions.

### 60. What is OLAP?

**Answer:**
Online Analytical Processing supports analytical queries over larger datasets, often involving scans and aggregations.

**Example:**
```text
Sales warehouse
```

**Remember:** OLAP = analytics.

### 61. What is a data warehouse?

**Answer:**
A data warehouse stores curated structured data for analytics and reporting.

**Example:**
```text
FactSales + dimensions
```

**Remember:** Warehouse = analytical store.

### 62. What is a data lake?

**Answer:**
A data lake stores large volumes of raw and varied data in flexible storage.

**Example:**
```text
Raw CSV/JSON/Parquet
```

**Remember:** Lake = flexible/raw.

### 63. What is a data mart?

**Answer:**
A data mart is a focused analytical store for a subject or department.

**Example:**
```text
Finance data mart
```

**Remember:** Mart = focused analytics.

### 64. What is an ODS?

**Answer:**
An Operational Data Store is an integrated store commonly used for current or near-current operational reporting and integration.

**Example:**
```text
Latest customer status
```

**Remember:** ODS = operational/current view.

### 65. What is a star schema?

**Answer:**
A star schema has a central fact table connected to denormalized dimension tables.

**Example:**
```text
FactSales ↔ DimCustomer, DimDate, DimProduct
```

**Remember:** Star = simple BI model.

### 66. What is a snowflake schema?

**Answer:**
A snowflake schema further normalizes dimension structures.

**Example:**
```text
DimProduct → DimCategory
```

**Remember:** Snowflake schema = normalized dimensions.

### 67. What is SCD Type 0?

**Answer:**
The original dimension value is retained and not updated for tracked changes.

**Example:**
```text
Original customer birth date remains.
```

**Remember:** Type 0 = keep original.

### 68. What is SCD Type 1?

**Answer:**
The old dimension value is overwritten.

**Example:**
```text
Correct a spelling error in place.
```

**Remember:** Type 1 = overwrite.

### 69. What is SCD Type 2?

**Answer:**
History is preserved by creating a new dimension version, commonly using effective dates and a current flag.

**Example:**
```text
Old region row expires; new row becomes current.
```

**Remember:** Type 2 = preserve history.

### 70. What is SCD Type 3?

**Answer:**
Limited history is stored in additional columns such as current and previous value.

**Example:**
```text
current_region='South', previous_region='North'
```

**Remember:** Type 3 = limited history.

### 71. How do you find the second-highest salary?

**Answer:**
Use a subquery or ranking method depending on tie requirements.

**Example:**
```text
SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) FROM employees);
```

**Remember:** Clarify whether distinct salaries matter.

### 72. How do WHERE and HAVING differ?

**Answer:**
WHERE filters rows before grouping; HAVING filters grouped results after aggregation.

**Example:**
```text
WHERE salary>50000; HAVING AVG(salary)>60000
```

**Remember:** WHERE = rows; HAVING = groups.

### 73. How do you get top row per group?

**Answer:**
Use ROW_NUMBER or another window function partitioned by the group and ordered by the desired metric.

**Example:**
```text
ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC)
```

**Remember:** Window functions solve group ranking.

# Part C — Data-Engineering SQL Scenarios

### Scenario 1 — Source has duplicates
**Approach:** identify the business key → group/count duplicates → decide which record is authoritative → deduplicate using a deterministic rule → validate counts.

**Interview Point:** Never remove duplicates without defining what makes one record the correct record.

### Scenario 2 — Target has rows missing from source
**Approach:** compare using the business key, use an appropriate join, check timing/watermark differences, and determine whether the difference is expected or a data-quality problem.

**Interview Point:** Reconciliation is a standard data-engineering responsibility.

### Scenario 3 — SQL query is slow
**Approach:** inspect the execution plan/profile, check joins and filters, reduce unnecessary columns/rows, validate statistics/partition pruning where applicable, and consider indexes or platform-specific optimization.

**Interview Point:** Diagnose first; don't blindly add indexes or increase compute.

### Scenario 4 — SCD Type 2 requirement
**Approach:** identify the business key and tracked attributes, expire the previous current row, insert a new version with effective dates/current indicator, and ensure exactly one current record.

**Interview Point:** Type 2 = preserve history.

### Scenario 5 — NULL unexpectedly changes results
**Approach:** remember that NULL represents unknown/absent value and comparisons with NULL use three-valued logic; use `IS NULL`/`IS NOT NULL` and carefully validate join/filter behavior.

**Interview Point:** NULL is not equal to zero or an empty string.
