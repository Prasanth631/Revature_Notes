# Day 5: Snowflake Advanced Features & UDFs

![Snowflake](https://img.shields.io/badge/Snowflake-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

---

![Semi Structured Data](https://img.shields.io/badge/Semi_Structured_Data-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 1. Querying Semi-Structured Data (JSON, XML, Avro)

### Definition
Snowflake provides native support for querying semi-structured data formats (JSON, XML, Avro, ORC, Parquet) using the `VARIANT` data type, colon syntax (`:`), bracket notation, and table functions like `FLATTEN()` without pre-shredding.

### Why it matters / Real-world use case
An ad-tech platform collects clickstream payloads containing nested user attributes and variable-length array events in JSON. Data engineers load the raw JSON directly into a single `payload VARIANT` column and query user properties like `payload:user.demographics.city::STRING` using standard SQL in production reporting views.

### How it works
- **VARIANT Column:** Stores up to 16 MB of arbitrary semi-structured data per row.
- **Automatic Columnar Shredding:** Under the hood, Snowflake's storage engine extracts frequent nested keys into columnar micro-partitions for relational-speed querying.
- **Colon Syntax (`:`):** Navigates nested object attributes (e.g., `col:field.subfield`).
- **Bracket Syntax (`[]`):** Indexes array elements (e.g., `col:items[0]`).
- **`FLATTEN()` Function:** Explodes nested arrays into relational rows (similar to `LATERAL VIEW explode`).

```text
Raw JSON Payload:
{"customer_id": 101, "items": [{"sku": "A1", "price": 25}, {"sku": "B2", "price": 40}]}
                       |
                       v  FLATTEN(input => payload:items)
Row 1: customer_id: 101 | sku: "A1" | price: 25
Row 2: customer_id: 101 | sku: "B2" | price: 40
```

### Example

```sql
-- 1. Create table with native VARIANT column and insert nested JSON
CREATE OR REPLACE TABLE retail_dw.raw_pos.clickstream_events (
    event_id NUMBER,
    event_payload VARIANT
);

INSERT INTO retail_dw.raw_pos.clickstream_events
SELECT 1, PARSE_JSON('{"user_id": 901, "location": {"city": "Dallas", "state": "TX"}, "actions": ["login", "view_item", "checkout"]}');

-- 2. Query nested fields and explode array into rows
SELECT
    event_id,
    event_payload:user_id::NUMBER          AS user_id,
    event_payload:location.city::STRING    AS city,
    f.value::STRING                        AS action_name
FROM retail_dw.raw_pos.clickstream_events,
LATERAL FLATTEN(input => event_payload:actions) f;
```

### Interview Q&A

**Q1: What is the maximum size of a VARIANT column in Snowflake?**
**Answer:** The maximum size of a `VARIANT` column value is 16 MB of uncompressed JSON/data per single row.

**Q2: What is the difference between single colon (`:`) and double colon (`::`) in Snowflake SQL?**
**Answer:** The single colon (`:`) extracts a key or field from a `VARIANT` object, returning a `VARIANT` data type. The double colon (`::`) casts that extracted `VARIANT` value into a target SQL data type (e.g., `::STRING`, `::NUMBER`, `::DATE`).

**Q3: How does Snowflake achieve high performance on deeply nested JSON without indexes?**
**Answer:** During ingestion, the storage engine shreds repeated JSON keys and attributes into distinct columnar sub-vectors inside micro-partitions and collects min/max statistics, allowing queries to scan only the nested fields accessed.

### Common Pitfalls / Gotchas
- Forgetting to cast extracted variant values (e.g., omitting `::STRING`), which keeps string values surrounded by literal quotes (`"Dallas"` instead of `Dallas`).
- Storing semi-structured data as `VARCHAR(16777216)` instead of `VARIANT`; `VARCHAR` prevents path-based traversal and disables columnar shredding.
- Using Cartesian joins when flattening multiple nested arrays within the same JSON document.

### Quick Recap
- Native `VARIANT` data type stores up to 16 MB of JSON, XML, or Avro per row.
- Use `:` to traverse object keys and `[]` to access array elements.
- Always cast extracted fields to target SQL types using `::TYPE`.
- `FLATTEN()` explodes nested arrays into relational rows.
- Repeated JSON sub-elements are automatically shredded into columnar micro-partitions.

---

![Replication & DR](https://img.shields.io/badge/Replication_%26_DR-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 2. Cross-Region Replication, Failover & Disaster Recovery Planning

### Definition
Cross-Region and Cross-Cloud Replication enables Snowflake accounts to synchronize databases, users, roles, and privileges across different cloud regions and cloud providers (AWS, Azure, GCP). Failover groups allow secondary accounts to be promoted to primary during region-wide outages to maintain business continuity.

### Why it matters / Real-world use case
An international banking institution hosts its primary Snowflake account on AWS `us-east-1`. In the event of a catastrophic AWS regional data center disaster, the bank promotes its secondary replica in Azure `eastus2` to primary within 5 minutes, ensuring financial trading platforms experience zero downtime and zero data loss.

### How it works
- **Replication Groups:** Logical containers that replicate data objects (databases) and account-level objects (users, roles, warehouses, resource monitors) across accounts.
- **Failover Groups:** Extended replication groups that support point-in-time promotion of a secondary replica to the primary read-write role during an outage.
- **Incremental Synchronization:** After the initial baseline copy, replication copies only modified micro-partitions over secure cloud backbones.

```text
Primary Account (AWS us-east-1)                 Secondary Account (Azure eastus2)
+----------------------------+                 +----------------------------+
| Primary Failover Group     | ──Replicate──>  | Secondary Failover Group   |
| Databases, Users, Roles    | (Incremental)   | (Read-Only Replica)        |
+----------------------------+                 +----------------------------+
              |                                               |
         [AWS Outage] ─────────────────────────────> [PROMOTE TO PRIMARY]
                                                     (Becomes Read-Write in < 5m)
```

### Example

```sql
-- Step 1: On Primary Account (AWS): Create Failover Group
CREATE FAILOVER GROUP dr_failover_group
    OBJECT_TYPES = USERS, ROLES, WAREHOUSES, DATABASES
    ALLOWED_DATABASES = retail_dw
    ALLOWED_ACCOUNTS = my_org.azure_eastus2_account
    REPLICATION_SCHEDULE = '10 MINUTE';

-- Step 2: On Secondary Account (Azure): Create Replica Failover Group
CREATE FAILOVER GROUP dr_failover_group
    AS REPLICA OF my_org.aws_useast1_account.dr_failover_group;

-- Step 3: Disaster Recovery Event: Promote Secondary Account to Primary
ALTER FAILOVER GROUP dr_failover_group PRIMARY;
```

### Interview Q&A

**Q1: Can Snowflake replicate across different cloud providers (e.g., AWS to Azure)?**
**Answer:** Yes. Snowflake provides true cross-cloud replication. A primary database running in AWS `us-east-1` can replicate continuously to a secondary account running in Microsoft Azure or Google Cloud Platform.

**Q2: What is the difference between a Replication Group and a Failover Group?**
**Answer:** A Replication Group enables one-way data synchronization for read-only reporting. A Failover Group adds disaster recovery capabilities, enabling the secondary account to be promoted to a primary read-write account during a disaster.

**Q3: How are replication costs incurred in Snowflake?**
**Answer:** Replication incurs two costs: compute credits consumed by the serverless replication engine to process micro-partitions, and cloud provider data egress fees for transferring data out of the source cloud region.

### Common Pitfalls / Gotchas
- Replicating transient or temporary tables; transient tables can replicate, but temporary tables and external stages cannot be replicated across accounts.
- Setting replication schedules too frequent for rarely updated databases, causing unnecessary compute and data egress charges.
- Forgetting to include `USERS` and `ROLES` in the Failover Group, leaving the secondary account without required RBAC access controls upon failover.

### Quick Recap
- True cross-region and cross-cloud replication across AWS, Azure, and GCP.
- Failover Groups synchronize databases, users, roles, and warehouse definitions.
- Incremental replication transfers only changed micro-partitions.
- Fast RTO (Recovery Time Objective) via instant promotion: `ALTER FAILOVER GROUP ... PRIMARY`.
- Incurs serverless compute credits and cloud data egress fees.

---

![Data Retention](https://img.shields.io/badge/Data_Retention_%26_Time_Travel-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 3. Data Retention Policies (Time Travel & Fail-Safe)

### Definition
Data retention policies govern Snowflake's continuous data protection framework, consisting of Time Travel (accessing and restoring historical data within a configurable 0 to 90-day window) and Fail-Safe (a non-configurable 7-day disaster recovery safety net managed exclusively by Snowflake Support).

### Why it matters / Real-world use case
A junior developer accidentally executes `DROP TABLE customer_orders;` in production at 3:00 PM on Friday. Rather than restoring terabytes of data from tape backups, the data engineer recovers the table instantly in 5 seconds using `UNDROP TABLE customer_orders;` via Time Travel.

### How it works
- **Time Travel (0–90 Days):**
  - Standard Edition: Up to 1 day of Time Travel.
  - Enterprise Edition: Configurable up to **90 days** for Permanent tables (`DATA_RETENTION_TIME_IN_DAYS`).
  - Transient & Temporary tables: Maximum 1 day.
  - Query historic state using `AT` or `BEFORE` (timestamp, offset, or statement ID).
- **Fail-Safe (7 Days):**
  - Starts immediately after the Time Travel window expires.
  - Last-resort disaster recovery available **only via Snowflake Support** for catastrophic hardware/datacenter loss.
  - Applies only to Permanent tables. Transient/Temporary have **zero Fail-safe**.

```text
[Active Data] ──> [Time Travel: 0 to 90 Days] ──> [Fail-Safe: 7 Days] ──> [Storage Reclaimed]
                     (User Accessible:                  (Snowflake Support
                      UNDROP, AT, BEFORE)                Disaster Recovery ONLY)
```

### Example

```sql
-- 1. Query table as it existed 30 minutes ago
SELECT * FROM retail_dw.raw_pos.customer_orders
AT(OFFSET => -60 * 30);

-- 2. Query table state immediately BEFORE a rogue UPDATE query ran
SELECT * FROM retail_dw.raw_pos.customer_orders
BEFORE(STATEMENT => '01b2345a-0001-2345-0000-00012345abcd');

-- 3. Restore an accidentally dropped production table
DROP TABLE retail_dw.raw_pos.customer_orders;
UNDROP TABLE retail_dw.raw_pos.customer_orders;
```

### Interview Q&A

**Q1: What is the maximum Time Travel retention period in Snowflake Enterprise Edition?**
**Answer:** Up to 90 days for Permanent tables. Standard Edition is limited to 1 day. Transient and Temporary tables are limited to 1 day across all editions.

**Q2: Can a customer query or restore data directly from Fail-Safe?**
**Answer:** No. Fail-Safe is completely inaccessible to customers. It is a 7-day disaster recovery safety net accessible only by Snowflake Support for catastrophic data recovery.

**Q3: How does Zero-Copy Cloning interact with Time Travel?**
**Answer:** You can clone a table, schema, or database at a specific historical point in time (e.g., `CREATE TABLE clone_orders CLONE orders AT(OFFSET => -3600);`). The clone is created instantly as a metadata pointer without copying physical storage bytes.

### Common Pitfalls / Gotchas
- Retaining 90 days of Time Travel on high-churn staging tables, creating massive secondary storage bills for deleted historical micro-partitions.
- Confusing Fail-Safe with Time Travel; users cannot run `UNDROP` on tables that have passed beyond their Time Travel period into Fail-Safe.
- Forgetting that Zero-Copy Clones begin consuming independent storage credits as soon as updates or deletes are executed against either the source or clone.

### Quick Recap
- Time Travel allows querying and restoring data up to 90 days in the past.
- Supports `AT` and `BEFORE` operators using timestamps, offsets, or query IDs.
- `UNDROP TABLE / SCHEMA / DATABASE` restores dropped objects instantly.
- Fail-Safe is an automated 7-day safety net managed exclusively by Snowflake Support.
- Transient and Temporary tables have 0 Fail-Safe days, saving storage budget.

---

![User Defined Functions](https://img.shields.io/badge/UDFs_%28SQL%2C_JS%2C_Python%29-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 4. SQL, JavaScript, and Python UDFs

### Definition
User-Defined Functions (UDFs) allow data engineers to extend Snowflake SQL by writing custom computational, parsing, or mathematical logic in SQL, JavaScript, or Python that executes directly within the distributed Virtual Warehouse engine.

### Why it matters / Real-world use case
An enterprise needs to calculate the Haversine distance between customer GPS coordinates and delivery warehouses. While complex trigonometric functions are tedious in raw SQL, data engineers write a clean, vectorized Python UDF using the Python `math` module and invoke it directly inside SQL pipelines.

### How it works
- **SQL UDFs:** Fast, inlineable scalar or tabular expressions evaluated directly by the query compiler.
- **JavaScript UDFs:** Support procedural logic, regex loops, and JSON manipulation using the V8 JavaScript engine.
- **Python UDFs (Snowpark):** Execute custom Python code inside secure sandboxes on warehouse nodes. Supports Anaconda packages (Pandas, NumPy, Scikit-Learn) with zero external server requirements.
- **Types:** Scalar UDFs (return 1 value per row) and Tabular UDFs / UDTFs (return a table).

| UDF Language | Execution Speed | Ecosystem Support | Best Used For |
| :--- | :--- | :--- | :--- |
| **SQL** | Highest (Inlined) | Native SQL functions | Reusable business formulas, short calculations |
| **JavaScript** | High (V8 Engine) | Standard JS libraries | String parsing, complex regex, conditional loops |
| **Python** | High (Vectorized) | Anaconda, NumPy, Pandas | ML inference, mathematical modeling, geospatial logic |

### Example

```sql
-- 1. SQL UDF: Calculate discounted tax amount
CREATE OR REPLACE FUNCTION retail_dw.raw_pos.calc_tax(amount NUMBER, rate NUMBER)
RETURNS NUMBER(10,2)
AS
$$
    ROUND(amount * rate, 2)
$$;

-- 2. Python UDF: Sentiment classification using Python standard library
CREATE OR REPLACE FUNCTION retail_dw.raw_pos.simple_sentiment(feedback STRING)
RETURNS STRING
LANGUAGE PYTHON
RUNTIME_VERSION = '3.9'
HANDLER = 'analyze_sentiment'
AS
$$
def analyze_sentiment(feedback: str) -> str:
    if not feedback:
        return 'NEUTRAL'
    positive_words = {'great', 'excellent', 'fast', 'love', 'good'}
    words = set(feedback.lower().split())
    if words.intersection(positive_words):
        return 'POSITIVE'
    return 'NEGATIVE'
$$;

-- 3. Invoking the UDF directly in SQL
SELECT feedback_text, retail_dw.raw_pos.simple_sentiment(feedback_text) AS sentiment
FROM customer_reviews;
```

### Interview Q&A

**Q1: What is the difference between a UDF and a Stored Procedure in Snowflake?**
**Answer:** A UDF calculates and returns a value or table and is called directly within a SQL query (`SELECT my_udf(col) FROM table`). A Stored Procedure executes administrative or procedural tasks (DDL, transactions, branching logic) and is executed standalone using `CALL my_procedure()`.

**Q2: What is a Secure UDF in Snowflake?**
**Answer:** A Secure UDF hides the underlying function logic and prevents internal data values from being exposed to unauthorized users through query optimization or error messages.

**Q3: Can Python UDFs import third-party libraries in Snowflake?**
**Answer:** Yes. Through Snowflake's partnership with Anaconda, hundreds of pre-compiled third-party Python packages (e.g., `numpy`, `pandas`, `scipy`) can be imported directly into Python UDFs using the `PACKAGES = ('numpy', 'pandas')` clause.

### Common Pitfalls / Gotchas
- Calling slow, un-vectorized Python or JavaScript UDFs over billions of rows; scalar UDFs run row-by-row and can become an execution bottleneck.
- Accessing external network endpoints from standard UDFs; external API calls require dedicated External Network Access Integrations.
- Forgetting that SQL UDFs can be inlined by the optimizer, whereas JavaScript and Python UDFs run inside sandboxed interpreters.

### Quick Recap
- Extend Snowflake SQL using SQL, JavaScript, or Python.
- SQL UDFs are fastest and can be inlined by the optimizer.
- Python UDFs run in secure sandboxes with native Anaconda package support.
- UDFs return values in SQL expressions; Stored Procedures execute administrative tasks via `CALL`.
- Secure UDFs protect IP and prevent data leakage via execution profiling.

---

![Data Sharing](https://img.shields.io/badge/Data_Sharing-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 5. Data Sharing Concepts and Implementation

### Definition
Snowflake Secure Data Sharing allows provider accounts to share live, read-only database objects (tables, secure views, secure UDFs) with consumer accounts instantly without copying, moving, or syncing physical data files.

### Why it matters / Real-world use case
A healthcare analytics vendor provides daily clinical metrics to 50 hospital networks. Instead of building complex SFTP file pipelines or maintaining public APIs, the vendor grants hospitals access to a secure Snowflake Share. Hospitals query the live tables instantly using their own virtual warehouses with zero data latency.

### How it works
- **No Data Movement:** The provider shares access to metadata pointers in the Services Layer. Consumers query the provider's underlying immutable micro-partitions directly.
- **Compute Isolation:** The consumer pays for their own compute warehouse credits to query the shared data. The provider pays only for data storage.
- **Reader Accounts:** For consumers who do not own a Snowflake account, providers can provision a managed "Reader Account" where the provider sponsors compute fees.

```text
Provider Account (Storage Owner)                Consumer Account (Compute Owner)
+-------------------------------+               +-------------------------------+
| Database: clinical_mart       |               | Imported Database: shared_mart|
| Table: patient_metrics        |               | Virtual Warehouse: CONSUMER_WH|
+-------------------------------+               +-------------------------------+
               \                                               /
                \─── Shares Metadata Pointers (Zero Copy) ────/
```

### Example

```sql
-- Step 1: Provider creates a Share and grants access to tables
USE ROLE ACCOUNTADMIN;
CREATE OR REPLACE SHARE clinical_data_share;

GRANT USAGE ON DATABASE healthcare_dw TO SHARE clinical_data_share;
GRANT USAGE ON SCHEMA healthcare_dw.curated TO SHARE clinical_data_share;
GRANT SELECT ON VIEW healthcare_dw.curated.v_hospital_metrics TO SHARE clinical_data_share;

-- Add consumer account to share
ALTER SHARE clinical_data_share ADD ACCOUNTS = xy12345_consumer;

-- Step 2: Consumer creates a database from the incoming Share
USE ROLE ACCOUNTADMIN;
CREATE DATABASE hospital_partner_dw FROM SHARE provider_account.clinical_data_share;

-- Step 3: Consumer queries shared data immediately using their OWN warehouse
SELECT * FROM hospital_partner_dw.curated.v_hospital_metrics;
```

### Interview Q&A

**Q1: How does Snowflake Secure Data Sharing avoid copying data?**
**Answer:** Data sharing operates at the Cloud Services metadata layer. The provider grants access privileges to existing immutable micro-partitions. The consumer's virtual warehouse reads the provider's storage files directly, eliminating data duplication.

**Q2: Who pays for compute and storage in Snowflake Data Sharing?**
**Answer:** The data provider pays for physical data storage. The consumer pays for the Virtual Warehouse compute credits consumed when executing queries against the shared data.

**Q3: What is a Snowflake Reader Account?**
**Answer:** A Reader Account is a Snowflake account created and funded by a data provider for a third party who does not have their own Snowflake account. The provider pays for both storage and the compute credits consumed by the Reader Account.

### Common Pitfalls / Gotchas
- Sharing standard views instead of **Secure Views**; non-secure views can reveal underlying data logic and table structures to consumers.
- Sharing transient or temporary tables; only permanent tables, secure views, and secure UDFs can be shared.
- Assuming shared data can be modified; shared databases are strictly **read-only** for consumers.

### Quick Recap
- Zero-copy, live, read-only data sharing across Snowflake accounts.
- Provider pays for data storage; consumer pays for query compute credits.
- Operates at the Cloud Services metadata layer with zero physical file transfer.
- Reader Accounts allow sharing with organizations that do not have Snowflake.
- Always use Secure Views to mask proprietary SQL logic and enforce multi-tenant filters.

---

## Day Summary Table

| Topic | One-line takeaway | Interview likelihood |
| :--- | :--- | :---: |
| **Semi-Structured Data** | Native `VARIANT` column queries JSON/XML/Avro using `:` syntax and `FLATTEN()` with automatic columnar shredding. | High |
| **Replication & Failover** | Cross-region and cross-cloud database/account synchronization with near-instant disaster recovery failover. | High |
| **Data Retention Policies** | Time Travel (0–90 days) for historic queries/undrops; Fail-Safe (7 days) for catastrophic disaster recovery. | High |
| **SQL, JS & Python UDFs** | Extend SQL with custom procedural logic; Python UDFs support Anaconda packages in secure sandboxes. | High |
| **Data Sharing** | Zero-copy, live read-only data access where provider pays storage and consumer pays query compute. | High |
