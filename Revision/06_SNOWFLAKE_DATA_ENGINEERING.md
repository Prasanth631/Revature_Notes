# 06 — Snowflake Data Engineering

> **Highest-priority platform section.** Focus on architecture, storage, loading, performance, cost, programmability, security, Snowpark and dbt.

## Part A — Curriculum Notes

### Snowflake core
- Separate storage and compute conceptually; virtual warehouses provide compute resources for workloads.
- Micro-partitioning and pruning are central to Snowflake storage/query behavior.
- Know bulk loading, stages, file formats, error handling and semi-structured data.
- Performance includes warehouse sizing, clustering, pruning, caching, query profiling and workload management.
- Cost optimization includes right-sizing, auto-suspend/resume, workload isolation and avoiding unnecessary scans/compute.

### Snowflake advanced
- Know time-based recovery/retention concepts, replication/failover and disaster recovery.
- Know SQL/JavaScript/Python UDFs, stored procedures and data sharing.
- Know Snowpark DataFrames and how Snowpark can bring Python/other programming patterns closer to Snowflake execution.
- Know dbt fundamentals, models, sources, seeds, tests, documentation, materializations and incremental models.
- Know users/RBAC, masking, row-level controls, audit/monitoring, Python connector, REST/API and authentication concepts.

## Part B — Full Source-Style Snowflake Q&A
# Snowflake — Complete Interview Notes (Source-Derived)
> Complete source-derived interview notes from `Snowflake.docx`. The question/answer content is preserved and organized for Markdown study.
❄️ SNOWFLAKE INTERVIEW QUESTIONS — PHASE 1
## Phase 1 — Snowflake Fundamentals & Architecture
### 1. What is Snowflake?
**Answer**

Snowflake is a cloud-based data platform used to store, process, and analyze large amounts of data. It separates storage and compute, so computing resources can be increased or decreased without changing where the data is stored.
**Example**

A company can store its sales data in Snowflake and increase compute resources when many users are running reports.
### 2. What is Snowflake Architecture?
**Answer**

Snowflake architecture mainly consists of three layers: Storage, Compute, and Cloud Services. Storage stores the data, Compute processes the data using Virtual Warehouses, and Cloud Services manages activities such as authentication, metadata, query processing, query optimization and parsing.
**Example**

When a user runs a query, Cloud Services manages the request, a Virtual Warehouse processes it, and the required data comes from the Storage Layer.
### 3. What is the Storage Layer in Snowflake?
**Answer**

The Storage Layer stores the data loaded into Snowflake tables. Snowflake automatically manages the storage and organizes the data into compressed micro-partitions.
**Example**

### 4. What is the Compute Layer in Snowflake?
**Answer**

The Compute Layer provides the processing power needed to execute SQL queries and perform data processing. Snowflake provides this compute through Virtual Warehouses.
**Example**

### 5. What is the Cloud Services Layer?
**Answer**

The Cloud Services Layer manages and coordinates many Snowflake operations. It handles activities such as authentication, access control, metadata management, query parsing, and query optimization.
**Example**

### 6. Why does Snowflake separate Storage and Compute?
**Answer**

Snowflake separates storage and compute so they can be managed independently. You can increase or decrease computing power without changing the amount of data stored.
**Example**

Virtual Warehouses
### 7. What is a Virtual Warehouse in Snowflake?
**Answer**

A Virtual Warehouse is a group of compute resources used to execute SQL queries and perform data processing. It provides computing power but does not permanently store table data.
**Example**

### 8. Does a Virtual Warehouse store data?
**Answer**

No. A Virtual Warehouse provides compute resources, while the actual table data is stored in Snowflake's Storage Layer. This allows the warehouse to be suspended or resized without affecting the stored data.
**Example**

If a warehouse is suspended overnight, the company's customer data remains stored and can be accessed when the warehouse resumes.
### 9. How do you create a Virtual Warehouse?
**Answer**

A Virtual Warehouse can be created using the CREATE WAREHOUSE command. While creating it, you can specify settings such as warehouse size, AUTO_SUSPEND, and AUTO_RESUME.
**Example**

```text
CREATE WAREHOUSE MY_WH
```
WITH
```text
WAREHOUSE_SIZE = 'XSMALL'
AUTO_SUSPEND = 60
AUTO_RESUME = TRUE;
```
### 10. What is Warehouse Size in Snowflake?
**Answer**

**Example**

### 11. What are AUTO_SUSPEND and AUTO_RESUME?
**Answer**

AUTO_SUSPEND automatically stops a warehouse after it has been inactive for a specified period. AUTO_RESUME automatically starts the warehouse when a query needs it.
**Example**

```text
AUTO_SUSPEND = 300
AUTO_RESUME = TRUE
```
Here, the warehouse can suspend after five minutes of inactivity and resume automatically when required.
### 12. What happens to data when a Virtual Warehouse is suspended?
**Answer**

**Example**

Micro-Partitioning
### 13. What is Micro-Partitioning in Snowflake?
**Answer**

Micro-partitioning is Snowflake's automatic method of organizing table data into small storage units called micro-partitions. Snowflake automatically creates and manages these partitions when data is loaded or changed.
**Example**

If a table contains millions of sales records, Snowflake automatically divides the data into multiple micro-partitions.
### 14. Are Micro-Partitions created manually?
**Answer**

**Example**

### 15. How is data physically stored in Snowflake?
**Answer**

Snowflake stores table data in a compressed, columnar format and organizes it into micro-partitions. Snowflake manages the physical storage internally, so users do not need to manage disks or physical files.
**Example**

If a query needs only the SALARY column from a large employee table, columnar storage allows Snowflake to work efficiently with that column.
### 16. What is Columnar Storage?
**Answer**

Columnar storage means that data is organized by columns rather than primarily by rows. This is useful for analytical queries because these queries often access only a few columns from many rows.
**Example**

```text
SELECT AVG(SALARY)
```
FROM EMPLOYEES;
This query mainly needs the SALARY column.
### 17. What are the main characteristics of Micro-Partitions?
**Answer**

Micro-partitions are compressed and immutable storage units managed automatically by Snowflake. They typically contain around 16 MB to 64 MB of uncompressed data and Snowflake maintain metadata such as minimum and maximum values and row counts.
**Example**

### 18. What metadata does Snowflake maintain for Micro-Partitions?
**Answer**

Snowflake maintains metadata such as minimum and maximum column values, row counts, and clustering information. This metadata helps Snowflake identify which micro-partitions may contain the required data.
**Example**

### 19. Are Snowflake Micro-Partitions mutable or immutable?
**Answer**

Micro-partitions are immutable, which means Snowflake does not directly modify an existing micro-partition after it has been written. When data changes, Snowflake manages the change by creating new storage structures as required.
**Example**

Clustering
### 20. What is Clustering in Snowflake?
**Answer**

Clustering is a way of organizing data across micro-partitions based on selected columns or expressions. It can help Snowflake reduce the number of micro-partitions that need to be scanned for certain queries.
**Example**

### 21. What is a Clustering Key?
**Answer**

A clustering key is one or more columns or expressions selected to help organize data in a large Snowflake table. It is useful when queries frequently filter or access data using those columns.
**Example**

```text
CREATE TABLE SALES (
```
ORDER_ID INT,
ORDER_DATE DATE,
AMOUNT NUMBER
)
CLUSTER BY (ORDER_DATE);
Here, ORDER_DATE is the clustering key.
### 22. Why is Clustering useful?
**Answer**

Clustering can improve query performance on large tables by organizing data so that Snowflake can potentially skip more irrelevant micro-partitions. It is especially useful when queries repeatedly filter on particular columns.
**Example**

A large sales table frequently queried by ORDER_DATE may benefit from clustering on ORDER_DATE.
### 23. Do all Snowflake tables need Clustering?
**Answer**

No. Snowflake automatically manages micro-partitions, so many tables work well without an explicit clustering key. Clustering is mainly considered for large tables where it can provide a meaningful performance improvement.
**Example**

### 24. What is the difference between Micro-Partitioning and Clustering?
**Answer**

Micro-partitioning is Snowflake's automatic method of organizing data into micro-partitions. Clustering is an additional way of improving the organization of those micro-partitions based on selected columns or expressions.
**Example**

## Phase 2 — Bulk Data Loading, File Formats, Staging & Error Handling
### 25. What is Bulk Data Loading in Snowflake?
**Answer**

Bulk data loading means loading a large amount of data from files into Snowflake tables. Snowflake mainly uses the COPY INTO command to load data from a stage into a table.
**Example**

A company receives a CSV file containing one million customer records. The file can be placed in a stage and loaded into the CUSTOMERS table using COPY INTO.
### 26. What is the COPY INTO command in Snowflake?
**Answer**

```text
COPY INTO is a SQL command used to load data from staged files into a Snowflake table. It can work with different file formats and also provides options for handling loading errors.
```
**Example**

```text
COPY INTO employees
```
FROM @employee_stage
```text
FILE_FORMAT = (TYPE = CSV);
```
This loads CSV data from the stage into the employees table.
### 27. What are the steps involved in Bulk Data Loading?
**Answer**

The basic process is to prepare the target table, place the source file in a stage, define the file format, and use COPY INTO to load the data. Error-handling options can be added when required.
**Example**

File -> Stage -> File Format -> COPY INTO -> Table
### 28. What is a File Format in Snowflake?
**Answer**

A file format tells Snowflake how the data inside a file is structured and how it should be read during loading. It can define details such as file type, delimiter, compression, and header information.
**Example**

```text
CREATE FILE FORMAT employee_csv
TYPE = CSV
FIELD_DELIMITER = ',';
```
This defines a CSV file where columns are separated by commas.
### 29. What file formats are supported by Snowflake?
**Answer**

Snowflake supports file formats such as CSV, JSON, Parquet, Avro, and ORC. These formats can be used when loading or unloading data depending on the structure and requirements of the source data.
**Example**

A company may use CSV for employee data, JSON for application data, and Parquet for large analytical datasets.
### 30. What is CSV and how is it used in Snowflake?
**Answer**

CSV stands for Comma-Separated Values. It is a simple text-based format where data is stored in rows and columns, with a delimiter separating the columns. Snowflake can load CSV files by using a suitable file format and COPY INTO.
**Example**

101,Rajiv,Data Engineer
102,Rahul,Analyst
This data can be loaded into an employee table.
### 31. What is JSON and how is it used in Snowflake?
**Answer**

JSON is a semi-structured format commonly used for application and API data. Snowflake can store JSON data using the VARIANT data type and allows users to access values inside the JSON structure.
**Example**

{
"id": 101,
"name": "Vaseem"
}
This JSON data can be stored in a VARIANT column.
### 32. What is Parquet?
**Answer**

Parquet is a columnar file format commonly used for large analytical datasets. It provides efficient storage and allows data to be processed by columns, making it useful for analytical workloads.
**Example**

A company can store millions of sales records in Parquet files and load them into Snowflake for analysis.
### 33. What is Avro?
**Answer**

Avro is a schema-based data serialization format used to store and exchange structured or semi-structured data. Snowflake supports Avro files for data loading and processing.
**Example**

An application can generate customer event data as Avro files and load those files into Snowflake for analysis.
### 34. What is ORC?
**Answer**

ORC stands for Optimized Row Columnar. It is a columnar file format designed for efficient storage and analytical processing. Snowflake supports ORC files when working with staged data.
**Example**

Historical transaction data stored as ORC files can be accessed through a Snowflake stage and loaded into Snowflake.
### 35. What is the difference between CSV and Parquet?
**Answer**

CSV is a simple text-based format that uses delimiters to separate columns, while Parquet is a columnar format designed for analytical workloads. Parquet is generally more suitable for large datasets because of its efficient storage and column-based processing.
**Example**

CSV can be convenient for a small employee file, while Parquet can be better for a large sales dataset.
### 36. What is the difference between Structured and Semi-Structured Data?
**Answer**

Structured data follows a fixed format of rows and columns, while semi-structured data can have flexible or nested structures. Relational tables and CSV are examples of structured data, while JSON and Avro can contain semi-structured data.
**Example**

An employee table with ID, NAME, and SALARY is structured, while a JSON document containing customer and order information can be semi-structured.
Staging
### 37. What is a Stage in Snowflake?
**Answer**

A stage is a location used to store or access files before they are loaded into Snowflake tables. Snowflake provides both internal stages and external stages for handling source files.
**Example**

A sales.csv file can be placed in a stage and then loaded into the SALES table using COPY INTO.
### 38. What are the types of Internal Stages in Snowflake?
**Answer**

Snowflake provides three types of internal stages: User Stage, Table Stage, and Named Stage. A User Stage belongs to a user, a Table Stage is associated with a table, and a Named Stage is a separately created stage object.
**Example**

A developer can use a User Stage for personal files, while a team can use a Named Stage for a common data-loading process.
### 39. What is an External Stage?
**Answer**

An External Stage points to a location outside Snowflake, such as Amazon S3, Azure Storage, or Google Cloud Storage. It allows Snowflake to access files stored in external cloud storage.
**Example**

If sales.csv is stored in an Amazon S3 bucket, an external stage can point to that location so Snowflake can access the file.
### 40. What is the difference between Internal and External Stages?
**Answer**

An Internal Stage stores files using Snowflake-managed storage, while an External Stage points to files stored in external cloud storage. The choice depends on where the source files are maintained.
**Example**

A file uploaded into Snowflake can use an Internal Stage, while a file already stored in an S3 bucket can use an External Stage.
### 41. What is a Named Stage?
**Answer**

A Named Stage is a database object created for storing or accessing files used in data-loading operations. It can be reused by different loading processes when the required privileges are available.
**Example**

```text
CREATE STAGE sales_stage
FILE_FORMAT = (TYPE = CSV);
```
The sales_stage can then be used for loading sales files.
Error Handling
### 42. How does Snowflake handle errors during data loading?
**Answer**

Snowflake provides options to control what happens when errors occur during data loading. Options such as ON_ERROR can control whether the load stops or continues, while validation can be used to identify problems before loading.
**Example**

If a CSV file contains a few invalid records, an appropriate error-handling option can allow valid records to continue loading while the problematic records are identified.
### 43. What is ON_ERROR in Snowflake?
**Answer**

ON_ERROR is an option used with COPY INTO to specify how Snowflake should handle errors during loading. Depending on the selected option, the load can stop or continue when errors are found.
**Example**

```text
COPY INTO employees
```
FROM @employee_stage
```text
FILE_FORMAT = (TYPE = CSV)
ON_ERROR = 'CONTINUE';
```
Here, Snowflake continues processing instead of stopping at the first error.
### 44. What is VALIDATION_MODE in Snowflake?
**Answer**

VALIDATION_MODE is used to check data files for loading errors without actually loading the data into the target table. It is useful when you want to identify problems in a file before performing the actual load.
**Example**

If you receive a large CSV file, you can validate it first to find incorrect records before loading the complete file.
### 45. How can you identify errors in a failed data load?
**Answer**

Snowflake provides information about errors that occur during data loading. You can use validation and load information to identify problematic records and understand why the load failed.
**Example**

If five records in a CSV file have an incorrect number of columns, the error information can help identify those records so they can be corrected.
### 46. What is Load History in Snowflake?
**Answer**

Load history provides information about data-loading operations performed in Snowflake. It can help you check which files were loaded and identify whether a loading operation was successful or had errors.
**Example**

If one of twenty daily files is missing from a table, you can check the load history to determine whether that file was successfully processed.
### 47. How does Snowflake prevent the same file from being loaded repeatedly?
**Answer**

Snowflake keeps load metadata for files that have already been processed. When the same file is encountered again within the applicable load-history period, Snowflake can recognize that it has already been loaded and avoid loading it again.
**Example**

If sales_01.csv was successfully loaded yesterday and the same file is submitted again, Snowflake can identify it as an already processed file.
### 48. What is the difference between a Stage and a File Format?
**Answer**

A Stage defines where the files are located, while a File Format defines how the data inside those files should be interpreted. Both are commonly used together during data loading.
**Example**

An External Stage can point to an S3 location, while a CSV File Format tells Snowflake that the files use commas to separate columns.
49. Explain the complete process of loading a CSV file into Snowflake.
**Answer**

First, the target table is created and the CSV file is placed in an internal or external stage. A CSV file format is then defined, and COPY INTO is used to load the data from the stage into the target table.
**Example**

CSV File
↓
Stage
↓
CSV File Format
↓
```text
COPY INTO
```
↓
Snowflake Table
## Phase 3 — Tables, Views, Time Travel, Cloning & Performance
### 50. What is a Snowflake Table?
**Answer**

A table is a database object used to store data in Snowflake. Snowflake provides different table types depending on how the data needs to be stored, retained, and recovered.
**Example**

A company can use a table to store employee information such as employee ID, name, department, and salary.
### 51. What is a Permanent Table in Snowflake?
**Answer**

A Permanent Table is the standard table type used to store important business data. It supports features such as Time Travel and Fail-safe for data recovery.
**Example**

A company can store its customer master data in a Permanent Table because the data needs to be maintained for a long period.
### 52. What is a Temporary Table in Snowflake?
**Answer**

A Temporary Table exists only during the session in which it is created. When the session ends, the table is automatically removed, making it useful for temporary or intermediate data.
**Example**

A developer can create a Temporary Table to store intermediate results while preparing a report.
### 53. What is a Transient Table in Snowflake?
**Answer**

A Transient Table is used for data that does not require the same recovery protection as permanent data. It does not have Fail-safe, making it suitable for temporary or easily recreated data.
**Example**

A data pipeline can use a Transient Table to store intermediate transformation data that can be recreated when required.
### 54. What is an External Table in Snowflake?
**Answer**

An External Table allows Snowflake to query data stored outside Snowflake, usually in cloud storage. The data remains in the external storage location instead of being stored as Snowflake table data.
**Example**

A company has Parquet files in Amazon S3 and wants to query them without loading the files into Snowflake. It can create an External Table over those files.
### 55. What is a Dynamic Table in Snowflake?
**Answer**

A Dynamic Table automatically refreshes its data based on a defined query and target freshness. It is useful when transformed data needs to stay updated as source data changes.
**Example**

A company can use a Dynamic Table to automatically maintain an updated sales summary from a source sales table.
### 56. What is the difference between Permanent, Temporary and Transient Tables?
**Answer**

Permanent Tables are used for important long-term data and provide the strongest recovery capabilities. Temporary Tables exist only for the current session, while Transient Tables are useful for data that does not require Fail-safe.
**Example**

Customer data can use a Permanent Table, session-level calculations can use a Temporary Table, and intermediate pipeline data can use a Transient Table.
Views
### 57. What is a View in Snowflake?
**Answer**

A View is a database object that stores a SQL query rather than storing a separate copy of the result data. When the View is queried, Snowflake executes its underlying query.
**Example**

```text
CREATE VIEW employee_view AS
SELECT employee_id, name, department
```
FROM employees;
The View can then be queried like a table.
### 58. What is a Materialized View in Snowflake?
**Answer**

A Materialized View stores precomputed query results so that frequently used queries can be processed more efficiently. Snowflake automatically maintains the materialized results when the underlying data changes.
**Example**

A company frequently calculates total sales by department. A Materialized View can store the precomputed results to improve the performance of repeated queries.
### 59. What is the difference between a View and a Materialized View?
**Answer**

A regular View stores the query definition and calculates the result when queried, while a Materialized View stores precomputed results. Materialized Views can improve performance for suitable queries but require additional maintenance and storage.
**Example**

A simple employee filter can use a regular View, while a frequently used large sales aggregation may benefit from a Materialized View.
Time Travel
### 60. What is Time Travel in Snowflake?
**Answer**

Time Travel allows users to access or recover historical versions of data within the configured retention period. It can be used to query previous data and recover accidentally changed or deleted objects.
**Example**

If someone accidentally deletes customer records, Time Travel can be used to access the earlier version of the data.
### 61. Why is Time Travel used in Snowflake?
**Answer**

Time Travel is mainly used for recovering accidentally modified or deleted data and for querying historical data. It provides a way to access previous versions of data without requiring a separate backup.
**Example**

If an employee accidentally updates thousands of rows, the previous version can be accessed using Time Travel.
### 62. What is DATA_RETENTION_TIME_IN_DAYS?
**Answer**

DATA_RETENTION_TIME_IN_DAYS specifies how long historical data can be accessed using Time Travel. The retention period can be configured according to the requirements of the Snowflake object.
**Example**

```text
ALTER TABLE employees
SET DATA_RETENTION_TIME_IN_DAYS = 7;
```
This configures a seven-day retention period for historical data.
### 63. How can you query historical data using Time Travel?
**Answer**

Snowflake provides AT and OFFSET clauses to access historical data from a previous point in time. This allows users to compare or recover data from an earlier state.
**Example**

```text
SELECT *
```
FROM employees
```text
AT (OFFSET => -60*5);
```
This queries the table using a previous point in time.
### 64. How can you recover a dropped table using Time Travel?
**Answer**

A dropped table can be recovered during its applicable Time Travel period using the UNDROP TABLE command. This restores the table without requiring the data to be loaded again.
**Example**

```text
DROP TABLE employees;
UNDROP TABLE employees;
```
The dropped table can be restored using UNDROP.
### 65. Can Snowflake recover a dropped schema or database?
**Answer**

Yes. Snowflake provides UNDROP commands for recovering dropped databases and schemas when they are still within the applicable recovery period.
**Example**

```text
UNDROP SCHEMA company_schema;
```
This restores the dropped schema.
### 66. What is Fail-safe in Snowflake?
**Answer**

Fail-safe is a separate data recovery mechanism available after the Time Travel period ends. It is managed by Snowflake and is intended for recovery in specific circumstances rather than normal user-controlled data access.
**Example**

If historical data is no longer available through Time Travel, Snowflake's Fail-safe process may be used for eligible data recovery.
### 67. What is the difference between Time Travel and Fail-safe?
**Answer**

Time Travel allows users to access and recover historical data during the configured retention period. Fail-safe comes after the Time Travel period and is intended for Snowflake-managed recovery rather than normal user access.
**Example**

A user can use Time Travel to recover accidentally deleted data, while Fail-safe is used by Snowflake for eligible recovery after Time Travel ends.
Zero-Copy Cloning
### 68. What is Zero-Copy Cloning in Snowflake?
**Answer**

Zero-Copy Cloning creates a clone of a Snowflake object without immediately creating a complete physical copy of the data. The clone initially references the existing data and uses additional storage only when changes are made.
**Example**

A developer can clone a production table to create a testing table without immediately duplicating the complete dataset.
### 69. What objects can be cloned in Snowflake?
**Answer**

Snowflake supports cloning objects such as databases, schemas, and tables. A clone can be used to create a separate environment for development, testing, or analysis.
**Example**

A complete database can be cloned to create a testing environment without physically copying all of its data at the beginning.
### 70. What is the benefit of Zero-Copy Cloning?
**Answer**

Zero-Copy Cloning is fast and initially requires very little additional storage because the clone references existing data. It is useful for creating development, testing, and backup environments.
**Example**

A development team can quickly create a copy of a production database for testing without performing a full data copy.
### 71. What happens when data is changed in a clone?
**Answer**

The original object and the clone are independent from the user's point of view. When data is changed in either object, Snowflake uses additional storage for the changed data rather than modifying the other object's data.
**Example**

If a developer updates rows in a cloned table, those changes do not modify the original production table.
### 72. What is the difference between Zero-Copy Cloning and a traditional copy?
**Answer**

A traditional copy creates a separate physical copy of the data, while Zero-Copy Cloning initially shares the existing storage structures. This makes cloning much faster and more storage-efficient at the beginning.
**Example**

Copying a 1 TB table traditionally requires copying the data, while a zero-copy clone can be created almost immediately without initially duplicating the full 1 TB.
### 73. Can Time Travel and Cloning be used together?
**Answer**

Yes. Snowflake allows a clone to be created from a previous point in time using Time Travel. This is useful when a specific historical version of a table, schema, or database is required.
**Example**

If a table was correct yesterday but changed today, a clone can be created from yesterday's version for investigation.
Performance & Optimization
### 74. What is Data Compression in Snowflake?
**Answer**

Data compression reduces the amount of storage required to store data. Snowflake automatically compresses data when it is stored, so users normally do not need to manually compress table data.
**Example**

A company storing a large amount of historical sales data can benefit from compression because the stored data requires less physical storage.
### 75. What are Statistics in Snowflake?
**Answer**

Statistics and metadata provide information about stored data that Snowflake can use during query processing. They help the optimizer understand the data and choose efficient execution strategies.
**Example**

Information about values in micro-partitions can help Snowflake determine which partitions may contain the required data.
### 76. What is Data Pruning in Snowflake?
**Answer**

Data pruning means skipping micro-partitions that do not contain data required by a query. Snowflake uses micro-partition metadata to determine which partitions can be safely ignored.
**Example**

If a query searches for sales from 2026, Snowflake can skip micro-partitions that contain only 2024 data.
### 77. How does Micro-Partition Pruning improve performance?
**Answer**

Micro-partition pruning reduces the amount of data Snowflake needs to scan. By skipping irrelevant partitions, queries can process less data and complete more efficiently.
**Example**

A sales table contains five years of data, but a query requests only 2026 records. Snowflake can skip partitions containing the other years.
### 78. What is Performance Tuning in Snowflake?
**Answer**

Performance tuning means improving query execution while using compute resources efficiently. It can involve better SQL, effective filtering, pruning, clustering, appropriate warehouse sizing, and caching.
**Example**

If a query scans an entire large table unnecessarily, improving the filtering conditions can reduce the amount of data processed.
### 79. How can you improve the performance of a large Snowflake table?
**Answer**

Performance can be improved by writing efficient queries, using appropriate filters, taking advantage of pruning, and using clustering when it is beneficial. Choosing an appropriate warehouse size can also help.
**Example**

If most queries filter a large sales table using ORDER_DATE, improving pruning or using an appropriate clustering strategy can reduce unnecessary scanning.
### 80. What is the difference between Micro-Partitioning and Clustering?
**Answer**

Micro-partitioning is automatically managed by Snowflake when data is stored, while clustering is used to organize data based on selected columns to improve pruning for certain workloads. Clustering may be useful when a large table becomes poorly organized for common query patterns.
**Example**

Snowflake automatically creates micro-partitions for a sales table, while a clustering key on ORDER_DATE can help organize a very large table frequently filtered by order date.
### 81. When should you use a Clustering Key?
**Answer**

A clustering key can be useful for very large tables where queries frequently filter or join on specific columns and natural micro-partition organization is not providing enough pruning. It should be used only when the performance benefit justifies the additional cost.
**Example**

A very large sales table is frequently filtered by ORDER_DATE. A clustering key on ORDER_DATE may improve pruning.
### 82. What are the disadvantages of Clustering?
**Answer**

Clustering can add additional compute and storage costs because Snowflake may need to reorganize data to maintain the clustering. Therefore, it is generally more suitable for large tables where the performance improvement is significant.
**Example**

Adding clustering to a small table may provide little benefit while adding unnecessary maintenance cost.
### 83. What is Query Optimization in Snowflake?
**Answer**

Query optimization is the process of finding an efficient way to execute a SQL query. Snowflake's optimizer analyzes the query and available information to create an execution plan for processing it efficiently.
**Example**

For a query filtering millions of records, Snowflake can use pruning and other optimizations to avoid processing unnecessary data.
## Phase 4 — Scaling, Workload Management, Query Execution & Caching
### 84. What is a Multi-Cluster Warehouse in Snowflake?
**Answer**

A Multi-Cluster Warehouse can use multiple compute clusters to handle many queries running at the same time. Snowflake can add or remove clusters based on the workload and configured scaling settings.
**Example**

If hundreds of users run reports at the same time, Snowflake can use multiple clusters to handle the increased workload.
### 85. Why are Multi-Cluster Warehouses used?
**Answer**

Multi-Cluster Warehouses are mainly used to handle high query concurrency. They help reduce query queuing when many users or workloads need compute resources at the same time.
**Example**

A company has one warehouse used by many analysts. During business hours, many queries arrive together, so additional clusters can handle the workload.
### 86. What is the difference between Scaling Up and Scaling Out in Snowflake?
**Answer**

Scaling up means increasing the size of a Virtual Warehouse to provide more computing power to a cluster. Scaling out means adding more clusters to handle multiple concurrent workloads.
**Example**

A complex query may benefit from scaling up, while hundreds of users running queries simultaneously may benefit from scaling out.
### 87. What are Minimum and Maximum Clusters in a Multi-Cluster Warehouse?
**Answer**

Minimum Clusters defines the smallest number of clusters the warehouse can run, while Maximum Clusters defines the highest number of clusters Snowflake can use when workload increases.
**Example**

If a warehouse has minimum clusters set to 1 and maximum clusters set to 3, Snowflake can run between one and three clusters depending on demand.
### 88. What is a Scaling Policy in a Multi-Cluster Warehouse?
**Answer**

A scaling policy controls how Snowflake adds clusters when there are more queries waiting for resources. Snowflake provides Standard and Economy scaling policies for different workload and cost requirements.
**Example**

A workload that requires faster response times can use the Standard policy, while a workload focused more on controlling credits can use the Economy policy.
### 89. What is the Standard Scaling Policy?
**Answer**

The Standard policy prioritizes maintaining performance and reducing query queuing. It can start additional clusters sooner when Snowflake detects that more compute resources are required.
**Example**

A dashboard system with many users can use the Standard policy to reduce waiting time during busy periods.
### 90. What is the Economy Scaling Policy?
**Answer**

The Economy policy focuses more on reducing compute costs. Snowflake waits longer before starting additional clusters, allowing existing clusters to remain highly utilized.
**Example**

A less time-sensitive workload can use the Economy policy to reduce unnecessary cluster usage.
### 91. What is Query Queuing in Snowflake?
**Answer**

Query queuing occurs when queries have to wait because the available warehouse resources are already being used. Multi-Cluster Warehouses can help reduce this problem by adding additional clusters when required.
**Example**

If one warehouse is processing many queries and a new query has to wait, additional clusters can help process the waiting workload.
Workload Management
### 92. What is Workload Management in Snowflake?
**Answer**

Workload management means organizing and managing compute resources so different workloads can run efficiently. Separate warehouses, warehouse sizing, and multi-cluster warehouses can be used to manage workloads.
**Example**

A company can use one warehouse for data loading and another for reporting so that heavy reporting queries do not affect data loading.
### 93. Why should different workloads use separate Virtual Warehouses?
**Answer**

Using separate warehouses isolates workloads from each other. This allows one workload to scale or consume compute resources without directly affecting another workload.
**Example**

A company can use one warehouse for ETL jobs and another warehouse for business reports.
### 94. How can you monitor Snowflake resource usage?
**Answer**

Snowflake provides monitoring information about warehouses, queries, and credit consumption. This information helps identify expensive workloads and performance problems.
**Example**

If a warehouse is using more credits than expected, its query and usage information can be checked to find the reason.
### 95. What is Query History in Snowflake?
**Answer**

Query History provides information about queries executed in Snowflake, such as execution time, warehouse used, and query status. It is useful for monitoring and troubleshooting workloads.
**Example**

If a report suddenly becomes slow, Query History can be checked to compare its recent execution time with previous executions.
Query Execution
### 96. What is a Query Execution Plan?
**Answer**

A Query Execution Plan describes how Snowflake plans to execute a SQL query. It shows the operations involved in processing the query, such as scans, joins, filters, and aggregations.
**Example**

If a query joins two large tables, the execution plan can help you understand how Snowflake is processing that join.
### 97. Why is a Query Execution Plan important?
**Answer**

A Query Execution Plan helps understand how a query will be processed and can reveal operations that may affect performance. It is useful when investigating inefficient queries.
**Example**

If a query performs a large table scan when only a small amount of data is required, the execution plan can help identify the problem.
### 98. What is Query Profile in Snowflake?
**Answer**

Query Profile provides information about what actually happened when a query was executed. It helps identify expensive operations, large scans, joins, and other performance bottlenecks.
**Example**

If a query takes several minutes to complete, Query Profile can help identify which execution step consumed most of the processing time.
### 99. What is the difference between Query Execution Plan and Query Profile?
**Answer**

The Query Execution Plan shows how Snowflake plans to execute a query, while Query Profile shows what happened during the actual execution. Both can be used to understand and troubleshoot query performance.
**Example**

You can use the execution plan to understand the planned operations and Query Profile to identify which operation actually took the most time.
### 100. What are common reasons for a slow query in Snowflake?
**Answer**

A query can be slow because it processes too much data, performs expensive joins, has poor filtering, or uses an unsuitable warehouse size. Poor data organization can also reduce pruning efficiency.
**Example**

A query that selects millions of rows without a useful filter may take longer because Snowflake has to process a large amount of data.
Caching
### 101. What is Caching in Snowflake?
**Answer**

Caching allows Snowflake to reuse information that has already been processed instead of doing the same work again. Important cache layers include Result Cache, Metadata Cache, and Warehouse Cache.
**Example**

If the same query is executed again and its result is available in the Result Cache, Snowflake may return the cached result instead of executing the query again.
### 102. What is Result Cache in Snowflake?
**Answer**

Result Cache stores the results of previously executed queries. When a query can use a valid cached result, Snowflake can return the result without using warehouse compute for the query.
**Example**

If a user runs the same sales report repeatedly and the result is still valid, Snowflake can return the cached result.
### 103. What is Metadata Cache in Snowflake?
**Answer**

Metadata Cache stores information about Snowflake objects and their metadata so that this information can be accessed efficiently. It helps Snowflake avoid repeatedly retrieving the same metadata.
**Example**

Information about tables, columns, and micro-partitions can be available through cached metadata when Snowflake needs it.
### 104. What is Warehouse Cache?
**Answer**

Warehouse Cache refers to data that can remain in the local cache of a running Virtual Warehouse. When queries repeatedly access the same data, the cache can reduce the need to retrieve the data again from remote storage.
**Example**

If several queries running on the same active warehouse access the same data, Warehouse Cache may help improve their performance.
### 105. What is the difference between Result Cache, Metadata Cache and Warehouse Cache?
**Answer**

Result Cache stores query results, Metadata Cache stores information about Snowflake objects and their metadata, and Warehouse Cache stores data locally for a running warehouse. Each cache helps reduce unnecessary processing or data retrieval in a different way.
**Example**

A repeated query may use Result Cache, information about a table may use Metadata Cache, and repeatedly accessed table data may benefit from Warehouse Cache.
### 106. How does Result Cache help reduce Snowflake costs?
**Answer**

When a query can use a valid Result Cache result, Snowflake does not need to use warehouse compute to execute that query again. This can reduce unnecessary compute consumption.
**Example**

If a dashboard repeatedly runs the same query and the result is reusable, cached results can reduce the number of times the warehouse needs to process the query.
Cost Optimization
### 107. What is Cost Optimization in Snowflake?
**Answer**

Cost optimization means controlling Snowflake resource usage while maintaining the required performance. It involves proper warehouse sizing, auto-suspend, efficient queries, caching, pruning, and workload monitoring.
**Example**

A company can use a smaller warehouse for simple workloads and configure auto-suspend so the warehouse does not continue running when it is not needed.
### 108. How does Warehouse Sizing affect Snowflake cost?
**Answer**

Larger warehouses provide more compute resources but consume more credits while running. Choosing a warehouse size that matches the workload helps balance performance and cost.
**Example**

Using an X-Large warehouse for a simple query may provide no meaningful benefit compared with a Small warehouse but can increase compute usage.
### 109. How does AUTO_SUSPEND help with cost optimization?
**Answer**

AUTO_SUSPEND automatically suspends a warehouse after it remains inactive for the configured period. This prevents the warehouse from continuing to consume compute resources when there are no queries.
**Example**

```text
CREATE WAREHOUSE reporting_wh
```
WITH
```text
AUTO_SUSPEND = 60;
```
The warehouse can automatically suspend after 60 seconds of inactivity.
### 110. How does AUTO_RESUME work?
**Answer**

AUTO_RESUME automatically starts a suspended warehouse when a query requires that warehouse. This allows users to run queries without manually starting the warehouse first.
**Example**

```text
CREATE WAREHOUSE reporting_wh
```
WITH
```text
AUTO_SUSPEND = 60
AUTO_RESUME = TRUE;
```
When a query is submitted, the suspended warehouse can automatically resume.
### 111. How can Query Optimization reduce Snowflake costs?
**Answer**

Efficient queries process less unnecessary data and therefore can reduce compute usage. Techniques such as filtering, pruning, selecting required columns, and avoiding unnecessary processing can improve efficiency.
**Example**

Instead of selecting every column from a large table, selecting only the columns required for the report can reduce unnecessary data processing.
### 112. How can Caching reduce Snowflake costs?
**Answer**

Caching can reduce compute usage by allowing Snowflake to reuse previously processed results or locally available data. This can reduce the need to execute the same work repeatedly.
**Example**

If a frequently requested report can use the Result Cache, Snowflake may return the cached result without starting or using warehouse compute for that query.
## Phase 5 — Semi-Structured Data, Replication, Disaster Recovery, UDFs & Data Sharing
### 113. What is semi-structured data in Snowflake, and which formats can Snowflake handle?
**Answer**

Semi-structured data does not follow a fixed table structure like rows and columns. Snowflake can work with formats such as JSON, XML, and Avro, mainly by using the VARIANT data type.
**Example**

A JSON customer record can contain different attributes such as name, email, and address, and Snowflake can store it in a VARIANT column.
### 114. What is the VARIANT data type in Snowflake?
**Answer**

VARIANT is a Snowflake data type used to store semi-structured data such as JSON, XML, and Avro. It allows different structures and data types to be stored in the same column.
**Example**

```text
CREATE TABLE customer_data (
```
customer_id INT,
details VARIANT
);
The details column can store JSON customer information.
### 115. What are OBJECT and ARRAY in Snowflake?
**Answer**

OBJECT is used to represent key-value data, while ARRAY is used to store an ordered collection of values. Both are commonly used when working with nested semi-structured data.
**Example**

A customer JSON object can contain an address object and a phone_numbers array.
### 116. How do you access values from JSON data in Snowflake?
**Answer**

Snowflake uses path notation to access individual elements inside semi-structured data. The colon operator can be used to access an object field, and additional path elements can be used for nested values.
**Example**

```text
SELECT details:name
```
FROM customer_data;
This extracts the name value from the JSON data.
### 117. What is FLATTEN in Snowflake?
**Answer**

FLATTEN is a table function used to convert elements from an array or nested structure into separate rows. It is useful when semi-structured data contains multiple values that need to be processed individually.
**Example**

If one customer has several phone numbers stored in an array, FLATTEN can return each phone number as a separate row.
### 118. How do you query nested JSON data in Snowflake?
**Answer**

Nested JSON data can be accessed by following the path of the required fields. Snowflake allows users to navigate through multiple levels of objects and arrays.
**Example**

```text
SELECT details:address:city
```
FROM customer_data;
This retrieves the city from the nested address object.
### 119. How does Snowflake handle Parquet and other semi-structured file formats?
**Answer**

Snowflake can read semi-structured files such as Parquet, Avro, and JSON from stages and load or query their data. Columnar formats such as Parquet can also provide efficient storage and processing.
**Example**

A company can keep Parquet files in cloud storage, create a stage, and load the required data into Snowflake.
Replication & Disaster Recovery
### 120. What is Cross-Region Replication in Snowflake?
**Answer**

Cross-Region Replication allows Snowflake data and supported objects to be replicated to another region. It helps organizations maintain a secondary environment for business continuity and disaster recovery.
**Example**

A company running its primary Snowflake account in one region can replicate supported data to another region for recovery if the primary region becomes unavailable.
### 121. Why is Replication used in Snowflake?
**Answer**

Replication is mainly used for disaster recovery, business continuity, and maintaining copies of data in different regions. It provides a secondary environment that can be used when the primary environment has a serious failure.
**Example**

A financial company can replicate important data to another region so that critical workloads can continue during a regional outage.
### 122. What is Failover in Snowflake?
**Answer**

Failover is the process of switching operations from a primary environment to a secondary replicated environment when the primary environment is unavailable. It helps applications continue working during a major failure.
**Example**

If the primary Snowflake region becomes unavailable, the company can fail over to the secondary region.
### 123. What are RPO and RTO in Disaster Recovery?
**Answer**

RPO, or Recovery Point Objective, defines how much data loss is acceptable, while RTO, or Recovery Time Objective, defines how quickly the system should be restored. Both are important when designing a disaster recovery strategy.
**Example**

If the RPO is 15 minutes, the business should be prepared for up to 15 minutes of data loss. If the RTO is one hour, the system should be restored within one hour.
### 124. What is a Disaster Recovery Plan in Snowflake?
**Answer**

A Disaster Recovery Plan defines how an organization protects data and restores operations when a major failure occurs. In Snowflake, replication and failover can be important parts of this plan.
**Example**

A company can replicate its critical database to another region, regularly monitor replication, test failover, and document the recovery process.
### 125. What should be monitored during Snowflake replication?
**Answer**

Replication should be monitored for its status, synchronization, and any delays or failures. Monitoring helps ensure that the secondary environment has the required data when it is needed.
**Example**

If replication is delayed, the team can investigate the issue before a disaster occurs.
### 126. What are some limitations of Cross-Region Replication?
**Answer**

Replication supports specific Snowflake objects and configurations, so not everything in an account is automatically replicated. Organizations must understand the supported objects and design their recovery strategy accordingly.
**Example**

Before depending on replication for disaster recovery, a company should verify that all required databases, objects, and configurations are supported.
Data Retention
### 127. What is a Data Retention Policy in Snowflake?
**Answer**

A data retention policy defines how long data or historical versions of data should be retained. It helps organizations balance recovery requirements with storage and cost considerations.
**Example**

A company may retain historical data for seven days when that period is sufficient for its recovery requirements.
### 128. How does Data Retention affect Time Travel and storage cost?
**Answer**

A longer retention period allows historical data to remain available for a longer time, but it can also increase storage requirements. Therefore, retention should be configured according to actual business and recovery needs.
**Example**

A table requiring only three days of historical recovery does not necessarily need a long retention period.
User-Defined Functions
### 129. What is a User-Defined Function (UDF) in Snowflake?
**Answer**

A UDF is a custom function created by a user to perform a specific calculation or transformation. It can be reused in SQL statements instead of writing the same logic repeatedly.
**Example**

A company can create a UDF that calculates an employee's annual bonus from their salary.
### 130. What types of UDFs can be created in Snowflake?
**Answer**

Snowflake supports UDFs using languages such as SQL, JavaScript, and Python. The appropriate language can be selected based on the complexity and requirements of the business logic.
**Example**

Simple calculations can use a SQL UDF, while more complex logic can use JavaScript or Python.
### 131. What is a SQL UDF?
**Answer**

A SQL UDF is a user-defined function written using SQL. It is useful for simple calculations and transformations that can be expressed using SQL expressions.
**Example**

```text
CREATE FUNCTION add_tax(price NUMBER)
```
RETURNS NUMBER
AS
'price * 1.18';
The function can then be reused whenever tax needs to be calculated.
### 132. What is a JavaScript UDF?
**Answer**

A JavaScript UDF allows JavaScript code to be used for custom data processing inside Snowflake. It is useful when the required logic is more suitable for JavaScript than standard SQL.
**Example**

A JavaScript UDF can implement a custom string-processing rule that would be difficult to express using a simple SQL expression.
### 133. What is a Python UDF?
**Answer**

A Python UDF allows Python code to be used for custom transformations and calculations in Snowflake. It is useful when Python provides a simpler way to implement the required logic.
**Example**

A Python UDF can perform a custom calculation on input values that would require complex SQL logic.
### 134. What is the difference between a UDF and a Stored Procedure?
**Answer**

A UDF is mainly used to calculate or transform values and return a result, while a Stored Procedure is designed for executing a sequence of operations or implementing multi-step business logic.
**Example**

A UDF can calculate a customer's discount, while a Stored Procedure can process an entire order workflow involving multiple operations.
Data Sharing
### 135. What is Snowflake Data Sharing?
**Answer**

Snowflake Data Sharing allows data to be shared with other Snowflake accounts without physically copying the underlying data. A provider creates a share and gives the required access to a consumer.
**Example**

A company can share selected sales data with a business partner without sending the partner a separate copy of the database.
### 136. Who are the Provider and Consumer in Snowflake Data Sharing?
**Answer**

The Provider is the account that owns and shares the data, while the Consumer is the account that receives access to the shared data. The provider controls which objects are made available.
**Example**

A data company can act as the Provider and share market data with a customer's Snowflake account as the Consumer.
### 137. How does Snowflake Data Sharing work?
**Answer**

The provider creates a Share, grants the required database objects to it, and then makes the Share available to the consumer account. The consumer can create a database from the Share and query the shared data.
**Example**

```text
CREATE SHARE sales_share;
GRANT USAGE ON DATABASE sales_db
```
TO SHARE sales_share;
The provider can then make the share available to the required consumer.
### 138. What are the advantages of Snowflake Data Sharing?
**Answer**

Data Sharing avoids unnecessary data copying and allows consumers to access shared data directly. It also gives the provider control over which data is shared.
**Example**

A company can share only a required sales schema with a partner instead of copying the entire database.
### 139. What are the security considerations when using Data Sharing?
**Answer**

The provider should share only the required objects and grant the minimum necessary access. Proper roles and privileges should be used to control who can access the shared data.
**Example**

Instead of sharing an entire customer database, a company can share only the columns and tables required by the partner.
### 140. What is the difference between Data Sharing and copying data?
**Answer**

Data Sharing provides access to shared data without creating a separate physical copy for the consumer, while copying creates another dataset that must be stored and maintained separately.
**Example**

A company can share a sales table with a partner instead of exporting the table and sending a separate copy.
## Phase 6 — Stored Procedures & Snowpark
### 141. What is a Stored Procedure in Snowflake?
**Answer**

A Stored Procedure is a reusable program that can contain multiple SQL statements and business logic. It is useful when a task requires several operations instead of a single calculation.
**Example**

A Stored Procedure can validate data, update a table, and then insert the processed results into another table.
### 142. What is a SQL Stored Procedure?
**Answer**

A SQL Stored Procedure is a procedure written using Snowflake SQL. It is useful for performing database operations and implementing business logic using SQL statements.
**Example**

A SQL Stored Procedure can update employee salaries and then return a message indicating that the update was completed.
### 143. What is a Python Stored Procedure in Snowflake?
**Answer**

A Python Stored Procedure allows Python code to execute business logic inside Snowflake. It is useful when the required processing is easier to implement using Python.
**Example**

A Python Stored Procedure can read data, apply custom processing, and write the processed results back to a Snowflake table.
### 144. What is the difference between a Stored Procedure and a UDF?
**Answer**

A UDF is mainly used to calculate or transform a value and return a result, while a Stored Procedure is used for executing multiple operations and implementing larger business workflows.
**Example**

A UDF can calculate an employee's bonus, while a Stored Procedure can calculate bonuses, update employee records, and generate a processing result.
### 145. When should you use a Stored Procedure in Snowflake?
**Answer**

A Stored Procedure should be used when a task requires multiple steps, conditional logic, database operations, or a complete business workflow. It is more suitable than a simple UDF when the operation involves several actions.
**Example**

An order-processing workflow can validate an order, update inventory, insert transaction records, and log the result using a Stored Procedure.
### 146. What is custom business logic in Snowflake?
**Answer**

Custom business logic is a set of rules or calculations created to meet a specific business requirement. Snowflake can implement this logic using SQL, UDFs, Stored Procedures, or Snowpark depending on the complexity.
**Example**

A company can create logic that calculates discounts based on customer type, purchase amount, and order history.
Snowpark
### 147. What is Snowpark?
**Answer**

Snowpark is a developer framework that allows users to work with Snowflake data using programming languages such as Python. It allows data processing to happen inside Snowflake instead of moving large amounts of data to an external system.
**Example**

A Python developer can use Snowpark DataFrames to transform a Snowflake table without downloading the table into Python.
### 148. Why is Snowpark useful?
**Answer**

Snowpark allows developers to use programming languages and DataFrame-style operations while taking advantage of Snowflake's compute and security. It is useful for processing that is difficult or inconvenient to express using SQL alone.
**Example**

A developer can use Python and Snowpark to implement a complex transformation directly on Snowflake data.
### 149. What is a Snowpark Session?
**Answer**

A Snowpark Session establishes the connection between a Snowpark application and Snowflake. It provides the starting point for creating DataFrames, running operations, and interacting with Snowflake objects.
**Example**

A Python Snowpark application first creates a Session and then uses that Session to read a Snowflake table.
### 150. What is a Snowpark DataFrame?
**Answer**

A Snowpark DataFrame represents data from a Snowflake table, view, or query and allows developers to perform transformations using programming-language APIs. The operations are ultimately executed in Snowflake.
**Example**

```text
df = session.table("EMPLOYEES")
```
Here, df represents the employee table as a Snowpark DataFrame.
### 151. What is the difference between a Snowpark DataFrame and a Pandas DataFrame?
**Answer**

A Snowpark DataFrame is designed to process data inside Snowflake, while a Pandas DataFrame normally processes data in the local Python environment. Snowpark therefore avoids moving large datasets unnecessarily from Snowflake to Python.
**Example**

A large employee table can be filtered using a Snowpark DataFrame without downloading all employee records to the local machine.
### 152. What are transformations and actions in Snowpark?
**Answer**

Transformations define how the data should be changed, while actions cause Snowpark to execute the required operation and return or produce a result. Snowpark uses lazy evaluation, so transformations are generally not executed immediately.
**Example**

filter() can define a transformation, while show() can trigger execution and display the resulting data.
### 153. What is Lazy Evaluation in Snowpark?
**Answer**

Lazy evaluation means Snowpark does not immediately execute every DataFrame operation when it is written. Instead, it builds a logical plan and executes the required operations when an action is performed.
**Example**

```text
df = session.table("EMPLOYEES")
df = df.filter(col("SALARY") > 50000)
```
df.show()
The filtering operation is defined first and execution occurs when show() is called.
### 154. What is Pushdown in Snowpark?
**Answer**

Pushdown means the processing is performed inside Snowflake rather than bringing the data into the external Python environment. Snowpark converts DataFrame operations into an execution plan that Snowflake can process.
**Example**

If a Snowpark application filters one million rows to find employees with salaries above 50,000, the filtering can be performed inside Snowflake instead of transferring all rows to Python.
### 155. How does Snowpark execute a DataFrame operation?
**Answer**

Snowpark builds a logical plan from the DataFrame operations and sends the required processing to Snowflake. Snowflake then optimizes and executes the plan using its compute resources.
**Example**

A sequence of filter(), select(), and group_by() operations can be combined into an optimized execution plan before Snowflake processes the data.
Snowpark DataFrame Operations
### 156. How do you select columns using Snowpark?
**Answer**

The select() operation is used to choose the required columns from a Snowpark DataFrame. It is useful when only specific columns are needed for further processing.
**Example**

df.select("EMPLOYEE_ID", "NAME", "SALARY")
This selects only the employee ID, name, and salary columns.
### 157. How do you filter data using Snowpark?
**Answer**

The filter() or where() operation is used to return rows that satisfy a specified condition.
**Example**

df.filter(col("SALARY") > 50000)
This returns employees whose salary is greater than 50,000.
### 158. How do you sort data in Snowpark?
**Answer**

The order_by() operation is used to sort DataFrame records based on one or more columns.
**Example**

df.order_by("SALARY")
This sorts employees according to their salary.
### 159. How do you add or modify a column in Snowpark?
**Answer**

The with_column() operation is used to create a new column or replace an existing column using an expression.
**Example**

df.with_column("ANNUAL_SALARY", col("SALARY") * 12)
This creates an ANNUAL_SALARY column.
### 160. How do you rename and remove columns in Snowpark?
**Answer**

Snowpark provides with_column_renamed() to rename a column and drop() to remove a column from a DataFrame.
**Example**

df.with_column_renamed("NAME", "EMPLOYEE_NAME")
This changes the column name from NAME to EMPLOYEE_NAME.
### 161. How do you remove duplicate records in Snowpark?
**Answer**

The distinct() operation is used to return unique rows from a Snowpark DataFrame.
**Example**

df.select("DEPARTMENT").distinct()
This returns each department only once.
### 162. How do you perform aggregations in Snowpark?
**Answer**

Snowpark provides grouping and aggregation operations such as group_by(), sum(), avg(), count(), min(), and max() to summarize data.
**Example**

df.group_by("DEPARTMENT").agg(avg("SALARY"))
This calculates the average salary for each department.
### 163. How do you perform joins using Snowpark?
**Answer**

The join() operation is used to combine data from two Snowpark DataFrames using matching columns or conditions. Snowpark supports different join types depending on the requirement.
**Example**

employees.join(
departments,
```text
employees["DEPT_ID"] == departments["DEPT_ID"]
```
)
This joins employee and department data using DEPT_ID.
### 164. What types of joins can be performed using Snowpark?
**Answer**

Snowpark supports common SQL join types such as inner, left, right, and full joins. The appropriate join type is selected based on which records need to be retained.
**Example**

A left join can be used when all employees must be retained even if some employees do not have a matching department record.
### 165. How can you use string and date functions in Snowpark?
**Answer**

Snowpark provides functions for working with strings, dates, and other data types. These functions can be used within DataFrame transformations to clean and transform data.
**Example**

A developer can use a string function to convert employee names to uppercase or a date function to extract the year from a joining date.
Snowpark UDFs & Approach
### 166. What is a Snowpark UDF?
**Answer**

A Snowpark UDF is a user-defined function that allows custom programming logic to be applied to Snowflake data. Python is commonly used to create Snowpark UDFs when standard SQL functions are not sufficient.
**Example**

A Python UDF can implement a custom text transformation that is difficult to express using normal SQL functions.
### 167. What is the difference between Snowpark and traditional Python processing?
**Answer**

Traditional Python processing may require data to be transferred from Snowflake to an external environment, while Snowpark can process the data inside Snowflake. This can reduce unnecessary data movement and make it suitable for large datasets.
**Example**

Instead of downloading a large customer table into Python, a Snowpark application can perform the transformation directly in Snowflake.
### 168. When should you use Snowpark instead of SQL?
**Answer**

SQL is generally suitable for standard database transformations and queries, while Snowpark is useful when the processing requires programming logic, DataFrame operations, or Python-based processing that is difficult to implement using SQL alone.
**Example**

A simple filtering and aggregation task can use SQL, while a complex Python-based transformation can use Snowpark.
### 169. What are the benefits of using Snowpark with Snowflake?
**Answer**

Snowpark allows developers to use familiar programming languages while keeping data processing inside Snowflake. It reduces unnecessary data movement and allows Snowflake's compute, security, and optimization capabilities to be used.
**Example**

A Python developer can build a transformation using Snowpark DataFrames while the actual processing remains inside Snowflake.
### 170. Can Snowpark use external Python libraries?
**Answer**

Snowpark can use supported Python packages and libraries when they are available in the Snowflake environment. The package requirements and compatibility should be checked before using them in a Snowpark application.
**Example**

A developer can use a supported Python package for a specialized transformation instead of implementing the entire logic manually.
## Phase 7 — dbt Fundamentals
### 171. What is dbt?
**Answer**

dbt is a transformation tool used to transform and organize data inside a data warehouse such as Snowflake. It allows developers to write SQL models and manage them using software development practices such as testing and documentation.
**Example**

A company can use dbt to transform raw customer and order data in Snowflake into clean reporting tables.
### 172. Why is dbt used with Snowflake?
**Answer**

dbt works well with Snowflake because it allows SQL transformations to be developed and managed while Snowflake performs the actual data processing. This helps organize transformation logic into reusable and maintainable models.
**Example**

Raw sales data can be stored in Snowflake, while dbt models transform it into clean customer and sales tables.
### 173. What is a dbt Project?
**Answer**

A dbt Project is a collection of configuration files, SQL models, tests, seeds, macros, snapshots, and documentation used to manage a data transformation workflow.
**Example**

A sales project can contain models for customers and orders, tests for data quality, and configuration in dbt_project.yml.
### 174. What is dbt_project.yml?
**Answer**

dbt_project.yml is the main configuration file of a dbt project. It defines project settings and can also configure how models and other project resources should be handled.
**Example**

A project can use dbt_project.yml to define the project name and configure model materializations.
### 175. What are the main directories in a dbt Project?
**Answer**

A dbt project commonly contains directories such as models, seeds, snapshots, tests, macros, and analyses. Each directory is used for a different part of the transformation workflow.
**Example**

SQL transformation models can be stored in the models directory, while CSV files used as seeds can be stored in the seeds directory.
dbt Models
### 176. What is a dbt Model?
**Answer**

A dbt Model is a SQL file that defines a transformation. When dbt runs the model, it converts the SQL into the appropriate Snowflake object according to its materialization.
**Example**

```text
SELECT *
```
FROM {{ source('sales', 'customers') }}
This model reads customer data from a configured source.
### 177. What is the purpose of the ref() function in dbt?
**Answer**

The ref() function is used to reference another dbt model. It helps dbt understand dependencies between models and generate the correct execution order.
**Example**

```text
SELECT *
```
FROM {{ ref('silver_customers') }}
Here, the model depends on silver_customers.
### 178. What is the difference between ref() and source() in dbt?
**Answer**

ref() is used to reference another dbt model, while source() is used to reference a source table defined in the dbt project. Both help dbt understand where the data comes from.
**Example**

{{ ref('silver_orders') }}
{{ source('sales', 'orders') }}
The first references a dbt model and the second references a source table.
### 179. What is a dbt Source?
**Answer**

A Source represents raw or existing tables that are loaded into the data warehouse outside of dbt. Defining sources allows dbt to reference these tables and apply testing and documentation to them.
**Example**

A raw customers table loaded into Snowflake by an ETL process can be configured as a dbt source.
### 180. How do you define a Source in dbt?
**Answer**

Sources are normally defined in a YAML file using the source name and the database and schema containing the source tables. Individual tables can then be referenced using the source() function.
**Example**

sources:
- name: sales
schema: raw
tables:
- name: customers
The model can then use source('sales', 'customers').
dbt Materializations
### 181. What is Materialization in dbt?
**Answer**

Materialization determines how dbt creates and stores the result of a model in the warehouse. Common materializations include View, Table, Incremental, and Ephemeral.
**Example**

A frequently used reporting model can be materialized as a Table, while a simple transformation can be materialized as a View.
### 182. What is a View materialization in dbt?
**Answer**

The View materialization creates a database View from the model SQL. The transformation is executed when the View is queried rather than storing the complete result as a physical table.
**Example**

A simple customer filtering model that does not need to store a separate copy can use View materialization.
### 183. What is a Table materialization in dbt?
**Answer**

The Table materialization creates a physical table containing the result of the model. It is useful when the transformed data is queried frequently and storing the result can improve usability or performance.
**Example**

A daily sales summary can be materialized as a Table for reporting users.
### 184. What is Ephemeral materialization in dbt?
**Answer**

Ephemeral models are not created as separate tables or views in Snowflake. dbt instead uses their SQL as part of other model queries, making them useful for reusable intermediate transformations.
**Example**

A small transformation used by several models can be defined as an Ephemeral model instead of creating a separate database object.
### 185. What are the main dbt materializations and when are they used?
**Answer**

View is useful for lightweight transformations, Table is useful for storing complete transformed results, Incremental is useful for processing only new or changed data, and Ephemeral is useful for intermediate reusable logic.
**Example**

A simple transformation can use View, a reporting table can use Table, a large continuously growing dataset can use Incremental, and a small reusable transformation can use Ephemeral.
dbt Seeds
### 186. What is a dbt Seed?
**Answer**

A Seed is a CSV file stored in the dbt project that can be loaded into the warehouse using dbt. Seeds are useful for small, relatively static datasets that are maintained as part of the project.
**Example**

A company can keep a small employee reference CSV in the seeds directory and load it into Snowflake using dbt.
### 187. When should you use a Seed instead of a Source?
**Answer**

A Seed is suitable when the data is a small static file maintained within the dbt project. A Source is more appropriate when the data already exists in the warehouse and is loaded by another process.
**Example**

A manually maintained country-code CSV can be a Seed, while a production customer table loaded by an ETL pipeline can be a Source.
dbt Testing
### 188. What is dbt Testing?
**Answer**

dbt Testing is used to check whether data meets defined quality rules. Tests can identify problems such as duplicate values, missing values, or invalid relationships.
**Example**

A test can verify that every employee ID is unique and that an employee ID is not NULL.
### 189. What are common generic tests in dbt?
**Answer**

Common dbt tests include unique, not_null, accepted_values, and relationships. These tests check common data-quality requirements without requiring custom SQL for every basic validation.
**Example**

A status column can use accepted_values to ensure that only valid statuses such as ACTIVE and INACTIVE are present.
### 190. What is a not_null test in dbt?
**Answer**

A not_null test checks that a column does not contain NULL values. It is useful for columns that are required for identifying or processing records.
**Example**

An employee ID column can have a not_null test because every employee should have an ID.
### 191. What is a unique test in dbt?
**Answer**

A unique test checks that each value in a column appears only once. It is commonly used for primary-key-like columns.
**Example**

An employee_id column should normally contain unique values, so a unique test can be applied to it.
### 192. What is a relationships test in dbt?
**Answer**

A relationships test checks whether values in one model have matching values in another model. It is useful for validating relationships between related datasets.
**Example**

Every customer_id in an orders table can be checked against the customer IDs in the customers table.
dbt Documentation
### 193. What is dbt Documentation?
**Answer**

dbt Documentation provides information about models, columns, sources, tests, and relationships in a dbt project. It helps developers and users understand how data is transformed and where it comes from.
**Example**

A team can document what a customer_revenue model represents and describe each important column.
### 194. Why is documentation important in dbt?
**Answer**

Documentation makes transformation logic and data definitions easier to understand and maintain. It helps new developers and business users understand the purpose and structure of datasets.
**Example**

A developer joining an existing project can use the documentation to understand how the final sales model is built from the source data.
## Phase 8 — Advanced dbt
### 195. What is an Incremental Model in dbt?
**Answer**

An Incremental Model is used to process only new or changed records instead of rebuilding the entire dataset every time. It is useful for large tables where processing all historical data repeatedly would take more time and compute.
**Example**

A sales table contains five years of data. Instead of processing all five years every day, an incremental model can process only the latest day's records.
### 196. How does an Incremental Model work in dbt?
**Answer**

The first time an incremental model runs, dbt creates the complete target table. On later runs, dbt processes only the records selected by the incremental condition and adds or updates them in the existing table.
**Example**

```text
SELECT *
```
FROM {{ source('sales', 'orders') }}
{% if is_incremental() %}
WHERE order_date > (SELECT MAX(order_date) FROM {{ this }})
{% endif %}
The condition processes only records newer than the latest record already present.
### 197. What are is_incremental() and this in dbt?
**Answer**

is_incremental() checks whether dbt is currently running an incremental model against an existing target table. this refers to the current model's target relation in the warehouse.
**Example**

is_incremental() can be used to apply a date filter, while {{ this }} can be used to find the latest processed date from the existing model.
### 198. What is a unique_key in an Incremental Model?
**Answer**

A unique_key identifies records that should be treated as unique in an incremental model. It allows dbt to determine which existing records should be updated instead of simply adding duplicate records.
**Example**

If order_id uniquely identifies an order, it can be configured as the unique_key for the incremental model.
### 199. What is the difference between Append and Merge behavior in Incremental Models?
**Answer**

Append behavior adds new records to the target table, while Merge behavior can insert new records and update existing records based on a unique key. Merge is useful when existing records can change.
**Example**

If an order's status can change after it is loaded, a merge-based incremental model can update the existing order instead of creating another row.
### 200. What is a Full Refresh in dbt?
**Answer**

A Full Refresh rebuilds an incremental model from the beginning instead of processing only incremental records. It can be useful when the model logic changes or the existing target data needs to be completely rebuilt.
**Example**

dbt run --full-refresh
This forces incremental models to be rebuilt.
### 201. What are the advantages and limitations of Incremental Models?
**Answer**

Incremental models can significantly reduce processing time and compute cost for large datasets, but they require careful logic to correctly identify new or changed records. Incorrect incremental conditions can cause missing or duplicate data.
**Example**

An incremental model is highly useful for a billion-row transaction table, but the developer must correctly handle late-arriving or updated records.
dbt Snapshots & SCD
### 202. What is a Snapshot in dbt?
**Answer**

A dbt Snapshot captures changes to records over time and stores historical versions of the data. It is commonly used to implement Slowly Changing Dimensions, especially SCD Type 2.
**Example**

If a customer's address changes, a snapshot can preserve the old address and store the new address as another historical version.
### 203. What is a Slowly Changing Dimension (SCD)?
**Answer**

A Slowly Changing Dimension is a method used to manage changes to dimension data over time. It allows organizations to decide whether they want to overwrite old information or maintain its history.
**Example**

If an employee moves from the IT department to HR, an SCD approach can determine whether the old department should be replaced or preserved as historical information.
### 204. What is the difference between SCD Type 1 and SCD Type 2?
**Answer**

SCD Type 1 overwrites the old value and does not maintain historical versions, while SCD Type 2 keeps the old record and creates a new version when the data changes.
**Example**

If a customer's city changes from Chennai to Mumbai, Type 1 keeps only Mumbai, while Type 2 preserves both the old and new versions.
### 205. How does dbt Snapshot implement SCD Type 2?
**Answer**

A dbt Snapshot detects changes in source records and creates a new version when a tracked value changes. It maintains historical information using fields such as the validity timestamps.
**Example**

When a customer's address changes, the previous version can be closed with an end timestamp and a new version can be created with a new start timestamp.
### 206. What are the main Snapshot strategies in dbt?
**Answer**

The main snapshot strategies are Timestamp and Check. Timestamp uses a column such as updated_at to detect changes, while Check compares selected columns to determine whether a record has changed.
**Example**

If a source table has a reliable updated_at column, the Timestamp strategy can be used to detect changes efficiently.
### 207. When would you use Timestamp versus Check strategy in a dbt Snapshot?
**Answer**

The Timestamp strategy is preferred when the source has a reliable column that changes whenever the record changes. The Check strategy is useful when there is no reliable update timestamp and specific columns need to be compared.
**Example**

A customer table with an updated_at column can use Timestamp, while a table without such a column can use Check on fields such as name and address.
Advanced dbt Error Handling & Monitoring
### 208. How does dbt handle errors during a run?
**Answer**

dbt reports errors when a model, test, or other operation fails and provides information that helps identify the problem. Depending on the failure, the developer can inspect the generated SQL, logs, or database error message.
**Example**

If a model references a column that does not exist in Snowflake, the dbt run will fail and provide an error that can be investigated.
### 209. How can you troubleshoot a failed dbt model?
**Answer**

First, check the dbt error message and identify the failing model. Then inspect the SQL, source data, dependencies, configuration, and the generated query to find the root cause.
**Example**

If a model fails because a source column was renamed, checking the source definition and model SQL can reveal the incorrect column reference.
### 210. How can dbt models be monitored?
**Answer**

dbt runs, model results, test results, logs, and execution times can be monitored to identify failures and performance problems. Monitoring helps ensure that data pipelines continue to work correctly.
**Example**

A team can monitor daily dbt runs and investigate any model that suddenly starts failing or taking much longer than normal.
### 211. How can dbt tests help with pipeline monitoring?
**Answer**

dbt tests can automatically check important data-quality conditions during pipeline execution. A failed test can indicate that the upstream data or transformation has a problem.
**Example**

If a not_null test on customer_id fails, the team can investigate the source or transformation before the incorrect data reaches reporting users.
dbt Cost & Performance
### 212. How can you optimize dbt models for Snowflake?
**Answer**

dbt models can be optimized by processing only required data, using incremental models for large datasets, avoiding unnecessary transformations, and choosing suitable materializations. Snowflake warehouse sizing and query optimization should also be considered.
**Example**

A large transaction model can use incremental processing instead of rebuilding the complete table every day.
### 213. How can Incremental Models reduce Snowflake costs?
**Answer**

Incremental models reduce the amount of data that needs to be processed because they can process only new or changed records. Less processing can reduce warehouse compute consumption.
**Example**

Instead of processing 500 million historical transactions every day, a model may process only the 100,000 transactions added that day.
### 214. What is the difference between dbt and an ETL tool?
**Answer**

dbt primarily focuses on transforming data that already exists in the warehouse, while traditional ETL tools often handle extraction, transformation, and loading as part of a broader pipeline. dbt is therefore commonly used as the transformation layer after data has been loaded into Snowflake.
**Example**

An ingestion tool can load raw data into Snowflake, and dbt can then transform that raw data into clean reporting models.
### 215. What is dbt DAG and why is it important?
**Answer**

A dbt DAG, or Directed Acyclic Graph, represents the dependencies between models, sources, and other resources. dbt uses these dependencies to determine the correct order in which transformations should run.
**Example**

If orders_summary depends on orders_clean, dbt ensures that orders_clean runs before orders_summary.
### 216. How does dbt support modular data transformation?
**Answer**

dbt allows complex transformations to be divided into smaller reusable models. These models can reference each other using ref(), making the overall pipeline easier to understand, test, and maintain.
**Example**

Instead of creating one large SQL query, a project can have separate models for cleaning customers, cleaning orders, and generating the final sales summary.
## Phase 9 — Python Connector, REST API & Snowflake Security
### 217. What is the Snowflake Python Connector?
**Answer**

The Snowflake Python Connector is a Python library that allows Python applications to connect to Snowflake and execute SQL statements. It is useful when an external Python application needs to interact with Snowflake.
**Example**

A Python application can connect to Snowflake, execute a SELECT query, and fetch the results for further processing.
### 218. What are the common steps to connect Python with Snowflake?
**Answer**

A Python application normally imports the Snowflake Connector, provides the required connection details and authentication information, creates a connection, and then creates a cursor to execute SQL statements.
**Example**

```text
import snowflake.connector
conn = snowflake.connector.connect(
user="USER",
password="PASSWORD",
account="ACCOUNT"
```
)
```text
cursor = conn.cursor()
```
cursor.execute("SELECT CURRENT_USER()")
This creates a Python connection and executes a Snowflake query.
### 219. What is the difference between Snowpark and the Snowflake Python Connector?
**Answer**

The Python Connector is mainly used to connect to Snowflake and execute SQL from an external Python application. Snowpark provides DataFrame APIs and programming capabilities for performing data processing within Snowflake.
**Example**

A Python application can use the Connector to execute a SQL query, while Snowpark can be used to build a DataFrame transformation on Snowflake data.
### 220. What is the Snowflake REST API?
**Answer**

The Snowflake REST API allows applications to interact with Snowflake programmatically through HTTP requests. It can be used to submit SQL statements and perform supported Snowflake operations without using the normal web interface.
**Example**

An application can send an HTTP request to Snowflake to execute a SQL statement and retrieve its result.
### 221. What are authentication methods used in Snowflake?
**Answer**

Snowflake supports different authentication methods depending on the application and security requirements. Common methods include password authentication, key-pair authentication, and OAuth.
**Example**

A developer may use password authentication for a basic connection, while an automated production application can use key-pair authentication.
### 222. What is Key-Pair Authentication in Snowflake?
**Answer**

Key-pair authentication uses a private key and a corresponding public key instead of a user's password. It is commonly used for secure programmatic access from applications and automated processes.
**Example**

A Python application running an automated data pipeline can authenticate to Snowflake using a private key associated with its Snowflake user.
### 223. What is OAuth authentication in Snowflake?
**Answer**

OAuth allows an application to authenticate using an OAuth access token instead of directly using a Snowflake password. It is useful when authentication is managed through an identity provider or OAuth-supported integration.
**Example**

An application can obtain an OAuth token and use that token to authenticate when connecting to Snowflake.
Users, Roles & Privileges
### 224. What are Users, Roles, and Privileges in Snowflake?
**Answer**

A User represents a person or service account, a Role is used to group permissions, and Privileges define what actions can be performed on Snowflake objects. Together, they form the basic access-control structure in Snowflake.
**Example**

A reporting user can be assigned a reporting role that has permission to query specific tables.
### 225. What is Role-Based Access Control (RBAC) in Snowflake?
**Answer**

RBAC controls access by assigning privileges to roles and then assigning those roles to users. This makes access easier to manage because permissions can be managed at the role level instead of individually for every user.
**Example**

A REPORTING_ROLE can be given SELECT access to reporting tables and then assigned to multiple analysts.
### 226. What is the difference between a Role and a Privilege?
**Answer**

A Role is a collection of permissions that can be assigned to users, while a Privilege is a specific permission to perform an action on an object. A role can contain multiple privileges.
**Example**

```text
SELECT is a privilege, while ANALYST_ROLE can be a role containing SELECT privileges on several tables.
```
### 227. What is Role Hierarchy in Snowflake?
**Answer**

Role hierarchy allows one role to inherit the privileges of another role. This helps organizations create levels of access without repeatedly granting the same privileges.
**Example**

A senior analyst role can inherit the privileges of a basic analyst role and receive additional permissions.
Data Security
### 228. What is Data Masking in Snowflake?
**Answer**

Data Masking protects sensitive information by changing how data is displayed to users who do not have the required privileges. A masking policy can return the original value for authorized users and a masked value for others.
**Example**

A customer's phone number can be displayed fully to authorized users but partially hidden from other users.
### 229. What is Row-Level Security in Snowflake?
**Answer**

Row-Level Security controls which rows a user can access based on defined conditions. Snowflake can implement this using Row Access Policies.
**Example**

A regional manager can be allowed to see only the sales records belonging to their region.
### 230. What are Audit Trails and Monitoring in Snowflake?
**Answer**

Audit trails record information about activities such as user logins, queries, and access to data. Monitoring these activities helps organizations investigate security issues, track usage, and meet auditing requirements.
**Example**

If sensitive data was accessed unexpectedly, audit information can help identify which user accessed it and when.


# Part C — Snowflake Codes
# Snowflake Basic Codes — Complete Source-Derived Reference
> Complete code reference from the uploaded `Snowflake Basic Codes.docx`.

## 1. Database
```sql
-- Create
```
```sql
CREATE DATABASE my_db;
```
```sql
-- Use
```
```sql
USE DATABASE my_db;
```
```sql
-- List
```
```sql
SHOW DATABASES;
```
```sql
-- Drop
```
```sql
DROP DATABASE my_db;
```

## 2. Schema
```sql
-- Create
```
```sql
CREATE SCHEMA my_schema;
```
```sql
-- Use
```
```sql
USE SCHEMA my_schema;
```
```sql
-- List
```
```sql
SHOW SCHEMAS;
```
```sql
-- Drop
```
```sql
DROP SCHEMA my_schema;
```

## 3. Table
```sql
-- Create
```
```sql
CREATE TABLE employees (
```
employee_id INT,
name VARCHAR,
salary NUMBER
```sql
);
```
```sql
-- Insert
```
```sql
INSERT INTO employees
```
```sql
VALUES (1, 'John', 50000);
```
```sql
-- Read
```
```sql
SELECT * FROM employees;
```
```sql
-- Alter
```
```sql
ALTER TABLE employees ADD COLUMN department VARCHAR;
```
```sql
-- Drop
```
```sql
DROP TABLE employees;
```

## 4. Temporary Table
```sql
CREATE TEMPORARY TABLE temp_employees (
```
id INT,
name VARCHAR
```sql
);
```
```sql
SELECT * FROM temp_employees;
```
```sql
DROP TABLE temp_employees;
```
A temporary table exists only for the current session.

## 5. Transient Table
```sql
CREATE TRANSIENT TABLE staging_employees (
```
id INT,
name VARCHAR
```sql
);
```
```sql
DROP TABLE staging_employees;
```
Transient tables are useful for temporary or staging-type data where Fail-safe protection is not required.

## 6. View
```sql
-- Create
```
```sql
CREATE VIEW employee_view AS
```
```sql
SELECT employee_id, name, salary
```
```sql
FROM employees;
```
```sql
-- Query
```
```sql
SELECT * FROM employee_view;
```
```sql
-- Replace
```
```sql
CREATE OR REPLACE VIEW employee_view AS
```
```sql
SELECT employee_id, name
```
```sql
FROM employees;
```
```sql
-- Drop
```
```sql
DROP VIEW employee_view;
```

## 7. Materialized View
```sql
CREATE MATERIALIZED VIEW employee_summary AS
```
```sql
SELECT department, AVG(salary) AS avg_salary
```
FROM employees
```sql
GROUP BY department;
```
```sql
SELECT * FROM employee_summary;
```
```sql
DROP MATERIALIZED VIEW employee_summary;
```

## 9. Stage
```sql
-- Create internal stage
```
```sql
CREATE STAGE my_stage;
```
```sql
-- List files
```
```sql
LIST @my_stage;
```
```sql
-- Drop
```
```sql
DROP STAGE my_stage;
```
For an external stage:
```sql
CREATE STAGE my_ext_stage
```
```sql
URL = 's3://my-bucket/data/';
```

## 10. File Format
```sql
-- Create CSV format
```
```sql
CREATE FILE FORMAT my_csv_format
```
```sql
TYPE = CSV
```
```sql
FIELD_DELIMITER = ','
```
```sql
SKIP_HEADER = 1;
```
```sql
-- Describe
```
```sql
DESC FILE FORMAT my_csv_format;
```
```sql
-- Drop
```
```sql
DROP FILE FORMAT my_csv_format;
```
Example for JSON:
```sql
CREATE FILE FORMAT my_json_format
```
```sql
TYPE = JSON;
```

## 13. Task
```sql
-- Create
```
```sql
CREATE TASK daily_task
```
```sql
WAREHOUSE = my_warehouse
```
```sql
SCHEDULE = 'USING CRON 0 9 * * * UTC'
```
AS
```sql
INSERT INTO target_table
```
```sql
SELECT * FROM source_table;
```
```sql
-- Resume
```
```sql
ALTER TASK daily_task RESUME;
```
```sql
-- Suspend
```
```sql
ALTER TASK daily_task SUSPEND;
```
```sql
-- Drop
```
```sql
DROP TASK daily_task;
```

## 14. Stored Procedure — SQL
```sql
CREATE PROCEDURE get_employee_count()
```
RETURNS NUMBER
LANGUAGE SQL
AS
$$
```sql
BEGIN
```
```sql
RETURN (SELECT COUNT(*) FROM employees);
```
```sql
END;
```
```sql
$$;
```
Call it:
```sql
CALL get_employee_count();
```
Drop it:
```sql
DROP PROCEDURE get_employee_count();
```

## 15. Function / SQL UDF
```sql
CREATE FUNCTION calculate_bonus(salary NUMBER)
```
RETURNS NUMBER
LANGUAGE SQL
AS
$$
salary * 0.10
```sql
$$;
```
Use it:
```sql
SELECT calculate_bonus(50000);
```
Drop it:
```sql
DROP FUNCTION calculate_bonus(NUMBER);
```

## 16. User
```sql
CREATE USER john
```
```sql
PASSWORD = 'Password123';
```
```sql
-- Show users
```
```sql
SHOW USERS;
```
```sql
-- Drop
```
```sql
DROP USER john;
```

## 17. Role
```sql
CREATE ROLE analyst_role;
```
```sql
SHOW ROLES;
```
```sql
DROP ROLE analyst_role;
```

## 18. Grant Privileges
```sql
GRANT USAGE ON DATABASE my_db
```
```sql
TO ROLE analyst_role;
```
```sql
GRANT USAGE ON SCHEMA my_db.my_schema
```
```sql
TO ROLE analyst_role;
```
```sql
GRANT SELECT ON TABLE my_db.my_schema.employees
```
```sql
TO ROLE analyst_role;
```
Assign role to user:
```sql
GRANT ROLE analyst_role TO USER john;
```

## 19. Warehouse
```sql
-- Create
```
```sql
CREATE WAREHOUSE my_warehouse
```
```sql
WAREHOUSE_SIZE = 'XSMALL'
```
```sql
AUTO_SUSPEND = 60
```
```sql
AUTO_RESUME = TRUE;
```
```sql
-- Start
```
```sql
ALTER WAREHOUSE my_warehouse RESUME;
```
```sql
-- Suspend
```
```sql
ALTER WAREHOUSE my_warehouse SUSPEND;
```
```sql
-- Resize
```
```sql
ALTER WAREHOUSE my_warehouse
```
```sql
SET WAREHOUSE_SIZE = 'SMALL';
```
```sql
-- Drop
```
```sql
DROP WAREHOUSE my_warehouse;
```

## 20. Clone
```sql
-- Table clone
```
```sql
CREATE TABLE employees_clone
```
```sql
CLONE employees;
```
```sql
-- Schema clone
```
```sql
CREATE SCHEMA dev_schema
```
```sql
CLONE production_schema;
```
```sql
-- Database clone
```
```sql
CREATE DATABASE dev_db
```
```sql
CLONE production_db;
```

## 21. Time Travel
```sql
-- Query historical data
```
```sql
SELECT *
```
FROM employees
```sql
AT (OFFSET => -3600);
```
Recover dropped table:
```sql
UNDROP TABLE employees;
```

## 22. Data Share
```sql
-- Create share
```
```sql
CREATE SHARE employee_share;
```
```sql
-- Grant database
```
```sql
GRANT USAGE ON DATABASE my_db
```
```sql
TO SHARE employee_share;
```
```sql
-- Grant schema
```
```sql
GRANT USAGE ON SCHEMA my_db.my_schema
```
```sql
TO SHARE employee_share;
```
```sql
-- Grant table
```
```sql
GRANT SELECT ON TABLE my_db.my_schema.employees
```
```sql
TO SHARE employee_share;
```


# Part D — Snowflake Scenarios
# Snowflake Scenario and Troubleshooting Questions

## 1. CSV load failed
**Approach:** validate file format, delimiter/header settings, target schema, data types and malformed rows. Use validation/load-history facilities, choose an appropriate `ON_ERROR` behavior, quarantine bad input when required, and rerun safely.

## 2. Query is slow
1. Inspect query history.
2. Check execution plan/profile.
3. Check pruning/scanned data.
4. Review joins and filters.
5. Check warehouse sizing/concurrency.
6. Consider clustering only if justified.
7. Re-test.

## 3. Warehouse costs are high
Use auto-suspend/auto-resume, right-size warehouses, separate workloads, reduce unnecessary scans, monitor usage and avoid unnecessary multi-cluster/clustering configurations.

## 4. Many users queue queries
Determine whether concurrency is the bottleneck. Separate workloads and consider multi-cluster scaling when appropriate.

## 5. Someone accidentally drops a table
If within applicable Time Travel retention, use `UNDROP TABLE` or access the historical state. Understand the distinction between Time Travel and Fail-safe.

## 6. Need a test copy of production
Use zero-copy cloning where appropriate. The clone is logically independent while initially sharing storage structures.

## 7. Need historical dimension tracking
Use an SCD Type 2 design or dbt snapshot where that matches the requirements.

## 8. Need Python transformations without extracting data
Consider Snowpark so DataFrame-style Python logic can execute in the Snowflake environment.

## 9. Need fine-grained access
Use roles/privileges and, where required, masking and row-level security.

## 10. Need data sharing
Use Snowflake Data Sharing concepts and grant the minimum required objects/privileges.


# Part E — High-Value Data-Engineering Scenarios

### Scenario 1 — Snowflake query is slow
**Approach:** profile the query → inspect pruning/scanned data → check joins and filters → review warehouse size/concurrency → check caching → consider clustering only if justified by workload.

**Interview Point:** Query tuning starts with diagnosis.

### Scenario 2 — Snowflake cost suddenly increases
**Approach:** inspect warehouse/query usage → identify unexpected workloads → review warehouse size, auto-suspend, concurrency and repeated scans → isolate workloads where appropriate.

**Interview Point:** Cost is a workload-design problem as well as a warehouse-size problem.

### Scenario 3 — Semi-structured JSON arrives
**Approach:** land the raw data safely → validate structure → query/extract required fields → transform into curated relational structures where useful.

**Interview Point:** Snowflake can work with semi-structured data while still supporting relational analytical models.

### Scenario 4 — Need historical dimension changes
**Approach:** implement an SCD strategy, commonly Type 2 when full history is required, using deterministic keys/versioning/effective dates.

### Scenario 5 — Need secure analyst access
**Approach:** define roles based on job responsibilities, grant least privilege, protect sensitive columns with masking and apply row-level restrictions where required.

**Interview Point:** RBAC + data-level controls + auditing provide layered governance.
