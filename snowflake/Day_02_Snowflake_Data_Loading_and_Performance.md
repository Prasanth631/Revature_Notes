# Day 2: Snowflake Data Loading & Performance

![Snowflake](https://img.shields.io/badge/Snowflake-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

---

![Bulk Loading](https://img.shields.io/badge/Bulk_Data_Loading-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 1. Bulk Data Loading Techniques

### Definition
Bulk data loading in Snowflake refers to loading batches of historical or staged files from internal or external cloud storage into Snowflake tables using the `COPY INTO <table>` command. It uses Virtual Warehouse compute to parallelize file ingestion and load millions of records in seconds.

### Why it matters / Real-world use case
An e-commerce company receives hourly zip bundles of 100 compressed CSV sales files from point-of-sale terminals landing in an Amazon S3 bucket. A scheduled batch pipeline uses `COPY INTO sales_raw` to ingest all 100 files simultaneously into a staging table within 30 seconds.

### How it works
- Files land in external cloud storage (S3, Azure Blob, GCS) or internal Snowflake stages.
- A virtual warehouse allocates threads across warehouse nodes; each node core reads and ingests one file at a time in parallel.
- Snowflake maintains load metadata in the table's internal catalog for 64 days, preventing duplicate file reloads by default.

```text
[S3 / Azure Blob / GCS Stage]
  ├── file_01.csv.gz (Thread 1) ──┐
  ├── file_02.csv.gz (Thread 2) ──┼──> [Virtual Warehouse] ──> [Target Snowflake Table]
  └── file_03.csv.gz (Thread 3) ──┘
```

### Example

```sql
-- Bulk load gzipped CSV files from an external S3 stage into raw target table
COPY INTO retail_dw.raw_pos.sales_orders
FROM @retail_dw.stages.s3_sales_stage/orders/2026/03/
FILES = ('orders_part1.csv.gz', 'orders_part2.csv.gz')
FILE_FORMAT = (TYPE = 'CSV' FIELD_OPTIONALLY_ENCLOSED_BY = '"' SKIP_HEADER = 1)
ON_ERROR = 'CONTINUE'
PURGE = FALSE;
```

### Interview Q&A

**Q1: How does Snowflake prevent loading the same file twice using COPY INTO?**
**Answer:** Snowflake tracks loaded file names and their cryptographic checksums in the target table's metadata for 64 days. If a file was already loaded successfully, subsequent `COPY INTO` commands skip it unless `FORCE = TRUE` is specified.

**Q2: How do you achieve maximum parallelism during bulk data loading?**
**Answer:** Break large data files into multiple smaller compressed files sized between 100 MB and 250 MB. Because each compute thread loads one file independently, matching the number of files to the number of available cores maximizes parallel throughput.

**Q3: What is the difference between bulk loading with COPY INTO and continuous loading with Snowpipe?**
**Answer:** `COPY INTO` requires an active user-managed Virtual Warehouse and is designed for scheduled, high-volume batch loads. Snowpipe is a serverless, event-driven service designed for continuous micro-batch loading (within minutes of file landing) billed on serverless compute.

### Common Pitfalls / Gotchas
- Loading one massive 20 GB file instead of splitting it; a single file is processed by only one single core, leaving the rest of the warehouse idle.
- Using `FORCE = TRUE` inadvertently in production pipelines, which causes duplicate rows to load into the table.
- Forgetting that Snowflake transforms and recompresses data into columnar micro-partitions during loading, which consumes memory and CPU.

### Quick Recap
- `COPY INTO <table>` is the primary command for batch file ingestion.
- Automatically prevents duplicate loads for 64 days using file checksums.
- Parallelized across virtual warehouse cores; split files into 100–250 MB compressed chunks.
- Supports external stages (S3, ADLS, GCS) and internal stages.
- Specify `FORCE = TRUE` only when intentionally reloading identical files.

---

![File Formats](https://img.shields.io/badge/File_Formats-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 2. File Format Optimization

### Definition
File format optimization involves defining reusable database objects (`FILE_FORMAT`) that specify parsing, delimiter, and compression rules for structured (CSV) and semi-structured (JSON, Parquet, Avro, ORC) data. It ensures high parsing speed, minimal data skew, and automatic schema inference during ingestion.

### Why it matters / Real-world use case
A streaming analytics pipeline dumps hourly server telemetry in Apache Parquet format and clickstream events in raw JSON. Creating dedicated, pre-configured file format objects enables data engineers to query staged files directly (`SELECT $1 FROM @stage`) and load semi-structured variants into relational tables without re-specifying delimiter and compression flags in every pipeline.

### How it works
- **Named File Formats:** Enforce consistent parsing properties across development and production pipelines.
- **Semi-Structured Optimization:** Parquet, Avro, and ORC preserve embedded schema definitions and columnar stats, allowing Snowflake to load them directly into `VARIANT` columns or infer schemas dynamically.
- **Supported Formats:** CSV, JSON, Parquet, Avro, ORC, and XML.

| Format Type | Native Schema | Compression Support | Primary Data Engineering Use Case |
| :--- | :--- | :--- | :--- |
| **CSV** | No (text delimited) | GZIP, BZIP2, DEFLATE | Relational database exports, legacy ERP drops |
| **JSON** | No (self-describing) | GZIP, ZSTD | Web clickstream, REST API payloads, logs |
| **Parquet** | Yes (binary columnar) | SNAPPY, GZIP, ZSTD | Spark / Data Lake exports, high-volume batch |
| **Avro** | Yes (binary row-based) | DEFLATE, SNAPPY | Kafka event streams, schema-registry pipelines |
| **ORC** | Yes (binary columnar) | ZLIB, SNAPPY | Apache Hive / Hadoop historical migrations |

### Example

```sql
-- 1. Create optimized file format for compressed Parquet data
CREATE OR REPLACE FILE FORMAT retail_dw.raw_pos.parquet_format
    TYPE = 'PARQUET'
    COMPRESSION = 'SNAPPY';

-- 2. Query data in stage directly using file format BEFORE loading
SELECT
    $1:event_id::STRING       AS event_id,
    $1:event_timestamp::DATE  AS event_date,
    $1:user_id::NUMBER        AS user_id
FROM @retail_dw.stages.s3_sales_stage/parquet/
(FILE_FORMAT => 'retail_dw.raw_pos.parquet_format')
LIMIT 5;
```

### Interview Q&A

**Q1: Why is Parquet preferred over CSV and JSON for high-volume data loading?**
**Answer:** Parquet is a binary columnar format that stores data with built-in compression and an embedded dictionary schema. Snowflake parses Parquet significantly faster than raw text or JSON, requiring less CPU and allowing direct column extraction during load.

**Q2: How does Snowflake handle loading semi-structured data like JSON?**
**Answer:** Snowflake loads JSON into a native `VARIANT` column data type. Internally, the storage engine shreds repeated JSON elements into columnar micro-partitions, providing relational-level query speeds on semi-structured fields.

**Q3: Can Snowflake automatically infer table schemas from staged Parquet files?**
**Answer:** Yes. Snowflake provides the `INFER_SCHEMA` table function to automatically detect column names and data types from Parquet, Avro, or ORC files and generate corresponding `CREATE TABLE` DDL.

### Common Pitfalls / Gotchas
- Loading uncompressed raw CSV files across the cloud network; always compress text files with GZIP or ZSTD before staging.
- Mismatched date/timestamp formats in CSV parsing; explicitly configure `TIMESTAMP_FORMAT` and `DATE_FORMAT` inside the file format definition.
- Treating JSON as raw `VARCHAR`; storing JSON in a `VARIANT` column allows native path querying (`data:user.id`) and automatic columnar optimization.

### Quick Recap
- Named file formats standardize parsing parameters across pipelines.
- Supports CSV, JSON, Parquet, Avro, ORC, and XML.
- Parquet is the most CPU- and I/O-efficient format for bulk ingestion.
- Semi-structured data lands in native `VARIANT` columns.
- `INFER_SCHEMA` automatically creates tables matching Parquet/Avro schema headers.

---

![Staging](https://img.shields.io/badge/Staging_%26_Error_Handling-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 3. Staging Strategies and Error Handling

### Definition
Staging refers to configuring cloud storage locations (Internal or External Stages) where raw files land prior to loading. Error handling refers to parameters that govern how the `COPY INTO` command behaves when encountering corrupt rows, delimiter mismatches, or schema violations.

### Why it matters / Real-world use case
An automated ingestion job loads 50 vendor files every night. If file #42 has a corrupted string in an integer column, default behavior aborts the entire multi-file load. By configuring `ON_ERROR = 'CONTINUE'` and logging errors with `VALIDATION_MODE`, the pipeline loads all valid records and isolates bad rows for investigation.

### How it works
- **Internal Stages:** Storage managed by Snowflake (User `@~`, Table `@%`, or Named Stage `@stage`).
- **External Stages:** Points to external cloud buckets (AWS S3, Azure Blob, GCS) via Storage Integrations.
- **Error Modes:**
  - `ABORT_STATEMENT` (Default): Fails transaction if any single error occurs.
  - `CONTINUE`: Skips corrupted rows and loads all valid records.
  - `SKIP_FILE`: Skips only the file containing errors; loads remaining files.
  - `SKIP_FILE_<num>`: Skips file if error count exceeds number or percentage.

```text
Incoming Stage Files:
  ├── File 1 (100% clean) ───────────────> Loaded to Table
  ├── File 2 (Row 15 corrupted) ──────────> ON_ERROR = 'CONTINUE' -> Rows 1-14, 16+ Loaded
  │                                                                 -> Row 15 logged to ERROR_HISTORY
  └── File 3 (100% clean) ───────────────> Loaded to Table
```

### Example

```sql
-- 1. Create an external stage pointing to AWS S3 via Storage Integration
CREATE OR REPLACE STAGE retail_dw.stages.s3_landing_stage
    URL = 's3://company-bucket/landing/'
    STORAGE_INTEGRATION = s3_int
    FILE_FORMAT = (TYPE = 'CSV' SKIP_HEADER = 1);

-- 2. Dry-run validation: check for errors WITHOUT loading data
COPY INTO retail_dw.raw_pos.sales_orders
FROM @retail_dw.stages.s3_landing_stage
VALIDATION_MODE = 'RETURN_ERRORS';

-- 3. Robust production load skipping corrupt rows
COPY INTO retail_dw.raw_pos.sales_orders
FROM @retail_dw.stages.s3_landing_stage
ON_ERROR = 'CONTINUE';
```

### Interview Q&A

**Q1: What is the difference between an Internal Stage and an External Stage?**
**Answer:** Internal stages are cloud storage managed directly by Snowflake within your account (User, Table, or Named). External stages point directly to customer-owned cloud object storage (S3, Azure Blob, GCS) using secure Storage Integrations without storing cloud credentials in SQL.

**Q2: What is the purpose of the VALIDATION_MODE parameter in COPY INTO?**
**Answer:** `VALIDATION_MODE` instructs Snowflake to parse and validate staged files against the target table schema without writing data or consuming full table write compute. It returns errors (e.g., `RETURN_ERRORS` or `RETURN_ALL_ERRORS`) for pre-load validation.

**Q3: How can you inspect which rows failed during a COPY INTO operation that used ON_ERROR = 'CONTINUE'?**
**Answer:** Query the `VALIDATE()` table function passing the target table name and the relevant `job_id`, or query the `COPY_HISTORY()` view in `INFORMATION_SCHEMA`.

### Common Pitfalls / Gotchas
- Using Table Stages (`@%tablename`); table stages cannot be shared between multiple tables and cannot be dropped independently. Best practice is to always use Named Stages.
- Embedding hardcoded AWS access keys and secret keys in the stage definition; production environments should always use Cloud Storage Integrations with IAM roles.
- Setting `ON_ERROR = 'CONTINUE'` without setting up monitoring; silently skipping bad rows leads to missing business data.

### Quick Recap
- Stages represent landing zones: Internal (Snowflake-managed) or External (S3/ADLS/GCS).
- Always use Storage Integrations for external stages to eliminate plain-text credentials.
- `ON_ERROR` controls failure behavior: `ABORT_STATEMENT`, `CONTINUE`, or `SKIP_FILE`.
- `VALIDATION_MODE` parses files and returns errors without loading data.
- Review load exceptions using `VALIDATE()` or `COPY_HISTORY()`.

---

![Performance Tuning](https://img.shields.io/badge/Performance_Tuning-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 4. Performance Tuning for Large Datasets

### Definition
Performance tuning for data loading involves optimizing file sizing, thread concurrency, virtual warehouse sizing, and staging layouts to ingest massive data volumes (terabytes to petabytes) in minimum time with lowest credit cost.

### Why it matters / Real-world use case
A telecommunications provider needs to load 8 terabytes of network call logs every morning within a 45-minute SLA window. Sizing files to 150 MB compressed and scaling up to an X-Large warehouse provides 16 parallel nodes (128 cores), completing ingestion in 28 minutes at predictable credit expenditure.

### How it works
- **File Sizing Rule:** Aim for compressed files between **100 MB and 250 MB**. Snowflake allocates one core per file; 1,000 files of 150 MB load far faster than ten 15 GB files or 100,000 tiny 1 MB files.
- **Warehouse Sizing:** Scale up the warehouse during the batch window. Since Snowflake meters by the second, an X-Large warehouse (16 credits/hr) running for 15 minutes costs the exact same 4 credits as a Medium warehouse (4 credits/hr) running for 1 hour, but finishes 4x faster.
- **Path Partitioning:** Organize files in stages using date prefixes (`/year/month/day/`) to limit the directory list scan overhead during `COPY INTO`.

```text
Bad Ingestion:    [One 20 GB File]  ──> 1 Core Active (15 Cores Idle) ──> Severe Bottleneck
Optimal Ingestion:[100 x 200MB Files] ──> All Cores Active in Parallel ──> Maximum Throughput
```

### Example

```sql
-- Optimal bulk load: Target specific date folder with compressed files
COPY INTO retail_dw.raw_pos.network_logs
FROM @retail_dw.stages.s3_landing_stage/telecom/2026/03/01/
FILE_FORMAT = (TYPE = 'PARQUET')
PATTERN = '.*call_log_[0-9]+\\.parquet';
```

### Interview Q&A

**Q1: What is the optimal file size for loading data into Snowflake?**
**Answer:** The recommended compressed file size is 100 MB to 250 MB. This balances parallel thread execution across warehouse cores without incurring high file metadata management overhead.

**Q2: What is the "Small Files Problem" during data loading?**
**Answer:** Ingesting millions of tiny files (under 10 MB) causes excessive cloud storage API request overhead and Cloud Services metadata latency, resulting in underutilized compute threads and slow ingestion.

**Q3: How does warehouse sizing impact bulk data loading costs?**
**Answer:** Larger warehouses provide more parallel cores to load files faster. Because compute is billed per second, doubling the warehouse size to cut load time in half consumes roughly the identical number of credits while completing the job faster.

### Common Pitfalls / Gotchas
- Running `COPY INTO` without specifying a folder path prefix; forcing Snowflake to scan an entire S3 bucket with millions of files wastes Cloud Services credits.
- Using `ORDER BY` during data staging or loading, which forces data shuffling across nodes and degrades ingestion speed.
- Ingesting uncompressed files; raw text increases network transfer time and cloud storage egress costs.

### Quick Recap
- Optimal file size: 100 MB to 250 MB compressed.
- Organize stage paths by date/hour prefixes to accelerate file listing.
- Scale up the virtual warehouse to increase concurrent core count.
- Per-second billing makes larger warehouses cost-effective for batch loads.
- Avoid both the "single huge file" and "millions of tiny files" anti-patterns.

---

![Tables and Views](https://img.shields.io/badge/Tables_and_Views-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 5. Tables and Views Creation

### Definition
Snowflake provides distinct table types (Permanent, Transient, Temporary, External) and view types (Standard Views, Secure Views, Materialized Views) designed to balance data durability, storage cost, query latency, and data privacy.

### Why it matters / Real-world use case
In an ETL Medallion Architecture, raw staging tables are created as `TRANSIENT` to avoid Fail-safe cloud storage charges. Curated gold reporting marts use `PERMANENT` tables for full 90-day Time Travel and Fail-safe protection. Data shared with external vendors uses `SECURE VIEWS` to prevent unauthorized users from viewing the underlying SQL logic.

### How it works
- **Permanent Tables:** Default table type. Includes Time Travel (up to 90 days in Enterprise) and 7 days of Fail-safe disaster recovery.
- **Transient Tables:** Persist until explicitly dropped. Supports Time Travel (0 or 1 day), but has **NO Fail-safe**, eliminating secondary storage costs for intermediate ETL data.
- **Temporary Tables:** Visible only within the active session. Dropped automatically upon session logout. No Fail-safe.
- **Secure Views:** Prevents users from inspecting view definitions, subquery optimizations, or underlying data filters.
- **Materialized Views:** Pre-computes and stores query results physically. Maintained automatically by a serverless background service.

| Object Type | Persistence | Time Travel | Fail-Safe | Primary Use Case |
| :--- | :--- | :--- | :--- | :--- |
| **Permanent Table** | Indefinite | 0–90 Days | 7 Days | Production core dimensions, fact tables |
| **Transient Table** | Indefinite | 0–1 Day | None | Staging layers, intermediate transformation |
| **Temporary Table** | Session-only | 0–1 Day | None | Scratchpad processing, ad-hoc ETL scripts |
| **Standard View** | Logical only | N/A | N/A | Simplifying complex joins, abstraction |
| **Secure View** | Logical only | N/A | N/A | Multi-tenant data privacy, secure sharing |
| **Materialized View** | Physical result | N/A | N/A | Accelerating slow, repeated aggregate queries |

### Example

```sql
-- 1. Create a Transient table for ETL staging (Saves Fail-safe storage costs)
CREATE OR REPLACE TRANSIENT TABLE retail_dw.raw_pos.stg_orders (
    order_id NUMBER,
    customer_id NUMBER,
    order_amount NUMBER(10,2)
) DATA_RETENTION_TIME_IN_DAYS = 1;

-- 2. Create a Secure View masking sensitive customer PII
CREATE OR REPLACE SECURE VIEW retail_dw.raw_pos.v_customer_public AS
SELECT
    customer_id,
    city,
    country
FROM retail_dw.raw_pos.dim_customers;
```

### Interview Q&A

**Q1: What is the key difference between a Permanent Table and a Transient Table?**
**Answer:** Permanent tables include both Time Travel (up to 90 days) and 7 days of Fail-safe disaster recovery. Transient tables support at most 1 day of Time Travel and have **no Fail-safe**, making them ideal for intermediate ETL staging tables to avoid storage costs.

**Q2: What is a Secure View and when should you use it?**
**Answer:** A Secure View hides the underlying SQL query definition and query execution plan optimizations from unauthorized users. It is essential when enforcing row-level security or sharing data with third parties to prevent data exposure via query profile inspection.

**Q3: How are Materialized Views maintained in Snowflake?**
**Answer:** Materialized views are automatically maintained by a background serverless Snowflake process whenever underlying table data changes. Users do not run manual refresh scripts, but consume serverless credits for maintenance.

### Common Pitfalls / Gotchas
- Using Permanent tables for temporary staging tables, resulting in unnecessary storage billing for 7 days of Fail-safe data after tables are dropped.
- Overusing Materialized Views on tables with high write frequency; background maintenance costs can exceed the performance benefits.
- Using Standard Views for sensitive multi-tenant data; users can reverse-engineer filtered data through query profile execution statistics.

### Quick Recap
- Permanent tables provide full Time Travel (0–90 days) and 7 days of Fail-safe.
- Transient tables have zero Fail-safe, reducing storage costs for staging layers.
- Temporary tables exist only during the current session.
- Secure Views protect underlying business logic and sensitive filter conditions.
- Materialized Views store precomputed query results and are maintained serverless.

---

## Day Summary Table

| Topic | One-line takeaway | Interview likelihood |
| :--- | :--- | :---: |
| **Bulk Data Loading** | Batch ingestion using `COPY INTO` parallelized across warehouse cores with 64-day duplicate prevention. | High |
| **File Format Optimization** | Pre-configured parsing objects; compressed Parquet delivers maximum throughput and native schema support. | High |
| **Staging & Error Handling** | External stages isolate cloud storage; `ON_ERROR` and `VALIDATION_MODE` control pipeline fault tolerance. | High |
| **Performance Tuning** | Split files to 100–250 MB compressed chunks; scale up warehouses for fast, cost-neutral batch ingestion. | High |
| **Tables and Views** | Use Transient tables for staging to avoid Fail-safe costs; use Secure Views for data privacy and sharing. | High |
