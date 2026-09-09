# Day 3: Snowflake Performance & Storage Optimization

![Snowflake](https://img.shields.io/badge/Snowflake-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

---

![Compression](https://img.shields.io/badge/Compression_Techniques-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 1. Compression Techniques

### Definition
Snowflake automatically applies proprietary, column-specific compression algorithms to data as it is written into immutable micro-partitions. This compression occurs seamlessly in memory during loading, reducing physical cloud storage footprint by 60% to 80% without requiring user intervention.

### Why it matters / Real-world use case
A telecommunications provider ingests 10 terabytes of uncompressed network events daily. Because Snowflake automatically applies dictionary and run-length encoding to repeated IP addresses and status codes, the actual storage footprint is compressed down to 2.2 terabytes, cutting monthly cloud storage costs by over 75% and speeding up query I/O.

### How it works
- **Column-Specific Algorithms:** Snowflake evaluates the data distribution of each column individually and selects the optimal compression scheme (e.g., Run-Length Encoding, Dictionary Encoding, Bit-Packing, Zstandard, or LZ4).
- **Zero Configuration:** Compression is fully managed and cannot be turned off or manually overridden.
- **In-Memory Transformation:** Data is converted from incoming formats, compressed into columnar vectors, and encrypted before hitting cloud object storage.

| Algorithm Pattern | Best For | Compression Mechanism |
| :--- | :--- | :--- |
| **Dictionary Encoding** | Low-cardinality text (e.g., country codes, status) | Replaces repeated strings with small integer tokens |
| **Run-Length Encoding (RLE)** | Sorted or contiguous repeated values | Stores value and repeat count instead of duplicates |
| **Bit-Packing** | Small integer ranges (e.g., age, days) | Uses minimum bits necessary per value |
| **Zstandard / LZ4** | High-cardinality strings, JSON payloads | High-speed dictionary block compression |

### Example

```sql
-- Inspect compression ratio and physical storage savings
SELECT
    table_name,
    active_bytes,
    ROUND(active_bytes / (1024 * 1024 * 1024), 2) AS compressed_gb,
    -- Estimate uncompressed size based on average 4x compression ratio
    ROUND((active_bytes * 4) / (1024 * 1024 * 1024), 2) AS estimated_uncompressed_gb
FROM retail_dw.INFORMATION_SCHEMA.TABLE_STORAGE_METRICS
WHERE table_name = 'STORE_TRANSACTIONS';
```

### Interview Q&A

**Q1: How do you configure compression on a Snowflake table?**
**Answer:** You do not configure compression. Snowflake automatically applies proprietary compression algorithms based on data types and value distributions during the load process. It is completely transparent and non-configurable.

**Q2: How does physical compression impact query execution speed?**
**Answer:** Compressed columnar data drastically reduces the volume of bytes transferred from cloud object storage to virtual warehouse memory and local SSD cache. Since cloud data transfer is the primary I/O bottleneck, compression significantly accelerates query execution.

**Q3: Does Snowflake decompress entire micro-partitions when executing a query?**
**Answer:** No. Snowflake decompresses only the specific columnar blocks requested by the query. Unreferenced columns remain untouched in compressed storage.

### Common Pitfalls / Gotchas
- Pre-compressing files with low-efficiency algorithms before loading and expecting Snowflake to retain that format; Snowflake always decompresses staged files and recompresses them into its own internal columnar format.
- Assuming that high-cardinality columns (e.g., random UUIDs) compress well; random distinct values compress poorly compared to categorical data.
- Storing numbers as strings (e.g., `'1001'` instead of `1001`), which prevents optimal integer bit-packing compression.

### Quick Recap
- Automatic, proprietary, column-specific compression applied during ingestion.
- Delivers typical compression ratios between 60% and 80% (3x to 5x reduction).
- Reduces both cloud storage costs and network I/O transfer time during query execution.
- Evaluates algorithms like Dictionary Encoding, RLE, and Bit-Packing per column.
- Requires zero manual tuning or DBA maintenance.

---

![Pruning](https://img.shields.io/badge/Pruning_Mechanisms-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 2. Pruning Mechanisms

### Definition
Pruning is Snowflake's core query optimization mechanism where the Cloud Services optimizer evaluates query filter predicates against micro-partition metadata to eliminate non-matching micro-partitions prior to reading data from storage.

### Why it matters / Real-world use case
An analyst queries an e-commerce sales table holding 5 years of orders (12 billion rows): `WHERE order_date BETWEEN '2026-03-01' AND '2026-03-02'`. Because Snowflake prunes by date range, the query reads only 40 micro-partitions out of 250,000, finishing in 2 seconds without full table scans.

### How it works
- **Metadata Registration:** As micro-partitions are written, Cloud Services logs minimum and maximum values for every column.
- **Filter Evaluation:** The query optimizer checks `WHERE`, `HAVING`, and `JOIN` predicates against partition boundaries.
- **Micro-Partition Elimination:** Partitions whose min/max range does not overlap the query predicate are excluded from the execution plan.

```text
Incoming Query: WHERE department_id = 10
                       |
                       v
      [Cloud Services Metadata Evaluation]
Partition 1 [Dept: 1 - 5]   --> PRUNED (Skipped)
Partition 2 [Dept: 6 - 9]   --> PRUNED (Skipped)
Partition 3 [Dept: 10 - 20] --> SCANNED (Read only this partition)
```

### Example

```sql
-- Step 1: Execute query with a selective filter
SELECT
    store_id,
    SUM(sale_amount) AS total_revenue
FROM retail_dw.raw_pos.store_transactions
WHERE sale_date = '2026-03-01'
GROUP BY store_id;

-- Step 2: Verify partition pruning in Query History
SELECT
    query_id,
    query_text,
    partitions_scanned,
    partitions_total,
    ROUND((partitions_scanned / partitions_total) * 100, 2) AS scan_percentage
FROM TABLE(INFORMATION_SCHEMA.QUERY_HISTORY())
WHERE query_text LIKE '%store_transactions%WHERE sale_date%'
ORDER BY start_time DESC
LIMIT 1;
```

### Interview Q&A

**Q1: How do you verify if a query successfully pruned micro-partitions?**
**Answer:** Open the Snowflake Query Profile in Snowsight or query the `QUERY_HISTORY()` view. Inspect the metrics `Partitions Scanned` vs `Partitions Total`. Efficient pruning is indicated by `Partitions Scanned` being a small fraction of total partitions.

**Q2: What causes partition pruning to fail on filtered queries?**
**Answer:** Applying scalar functions or expressions to filter columns (e.g., `WHERE TO_CHAR(sale_date, 'YYYY-MM') = '2026-03'`), or querying columns whose min/max ranges overlap across all micro-partitions due to random ingestion ordering.

**Q3: Can pruning occur on columns that are not date or time types?**
**Answer:** Yes. Pruning works on any data type (strings, integers, floats, dates) because Snowflake captures min/max values for every column in every micro-partition.

### Common Pitfalls / Gotchas
- Wrapping filtered columns in functions (e.g., `WHERE UPPER(country) = 'USA'`), which disables optimizer min/max metadata pruning; filter using raw literals or cast constants instead.
- Expecting pruning on very small tables (< 1 GB); small tables fit in 1 or 2 micro-partitions, so pruning yields negligible difference.
- Filtering on highly fragmented columns without clustering keys, leading to full micro-partition scans.

### Quick Recap
- Optimizer skips non-matching micro-partitions before reading data from storage.
- Operates on min/max metadata tracked for all columns in Cloud Services.
- Verified in Query Profile via `Partitions Scanned` vs `Partitions Total`.
- Do not wrap filter columns in scalar functions to preserve pruning.
- Eliminates the need for manual partitioning and traditional database indexes.

---

![Statistics](https://img.shields.io/badge/Statistics_Generation-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 3. Statistics Generation

### Definition
Statistics generation in Snowflake is the automated, zero-overhead collection of data profile metrics during write operations (`INSERT`, `UPDATE`, `COPY INTO`). Unlike traditional databases where DBAs must run manual `ANALYZE` or `UPDATE STATISTICS` commands, Snowflake captures statistics continuously and automatically.

### Why it matters / Real-world use case
In traditional RDBMS systems, stale statistics cause the query optimizer to pick terrible execution plans (e.g., choosing nested loop joins instead of hash joins), bringing production down until DBAs run manual maintenance scripts. In Snowflake, statistics are updated automatically with every micro-partition write, ensuring the optimizer always has 100% accurate cardinality estimates.

### How it works
- **Write-Time Collection:** When a micro-partition is committed, the storage engine computes column metrics and stores them in Cloud Services.
- **Collected Metrics:**
  - Column minimum and maximum values.
  - Number of distinct values (cardinality).
  - Count of NULL values.
  - Total row counts and byte sizes.
- **Cost-Based Optimization:** The optimizer uses accurate distinct counts and sizes to decide join algorithms (Hash Join, Broadcast Join) and join order.

```text
DML Operation (INSERT / COPY INTO)
            |
            v
[Write Immutable Micro-Partition] ──> Compute Metrics on the fly
            |
            v
[Cloud Services Catalog]          ──> Persist Min, Max, Nulls, Distinct Counts
            |
            v
[Cost-Based Query Optimizer]       ──> Chooses optimal Join Order & Prunes Partitions
```

### Example

```sql
-- 1. Query that uses metadata statistics directly without compute
SELECT
    COUNT(*)               AS row_count,
    COUNT(DISTINCT store_country) AS estimated_countries
FROM retail_dw.raw_pos.store_transactions;

-- 2. Inspect table-level column metadata tracked by Cloud Services
SELECT
    column_name,
    data_type,
    is_nullable
FROM retail_dw.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'STORE_TRANSACTIONS';
```

### Interview Q&A

**Q1: How do you update statistics on a table in Snowflake?**
**Answer:** You do not run commands to update statistics. Snowflake generates and updates statistics automatically during data ingestion and DML operations. There is no `ANALYZE TABLE` command in Snowflake.

**Q2: How does Snowflake's query optimizer use column statistics?**
**Answer:** The optimizer uses statistics to estimate intermediate row cardinality, determine partition pruning boundaries, pick the most efficient join type (e.g., Broadcast vs Hash Join), and order multi-table joins.

**Q3: Are statistics stored in the table storage layer or in Cloud Services?**
**Answer:** Statistics are stored in the Cloud Services Layer metadata repository. This is why metadata queries (like `SELECT COUNT(*)`) resolve instantly without waking a Virtual Warehouse.

### Common Pitfalls / Gotchas
- Looking for DBA maintenance commands like `VACUUM` or `ANALYZE TABLE`; they do not exist in Snowflake.
- Assuming statistics are estimated via sampling; Snowflake computes exact min/max, distinct, and null statistics on all micro-partitions upon write.
- Believing that query compilation takes long due to statistics; metadata is cached and optimized for sub-second plan generation.

### Quick Recap
- Statistics are generated automatically during every write operation.
- No manual `ANALYZE` or statistics maintenance scripts exist in Snowflake.
- Captures min/max values, distinct counts, null counts, and row counts.
- Stored in Cloud Services to power cost-based query optimization and partition pruning.
- Enables metadata-only queries to return instantly at zero compute cost.

---

## Day Summary Table

| Topic | One-line takeaway | Interview likelihood |
| :--- | :--- | :---: |
| **Compression Techniques** | Automatic, column-specific compression (60–80% reduction) applied in memory with zero DBA tuning. | High |
| **Pruning Mechanisms** | Optimizer skips non-matching micro-partitions using metadata, eliminating full table scans. | High |
| **Statistics Generation** | Continuous, automatic collection of min/max, distinct, and null metrics during writes without manual `ANALYZE`. | High |
