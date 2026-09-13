# 01 — Curriculum Master Checklist

## How to use
Use this file only as a coverage checklist. The actual explanations are in files 02–08.

## Core areas
- [ ] SDLC / Waterfall / Agile / Scrum / Story Points
- [ ] Git / VCS / CVCS / DVCS / branching / merge / push / pull
- [ ] Cloud fundamentals / IaaS / PaaS / SaaS / AWS / Azure / GCP
- [ ] Data types / files / OLTP / OLAP / DWH / Lake / ODS / Data Mart
- [ ] Data modeling / dimensional modeling / star / snowflake / SCD
- [ ] ETL / ELT / batch / incremental processing
- [ ] Python — all curriculum topics
- [ ] SQL / RDBMS — all curriculum topics
- [ ] PySpark / Spark — all curriculum topics
- [ ] Scala — all curriculum topics
- [ ] Snowflake — all curriculum topics
- [ ] Snowpark / dbt / API / RBAC / masking / RLS / audit
- [ ] Microsoft Fabric — all curriculum topics
- [ ] Power BI / governance / lineage / RLS / CI/CD
- [ ] Project 1
- [ ] Project 2

## Interview emphasis
### Must-master
- [ ] Python
- [ ] SQL
- [ ] Snowflake
- [ ] PySpark
- [ ] P1/P2 project explanation

### Strong working knowledge
- [ ] Fabric
- [ ] Cloud/data engineering
- [ ] Git
- [ ] SDLC

### Supporting skill
- [ ] Scala

## Existing detailed curriculum source
# Curriculum Master Checklist

This is the master map based directly on the uploaded `Copy of Revature Persistent SnowFlake MsFabric.docx`. The curriculum contains 300+ individual topic bullets across SDLC/Git, Python, SQL, cloud/data engineering, Spark/PySpark, Scala, Snowflake, Snowpark/dbt, APIs/security and Fabric. The source curriculum also points to the Disaster-Affected-Region-Tracker-Analysis project. 

## A. SDLC / Git
- [ ] Introduction to SDLC
- [ ] Waterfall
- [ ] Agile
- [ ] Agile vs Waterfall
- [ ] Story Pointing
- [ ] Scrum Ceremonies
- [ ] Source Control Management
- [ ] Git, VCS, CVCS, DVCS
- [ ] Initializing a repository
- [ ] Pushing to remote
- [ ] Git commit
- [ ] branch
- [ ] Merge
- [ ] Push
- [ ] Pull
- [ ] Git exercises

See: `02_SDLC_GIT_DETAILED.md`

## B. Python
- [ ] Full-stack overview
- [ ] interpreter vs compiler
- [ ] REPL/Jupyter
- [ ] what is Python & why Python
- [ ] syntax/comments
- [ ] variables/data types/operators
- [ ] input/output
- [ ] namespaces
- [ ] strings
- [ ] sets
- [ ] casting
- [ ] booleans
- [ ] lists/tuples/range
- [ ] binary type
- [ ] None type
- [ ] dictionaries/numbers/datetime
- [ ] if/else, for, while
- [ ] functions, arrays, lambda
- [ ] classes/objects
- [ ] inheritance, abstraction, polymorphism, encapsulation
- [ ] iterators, scope, modules
- [ ] logging
- [ ] JSON, regex
- [ ] pip
- [ ] pylint
- [ ] errors/exceptions/try-except
- [ ] file handling
- [ ] read/write/create/delete
- [ ] NumPy/Matplotlib
- [ ] Pytest
- [ ] Pandas
- [ ] Counter/namedtuple/OrderedDict

See: `03_PYTHON_DETAILED.md`

## C. SQL / RDBMS
- [ ] SQL and RDBMS
- [ ] schema/table structure/data types
- [ ] DDL/DML/DQL/DCL/TCL
- [ ] queries
- [ ] primary/composite/foreign/unique/alternate keys
- [ ] referential integrity
- [ ] normalization/multiplicity/consistency
- [ ] CREATE/DROP/TRUNCATE
- [ ] auto-increment
- [ ] CHECK/DEFAULT/CASCADE
- [ ] aggregate/scalar functions
- [ ] clauses
- [ ] subqueries
- [ ] joins and aliases
- [ ] cross/inner/left/right/outer/equi/theta joins
- [ ] CID properties
- [ ] transactions/ACID
- [ ] CRUD
- [ ] commit/rollback/isolation
- [ ] sequences/indexes/triggers
- [ ] views/stored procedures/UDFs
- [ ] schema design
- [ ] model types

See: `04_SQL_RDBMS_DETAILED.md`

## D. Cloud + Data Engineering
- [ ] service types
- [ ] IaaS/PaaS/SaaS
- [ ] AWS/Azure/GCP overview
- [ ] pricing/components/architecture/benefits/challenges
- [ ] structured/semi-structured/unstructured
- [ ] file types
- [ ] data-store vendors
- [ ] OLTP vs OLAP
- [ ] DWH vs Data Lake
- [ ] DWH architecture
- [ ] ODS
- [ ] data mart
- [ ] cleansing
- [ ] denormalization
- [ ] conceptual/logical/physical modeling
- [ ] dimensional modeling
- [ ] BigQuery/Snowflake/Redshift
- [ ] star/snowflake schema
- [ ] SCD types
- [ ] ETL/ELT
- [ ] building ETL/ELT processes

See: `05_CLOUD_DATA_ENGINEERING_DETAILED.md`

## E. Spark / PySpark
- [ ] Spark ecosystem/setup
- [ ] Hadoop vs Spark
- [ ] local/cluster mode
- [ ] actions/transformations
- [ ] RDDs and operations
- [ ] key-value RDDs
- [ ] RDD loading/saving
- [ ] shared variables
- [ ] cluster manager
- [ ] spark-submit
- [ ] caching
- [ ] memory tuning
- [ ] troubleshooting
- [ ] DataFrames
- [ ] Datasets
- [ ] aggregates
- [ ] SparkSession
- [ ] JSON/Parquet
- [ ] complex/advanced transformations
- [ ] windows
- [ ] real-time processing
- [ ] Event Hubs
- [ ] windowing/watermarking/state
- [ ] streaming best practices

See: `06_PYSPARK_FULL_QA.md`

## F. Scala
- [ ] setup
- [ ] functional programming
- [ ] variables/values
- [ ] types
- [ ] conditions/loops
- [ ] classes/objects/structure
- [ ] expressions/statements
- [ ] tuples
- [ ] pure/impure functions
- [ ] higher-order functions
- [ ] exceptions
- [ ] List/Map/Set

See: `08_SCALA_FULL_QA.md`

## G. Snowflake
- [ ] introduction/setup
- [ ] architecture
- [ ] virtual warehouses
- [ ] micro-partitioning
- [ ] physical storage
- [ ] clustering
- [ ] bulk loading
- [ ] CSV/JSON/Parquet/Avro/ORC
- [ ] staging/error handling
- [ ] large-data performance
- [ ] tables/views
- [ ] compression
- [ ] pruning/statistics
- [ ] auto-scaling/multi-cluster
- [ ] workload management/resource monitoring
- [ ] cost optimization
- [ ] execution plans/profiling
- [ ] result/metadata/warehouse cache
- [ ] semi-structured data
- [ ] replication/failover/DR
- [ ] retention
- [ ] SQL/JS/Python UDFs
- [ ] data sharing
- [ ] Python/SQL stored procedures
- [ ] custom business logic
- [ ] Snowpark
- [ ] DataFrames/UDFs/external libraries
- [ ] dbt fundamentals/advanced overview
- [ ] models/materializations/sources/seeds/testing/docs
- [ ] Snowflake integration
- [ ] incremental models/snapshots
- [ ] error handling/monitoring
- [ ] tasks/workflows
- [ ] Python connector
- [ ] REST API
- [ ] key-pair/OAuth
- [ ] users/RBAC
- [ ] masking/RLS
- [ ] audit/monitoring

See: `09_SNOWFLAKE_FULL_QA.md`, `10_SNOWFLAKE_CODES_FULL.md`, `11_SNOWFLAKE_SCENARIOS.md`

## H. Microsoft Fabric
- [ ] Fabric introduction
- [ ] evolution from Synapse/Power BI
- [ ] workloads
- [ ] Data Engineering
- [ ] Data Factory
- [ ] Data Science
- [ ] Warehouse
- [ ] Real-Time Analytics
- [ ] SaaS model
- [ ] Lakehouse vs Warehouse vs Datamart
- [ ] workspace
- [ ] OneLake
- [ ] first Lakehouse
- [ ] upload dataset
- [ ] Lakehouse architecture
- [ ] Files/Delta tables
- [ ] Spark in Fabric
- [ ] notebooks/PySpark
- [ ] DataFrames
- [ ] Bronze/Silver/Gold
- [ ] notebook/Lakehouse/transform labs
- [ ] Bronze → Silver pipeline
- [ ] Data Factory
- [ ] pipelines/activities
- [ ] batch/incremental
- [ ] Copy Activity/Dataflows Gen2
- [ ] parameterization/scheduling
- [ ] ETL pipeline
- [ ] Warehouse
- [ ] SQL endpoint
- [ ] T-SQL
- [ ] performance
- [ ] star schema/facts/dimensions
- [ ] Warehouse lab
- [ ] Gold loading/analytical queries
- [ ] Power BI
- [ ] dashboards/reports
- [ ] real-time analytics/streaming
- [ ] governance RLS/CLS/lineage/monitoring
- [ ] CI/CD/deployment pipelines
- [ ] Power BI connection/dashboard/RLS
- [ ] pipeline monitoring

See: `13_FABRIC_FULL_QA.md`, `14_FABRIC_HANDS_ON.md`, `15_POWERBI_GOVERNANCE_CICD.md`
