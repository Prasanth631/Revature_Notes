# Day 6: Snowpark & dbt (Data Build Tool)

![Snowpark](https://img.shields.io/badge/Snowpark_%26_dbt-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

---

![Stored Procedures](https://img.shields.io/badge/Stored_Procedures-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 1. Python & SQL Stored Procedures

### Definition
A Stored Procedure in Snowflake is an executable database object written in SQL Scripting, Python, JavaScript, Java, or Scala that performs procedural administrative tasks, data transformations, multi-statement transactions, and control-flow operations (`IF/ELSE`, `LOOPS`).

### Why it matters / Real-world use case
An enterprise data pipeline requires a nightly partition maintenance routine: checking row counts, dropping tables older than 90 days, dynamically creating new monthly schemas, and committing the transaction. Stored Procedures execute these procedural DDL and administrative steps sequentially within a single secure session.

### How it works
- **Execution:** Invoked explicitly using the `CALL` statement (e.g., `CALL my_procedure()`).
- **Caller's vs Owner's Rights:**
  - `EXECUTE AS OWNER` (Default): Runs with the privileges of the procedure creator, allowing restricted users to perform administrative tasks without granting table-level grants.
  - `EXECUTE AS CALLER`: Runs with the privileges of the executing user.
- **Control Flow:** Implements loops, try/catch exception handling, dynamic SQL statement construction, and multi-table transactions.

```text
[Orchestrator / Airflow / Task] ──> CALL run_nightly_etl()
                                          |
                                          v
+-------------------------------------------------------------+
| Stored Procedure: Executes as OWNER                         |
|  1. BEGIN TRANSACTION                                       |
|  2. Dynamic DDL: CREATE TABLE IF NOT EXISTS ...             |
|  3. INSERT / MERGE business transformations                 |
|  4. COMMIT or ROLLBACK on EXCEPTION                         |
+-------------------------------------------------------------+
```

### Example

```sql
-- Stored Procedure using Snowflake SQL Scripting
CREATE OR REPLACE PROCEDURE retail_dw.raw_pos.archive_old_orders(retention_days INT)
RETURNS STRING
LANGUAGE SQL
EXECUTE AS CALLER
AS
$$
DECLARE
    deleted_count INT DEFAULT 0;
BEGIN
    DELETE FROM retail_dw.raw_pos.customer_orders
    WHERE order_date < DATEADD('day', -retention_days, CURRENT_DATE());
    
    deleted_count := SQLROWCOUNT;
    RETURN 'Successfully archived ' || deleted_count || ' order records.';
EXCEPTION
    WHEN OTHER THEN
        RETURN 'Error executing archive procedure: ' || SQLERRM;
END;
$$;

-- Invoke procedure
CALL retail_dw.raw_pos.archive_old_orders(90);
```

### Interview Q&A

**Q1: What is the core difference between a Stored Procedure and a User-Defined Function (UDF)?**
**Answer:** A UDF calculates and returns a scalar value or table and is called directly within a SQL query (`SELECT my_udf(col) FROM table`). A Stored Procedure performs procedural operations (DDL, transaction control, error handling), returns an optional status message, and is invoked using `CALL my_proc()`.

**Q2: What is the difference between EXECUTE AS CALLER and EXECUTE AS OWNER?**
**Answer:** `EXECUTE AS CALLER` runs with the active privileges and session context of the user invoking the procedure. `EXECUTE AS OWNER` runs with the privileges of the role that owns the procedure, allowing developers to grant users permission to run a specific workflow without giving them direct access to underlying tables.

**Q3: Can a Stored Procedure execute dynamic SQL strings in Snowflake?**
**Answer:** Yes. Stored Procedures can construct SQL strings dynamically at runtime and execute them using the `EXECUTE IMMEDIATE` statement.

### Common Pitfalls / Gotchas
- Trying to call a Stored Procedure inside a `SELECT` statement (`SELECT my_procedure() FROM table`); procedures must be called standalone with `CALL`.
- Writing procedures with `EXECUTE AS CALLER` and forgetting that the caller must have explicit grants on all underlying objects accessed by the script.
- Forgetting to handle exceptions in multi-step procedures, causing partial data commits when an intermediate step fails.

### Quick Recap
- Stored Procedures perform procedural logic, administrative tasks, and dynamic SQL.
- Invoked standalone using `CALL procedure_name(args)`.
- Support SQL Scripting, Python, JavaScript, Java, and Scala.
- Security modes: `EXECUTE AS OWNER` (privileged) vs `EXECUTE AS CALLER`.
- Capable of managing multi-statement ACID transactions and exception blocks.

---

![Snowpark Python](https://img.shields.io/badge/Snowpark_for_Python-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 2. Snowpark for Python & DataFrame Operations

### Definition
Snowpark is a developer framework and set of native libraries (Python, Scala, Java) that allows engineers to query and transform Snowflake data using expressive DataFrame APIs, executing all processing directly inside Snowflake Virtual Warehouses without transferring data to external client servers.

### Why it matters / Real-world use case
Data science teams build machine learning feature pipelines using Python DataFrames. Previously, they had to extract terabytes of data over JDBC to external Apache Spark or Python servers. With Snowpark, data scientists write native Python code in Jupyter notebooks, and Snowflake translates the DataFrame operations into optimized SQL that executes entirely on Snowflake's distributed warehouse nodes.

### How it works
- **Lazy Evaluation:** Like PySpark, Snowpark DataFrame transformations (`filter`, `select`, `join`, `groupBy`) are evaluated lazily. Execution occurs only when an action (`collect()`, `show()`, `to_pandas()`) is called.
- **SQL Translation:** Snowpark transpiles Python DataFrame logic into native, highly optimized Snowflake SQL executed on the assigned Virtual Warehouse.
- **Anaconda Integration:** Runs inside secure Python sandbox runtimes on warehouse compute nodes with pre-installed enterprise packages (`pandas`, `scipy`, `scikit-learn`).

```text
[Python Client / Jupyter / dbt-python]
   df = session.table("orders").filter(col("amount") > 100).groupBy("country").count()
                                   |
                                   v  (Transpiled to Optimized SQL)
             [SELECT country, COUNT(*) FROM orders WHERE amount > 100 GROUP BY country]
                                   |
                                   v
             [Snowflake Virtual Warehouse (Zero Client Data Transfer)]
```

### Example

```python
# Snowpark Python script executing within Snowflake
from snowflake.snowpark import Session
from snowflake.snowpark.functions import col, sum as _sum, round as _round

# Establish connection
connection_parameters = {
    "account": "xy12345",
    "user": "etl_developer",
    "password": "SecretPassword123",
    "role": "SYSADMIN",
    "warehouse": "INGEST_WH",
    "database": "RETAIL_DW",
    "schema": "RAW_POS"
}
session = Session.builder.configs(connection_parameters).create()

# Read table into Snowpark DataFrame
orders_df = session.table("customer_orders")

# DataFrame transformations (evaluated lazily)
metrics_df = (
    orders_df.filter(col("order_date") >= "2026-03-01")
    .group_by("store_country")
    .agg(_round(_sum("order_amount"), 2).alias("total_sales"))
    .order_by(col("total_sales").desc())
)

# Action: write results directly to a new curated table inside Snowflake
metrics_df.write.mode("overwrite").save_as_table("curated_country_sales")
```

### Interview Q&A

**Q1: How does Snowpark differ from traditional PySpark?**
**Answer:** PySpark executes on dedicated Spark clusters (driver and worker nodes), requiring separate cluster management and transferring data over the network. Snowpark translates Python DataFrame operations directly into native Snowflake SQL, executing entirely inside Snowflake's managed Virtual Warehouses with zero external compute cluster management.

**Q2: What is lazy evaluation in Snowpark DataFrames?**
**Answer:** Transformations (like `filter`, `select`, and `join`) do not execute immediately; they build an internal abstract syntax tree (AST). Execution is triggered only when an action (such as `collect()`, `show()`, or `save_as_table()`) is invoked, allowing Snowflake to optimize the complete query plan.

**Q3: How does Snowpark access third-party Python libraries like Pandas or Scikit-Learn?**
**Answer:** Snowflake has built-in integration with Anaconda. Standard packages are pre-installed in the secure server-side execution environment, and developers can specify dependencies via `session.add_packages(['pandas', 'scikit-learn'])`.

### Common Pitfalls / Gotchas
- Calling `.to_pandas()` on massive multi-terabyte DataFrames; this pulls all rows over the network into the single-node driver memory, causing out-of-memory crashes.
- Treating Snowpark as a remote Python interpreter; non-DataFrame Python loops execute locally on the client machine instead of on the warehouse unless wrapped in a UDF or Stored Procedure.
- Forgetting that Snowpark operations consume Snowflake virtual warehouse credits.

### Quick Recap
- Write data transformations in Python, Java, or Scala using DataFrame syntax.
- Operations execute inside Snowflake Virtual Warehouses with zero client data egress.
- Features lazy evaluation and translates DataFrame methods into optimized SQL.
- Native Anaconda integration provides pre-installed Python data science libraries.
- Avoid `.to_pandas()` or `.collect()` on large datasets to prevent driver memory errors.

---

![Snowpark vs Traditional](https://img.shields.io/badge/Snowpark_vs_Traditional-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 3. Snowpark vs Traditional Approaches

### Definition
Snowpark represents an architectural shift from traditional big data processing architectures (extracting data to separate Spark/Hadoop clusters) to **in-database compute**, executing Python, Scala, and Java logic directly within the governed data cloud engine.

### Why it matters / Real-world use case
An enterprise was paying $20,000/month for a 10-node AWS EMR (Spark) cluster to transform Snowflake data for ML models. Network egress fees and JDBC bottlenecks added 45 minutes of latency. By migrating the pipelines to Snowpark, they eliminated the EMR cluster completely, ran transformations in-database, and cut pipeline runtime by 60%.

### How it works
- **Traditional Spark Pattern:** Extract data from storage/warehouse over network -> Load into external Spark cluster memory -> Process in Spark -> Write back over network to warehouse.
- **Snowpark In-Database Pattern:** Python code compiles to SQL -> Warehouse executes directly against storage micro-partitions in-place -> Zero data leaves Snowflake boundary.

| Dimension | Traditional PySpark / EMR / Databricks | Snowpark for Python |
| :--- | :--- | :--- |
| **Architecture** | Separate compute cluster external to database | Native execution inside Snowflake Virtual Warehouses |
| **Data Movement** | Massive network transfer (Data egress & ingress) | **Zero data movement**; processed in-place |
| **Infrastructure** | Manage Spark clusters, JVM tuning, drivers, workers | Managed Virtual Warehouses with auto-suspend |
| **Security & RBAC** | Manage separate IAM roles, cluster access, credentials | Native Snowflake Role-Based Access Control (RBAC) |
| **Cost Model** | Pay for Spark VMs + storage egress + warehouse credits | Pay only for active Snowflake warehouse credits |

### Interview Q&A

**Q1: Why are enterprises migrating workloads from PySpark to Snowpark?**
**Answer:** Snowpark eliminates the complexity of managing separate Spark clusters, removes network latency and cloud data transfer egress fees, and unifies security under Snowflake's native governance and RBAC framework while allowing developers to write familiar Python code.

**Q2: In what scenario would you still choose traditional Spark over Snowpark?**
**Answer:** Traditional Spark is preferred for processing data that does not reside in Snowflake (e.g., massive multi-petabyte raw data lake file wrangling on S3), real-time streaming with Kafka and Spark Streaming, or specialized open-source graph/ML engines not supported in Snowflake runtimes.

### Common Pitfalls / Gotchas
- Assuming Snowpark is a Spark drop-in replacement; while the DataFrame API is very similar, internal distributed RDD and shuffle mechanics do not exist in Snowpark.
- Migrating row-by-row Python loops to Snowpark without vectorizing them, leading to slow performance.

### Quick Recap
- Eliminates external Spark cluster infrastructure and maintenance overhead.
- Zero network data egress fees: data is processed directly inside Snowflake storage.
- Governed entirely by Snowflake native security, masking policies, and RBAC.
- Unifies SQL developers and Python data engineers on the same compute engine.

---

![DBT Fundamentals](https://img.shields.io/badge/dbt_Fundamentals-FF694B?style=for-the-badge&logo=dbt&logoColor=white)

## 4. dbt Fundamentals & Project Structure

### Definition
dbt (Data Build Tool) is an open-source data transformation framework that enables data engineers to develop, test, document, and version-control modular SQL and Python transformation pipelines inside the data warehouse using software engineering best practices.

### Why it matters / Real-world use case
An enterprise data warehouse has 300 ad-hoc SQL stored procedures running on cron jobs without version control or automated testing. When an upstream column name changes, reports break silently. Implementing dbt organizes code into version-controlled Git models, builds lineage dependency graphs (DAGs) automatically, and halts pipelines immediately when schema tests fail.

### How it works
- **ELT Paradigm:** dbt does **T** (Transformation) only. Raw data is already loaded into Snowflake; dbt issues compiled `CREATE TABLE AS SELECT` or `CREATE VIEW AS SELECT` DDLs to Snowflake.
- **Core Project Structure:**
  - `dbt_project.yml`: Master configuration file.
  - `models/`: SQL select statements defining transformations.
  - `sources.yml`: Declares raw tables loaded by ingestion tools (Fivetran, Airbyte, Kafka).
  - `seeds/`: Static CSV files (e.g., country codes, zip lookup tables) loaded via `dbt seed`.
  - `tests/`: Data quality tests (unique, not_null, accepted_values, relationships).

```text
dbt Project Directory:
├── dbt_project.yml          --> Global project configuration
├── packages.yml             --> External dependencies (dbt-utils)
├── models/
│   ├── staging/
│   │   ├── sources.yml      --> Raw landing table references
│   │   └── stg_orders.sql   --> Cleaned view / staging model
│   └── marts/
│       └── fct_sales.sql    --> Curated business fact table
└── seeds/
    └── country_codes.csv    --> Static reference data
```

### Example

```yaml
# models/staging/sources.yml
version: 2

sources:
  - name: pos_landing
    database: retail_dw
    schema: raw_pos
    tables:
      - name: customer_orders
        description: "Raw order transactions from POS terminals"
        columns:
          - name: order_id
            tests:
              - unique
              - not_null
```

```sql
-- models/staging/stg_orders.sql
WITH source_data AS (
    SELECT * FROM {{ source('pos_landing', 'customer_orders') }}
)
SELECT
    order_id,
    customer_id,
    order_date::DATE AS order_date,
    ROUND(order_amount, 2) AS order_amount
FROM source_data;
```

### Interview Q&A

**Q1: Does dbt extract or load data into Snowflake?**
**Answer:** No. dbt strictly handles the **T** (Transformation) in ELT. It assumes data is already loaded into Snowflake by an ingestion tool (e.g., Fivetran, Snowpipe, Airflow) and compiles SQL SELECT statements to build conformed tables and views inside the warehouse.

**Q2: What is the purpose of the {{ source() }} and {{ ref() }} functions in dbt?**
**Answer:** `{{ source() }}` links a model to raw source tables declared in YAML, tracking upstream lineage. `{{ ref() }}` references other dbt models in the project, automatically constructing the Directed Acyclic Graph (DAG) and ensuring models run in correct dependency order.

**Q3: What are dbt seeds and when should they be used?**
**Answer:** dbt seeds are static CSV files stored in the `seeds/` folder and loaded into Snowflake tables using the `dbt seed` command. They are intended for small, static lookup tables (e.g., postal codes, state mappings), never for frequently updated transactional data.

### Common Pitfalls / Gotchas
- Hardcoding database and schema names in model SQL instead of using `{{ ref('model_name') }}`; hardcoding breaks dbt's dependency DAG and prevents deployment across dev/staging/prod environments.
- Using `dbt seed` to load large datasets (> 100 MB); seeds are intended only for small reference lookup files.
- Omitting documentation and column descriptions in YAML files, negating dbt's automated lineage and catalog generation capabilities.

### Quick Recap
- Open-source framework for in-database transformation (ELT).
- Code is written as standard `SELECT` queries with Jinja templating.
- `{{ ref() }}` automatically builds model dependency graphs (DAGs).
- `sources` declare raw ingestion tables; `seeds` load static lookup CSVs.
- Native integration with Git version control and CI/CD pipelines.

---

![DBT Models](https://img.shields.io/badge/dbt_Models_%26_Testing-FF694B?style=for-the-badge&logo=dbt&logoColor=white)

## 5. Models, Materializations Strategies & Testing

### Definition
A dbt Model is a single SQL file containing a `SELECT` statement that transforms data. Materialization strategies define how that model persists physically in Snowflake (View, Table, Incremental, or Ephemeral). Testing verifies data integrity and schema contracts across the pipeline.

### Why it matters / Real-world use case
A daily order reporting table contains 1 billion rows. Rebuilding the entire table from scratch daily with `materialized='table'` takes 90 minutes and consumes 24 credits. Converting the model to `materialized='incremental'` processes only the last 24 hours of new or updated records, finishing in 3 minutes and saving thousands of dollars in annual compute costs.

### How it works
- **Materialization Types:**
  - `view` (Default): Built as a standard logical view (`CREATE VIEW AS SELECT`). Zero storage cost; runs on read.
  - `table`: Drops and rebuilds a physical table from scratch on every run.
  - `incremental`: Appends or merges only new/updated records since the last dbt execution.
  - `ephemeral`: Temporary CTE injected directly into downstream models; no physical object created in Snowflake.
- **Testing Framework:**
  - **Generic Tests:** Built-in validation (`unique`, `not_null`, `accepted_values`, `relationships`).
  - **Singular Tests:** Custom SQL queries in the `tests/` folder; test passes if query returns 0 rows.

```text
dbt Model (orders.sql)
       |
       v  dbt run
[Materialization Strategy]
  ├── 'view'        ──> CREATE OR REPLACE VIEW ...
  ├── 'table'       ──> CREATE OR REPLACE TABLE ... (Full Drop & Rebuild)
  └── 'incremental' ──> MERGE INTO target USING (SELECT ... WHERE update_time > max_time)
```

### Example

```sql
-- models/marts/fct_orders.sql
{{ config(
    materialized='incremental',
    unique_key='order_id',
    incremental_strategy='merge'
) }}

SELECT
    order_id,
    customer_id,
    order_date,
    order_amount,
    last_updated_at
FROM {{ ref('stg_orders') }}

{% if is_incremental() %}
    -- Filter only records modified since the latest record in target table
    WHERE last_updated_at > (SELECT MAX(last_updated_at) FROM {{ this }})
{% endif %}
```

```yaml
# Schema testing configuration in models/marts/schema.yml
version: 2

models:
  - name: fct_orders
    columns:
      - name: order_id
        tests:
          - unique
          - not_null
      - name: order_amount
        tests:
          - not_null
```

### Interview Q&A

**Q1: What are the four core materialization strategies in dbt?**
**Answer:** `view` (creates a standard Snowflake view), `table` (recreates a physical table from scratch on every run), `incremental` (inserts or updates only new/modified rows), and `ephemeral` (interpolates SQL as a Common Table Expression into downstream models without creating any database object).

**Q2: How does an incremental model determine which records to process?**
**Answer:** By using the `is_incremental()` macro. On subsequent runs, dbt compiles the code inside `{% if is_incremental() %}` to filter only rows with an update timestamp greater than the maximum timestamp currently existing in the target table (`{{ this }}`).

**Q3: What are the four built-in generic tests in dbt?**
**Answer:** `unique` (ensures no duplicate values), `not_null` (ensures column has no NULLs), `accepted_values` (validates column matches a specific list of values), and `relationships` (enforces referential integrity / foreign key relationships between tables).

### Common Pitfalls / Gotchas
- Running an incremental model without specifying a `unique_key`; this causes duplicate rows to be appended on every run instead of executing an update/merge.
- Rebuilding multi-million row models with `materialized='table'` on frequent hourly schedules, incurring massive compute costs.
- Neglecting to run `dbt test` in production CI/CD pipelines before deploying code changes.

### Quick Recap
- Models are defined as clean SQL `SELECT` queries.
- Materializations: `view`, `table`, `incremental`, and `ephemeral`.
- Incremental models process delta changes via `is_incremental()` and `unique_key`.
- Generic tests validate data contracts (`unique`, `not_null`, `accepted_values`, `relationships`).
- Run models using `dbt run` and execute tests using `dbt test`.

---

## Day Summary Table

| Topic | One-line takeaway | Interview likelihood |
| :--- | :--- | :---: |
| **Stored Procedures** | Procedural logic, DDL, and transaction control invoked via `CALL` with caller or owner rights. | High |
| **Snowpark for Python** | In-database Python DataFrame transformations compiled to SQL with zero client data transfer. | High |
| **Snowpark vs Spark** | Eliminates external Spark cluster infrastructure and egress costs by running compute in Snowflake. | High |
| **dbt Fundamentals** | In-database ELT transformation tool managing modular SQL, dependency DAGs, and Git version control. | High |
| **Models & Materializations** | Persistent strategies (`view`, `table`, `incremental`, `ephemeral`) and automated schema testing. | High |
