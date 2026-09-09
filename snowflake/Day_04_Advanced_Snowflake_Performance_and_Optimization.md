# Day 4: Advanced Snowflake Performance & Optimization

![Snowflake](https://img.shields.io/badge/Snowflake-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

---

![Auto Scaling](https://img.shields.io/badge/Auto_Scaling_%26_Multi_Cluster-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 1. Auto-Scaling and Multi-Cluster Warehouses

### Definition
Multi-Cluster Warehouses (available in Enterprise Edition and above) enable Snowflake to automatically allocate and shut down additional compute clusters of the same size to manage fluctuating query concurrency without queuing.

### Why it matters / Real-world use case
At 9:00 AM on Monday, 300 business analysts open corporate Power BI dashboards simultaneously. A standard single-cluster warehouse would queue 80% of queries, causing severe latency. A multi-cluster warehouse configured with `MIN_CLUSTER_COUNT = 1` and `MAX_CLUSTER_COUNT = 5` automatically spins up 4 additional clusters to absorb the concurrency spike, then scales back down to 1 cluster by 10:30 AM.

### How it works
- **Scaling Policies:**
  - `STANDARD`: Prioritizes user experience; launches an additional cluster immediately when a query enters the queue.
  - `ECONOMY`: Prioritizes cost savings; launches a new cluster only if the system estimates there is enough sustained query load for at least 6 minutes.
- **Auto-Scaling Mechanics:** Monitors concurrency and query execution queues; spins up nodes in seconds and shuts down clusters after 2–3 consecutive checks without queuing.

```text
[Incoming Queries Surge] ──> Queue Detected
                                   |
              +--------------------+--------------------+
              | STANDARD Policy                         | ECONOMY Policy
              v                                         v
   Spin up Cluster 2 IMMEDIATELY              Wait up to 6 min of sustained load
```

### Example

```sql
-- Create an auto-scaling multi-cluster warehouse
CREATE OR REPLACE WAREHOUSE mc_analytics_wh WITH
    WAREHOUSE_SIZE = 'MEDIUM'
    MIN_CLUSTER_COUNT = 1
    MAX_CLUSTER_COUNT = 5
    SCALING_POLICY = 'STANDARD'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE
    COMMENT = 'Auto-scaling cluster for concurrent BI workloads';
```

### Interview Q&A

**Q1: What problem does a Multi-Cluster Warehouse solve that Scale-Up cannot?**
**Answer:** Scale-Up (increasing T-shirt size) increases processing power for a single complex query but does not solve query concurrency bottlenecks. Multi-Cluster Warehouses (Scale-Out) allocate additional clusters to execute many independent queries simultaneously, completely eliminating query queuing.

**Q2: What is the difference between Maximized and Auto-Scale modes?**
**Answer:** Maximized mode has `MIN_CLUSTER_COUNT` equal to `MAX_CLUSTER_COUNT` (e.g., min 3, max 3), running all clusters continuously. Auto-Scale mode has `MIN_CLUSTER_COUNT` less than `MAX_CLUSTER_COUNT` (e.g., min 1, max 5), dynamically starting and stopping clusters based on query load.

**Q3: Does Auto-Scaling require manual intervention or external orchestrators?**
**Answer:** No. Snowflake's Cloud Services layer monitors queue depth natively and orchestrates cluster provisioning and de-provisioning automatically based on the chosen scaling policy.

### Common Pitfalls / Gotchas
- Setting `MIN_CLUSTER_COUNT` equal to `MAX_CLUSTER_COUNT` unintentionally, which runs all clusters 24/7 and dramatically inflates credit bills.
- Choosing `STANDARD` policy for non-urgent background batch workloads where `ECONOMY` would save significant cloud budget.
- Confusing warehouse sizing (T-shirt size) with cluster count; size controls vertical node power, while cluster count controls horizontal concurrency.

### Quick Recap
- Enterprise Edition feature for horizontal auto-scaling.
- Eliminates query queuing during peak concurrent user traffic.
- `STANDARD` policy prioritizes latency; `ECONOMY` policy conserves credits.
- Dynamic cluster startup in seconds; automated shutdown when queues clear.
- Independent clusters share the same underlying storage without data duplication.

---

![Workload Management](https://img.shields.io/badge/Workload_Management-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 2. Workload Management and Resource Monitoring

### Definition
Workload management in Snowflake involves isolating distinct organizational workloads onto dedicated virtual warehouses and using Resource Monitors to set strict credit quotas and automated suspension thresholds.

### Why it matters / Real-world use case
A junior data scientist accidentally writes a Cartesian join query on an unsupervised warehouse that could run indefinitely. A configured Resource Monitor triggers an automated alert at 75% credit quota, sends a warning email at 90%, and suspends the warehouse immediately at 100%, preventing thousands of dollars in unexpected cloud overage charges.

### How it works
- **Dedicated Workload Pools:** Separate compute clusters for `ETL_WH`, `BI_WH`, `DEV_WH`, and `ML_WH` guarantee that heavy data science experiments cannot starve business-critical executive dashboards.
- **Resource Monitors:** Created at the Account level or Warehouse level to track monthly, weekly, or daily credit consumption.
- **Trigger Actions:** `NOTIFY` (sends email alert), `SUSPEND` (allows running queries to finish but blocks new queries), and `SUSPEND_IMMEDIATE` (kills running queries immediately).

```text
[Monthly Credit Quota: 1000 Credits]
  ├── 75% Used (750 Credits)  ──> NOTIFY Administrator via Email
  ├── 90% Used (900 Credits)  ──> NOTIFY + Warning
  └── 100% Used (1000 Credits) ──> SUSPEND_IMMEDIATE (Abort all queries, halt billing)
```

### Example

```sql
-- 1. Create a Resource Monitor with tiered enforcement
CREATE OR REPLACE RESOURCE MONITOR dev_cost_monitor WITH
    CREDIT_QUOTA = 500
    FREQUENCY = MONTHLY
    START_TIMESTAMP = IMMEDIATELY
    TRIGGERS
        ON 75 PERCENT DO NOTIFY
        ON 90 PERCENT DO NOTIFY
        ON 100 PERCENT DO SUSPEND
        ON 110 PERCENT DO SUSPEND_IMMEDIATE;

-- 2. Assign the Resource Monitor to a development warehouse
ALTER WAREHOUSE dev_wh SET RESOURCE_MONITOR = dev_cost_monitor;
```

### Interview Q&A

**Q1: What is the difference between SUSPEND and SUSPEND_IMMEDIATE in a Resource Monitor?**
**Answer:** `SUSPEND` prevents any new queries from starting on the warehouse but allows all currently running queries to finish. `SUSPEND_IMMEDIATE` cancels all actively executing queries immediately and shuts down the warehouse compute nodes on the spot.

**Q2: Can a Resource Monitor be assigned to multiple warehouses?**
**Answer:** Yes. A Resource Monitor can monitor an individual warehouse, a group of warehouses, or the entire Snowflake account at the global level.

**Q3: Who can create and manage Resource Monitors?**
**Answer:** Only users with the `ACCOUNTADMIN` role can create and modify Resource Monitors, though privileges can be granted to specific administrative roles.

### Common Pitfalls / Gotchas
- Setting `SUSPEND_IMMEDIATE` on production ETL warehouses during critical SLA batch processing windows, causing pipeline failures.
- Not defining email alert recipients in Snowsight notification preferences, causing notification triggers to fire without anyone receiving alerts.
- Believing Resource Monitors monitor storage; Resource Monitors track **compute credits only**, not cloud storage bytes.

### Quick Recap
- Workload isolation guarantees dedicated compute per business function.
- Resource Monitors enforce credit quotas at Account or Warehouse level.
- Actions: `NOTIFY`, `SUSPEND` (finish existing), `SUSPEND_IMMEDIATE` (kill all).
- Created and managed exclusively by `ACCOUNTADMIN`.
- Tracks compute credit usage, not storage volume.

---

![Cost Optimization](https://img.shields.io/badge/Cost_Optimization-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 3. Cost Optimization Techniques

### Definition
Cost optimization in Snowflake is the continuous practice of minimizing compute credit and cloud storage expenditure through architectural governance, warehouse lifecycle tuning, caching, and storage lifecycle management.

### Why it matters / Real-world use case
An enterprise was spending $40,000 monthly on Snowflake. By implementing 60-second auto-suspend timeouts, converting raw staging tables to `TRANSIENT` to eliminate Fail-safe costs, and sizing development warehouses down from Large to X-Small, the engineering team reduced monthly spend to $14,000 with zero impact on query performance.

### How it works
- **Compute Optimization:**
  - Set `AUTO_SUSPEND` to 60 seconds on ETL/dev warehouses and 120–300 seconds on BI warehouses.
  - Set `STATEMENT_TIMEOUT_IN_SECONDS` to automatically abort runaway queries.
  - Right-size warehouses: start small (X-Small) and only scale up when data volume demands it.
- **Storage Optimization:**
  - Use `TRANSIENT` or `TEMPORARY` tables for staging to eliminate 7-day Fail-safe storage costs.
  - Configure `DATA_RETENTION_TIME_IN_DAYS = 1` on non-production databases to reduce Time Travel storage.
  - Monitor unused tables and external stages with `TABLE_STORAGE_METRICS`.

| Optimization Dimension | Tactical Action | Cost Benefit |
| :--- | :--- | :--- |
| **Idle Compute** | Set `AUTO_SUSPEND = 60` | Halts billing after 1 minute of inactivity |
| **Runaway Queries** | Set `STATEMENT_TIMEOUT_IN_SECONDS = 3600` | Aborts queries running longer than 1 hour |
| **ETL Staging Storage** | Use `TRANSIENT` tables | Eliminates 7 days of secondary Fail-safe storage |
| **Dev Environments** | Set retention to 0 or 1 day | Minimizes historical Time Travel storage fees |

### Example

```sql
-- Set aggressive cost boundaries on development warehouse
ALTER WAREHOUSE dev_wh SET
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE
    STATEMENT_TIMEOUT_IN_SECONDS = 1800  -- Automatically cancel queries running over 30 mins
    STATEMENT_QUEUED_TIMEOUT_IN_SECONDS = 300; -- Cancel queries queued longer than 5 mins
```

### Interview Q&A

**Q1: What are the three primary cost components in a Snowflake bill?**
**Answer:** Compute costs (Virtual Warehouses, Cloud Services, and serverless features like Snowpipe and Automatic Clustering), Storage costs (active micro-partitions, Time Travel, and Fail-safe), and Data Transfer costs (egress across regions or cloud providers).

**Q2: How does Cloud Services billing work?**
**Answer:** Cloud Services usage is free up to 10% of the daily compute warehouse credits used by the account. Snowflake only bills for Cloud Services if its daily credit usage exceeds 10% of total warehouse compute credits.

**Q3: How do Transient tables reduce storage costs?**
**Answer:** Transient tables have a maximum Time Travel period of 1 day and **zero Fail-safe**. Permanent tables maintain a non-configurable 7-day Fail-safe period, which charges for historical micro-partitions even after tables are truncated or dropped.

### Common Pitfalls / Gotchas
- Leaving `AUTO_SUSPEND` disabled (`NULL`), allowing idle warehouses to consume credits continuously 24/7.
- Performing massive row-by-row updates in production instead of batch merges, generating massive Time Travel storage churn.
- Running multi-terabyte table scans in development environments using `ACCOUNTADMIN` or unconstrained warehouse sizes.

### Quick Recap
- Set `AUTO_SUSPEND` to 60 seconds on development and ETL warehouses.
- Set query timeout parameters (`STATEMENT_TIMEOUT_IN_SECONDS`) to abort runaway queries.
- Use `TRANSIENT` tables for staging to avoid 7-day Fail-safe storage charges.
- Cloud Services is free up to 10% of daily warehouse compute credit consumption.
- Right-size warehouses: scale up only for demonstrable query complexity.

---

![Execution Plans](https://img.shields.io/badge/Execution_Plans-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 4. Query Execution Plans

### Definition
A Query Execution Plan is the compiled, step-by-step physical execution tree generated by the Cloud Services Cost-Based Optimizer that outlines how a SQL query will be processed, pruned, joined, aggregated, and returned.

### Why it matters / Real-world use case
A complex financial reporting query takes 15 minutes to run. By generating an execution plan using `EXPLAIN`, a data engineer discovers that a join condition was written without an equality predicate, producing an accidental Cartesian product (Cross Join) that evaluated 50 billion intermediate rows instead of 1 million.

### How it works
- **Compilation Phase:** Cloud Services parses SQL, validates schema objects, evaluates permissions, and consults micro-partition metadata.
- **Cost-Based Optimization:** Chooses join algorithms (Hash Join, Merge Join, Broadcast Join), determines join order, and prunes partitions.
- **EXPLAIN Command:** Displays the execution tree and estimated partitions/bytes without executing the query or waking a compute warehouse.

```text
Result Output
      ^
      |
[Aggregate / Group By]
      ^
      |
[Hash Join (Orders + Customers)]
     / \
    /   \
[Scan Orders]  [Scan Customers]
(Pruned: 98%)   (Pruned: 100%)
```

### Example

```sql
-- Generate logical and physical execution plan WITHOUT executing the query
EXPLAIN
SELECT
    c.customer_name,
    SUM(o.order_amount) AS total_spent
FROM retail_dw.raw_pos.customer_orders o
JOIN retail_dw.raw_pos.dim_customers c
    ON o.customer_id = c.customer_id
WHERE o.order_date >= '2026-03-01'
GROUP BY c.customer_name;
```

### Interview Q&A

**Q1: Does running the EXPLAIN command consume Virtual Warehouse credits?**
**Answer:** No. `EXPLAIN` runs entirely within the Cloud Services Layer. It evaluates metadata and compiles the execution plan without spinning up or charging a Virtual Warehouse.

**Q2: What is a Cartesian Product in an execution plan and why is it dangerous?**
**Answer:** A Cartesian Product (Cross Join) occurs when tables are joined without matching equality keys, causing every row in table A to join with every row in table B ($M \times N$ rows). It causes massive memory explosion, disk spilling, and query timeouts.

**Q3: What join algorithm does Snowflake typically select for joining large fact tables to smaller dimension tables?**
**Answer:** A Broadcast Hash Join, where the smaller dimension table is distributed and loaded into the memory of every compute node, and the large fact table is streamed through without network reshuffling.

### Common Pitfalls / Gotchas
- Relying on `EXPLAIN` estimates for final performance; `EXPLAIN` gives estimates, while Query Profile gives exact runtime metrics.
- Overlooking join key data type mismatches (e.g., joining `VARCHAR` to `NUMBER`), which disables join pruning and forces full table scans.
- Confusing query compilation time with query execution time; complex views with dozens of layers increase compilation time in Cloud Services.

### Quick Recap
- Generated by Cloud Services Cost-Based Optimizer.
- Evaluates partition pruning, join ordering, and aggregation strategies.
- `EXPLAIN` command displays the plan without running the query or consuming warehouse credits.
- Watch for Cartesian Joins and non-equality join operators.
- Broadcast joins are selected for large-to-small table joins; Hash joins for large-to-large joins.

---

![Performance Profiling](https://img.shields.io/badge/Performance_Profiling-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 5. Performance Profiling

### Definition
Performance profiling is the diagnostic analysis of executed queries using the graphical **Snowflake Query Profile** in Snowsight to identify execution bottlenecks such as disk spilling, poor partition pruning, network data skew, and resource queuing.

### Why it matters / Real-world use case
A daily batch query starts failing with out-of-memory errors after data volumes double. Profiling the query reveals heavy "Remote Disk Spilling" (writing 200 GB of intermediate state to S3). Sizing the warehouse up from Medium to X-Large gives the cluster enough physical RAM to complete the operation in-memory, cutting runtime from 45 minutes to 3 minutes.

### How it works
- **Query Profile Interface:** Visualizes execution nodes (TableScan, Join, Aggregate, Filter, Sort) and percentage of total runtime spent per operator.
- **Key Diagnostic Metrics:**
  - **Partitions Scanned vs Total:** Indicates pruning efficiency.
  - **Spilling to Local Storage:** Occurs when node RAM is exhausted and data spills to local NVMe SSDs.
  - **Spilling to Remote Storage:** Occurs when local SSDs are full and data spills to cloud object storage (Amazon S3 / Azure Blob), causing severe I/O degradation.
  - **Bytes Sent Over Network:** Measures data reshuffling between nodes during joins.

```text
[Operator Tree]
TableScan (4%) ──> Filter (1%) ──> HashJoin (85% Bottleneck) ──> Aggregate (10%)
                                         |
                       [Diagnostics: Remote Disk Spilling Detected!]
                       -> Action: Scale Up Warehouse to increase RAM
```

### Example

```sql
-- Find queries with heavy disk spilling from query history
SELECT
    query_id,
    query_text,
    warehouse_size,
    total_elapsed_time / 1000 AS elapsed_seconds,
    bytes_spilled_to_local_storage / (1024 * 1024)  AS local_spill_mb,
    bytes_spilled_to_remote_storage / (1024 * 1024) AS remote_spill_mb
FROM TABLE(INFORMATION_SCHEMA.QUERY_HISTORY())
WHERE bytes_spilled_to_remote_storage > 0
ORDER BY elapsed_seconds DESC
LIMIT 5;
```

### Interview Q&A

**Q1: What is the difference between Local Disk Spilling and Remote Disk Spilling?**
**Answer:** Local spilling happens when intermediate query memory exceeds physical RAM and writes to the warehouse node's local NVMe SSD (minor performance penalty). Remote spilling happens when local SSD capacity is exhausted and data spills to remote cloud object storage (severe performance penalty).

**Q2: How do you resolve Remote Disk Spilling in a Snowflake query?**
**Answer:** Scale up the Virtual Warehouse to a larger T-shirt size to provide more total RAM and local SSD per node, or rewrite the query to filter data earlier and eliminate unnecessary columns and massive Cartesian joins.

**Q3: What does a high "Queuing Time" indicate in Query Profile?**
**Answer:** It indicates that the Virtual Warehouse does not have enough compute resources or clusters to run the query because other concurrent queries are occupying all available threads. Resolve by enabling Multi-Cluster Auto-Scaling (Scale-Out).

### Common Pitfalls / Gotchas
- Addressing remote disk spilling by scaling out (adding clusters); scale-out adds clusters for concurrency, but only **scale-up** provides larger nodes with more RAM to fix spilling.
- Ignoring data skew; if one node processes 90% of the data while others remain idle, the join key is severely skewed.
- Failing to check the "Most Expensive Nodes" pane in Query Profile, which immediately highlights the exact operator consuming execution time.

### Quick Recap
- Graphical diagnostic tool in Snowsight under Query History.
- Shows exact time spent on TableScan, Joins, Aggregates, and Sorting.
- Local spilling = spilled to local node SSD; Remote spilling = spilled to S3/Blob.
- Fix remote spilling by scaling UP (larger warehouse size with more RAM).
- Fix query queuing by scaling OUT (adding clusters via Multi-Cluster Warehouses).

---

![Cache Layers](https://img.shields.io/badge/Cache_Layers-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)

## 6. Cache Layers

### Definition
Snowflake features a 3-tier caching architecture (Result Cache, Warehouse Local Cache, and Metadata Cache) designed to accelerate query execution, maximize throughput, and eliminate unnecessary compute credit consumption.

### Why it matters / Real-world use case
Every Monday morning, 50 executives open an executive KPI dashboard with identical queries. The first executive's query executes on the Virtual Warehouse and caches the result. The remaining 49 executives receive instantaneous (sub-second) responses directly from the Cloud Services Result Cache at zero warehouse compute cost, allowing the warehouse to auto-suspend immediately.

### How it works
- **1. Result Cache (Cloud Services Layer):**
  - Holds the exact tabular results of previously executed queries for **24 hours**.
  - Serves identical queries instantly with **zero compute credits** and zero active warehouse requirement.
  - 24-hour retention resets every time the query is re-executed (up to 31 days total), provided underlying data has not changed.
- **2. Warehouse Local Cache / Data Cache (Compute Layer):**
  - Caches raw columnar micro-partition files on the local NVMe SSDs and memory of the active warehouse nodes.
  - Accelerates subsequent queries that filter or scan the same tables. Dropped when the warehouse suspends.
- **3. Metadata Cache (Cloud Services Layer):**
  - Maintains micro-partition statistics (min/max boundaries, row counts, null counts) in Cloud Services.
  - Answers metadata-only queries (`COUNT(*)`, `MIN()`, `MAX()`) instantly with zero warehouse compute.

```text
Query Request
      |
      v
[1. Result Cache (Cloud Services)]     ──> Exact Match & Data Unchanged? ──> Return in 100ms (0 Credits)
      | (Cache Miss)
      v
[2. Metadata Cache (Cloud Services)]   ──> Metadata Query (COUNT)?       ──> Return in 200ms (0 Credits)
      | (Requires Data Scan)
      v
[3. Warehouse Local SSD Cache (Nodes)] ──> Micro-Partitions Cached?       ──> Return Fast (Local SSD Read)
      | (Cache Miss)
      v
[Central Cloud Storage (S3/Blob/GCS)]  ──> Pull Raw Micro-Partitions      ──> Standard Execution
```

### Example

```sql
-- Step 1: Execute query (Scans tables, caches micro-partitions on warehouse local SSD)
SELECT store_country, SUM(sale_amount)
FROM retail_dw.raw_pos.store_transactions
GROUP BY store_country;

-- Step 2: Suspend warehouse explicitly to prove Result Cache operates without compute
ALTER WAREHOUSE dev_wh SUSPEND;

-- Step 3: Run IDENTICAL query; returns instantly from Result Cache at 0 credits!
SELECT store_country, SUM(sale_amount)
FROM retail_dw.raw_pos.store_transactions
GROUP BY store_country;

-- Step 4: Temporarily disable Result Cache to test raw query performance during tuning
ALTER SESSION SET USE_CACHED_RESULT = FALSE;
```

### Interview Q&A

**Q1: What are the conditions required for Snowflake to reuse the Result Cache?**
**Answer:** The query SQL syntax must be identical, the underlying table data must not have changed, the query must not include non-deterministic functions (e.g., `CURRENT_TIMESTAMP()`, `RANDOM()`), and the user must have appropriate table access permissions.

**Q2: What happens to the Warehouse Local SSD Cache when a warehouse suspends?**
**Answer:** The local SSD cache is completely erased when the warehouse suspends because the underlying cloud virtual machine nodes are de-provisioned and released.

**Q3: How do you disable the Result Cache for query performance benchmarking?**
**Answer:** Execute `ALTER SESSION SET USE_CACHED_RESULT = FALSE;`. This forces Snowflake to bypass the Result Cache and execute the query against the warehouse to measure true execution speed.

### Common Pitfalls / Gotchas
- Benchmarking query performance without disabling `USE_CACHED_RESULT`; seeing a 100-millisecond response time and incorrectly assuming the query was optimized when it only hit the Result Cache.
- Adding non-deterministic functions like `CURRENT_TIMESTAMP()` in `WHERE` clauses, which invalidates and disables the Result Cache.
- Setting `AUTO_SUSPEND` too low on high-frequency BI warehouses (e.g., 20 seconds), causing the warehouse to repeatedly suspend and wipe out its valuable local SSD cache.

### Quick Recap
- Three caching layers: Result Cache, Metadata Cache, and Warehouse Local Cache.
- Result Cache lives in Cloud Services, lasts 24 hours, and costs zero compute credits.
- Metadata Cache answers count and boundary queries without a warehouse.
- Warehouse Local Cache lives on node SSDs and is wiped upon warehouse suspension.
- Use `ALTER SESSION SET USE_CACHED_RESULT = FALSE` during performance testing.

---

## Day Summary Table

| Topic | One-line takeaway | Interview likelihood |
| :--- | :--- | :---: |
| **Auto-Scaling & Multi-Cluster** | Scales out clusters horizontally to eliminate query queuing during peak concurrent user traffic. | High |
| **Workload Management** | Isolates compute by business domain; Resource Monitors enforce credit quotas and auto-suspension. | High |
| **Cost Optimization** | Set aggressive auto-suspend (60s), query timeouts, and use Transient tables to avoid Fail-safe costs. | High |
| **Query Execution Plans** | `EXPLAIN` visualizes join algorithms, partition pruning, and execution cost at zero compute credit charge. | Medium |
| **Performance Profiling** | Query Profile diagnoses execution bottlenecks; local/remote spilling requires vertical warehouse scale-up. | High |
| **Cache Layers** | 3-tier caching (Result, Metadata, Local SSD); Result Cache serves identical queries in 24h at 0 credits. | High |
