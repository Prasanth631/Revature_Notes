# 09 — Interview Crash Pack

## How to use this file
Use this only after studying the core files. It is for active recall, rapid revision and mock interviews.

# 1. Highest-Priority Questions

## Python
- Explain Python and why it is used in data engineering.
- List vs tuple vs set vs dictionary.
- `==` vs `is`.
- What is LEGB?
- What are iterators/generators?
- Exception handling and `try/except/finally`.
- Pandas vs PySpark.
- How do you process a large file without loading it all into memory?
- How would you make a Python pipeline idempotent?
- How do you test data-transformation code?

## SQL
- Explain joins with examples.
- WHERE vs HAVING.
- GROUP BY and aggregate functions.
- Subquery vs correlated subquery.
- Primary vs foreign key.
- DELETE vs TRUNCATE vs DROP.
- ACID.
- Isolation levels.
- Indexes.
- Star vs snowflake schema.
- SCD Type 1 vs Type 2.
- How do you detect duplicates?
- How do you find records missing from another table?
- How would you design an incremental load?

## Snowflake
- Explain Snowflake architecture.
- What is a virtual warehouse?
- What are micro-partitions?
- What is pruning?
- When would you cluster?
- How does Snowflake load CSV/JSON/Parquet?
- How do you troubleshoot a slow query?
- How do you reduce Snowflake cost?
- What are stages?
- How do you work with semi-structured data?
- Time-based recovery/retention concepts.
- Replication and failover.
- RBAC/masking/RLS.
- UDF vs stored procedure.
- Snowpark.
- dbt.

## PySpark
- RDD vs DataFrame.
- Transformation vs action.
- Lazy evaluation.
- Partition and shuffle.
- Narrow vs wide transformation.
- Join optimization.
- Data skew.
- Cache/persist.
- Spark memory problems.
- Window functions.
- Structured Streaming.
- Watermarking.

## Fabric
- What is Fabric?
- OneLake.
- Lakehouse.
- Bronze/Silver/Gold.
- Data Factory pipelines.
- Copy Activity.
- Dataflows Gen2.
- Warehouse.
- Power BI.
- RLS.
- Lineage/monitoring.
- Deployment/CI-CD.

# 2. Rapid Difference Questions

| Question | Short answer |
|---|---|
| List vs tuple | Mutable vs immutable |
| Set vs list | Unique/unordered membership collection vs ordered mutable sequence |
| `==` vs `is` | Value equality vs identity |
| ETL vs ELT | Transform before load vs load then transform |
| OLTP vs OLAP | Operational transactions vs analytics |
| DWH vs data lake | Curated analytics store vs flexible raw/varied storage |
| Star vs snowflake schema | Simpler denormalized dimensions vs more normalized dimensions |
| SCD1 vs SCD2 | Overwrite vs preserve history |
| RDD vs DataFrame | Lower-level distributed abstraction vs structured optimized abstraction |
| Transformation vs action | Defines computation vs triggers result/execution |
| Git fetch vs pull | Download updates vs download + integrate |
| IaaS/PaaS/SaaS | Infrastructure/platform/software service |

# 3. Scenario Answer Formula

For almost any data-engineering scenario:

**1. Clarify the requirement**  
**2. Identify source and target**  
**3. Define data grain/schema**  
**4. Validate data quality**  
**5. Transform**  
**6. Load/write safely**  
**7. Make it idempotent**  
**8. Monitor/log**  
**9. Handle failure/retry**  
**10. Optimize cost/performance**

# 4. Coding Areas

### Python
- strings
- lists/dictionaries
- frequency counting
- duplicates
- palindrome
- anagrams
- file processing
- JSON parsing
- exception handling
- OOP

### SQL
- joins
- top-N
- second-highest salary
- duplicates
- missing records
- running totals
- ranking/window functions
- date-based aggregation
- SCD2 logic
- incremental MERGE-style logic

### PySpark
- DataFrame creation
- select/filter
- withColumn
- groupBy/agg
- joins
- windows
- deduplication
- JSON/Parquet
- partitioning

# 5. Mock Interview

### Round 1 — Fundamentals
1. Tell me about yourself.
2. Explain SDLC.
3. Agile vs Waterfall.
4. Git workflow.
5. Explain Python.
6. Explain SQL joins.

### Round 2 — Data Engineering
7. ETL vs ELT.
8. DWH vs data lake.
9. Star schema.
10. SCD2.
11. Incremental loading.
12. Data quality.

### Round 3 — Technical Deep Dive
13. Explain PySpark execution.
14. Explain Snowflake architecture.
15. Troubleshoot a slow Snowflake query.
16. Explain Snowflake cost optimization.
17. Explain Fabric medallion architecture.
18. Explain Power BI RLS.

### Round 4 — Projects
19. Explain P1.
20. Explain P2.
21. What was your contribution?
22. What was the hardest issue?
23. How did you validate data?
24. How would you redesign the pipeline?

# 6. Final 30-Minute Revision

Read:
1. Python data-engineering section
2. SQL data-engineering section
3. Snowflake architecture/performance/security
4. P1/P2 architecture and your contribution
5. Rapid differences above

Then answer the mock questions aloud.
