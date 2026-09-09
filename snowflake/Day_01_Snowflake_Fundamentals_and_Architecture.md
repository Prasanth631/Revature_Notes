# Day 1: Snowflake Fundamentals & Architecture

![Snowflake](https://img.shields.io/badge/Snowflake-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

---

![Snowflake Setup](https://img.shields.io/badge/Snowflake_Setup-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 1. Snowflake Introduction & Setup

### Definition
Snowflake is a fully managed cloud Data Platform delivered as Software-as-a-Service (SaaS) on AWS, Azure, or GCP. It completely separates compute from storage, enabling independent scaling, zero maintenance overhead, and pay-as-you-go per-second billing.

### Why it matters / Real-world use case
A retail company ingests millions of point-of-sale transactions and mobile JSON clickstream records daily. Rather than provisioning servers, partitioning physical disks, and rebuilding database indexes, data engineers ingest raw data directly into Snowflake and immediately query it using standard ANSI SQL.

### How it works
- **SaaS Delivery:** Snowflake manages all hardware, operating systems, patches, encryption, and database kernel tuning.
- **Role-Based Provisioning:** Account administrators define role hierarchies (`ACCOUNTADMIN` -> `SYSADMIN` / `USERADMIN`) to separate data access from infrastructure administration.
- **Resource Allocation:** Databases hold structured and semi-structured data; independent compute clusters execute queries.

```text
[Client / Snowsight / Python] 
           |
           v
  [Cloud Services Layer]  --> Authenticates via RBAC (SYSADMIN, USERADMIN)
           |
           v
  [Virtual Warehouse]     --> Executes queries against Databases & Schemas
```

### Example

```sql
-- Create core database, schema, and an auto-suspending virtual warehouse
CREATE DATABASE IF NOT EXISTS retail_dw;
CREATE SCHEMA IF NOT EXISTS retail_dw.raw_pos;

CREATE WAREHOUSE IF NOT EXISTS ingest_wh WITH
    WAREHOUSE_SIZE = 'XSMALL'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE
    COMMENT = 'Dedicated compute for ingestion with 60s idle shutdown';

-- Validate session context
SELECT
    CURRENT_ROLE()      AS current_role,
    CURRENT_WAREHOUSE() AS current_warehouse,
    CURRENT_DATABASE()  AS current_database,
    CURRENT_SCHEMA()    AS current_schema;
```

### Interview Q&A

**Q1: What does it mean that Snowflake is a pure SaaS platform?**
**Answer:** Snowflake completely manages the underlying cloud infrastructure, operating systems, storage provisioning, security patches, and database tuning. The customer only manages their data, security roles, and SQL code.

**Q2: Can Snowflake be hosted on an on-premises private cloud?**
**Answer:** No. Snowflake is cloud-native and runs exclusively on public cloud hyperscalers: Amazon Web Services (AWS), Microsoft Azure, and Google Cloud Platform (GCP).

**Q3: Which role should be used to create databases and virtual warehouses?**
**Answer:** `SYSADMIN`. `ACCOUNTADMIN` is reserved for billing and account-level security; standard administrative objects should be owned by `SYSADMIN` to enforce separation of duties.

### Common Pitfalls / Gotchas
- Running daily ingestion pipelines using `ACCOUNTADMIN`, which introduces significant security risks and violates the principle of least privilege.
- Forgetting to set `AUTO_SUSPEND` on newly created virtual warehouses, causing compute nodes to idle continuously and drain billing credits.
- Double-quoting object names (`"my_table"`), which forces case-sensitive identifier matching instead of Snowflake's default uppercase resolution.

### Quick Recap
- Fully managed SaaS running exclusively on AWS, Azure, and GCP.
- Compute is completely decoupled from storage for independent scalability and billing.
- Zero infrastructure maintenance: no hardware provisioning, OS patching, or index tuning.
- Always configure `AUTO_SUSPEND` and `AUTO_RESUME` on compute warehouses.
- Use `SYSADMIN` for database objects and `USERADMIN` for user and role management.

---

![Architecture](https://img.shields.io/badge/Snowflake_Architecture-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 2. Architecture Overview

### Definition
Snowflake features a patented 3-tier Multi-Cluster Shared Data Architecture that logically and physically decouples Database Storage, Compute (Query Processing), and Cloud Services. This design eliminates resource contention between concurrent workloads and allows storage and compute to scale independently.

### Why it matters / Real-world use case
At month-end, the corporate finance team runs heavy aggregation queries on a 2X-Large warehouse, while the data engineering team runs hourly batch ingestion on an X-Small warehouse against the exact same tables. Because compute is isolated from storage, neither team experiences resource contention, locks, or query slowdowns.

### How it works
- **Cloud Services Layer:** The coordinator. Manages authentication, access control, query parsing, compilation, optimization, metadata tracking, and ACID transactions.
- **Compute Layer (Query Processing):** Stateless Virtual Warehouses composed of MPP nodes that execute SQL queries and cache data on local SSDs.
- **Database Storage Layer:** Cloud object storage (S3, Azure Blob, GCS) holding encrypted, compressed, columnar immutable micro-partitions.

```text
+-------------------------------------------------------------+
| 1. Cloud Services: Security, Metadata, Optimizer, ACID      |
+-------------------------------------------------------------+
                              |
       +----------------------+----------------------+
       |                                             |
+---------------+                             +---------------+
| 2. Compute:   |                             | 2. Compute:   |
| ETL_WH (Size: L)                            | BI_WH (Size: M)
+---------------+                             +---------------+
       |                                             |
+-------------------------------------------------------------+
| 3. Storage: S3 / Azure Blob / GCS (Immutable Micro-Partitions)|
+-------------------------------------------------------------+
```

### Example

```sql
-- Metadata-only query: resolves in Cloud Services at ZERO compute credit cost
-- Works even if all Virtual Warehouses in the account are SUSPENDED
SELECT
    COUNT(*)            AS total_orders,
    MIN(order_date)     AS first_order,
    MAX(order_date)     AS latest_order
FROM retail_dw.raw_pos.customer_orders;
```

### Interview Q&A

**Q1: What are the three layers of Snowflake architecture and their functions?**
**Answer:** The Cloud Services layer acts as the brain managing authentication, metadata, and optimization. The Compute layer executes queries via stateless Virtual Warehouses. The Storage layer permanently stores data in cloud object storage as immutable micro-partitions.

**Q2: How does Snowflake handle concurrency without table locking?**
**Answer:** Snowflake uses multi-version concurrency control (MVCC) and snapshot isolation coordinated by the Cloud Services layer. Because storage micro-partitions are immutable, reads and writes never block each other.

**Q3: Does a query always require an active Virtual Warehouse to return results?**
**Answer:** No. Queries that can be answered entirely from metadata (e.g., `COUNT(*)`, `MIN()`, `MAX()`) or from the 24-hour persisted query result cache execute in Cloud Services at zero warehouse compute cost.

### Common Pitfalls / Gotchas
- Believing that Virtual Warehouses store persistent table data. Warehouses are stateless; dropping a warehouse never deletes data.
- Assuming Snowflake is a shared-nothing system like Redshift. Snowflake is a shared-data architecture with independent compute clusters sharing centralized storage.
- Over-provisioning warehouse sizes for queries that only retrieve table metadata.

### Quick Recap
- Three independent layers: Cloud Services, Compute (Query Processing), and Storage.
- Complete workload isolation: batch ETL and ad-hoc BI never compete for compute resources.
- Storage resides in cloud object storage; compute nodes are stateless and disposable.
- Metadata-only queries execute in Cloud Services without waking up a warehouse.
- Snapshot isolation and MVCC ensure reads never block writes.

---

![Virtual Warehouses](https://img.shields.io/badge/Virtual_Warehouses-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 3. Virtual Warehouses

### Definition
A Virtual Warehouse is an independent cluster of compute resources (CPU, RAM, and local SSD storage) used to execute SQL queries, DML operations, and data loading tasks. Warehouses provide elastic processing power decoupled from storage, enabling fine-grained cost governance.

### Why it matters / Real-world use case
An enterprise runs a nightly dbt transformation job that processes 500 million rows. By resizing the warehouse from Small to X-Large before starting, the job finishes in 12 minutes instead of 3 hours. The warehouse suspends immediately upon completion, keeping total credit spend nearly identical while meeting business SLAs.

### How it works
- **T-Shirt Sizing:** Sizes range from X-Small (1 node, 1 credit/hr) to 6X-Large (512 nodes, 512 credits/hr), doubling in power and cost per step.
- **Scale-Up (Vertical):** Increases node size to speed up a single large, complex, join-heavy query.
- **Scale-Out (Horizontal):** Adds multiple clusters (Multi-Cluster Warehouse) to eliminate query queuing during peak concurrent user access.
- **Per-Second Metering:** Billed per second with a 60-second minimum charge upon resuming.

```text
Scale-Up (Vertical):     [Node] --> [Node][Node][Node][Node]   (Speeds up 1 heavy query)
Scale-Out (Horizontal):  [Cluster 1] + [Cluster 2] + [Cluster 3] (Handles 100s of users)
```

### Example

```sql
-- 1. Create a Multi-Cluster auto-scaling warehouse for BI reporting
CREATE WAREHOUSE IF NOT EXISTS bi_reporting_wh WITH
    WAREHOUSE_SIZE = 'MEDIUM'
    MIN_CLUSTER_COUNT = 1
    MAX_CLUSTER_COUNT = 4
    SCALING_POLICY = 'STANDARD'
    AUTO_SUSPEND = 120
    AUTO_RESUME = TRUE;

-- 2. Scale up vertically on demand for heavy processing
ALTER WAREHOUSE bi_reporting_wh SET WAREHOUSE_SIZE = 'LARGE';

-- 3. Suspend immediately when batch workload completes
ALTER WAREHOUSE bi_reporting_wh SUSPEND;
```

### Interview Q&A

**Q1: What is the difference between Scale-Up and Scale-Out in Snowflake?**
**Answer:** Scale-Up increases the T-shirt size (more CPU/RAM per node) to execute a single complex query faster. Scale-Out adds additional clusters of the same size to serve many concurrent users and eliminate query queuing.

**Q2: What happens to currently executing queries when you resize a warehouse?**
**Answer:** Running queries continue executing on the original cluster size without interruption. All queries submitted after the resize command executes run on the new warehouse size.

**Q3: What is the difference between STANDARD and ECONOMY scaling policies?**
**Answer:** `STANDARD` prioritizes query latency and spins up an additional cluster immediately when queuing occurs. `ECONOMY` prioritizes cost savings and only spins up a cluster if it estimates sustained queuing for at least 6 minutes.

### Common Pitfalls / Gotchas
- Scaling up a warehouse to fix query queuing. Scale-up fixes query complexity; scale-out fixes user concurrency bottlenecks.
- Setting `AUTO_SUSPEND` to 0 or `NULL`, which disables automatic suspension and incurs 24/7 compute billing charges.
- Not taking advantage of warehouse local SSD cache; running queries across frequently changing warehouses prevents cache reuse.

### Quick Recap
- MPP compute clusters composed of CPU, memory, and local SSD storage.
- T-shirt sizes (XS to 6XL) double in compute power and credit consumption at each step.
- Scale-up addresses query complexity; scale-out addresses query concurrency.
- Auto-suspend and auto-resume guarantee pay-as-you-go per-second cost control.
- Resizing a warehouse never aborts or restarts actively running queries.

---

![Micro Partitioning](https://img.shields.io/badge/Micro_Partitioning-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 4. Micro-Partitioning Mechanics

### Definition
Micro-partitioning is Snowflake's automated storage partitioning scheme where all table data is divided into contiguous, 50 MB to 500 MB uncompressed units of columnar storage. Snowflake captures column-level min/max metadata for every micro-partition to enable partition pruning without manual partition management.

### Why it matters / Real-world use case
An e-commerce audit table contains 4 billion historical transaction records. A compliance officer queries transactions for a specific date: `WHERE order_date = '2026-03-01'`. Snowflake uses metadata to scan only 15 micro-partitions out of 80,000, returning results in 2 seconds and bypassing 99.9% of table storage.

### How it works
- **Automatic Ingestion Slicing:** As data loads, Snowflake chunks records into 50–500 MB uncompressed files (compressing to 10–50 MB).
- **Columnar Organization:** Within each micro-partition, data is stored in independent columnar vectors with individual compression algorithms.
- **Metadata Logging:** Cloud Services records minimum value, maximum value, distinct count, null count, and byte offset for each column in every partition.
- **Partition Pruning:** The optimizer compares query `WHERE` predicates against partition min/max ranges and eliminates non-overlapping files prior to disk reads.

```text
Query: WHERE order_date = '2026-03-01'
                          |
                          v
         [Cloud Services: Metadata Catalog]
  Partition 1 [2026-01-01 to 2026-01-31] --> PRUNED (Skipped)
  Partition 2 [2026-02-01 to 2026-02-28] --> PRUNED (Skipped)
  Partition 3 [2026-03-01 to 2026-03-31] --> SCANNED (Read only 1 file)
```

### Example

```sql
-- Query benefits from automatic metadata pruning
SELECT
    customer_id,
    SUM(order_amount) AS total_spent
FROM retail_dw.raw_pos.customer_orders
WHERE order_date BETWEEN '2026-03-01' AND '2026-03-07'
GROUP BY customer_id;

-- Verify pruning efficiency using query history
SELECT
    query_id,
    partitions_scanned,
    partitions_total,
    bytes_scanned
FROM TABLE(INFORMATION_SCHEMA.QUERY_HISTORY())
WHERE query_text LIKE '%customer_orders%WHERE order_date BETWEEN%'
ORDER BY start_time DESC
LIMIT 1;
```

### Interview Q&A

**Q1: What is the size of a Snowflake micro-partition?**
**Answer:** Between 50 MB and 500 MB of uncompressed data, which typically compresses down to roughly 10 MB to 50 MB depending on compression ratios.

**Q2: What is partition pruning and how does it save costs?**
**Answer:** Partition pruning is the process where Snowflake evaluates query filter predicates against micro-partition min/max metadata and skips reading non-matching partitions from cloud storage, saving disk I/O and query runtime.

**Q3: How does Snowflake micro-partitioning differ from Hive or RDBMS partitioning?**
**Answer:** Snowflake micro-partitioning is 100% automated with uniform partition sizes and multi-dimensional pruning on all columns. Traditional partitioning requires manual DDL (`PARTITION BY`), often causing severe data skew and small-file problems.

### Common Pitfalls / Gotchas
- Wrapping filter columns in scalar functions (e.g., `WHERE YEAR(order_date) = 2026`), which can prevent the optimizer from using column min/max metadata for partition pruning.
- Expecting partition pruning on columns that have wide, overlapping min/max ranges across all micro-partitions due to random ingestion order.
- Attempting to manually create partition folders; Snowflake completely abstracts physical file management.

### Quick Recap
- Tables are split automatically into 50–500 MB uncompressed columnar chunks.
- Cloud Services records min/max boundaries and distinct counts for every column.
- Partition pruning eliminates non-matching partitions before reading data from storage.
- Pruning works on any column, not just predefined partition keys.
- Write queries using raw column predicates to maximize pruning efficiency.

---

![Physical Storage](https://img.shields.io/badge/Physical_Storage-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 5. How Data Is Physically Stored

### Definition
Snowflake physically stores data as encrypted, compressed, columnar-oriented immutable files within cloud provider object storage (AWS S3, Azure Blob, or Google Cloud Storage). This layout optimizes analytical throughput by reading only queried columns and delivering 60% to 80% compression ratios.

### Why it matters / Real-world use case
An analytics mart stores an enterprise table with 120 columns. A dashboard query calculates total revenue by store: `SELECT store_id, SUM(revenue) FROM sales GROUP BY store_id`. Because data is stored by column, Snowflake reads only the physical byte blocks for `store_id` and `revenue`, bypassing the other 118 columns and transferring 95% less data over the network.

### How it works
- **Columnar Slicing:** Rows are transposed into columnar vectors within each micro-partition file.
- **Tailored Compression:** Contiguous identical data types enable specialized encodings (dictionary, run-length, bit-packing, Zstandard).
- **Physical Immutability:** Micro-partitions are write-once. An `UPDATE` or `DELETE` creates new micro-partitions for modified records and marks old micro-partitions as historical.
- **End-to-End Encryption:** Files are automatically encrypted at rest using 256-bit AES keys managed through a hierarchical key model.

| Dimension | Row-Oriented Storage (OLTP) | Columnar Storage (Snowflake OLAP) |
| :--- | :--- | :--- |
| **Physical Layout** | All column values of a row stored together | Values of a single column stored together |
| **Optimized For** | Single-record INSERT/UPDATE, primary key lookups | Analytical aggregations (`SUM`, `AVG`, `COUNT`) |
| **I/O Pattern** | Reads entire row off disk | Reads only columns requested in SQL |
| **Compression** | Low (10%–20%) | High (60%–80%) |

### Example

```sql
-- Query demonstrating columnar efficiency: reads only 2 columns from disk
SELECT
    store_country,
    SUM(sale_amount) AS total_revenue
FROM retail_dw.raw_pos.store_transactions
GROUP BY store_country;

-- Inspect physical storage allocation
SELECT
    table_name,
    active_bytes,
    ROUND(active_bytes / (1024 * 1024), 2) AS active_mb,
    time_travel_bytes,
    failsafe_bytes
FROM retail_dw.INFORMATION_SCHEMA.TABLE_STORAGE_METRICS
WHERE table_name = 'STORE_TRANSACTIONS';
```

### Interview Q&A

**Q1: Why is columnar storage preferred for analytical data platforms?**
**Answer:** Columnar storage allows queries to scan only the specific columns referenced in a query, drastically reducing disk I/O. It also stores similar data types contiguously, resulting in 3x to 5x higher compression ratios than row storage.

**Q2: What happens physically to micro-partitions when you update records?**
**Answer:** Because micro-partitions are immutable, Snowflake reads the partition containing the target rows, writes a brand-new micro-partition with updated values, and flags the original partition as historical for Time Travel.

**Q3: Can a user access or modify Snowflake physical micro-partition files directly in AWS S3?**
**Answer:** No. Snowflake manages cloud storage accounts internally and stores data in an encrypted, proprietary columnar format accessible only through Snowflake's SQL engine.

### Common Pitfalls / Gotchas
- Running `SELECT *` on large tables, which forces the columnar engine to read all column byte vectors from storage and negates the I/O benefit of columnar storage.
- Assuming updates occur in-place; high-frequency single-row updates write many new micro-partitions, causing storage fragmentation and Time Travel bloat.
- Attempting to manually compress files before loading; Snowflake handles all internal physical compression automatically.

### Quick Recap
- Data is stored in encrypted, compressed, columnar immutable files in cloud object storage.
- Analytical queries read only requested columns, minimizing network and storage I/O.
- Contiguous column storage yields high compression ratios (60% to 80%).
- Immutability guarantees lock-free concurrency, Time Travel, and Zero-Copy Cloning.
- Never use `SELECT *` in production analytical queries.

---

![Storage Clustering](https://img.shields.io/badge/Storage_Clustering-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 6. Clustering at Storage Level

### Definition
Clustering refers to the physical grouping and ordering of records across micro-partitions based on designated table columns (Clustering Keys). Defining a clustering key enables Snowflake's serverless Automatic Clustering service to eliminate micro-partition overlap and maximize partition pruning on multi-terabyte tables.

### Why it matters / Real-world use case
An ad-tech platform queries a 15-terabyte clickstream table filtering by `(advertiser_id, click_date)`. Because data arrived randomly by web server, records for an advertiser were scattered across 50,000 micro-partitions. By defining a clustering key on `(advertiser_id, click_date)`, query partition scans dropped from 50,000 to 120 partitions, cutting runtime from 8 minutes to 4 seconds.

### How it works
- **Natural Clustering:** Tables cluster naturally based on insertion order as data is loaded.
- **Partition Overlap:** As random updates or diverse data streams land, column value ranges begin overlapping across many micro-partitions.
- **Clustering Key:** Designates 1 to 4 columns to sort and co-locate data.
- **Automatic Clustering:** A background serverless service re-organizes and merges micro-partitions to lower clustering depth without user maintenance scripts.
- **Clustering Depth:** Measures the average number of overlapping micro-partitions for a table. An ideal depth is close to 1.0.

```text
Unclustered (High Overlap):
  Partition 1: [Dates: Jan 01 - Jan 31]
  Partition 2: [Dates: Jan 05 - Jan 25]  --> Query for Jan 10 must scan BOTH partitions
  Partition 3: [Dates: Jan 02 - Jan 28]

Clustered (Zero Overlap):
  Partition 1: [Dates: Jan 01 - Jan 10]
  Partition 2: [Dates: Jan 11 - Jan 20]  --> Query for Jan 10 scans ONLY Partition 1
  Partition 3: [Dates: Jan 21 - Jan 31]
```

### Example

```sql
-- 1. Create large fact table with explicit clustering key
CREATE OR REPLACE TABLE retail_dw.raw_pos.web_clicks (
    click_id        NUMBER(38,0),
    country_code    VARCHAR(10),
    click_date      DATE,
    user_id         NUMBER(38,0),
    url             VARCHAR(500)
) CLUSTER BY (country_code, click_date);

-- 2. Inspect clustering health and overlap depth
SELECT SYSTEM$CLUSTERING_INFORMATION('retail_dw.raw_pos.web_clicks');

-- 3. Suspend automatic re-clustering during massive bulk ingestion
ALTER TABLE retail_dw.raw_pos.web_clicks SUSPEND RECLUSTER;
```

### Interview Q&A

**Q1: What is clustering depth in Snowflake?**
**Answer:** Clustering depth measures the average number of overlapping micro-partitions for a table along its clustering key. A clustering depth near 1.0 indicates optimal clustering with minimal partition overlap.

**Q2: Does Snowflake have traditional B-Tree or Bitmap indexes?**
**Answer:** No. Snowflake does not use indexes. It relies on micro-partition metadata, columnar storage, and clustering keys to optimize data retrieval.

**Q3: When should you define an explicit clustering key on a table?**
**Answer:** Only on very large tables (multi-hundred gigabytes or terabytes) where queries filter frequently on specific columns, execution is slow, and query profile shows that partition pruning is poor.

### Common Pitfalls / Gotchas
- Adding clustering keys to small tables (< 100 GB). Small tables already occupy few micro-partitions; clustering them wastes credits with zero performance gain.
- Selecting columns with excessively high cardinality (e.g., UUIDs or millisecond timestamps) as clustering keys, which prevents effective co-location.
- Ordering clustering key columns incorrectly; place lower-cardinality columns first, followed by higher-cardinality columns.

### Quick Recap
- Reorganizes micro-partitions to eliminate overlapping value ranges.
- Maintained in the background by Snowflake's serverless Automatic Clustering.
- Aim for a clustering depth close to 1.0.
- Apply only to multi-hundred GB or TB scale tables with documented pruning bottlenecks.
- Never define clustering keys on small tables.

---

## Day Summary Table

| Topic | One-line takeaway | Interview likelihood |
| :--- | :--- | :---: |
| **Snowflake Intro & Setup** | Fully managed cloud SaaS decoupling compute from storage with zero physical maintenance. | High |
| **Architecture Overview** | 3-tier architecture (Cloud Services, Compute, Storage) providing complete workload isolation. | High |
| **Virtual Warehouses** | Stateless MPP compute clusters scaling up for query power and scaling out for user concurrency. | High |
| **Micro-Partitioning Mechanics** | Automated 50–500 MB columnar blocks enabling metadata-driven partition pruning without indexes. | High |
| **Physical Storage Layout** | Encrypted, compressed, columnar immutable files in cloud object storage providing high I/O efficiency. | Medium |
| **Storage-Level Clustering** | Co-locates data in micro-partitions to eliminate overlap and restore pruning on multi-TB tables. | Medium |
