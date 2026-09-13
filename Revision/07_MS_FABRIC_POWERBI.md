# 07 — Microsoft Fabric & Power BI

## Part A — Curriculum Notes

### Fabric
- Fabric is a unified analytics environment covering data engineering, integration, warehousing, real-time analytics and BI.
- Know workspaces, OneLake, Lakehouse, Files, Delta tables, Spark/notebooks and the medallion Bronze → Silver → Gold pattern.
- Know Data Factory pipelines, Copy Activity, Dataflows Gen2, parameters, scheduling and incremental loading.
- Know Warehouse, SQL endpoint/T-SQL, dimensional modeling and analytical querying.
- Know Power BI integration, RLS, governance, lineage, monitoring and deployment/CI/CD.

### Interview Point
Explain Fabric as an end-to-end workflow rather than isolated features:
**source → ingestion → OneLake/Lakehouse → Spark/transform → Gold/Warehouse → Power BI → governance/monitoring.**

## Part B — Full Source-Style Fabric Q&A
# Microsoft Fabric — Complete Interview Notes (Source-Derived)
> Complete source-derived interview notes from `MSFabric.docx`. The question/answer content is preserved and organized for Markdown study.
## PART A — INTRODUCTION TO MICROSOFT FABRIC
### 1. What is Microsoft Fabric and why is it used?
**Answer**

Instead of using completely separate platforms for each activity, Fabric provides these capabilities under a unified platform with a common data foundation.
**Example**

**Interview Point:
Microsoft Fabric = Unified platform for data engineering, analytics, and BI.**

### 2. What are the main capabilities or workloads available in Microsoft Fabric?
**Answer**

These workloads work together so that data can move from ingestion and processing to analytics and visualization within the same platform.
**Example**

**Remember:
Data Engineering -> Data Factory -> Data Science -> Data Warehouse -> Real-Time Analytics -> Power BI**

### 3. How is Microsoft Fabric related to Azure Synapse Analytics and Power BI?
**Answer**

Azure Synapse Analytics provided engineering, SQL, and analytics capabilities, while Power BI focused mainly on business intelligence and visualization. Fabric connects these types of workloads more closely in one platform.
**Example**

### 4. What are Fabric Workloads and why are they important?
**Answer**

The major workloads include Data Engineering, Data Factory, Data Science, Data Warehouse, Real-Time Analytics, and Power BI.
**Example**

**Interview Point:
A workload is basically a specialized area of Fabric for a particular type of data task.**

## PART B — FABRIC WORKLOADS
### 5. What is Data Engineering in Microsoft Fabric?
**Answer**

It is mainly used by data engineers to build data-processing workflows and prepare reliable datasets for downstream analytics.
**Example**

### 6. What is Data Factory in Microsoft Fabric?
**Answer**

It provides capabilities such as pipelines, activities, Copy Activity, Dataflows Gen2, parameterization, and scheduling.
**Example**

### 7. What is Data Science in Microsoft Fabric?
**Answer**

It can use notebooks and other Fabric capabilities to prepare data and build analytical or machine learning models.
**Example**

### 8. What is the purpose of the Data Warehouse workload in Fabric?
**Answer**

It is particularly useful when the data is structured and the organization needs relational models, fact and dimension tables, and SQL-based reporting.
**Example**

### 9. What is Real-Time Analytics in Microsoft Fabric?
**Answer**

Typical use cases include application events, IoT data, logs, monitoring information, and continuously generated business events.
**Example**

**Interview Point:
Real-Time Analytics = Analyze continuously arriving data with low latency.**

### 10. What is the role of Power BI in Microsoft Fabric?
**Answer**

Power BI can consume data from Fabric Lakehouses, Warehouses, and other supported data sources to present business information in an understandable form.
**Example**

## PART C — SAAS MODEL IN MICROSOFT FABRIC
### 11. What is the SaaS model and how does Microsoft Fabric use it?
**Answer**

Microsoft Fabric follows a SaaS approach, allowing users to work with data and analytics capabilities through the Fabric platform rather than manually managing the underlying infrastructure.
**Example**

### 12. What are the advantages of using Microsoft Fabric as a SaaS platform?
**Answer**

It also provides an integrated environment where different workloads can work together instead of requiring users to manage many independent systems.
**Example**

## PART D — LAKEHOUSE, WAREHOUSE AND DATAMART
### 13. What is a Lakehouse in Microsoft Fabric?
**Answer**

Fabric Lakehouses work with technologies such as Apache Spark and Delta tables, making them suitable for processing large datasets.
**Example**

**Interview Point:
Lakehouse = Flexible data storage + structured analytical tables.**

### 14. What is a Data Warehouse in Microsoft Fabric?
**Answer**

A Warehouse is commonly used after data has been cleaned and transformed into a structure suitable for reporting and business analysis.
**Example**

### 15. What is a Data Mart and what is its purpose?
**Answer**

Data Marts make it easier for a particular department to access and analyze the data relevant to its business requirements.
**Example**

**Interview Point:
Data Mart = Department-specific analytical data.**

### 16. What is the difference between a Lakehouse, Data Warehouse, and Data Mart?
**Answer**

A Data Mart is a smaller analytical store focused on a particular business area or department.
**Example**

Lakehouse -> Raw and transformed data
Warehouse -> Curated structured analytical data
Data Mart -> Department-specific analytical data
### 17. When would you choose a Lakehouse instead of a Data Warehouse?
**Answer**

A Warehouse is more suitable when the data is already structured and the primary requirement is SQL-based analytical querying and reporting.
**Example**

### 18. Why is a Data Mart useful when a Data Warehouse already exists?
**Answer**

This can make reporting and analysis simpler and more focused for individual business teams.
**Example**

## PART E — WORKSPACE AND ONELAKE
### 19. What is a Workspace in Microsoft Fabric?
**Answer**

A Workspace can contain items such as Lakehouses, Warehouses, notebooks, pipelines, semantic models, and reports.
**Example**

### 20. Why are Workspaces important in Microsoft Fabric?
**Answer**

Organizations can use different Workspaces for different purposes, such as development, testing, and production.
**Example**

### 21. What is OneLake in Microsoft Fabric?
**Answer**

It helps organizations avoid unnecessary duplication of data and provides a centralized approach to storing organizational data.
**Example**

**Interview Point:
OneLake = One unified data lake for the Fabric environment.**

### 22. Why is OneLake important in Microsoft Fabric?
**Answer**

It also helps reduce unnecessary copies of data and simplifies the overall data architecture.
**Example**

### 23. How are Workspaces, Lakehouses, and OneLake related?
**Answer**

Therefore, these concepts work together as part of Fabric's organization and storage architecture.
**Example**

Workspace
↓
Lakehouse
↓
OneLake storage
A SalesAnalytics Workspace can contain a SalesLakehouse, whose data is stored in OneLake.
## PART F — FABRIC LAKEHOUSE STRUCTURE AND HANDS-ON
### 24. What are the main areas of a Fabric Lakehouse?
**Answer**

This structure allows a Lakehouse to support both raw file storage and structured analytical data.
**Example**

### 25. How do you set up a Workspace in Microsoft Fabric?
**Answer**

After creating it, users can add items such as a Lakehouse, Notebook, Pipeline, Warehouse, or other required Fabric resources.
**Example**

### 26. How do you create your first Lakehouse in Microsoft Fabric?
**Answer**

After creation, the Lakehouse provides areas such as Files and Tables where data can be stored and managed.
**Example**

### 27. How can you upload a sample dataset into a Fabric Lakehouse?
**Answer**

After uploading, the file becomes available in the Lakehouse and can be used for further processing or transformation.
**Example**

### 28. What is the difference between uploading a file and creating a table in a Lakehouse?
**Answer**

The table is generally more suitable for querying and downstream analytical processing than simply working with the original raw file.
**Example**

### 29. Why would you store raw data in a Lakehouse before transforming it?
**Answer**

It also separates the original data from the processed data, which makes the data engineering process easier to manage.
**Example**

**Interview Point:
Raw data first -> Transform later -> Curated data for analysis.**

30. Explain a simple end-to-end workflow using Microsoft Fabric.
**Answer**

The resulting curated data can then be used by a Data Warehouse for SQL analytics and Power BI for dashboards and reports.
**Example**

Sales CSV -> Data Factory -> Lakehouse/OneLake -> Data Engineering -> Curated Data -> Data Warehouse -> Power BI
This represents the basic Fabric flow:
Ingest -> Store -> Transform -> Analyze -> Visualize
**Interview Point:
If the auditor asks "Explain how Fabric is used in a real project", this flow is a strong answer.**

## PART A — LAKEHOUSE ARCHITECTURE
### 31. What is the architecture of a Lakehouse in Microsoft Fabric?
**Answer**

The Lakehouse is built on OneLake, which provides the underlying unified storage layer for Fabric.
**Example**

**Interview Point:
OneLake -> Lakehouse -> Files + Tables -> Processing and Analytics**

### 32. What is the purpose of the Files section in a Fabric Lakehouse?
**Answer**

This area is especially useful when data arrives from external sources and needs to be processed before being converted into structured tables.
**Example**

### 33. What is the purpose of the Tables section in a Fabric Lakehouse?
**Answer**

Tables are generally used after raw or source data has been processed into a more structured form.
**Example**

### 34. What is the difference between Files and Tables in a Fabric Lakehouse?
**Answer**

Files are commonly useful for raw data, whereas tables are commonly used for transformed and curated data.
**Example**

Sales.csv -> Files
Cleaned Sales Data -> Sales Delta Table
**Interview Point:
Files = file-based storage
Tables = structured analytical data**

### 35. What is Delta Lake and why is it important in a Fabric Lakehouse?
**Answer**

It helps provide capabilities such as transactional consistency, schema management, and reliable data operations.
**Example**

**Remember:
Delta = Reliable table format for Lakehouse data.**

### 36. What are the advantages of using Delta tables instead of ordinary files?
**Answer**

They also support features that make it easier to maintain and process changing datasets.
**Example**

## PART B — APACHE SPARK IN FABRIC
### 37. What is Apache Spark and why is it used in Microsoft Fabric?
**Answer**

Microsoft Fabric provides Spark capabilities that can be used with Lakehouses for data engineering and transformation tasks.
**Example**

**Interview Point:
Spark = Distributed processing engine for large-scale data.**

### 38. Why is Spark suitable for processing large datasets?
**Answer**

Spark also provides APIs for Python, SQL, Scala, and other languages.
**Example**

### 39. What is a Spark Notebook in Microsoft Fabric?
**Answer**

They are commonly used by data engineers for exploring data, performing transformations, and developing data-processing logic.
**Example**

### 40. Why are Notebooks useful for data engineering in Fabric?
**Answer**

They also allow code, results, and explanations to be maintained together in one working environment.
**Example**

## PART C — PYSPARK BASICS
### 41. What is PySpark and how is it related to Apache Spark?
**Answer**

Instead of writing Spark programs only in Scala or Java, users can perform Spark data-processing tasks using Python syntax.
**Example**

**Interview Point:
Apache Spark = Processing engine
PySpark = Python interface to Spark**

### 42. What is a Spark DataFrame?
**Answer**

DataFrames are one of the main structures used in PySpark for data transformation and analysis.
**Example**

### 43. How do you read data into a PySpark DataFrame?
**Answer**

For example, CSV data can be read using Spark's CSV reader.
**Example**

```text
df = spark.read.csv("Files/sales.csv", header=True, inferSchema=True)
```
This creates a Spark DataFrame containing the sales data.
### 44. What is the difference between a pandas DataFrame and a Spark DataFrame?
**Answer**

Spark DataFrames are therefore more suitable when the dataset is too large or the processing workload requires distributed computation.
**Example**

**Interview Point:
Pandas -> Usually single-machine processing
Spark DataFrame -> Distributed processing**

### 45. What are transformations in PySpark?
**Answer**

Common DataFrame transformations include select(), filter(), withColumn(), drop(), groupBy(), and join().
**Example**

```text
filtered_df = df.filter(df["Amount"] > 1000)
```
This creates a new DataFrame containing only sales where the amount is greater than 1000.
### 46. What is the purpose of the select() transformation in PySpark?
**Answer**

Selecting only required columns can also make transformations and queries more focused.
**Example**

df.select("Customer_ID", "Product", "Amount")
This selects only the three required columns from the DataFrame.
### 47. What is the purpose of filter() in PySpark?
**Answer**

The original DataFrame is not directly changed; a new filtered DataFrame is produced.
**Example**

df.filter(df["Amount"] > 500)
This keeps only transactions where the amount is greater than 500.
### 48. What is the purpose of withColumn() in PySpark?
**Answer**

It returns a new DataFrame containing the updated column.
**Example**

```text
df = df.withColumn("Total", df["Quantity"] * df["Price"])
```
This creates a new Total column by multiplying quantity by price.
### 49. What is the purpose of groupBy() in PySpark?
**Answer**

It is useful when business data needs to be summarized by categories.
**Example**

df.groupBy("Department").sum("Salary")
This calculates the total salary for each department.
### 50. What is the purpose of join() in PySpark?
**Answer**

Different join types such as inner, left, right, and full joins can be used depending on the requirement.
**Example**

sales_df.join(customer_df, "Customer_ID", "inner")
This combines sales information with customer information using Customer_ID.
## PART D — DATA TRANSFORMATIONS IN FABRIC
### 51. What are common data transformations performed using PySpark?
**Answer**

These operations help convert raw data into clean and useful data for analytical workloads.
**Example**

### 52. Why are DataFrames commonly used for data transformation in Fabric?
**Answer**

They are therefore convenient for converting raw Lakehouse data into cleaned and transformed datasets.
**Example**

## PART E — MEDALLION ARCHITECTURE
### 53. What is Medallion Architecture in data engineering?
**Answer**

Bronze generally contains raw data, Silver contains cleaned and transformed data, and Gold contains curated data prepared for business analytics.
**Example**

Bronze -> Raw Sales Data
Silver -> Cleaned Sales Data
Gold -> Sales Summary for Reporting
**Interview Point:
Bronze = Raw -> Silver = Clean -> Gold = Business-ready**

### 54. What is the Bronze layer in Medallion Architecture?
**Answer**

The purpose of Bronze is to preserve the source data so that it can be processed further into higher-quality layers.
**Example**

**Remember:
Bronze = Raw data**

### 55. What is the Silver layer in Medallion Architecture?
**Answer**

Silver data is more structured and reliable than raw Bronze data and can be used as a foundation for further business transformations.
**Example**

**Remember:
Silver = Cleaned and transformed data**

### 56. What is the Gold layer in Medallion Architecture?
**Answer**

Gold data is designed to be easier for analysts and reporting tools to consume.
**Example**

**Remember:
Gold = Business-ready data**

### 57. Why is Medallion Architecture useful in a Fabric Lakehouse?
**Answer**

Each layer has a clear purpose, allowing engineers to progressively transform raw data into trusted business information.
**Example**

Raw CSV -> Bronze -> Silver -> Gold -> Power BI
If incorrect values appear in Gold data, engineers can trace the processing back through the Silver and Bronze layers.
### 58. What is the difference between Bronze, Silver, and Gold layers?
**Answer**

The Gold layer contains curated and business-ready data that is optimized for reporting and analytical use.
**Example**

## PART F — HANDS-ON LAKEHOUSE WORKFLOW
### 59. How can you load data into a Lakehouse table using a Notebook?
**Answer**

This allows raw file-based data to be converted into structured data that can be used for further analytics.
**Example**

```text
df = spark.read.csv("Files/sales.csv", header=True, inferSchema=True)
```
df.write.mode("overwrite").format("delta").saveAsTable("Sales")
Here, the CSV data is read into a DataFrame and written as a Delta table named Sales.
### 60. How would you build a simple Bronze -> Silver pipeline in a Fabric Lakehouse?
**Answer**

This creates a simple processing flow where raw data is progressively converted into clean and reliable data.
**Example**

Source CSV
↓
Bronze — Raw Sales
↓
PySpark Notebook
↓
Remove duplicates + handle missing values + filter invalid records
↓
Silver — Clean Sales
**Interview Point:
For a basic Fabric Lakehouse pipeline, remember:**

Ingest -> Bronze -> Transform with Spark/PySpark -> Silver -> Further transformation -> Gold
## PART A — DATA FACTORY IN FABRIC
### 61. What is Data Factory in Microsoft Fabric and what is its purpose?
**Answer**

It is mainly used to build pipelines that move data from source systems into destinations such as Lakehouses and Warehouses.
**Example**

**Interview Point:
Data Factory = Data Integration + Data Movement + Orchestration**

### 62. What is a data pipeline in Microsoft Fabric Data Factory?
**Answer**

Pipelines can contain multiple activities and can be scheduled or triggered automatically.
**Example**

**Remember:
Pipeline = Container that organizes and executes data activities.**

### 63. What is an activity in a Data Factory pipeline?
**Answer**

Activities can be used for operations such as copying data, transforming data, executing notebooks, or controlling workflow execution.
**Example**

### 64. What is the difference between a pipeline and an activity?
**Answer**

In simple terms, the pipeline defines the overall process and activities perform the specific operations.
**Example**

Pipeline: Daily Sales ETL
Activities:
Copy sales data
Transform data
Load curated data
**Interview Point:
Pipeline = Workflow
Activity = Task within the workflow**

### 65. What is data ingestion in Microsoft Fabric?
**Answer**

The source can be a database, file, application, API, or another supported system. Data can be ingested either in batches or incrementally depending on the business requirement.
**Example**

## PART B — DATA INGESTION PATTERNS
### 66. What is batch data ingestion?
**Answer**

It is suitable when real-time processing is not required and data can be processed periodically.
**Example**

**Interview Point:
Batch = Process data in groups at intervals.**

### 67. What is incremental data ingestion?
**Answer**

This can reduce data movement, processing time, and unnecessary workload.
**Example**

### 68. What is the difference between batch and incremental ingestion?
**Answer**

Batch describes how and when data is processed, whereas incremental ingestion describes which portion of the data is processed.
**Example**

### 69. When would you choose batch ingestion instead of incremental ingestion?
**Answer**

Incremental ingestion is preferable when datasets are large and only a small number of records change between runs.
**Example**

### 70. Why is incremental ingestion useful for large datasets?
**Answer**

This can reduce processing time, data movement, and resource consumption.
**Example**

## PART C — COPY ACTIVITY
### 71. What is Copy Activity in Microsoft Fabric Data Factory?
**Answer**

It can connect supported sources and destinations and transfer data between them as part of an automated pipeline.
**Example**

### 72. What are the main components involved in a Copy Activity?
**Answer**

Additional settings can control mappings, formats, and other aspects of the data-copy operation.
**Example**

Source: SQL Database
↓
Copy Activity
↓
Destination: Fabric Lakehouse
### 73. What is the purpose of a source in Copy Activity?
**Answer**

The Copy Activity reads the required data from this source and transfers it to the configured destination.
**Example**

### 74. What is the purpose of a destination or sink in Copy Activity?
**Answer**

In Fabric, common destinations can include a Lakehouse or Warehouse depending on the integration requirement.
**Example**

**Remember:
Source = Where data comes from
Sink = Where data goes**

## PART D — DATAFLOWS GEN2
### 75. What are Dataflows Gen2 in Microsoft Fabric?
**Answer**

They are particularly useful when transformations need to be created without writing extensive programming code.
**Example**

### 76. What is the difference between Copy Activity and Dataflows Gen2?
**Answer**

Therefore, Copy Activity is useful for straightforward data movement, whereas Dataflows Gen2 is useful when multiple transformation steps are required.
**Example**

Copy Activity:
SQL -> Lakehouse
Dataflows Gen2:
SQL -> Filter -> Clean -> Transform -> Lakehouse
### 77. When would you use Dataflows Gen2 instead of a Spark Notebook?
**Answer**

The choice depends on the complexity of the transformation and the skills of the person developing the workflow.
**Example**

### 78. Why are Dataflows Gen2 useful for data integration?
**Answer**

They are useful for repeatable data transformation processes that need to be integrated into a broader data workflow.
**Example**

## PART E — PARAMETERIZATION
### 79. What is parameterization in a Fabric Data Factory pipeline?
**Answer**

The same pipeline can therefore work with different files, tables, dates, or environments by changing parameter values.
**Example**

### 80. Why is parameterization important in data pipelines?
**Answer**

This is especially useful when the same workflow must process different datasets, dates, or environments.
**Example**

**Interview Point:
Parameterization = Reusable and flexible pipelines.**

### 81. What is a practical example of using parameters in a pipeline?
**Answer**

The same pipeline can then use that parameter to identify the correct input file.
**Example**

```text
FileName = sales_2026_09_07.csv
```
On another day:
```text
FileName = sales_2026_09_08.csv
```
The pipeline structure remains the same.
## PART F — SCHEDULING AND AUTOMATION
### 82. What is scheduling in Microsoft Fabric Data Factory?
**Answer**

Scheduling is commonly used for regular batch data ingestion and transformation workflows.
**Example**

### 83. Why is scheduling important for ETL pipelines?
**Answer**

It is especially useful for daily, hourly, or weekly data-processing requirements.
**Example**

### 84. What is the difference between manually running a pipeline and scheduling it?
**Answer**

Scheduling is therefore more suitable for production workflows that need regular and predictable execution.
**Example**

## PART G — BUILDING AN ETL PIPELINE
### 85. What is an ETL pipeline in Microsoft Fabric?
**Answer**

Fabric Data Factory can be used to orchestrate these steps as part of an automated data workflow.
**Example**

Extract: Read sales data from SQL
Transform: Clean and filter sales records
Load: Store the processed data in a Lakehouse
**Interview Point:
ETL = Extract -> Transform -> Load**

### 86. What are the basic steps to build an ETL pipeline in Fabric?
**Answer**

Finally, configure the transformations, validate the pipeline, test its execution, and schedule it if the process needs to run automatically.
**Example**

SQL Database -> Copy Activity -> Lakehouse -> Transformation -> Final Table
The pipeline can then be scheduled to run every night.
### 87. How would you design a simple daily sales ETL pipeline in Fabric?
**Answer**

Finally, the transformed data can be loaded into a Lakehouse or Warehouse and the pipeline can be scheduled to execute every day.
**Example**

SQL Sales Table
↓
Copy Activity
↓
Lakehouse
↓
Transform Data
↓
Curated Sales Table
### 88. How can incremental ingestion be implemented in a Fabric pipeline?
**Answer**

The pipeline uses that information to retrieve only the required records instead of loading the complete source dataset.
**Example**

### 89. What factors should you consider when designing a Fabric data integration pipeline?
**Answer**

You should also consider reusability through parameterization and automation through scheduling.
**Example**

90. Explain a complete Data Factory ETL workflow in Microsoft Fabric.
**Answer**

After transformation, the cleaned data is loaded into a Lakehouse or Warehouse. The pipeline can be parameterized for reuse and scheduled to execute automatically.
**Example**

Source Database
↓
Fabric Data Factory Pipeline
↓
Copy Activity
↓
Lakehouse / Destination
↓
Data Transformation
↓
Curated Data
↓
Scheduled Daily Execution
**Interview Point:
For an audit, explain it as:**

Connect -> Extract -> Transform -> Load -> Schedule
## PART A — FABRIC DATA WAREHOUSE
### 91. What is a Data Warehouse in Microsoft Fabric?
**Answer**

It supports T-SQL queries and data models such as fact and dimension tables, making it suitable for business intelligence workloads.
**Example**

**Interview Point:
Fabric Warehouse = Structured data + SQL analytics + Business reporting**

### 92. What is the purpose of using a Data Warehouse in Microsoft Fabric?
**Answer**

It is generally used for downstream analytics after data has gone through ingestion and transformation.
**Example**

### 93. What type of data is generally stored in a Fabric Data Warehouse?
**Answer**

It commonly contains fact tables, dimension tables, and other structures required for analytical reporting.
**Example**

### 94. What is the difference between a Fabric Lakehouse and a Fabric Data Warehouse?
**Answer**

A Lakehouse is therefore often used earlier in the data-processing process, while a Warehouse is commonly used for curated analytical data.
**Example**

Lakehouse: Raw files -> Transformation -> Curated data
Warehouse: Curated structured data -> SQL analysis -> Reporting
**Interview Point:
Lakehouse = Engineering-oriented
Warehouse = SQL analytics-oriented**

## PART B — SQL ENDPOINT IN LAKEHOUSE
### 95. What is the SQL Endpoint of a Fabric Lakehouse?
**Answer**

It is particularly useful for analysts and SQL developers who want to query Lakehouse data using T-SQL.
**Example**

### 96. Why would you use the SQL Endpoint instead of a Spark Notebook?
**Answer**

Therefore, the choice depends on whether the task is mainly SQL-based analysis or programmatic data processing.
**Example**

### 97. What is the difference between a Lakehouse SQL Endpoint and a Fabric Data Warehouse?
**Answer**

The SQL Endpoint is therefore a SQL access method for Lakehouse data, whereas the Warehouse is itself a structured analytical storage environment.
**Example**

## PART C — T-SQL IN FABRIC
### 98. What is T-SQL and why is it used in Fabric Data Warehouse?
**Answer**

It provides familiar SQL capabilities for developers and analysts who work with Microsoft data technologies.
**Example**

```text
SELECT Product_ID, SUM(Sales_Amount) AS Total_Sales
```
FROM FactSales
GROUP BY Product_ID;
This query calculates total sales for each product.
### 99. What types of analytical queries can be written using T-SQL in Fabric?
**Answer**

These capabilities make T-SQL useful for creating analytical datasets and supporting reporting requirements.
**Example**

```text
SELECT d.Region, SUM(f.Sales_Amount) AS Revenue
```
FROM FactSales f
JOIN DimCustomer d
```text
ON f.Customer_ID = d.Customer_ID
```
GROUP BY d.Region;
This calculates revenue by customer region.
### 100. Why are joins important in Data Warehouse analytical queries?
**Answer**

This is essential for answering questions such as sales by product, customer, region, or date.
**Example**

## PART D — DATA MODELING
### 101. What is data modeling in a Data Warehouse?
**Answer**

A common approach is to separate measurable business events into fact tables and descriptive information into dimension tables.
**Example**

### 102. What is a fact table in a Data Warehouse?
**Answer**

Fact tables usually contain a large number of records compared with dimension tables.
**Example**

Order_ID, Customer_ID, Product_ID, Date_ID, Quantity, Sales_Amount
**Interview Point:
Fact = Business event + Measures**

### 103. What is a dimension table in a Data Warehouse?
**Answer**

Dimension tables generally contain descriptive columns rather than the primary business measures.
**Example**

Product_ID, Product_Name, Category, Brand
This allows sales to be analyzed by product or category.
**Interview Point:
Dimension = Descriptive context**

### 104. What is the difference between fact and dimension tables?
**Answer**

Fact tables are generally large and frequently queried with dimensions for analytical reporting.
**Example**

FactSales: Quantity, Sales Amount
DimProduct: Product Name, Category, Brand
DimCustomer: Customer Name, City, Region
### 105. What is a Star Schema?
**Answer**

It is called a Star Schema because the structure visually resembles a star, with the fact table at the center and dimensions around it.
**Example**

DimCustomer
|
DimProduct — FactSales — DimDate
|
DimStore
**Interview Point:
Center = Fact
Around it = Dimensions**

### 106. Why is Star Schema commonly used for analytical workloads?
**Answer**

It is also well suited for reporting tools because business users can easily understand the relationships between facts and dimensions.
**Example**

### 107. What is the grain of a fact table?
**Answer**

Once the grain is established, the measures and dimensions can be designed consistently around that level of detail.
**Example**

**Interview Point:
Before designing a fact table, always ask: "What does one row represent?"**

### 108. What are measures in a fact table?
**Answer**

Measures are often summarized using operations such as SUM, AVG, MIN, or MAX.
**Example**

### 109. What are keys in fact and dimension tables?
**Answer**

These relationships allow analytical queries to combine measures with descriptive information.
**Example**

## PART E — PERFORMANCE OPTIMIZATION
### 110. Why is performance optimization important in a Fabric Data Warehouse?
**Answer**

Optimization aims to make queries process data efficiently while still producing the required results.
**Example**

### 111. What are some basic ways to improve query performance in a Data Warehouse?
**Answer**

Understanding the data model and writing efficient SQL are important parts of performance optimization.
**Example**

Instead of:
```text
SELECT *
```
FROM FactSales;
select only the required columns:
```text
SELECT Product_ID, Sales_Amount
```
FROM FactSales;
### 112. Why should you avoid SELECT * in analytical queries?
**Answer**

Selecting only the required columns makes the query clearer and can reduce unnecessary processing.
**Example**

Instead of:
```text
SELECT *
```
FROM FactSales;
use:
```text
SELECT Order_ID, Sales_Amount
```
FROM FactSales;
when those are the only required fields.
### 113. How can filtering improve the performance of analytical queries?
**Answer**

It also ensures that the query focuses only on the data relevant to the business question.
**Example**

```text
SELECT *
```
FROM FactSales
```text
WHERE Sale_Date >= '2026-01-01';
```
This focuses the query on sales from 2026 onward instead of processing every historical record.
## PART F — BUILDING THE FABRIC WAREHOUSE
### 114. What are the basic steps to create a Data Warehouse in Microsoft Fabric?
**Answer**

After creation, the Warehouse can be populated with curated data and modeled using fact and dimension tables for analytical workloads.
**Example**

### 115. What type of data should be loaded into the Gold layer or Data Warehouse?
**Answer**

When using a Warehouse as the analytical layer, the data can be organized into fact and dimension tables for reporting.
**Example**

### 116. How would you load curated Gold data into a Fabric Data Warehouse?
**Answer**

The loading process should maintain the required relationships and data types so that analytical queries can work correctly.
**Example**

Bronze Raw Data
↓
Silver Cleaned Data
↓
Gold Curated Data
↓
Fabric Warehouse
↓
Fact + Dimension Tables
### 117. How would you build a Star Schema for a retail sales system?
**Answer**

Then create dimensions such as DimCustomer, DimProduct, DimDate, and DimStore to provide descriptive information for analysis.
**Example**

DimCustomer
|
DimProduct — FactSales — DimDate
|
DimStore
## PART G — ANALYTICAL QUERIES
### 118. How can you calculate total sales using T-SQL?
**Answer**

The result can be further grouped by dimensions such as product, region, or date to produce more detailed business insights.
**Example**

```text
SELECT SUM(Sales_Amount) AS Total_Sales
```
FROM FactSales;
This returns the overall sales amount.
### 119. How can you calculate sales by product category using a Star Schema?
**Answer**

This is a common example of how fact and dimension tables work together in analytical queries.
**Example**

SELECT
p.Category,
SUM(f.Sales_Amount) AS Total_Sales
FROM FactSales f
JOIN DimProduct p
```text
ON f.Product_ID = p.Product_ID
```
GROUP BY p.Category;
### 120. How would you explain a complete Fabric Data Warehouse workflow?
**Answer**

The Warehouse can then organize the data into fact and dimension tables, allowing analysts and Power BI to perform SQL-based analytical queries and reporting.
**Example**

Source Data
↓
Lakehouse — Bronze
↓
Silver — Cleaned Data
↓
Gold — Curated Data
↓
Fabric Data Warehouse
↓
Fact + Dimension Tables
↓
T-SQL Analytical Queries
↓
Power BI
**Interview Point:
The key idea is:**

Prepare data in Lakehouse -> Model curated data in Warehouse -> Analyze using SQL -> Report using BI
## PART A — POWER BI INTEGRATION
### 121. How does Microsoft Fabric integrate with Power BI?
**Answer**

Power BI can connect to curated Fabric data and create semantic models, reports, and dashboards for business users.
**Example**

**Interview Point:
Fabric prepares and stores data -> Power BI visualizes and analyzes it.**

### 122. Why is Power BI integration important in Microsoft Fabric?
**Answer**

This integration allows organizations to build an end-to-end data and analytics solution within the same platform.
**Example**

Source -> Fabric Lakehouse -> Warehouse -> Power BI Report -> Business User
### 123. How can Power BI connect to a Fabric Lakehouse?
**Answer**

This allows users to build reports without manually exporting Lakehouse data into separate files.
**Example**

### 124. How can Power BI connect to a Fabric Data Warehouse?
**Answer**

This approach allows Power BI reports to query curated business data stored in the Warehouse.
**Example**

## PART B — REPORTS AND DASHBOARDS
### 125. What is a Power BI report?
**Answer**

Reports help users explore data and understand business performance from different perspectives.
**Example**

### 126. What is a Power BI dashboard?
**Answer**

Dashboards can contain visual tiles that highlight important business measures.
**Example**

Total Revenue | Total Orders | Profit | Top Products | Regional Sales
**Interview Point:
Dashboard = High-level monitoring view**

### 127. What is the difference between a Power BI report and a dashboard?
**Answer**

Reports are more suitable for detailed exploration, while dashboards are useful for quick business monitoring.
**Example**

Report: Detailed sales analysis across multiple pages
Dashboard: One-page view showing revenue, profit, orders, and top products
### 128. What are visuals in Power BI?
**Answer**

Visuals help users understand patterns, comparisons, trends, and key performance indicators.
**Example**

### 129. What are slicers in Power BI?
**Answer**

Slicers can be based on fields such as date, region, product, or customer.
**Example**

### 130. How would you build a simple sales dashboard using Fabric and Power BI?
**Answer**

Then create visuals such as revenue cards, sales-by-region charts, monthly trends, and product performance, and arrange them into a dashboard or report.
**Example**

Fabric Lakehouse/Warehouse
↓
Power BI Connection
↓
Data Model
↓
Charts + Cards + Slicers
↓
Sales Dashboard
## PART C — REAL-TIME ANALYTICS
### 131. What is Real-Time Analytics in Microsoft Fabric?
**Answer**

It is useful when decisions need to be made using information that is arriving in near real time.
**Example**

**Interview Point:
Batch analytics = Historical/scheduled processing
Real-time analytics = Continuously arriving data**

### 132. When would you use Real-Time Analytics instead of batch processing?
**Answer**

The choice depends mainly on the required latency and business use case.
**Example**

### 133. What is streaming data?
**Answer**

Streaming data is commonly generated by applications, IoT devices, websites, logs, and transaction systems.
**Example**

### 134. What is the difference between batch data and streaming data?
**Answer**

Batch processing is suitable for periodic workloads, while streaming is useful when organizations need timely information from continuously arriving data.
**Example**

Batch: Daily sales file processed at midnight
Streaming: Customer transactions analyzed continuously as they occur
### 135. What are some practical use cases for Real-Time Analytics?
**Answer**

It is especially useful when delays in receiving information could affect business decisions or operations.
**Example**

## PART D — DATA GOVERNANCE
### 136. What is data governance in Microsoft Fabric?
**Answer**

In Fabric, governance can involve areas such as security, lineage, monitoring, access control, and data management.
**Example**

### 137. Why is data governance important in a data platform?
**Answer**

Without proper governance, organizations may face security, compliance, quality, and data-management problems.
**Example**

## PART E — ROW-LEVEL SECURITY
### 138. What is Row-Level Security (RLS)?
**Answer**

RLS is useful when users should see only the data relevant to their region, department, business unit, or responsibility.
**Example**

**Interview Point:
RLS controls which rows a user can see.**

### 139. Why is Row-Level Security useful in Power BI?
**Answer**

This reduces the need to create separate reports for each group of users.
**Example**

### 140. What is an example of implementing RLS?
**Answer**

The same Power BI report can then display different rows depending on the logged-in user.
**Example**

Manager A -> Maharashtra data
Manager B -> Karnataka data
Manager C -> Tamil Nadu data
## PART F — COLUMN-LEVEL SECURITY
### 141. What is Column-Level Security (CLS)?
**Answer**

For example, users may be allowed to see sales information but not sensitive personal or financial columns.
**Example**

Customer_ID, Product, Sales
but not:
Customer_Phone, Personal_Email
**Interview Point:
RLS = Restrict rows
CLS = Restrict columns**

### 142. What is the difference between RLS and CLS?
**Answer**

Both are security mechanisms used to limit access to sensitive or restricted data based on user requirements.
**Example**

RLS: User sees only Maharashtra records.
CLS: User cannot see the customer's personal phone number.
## PART G — DATA LINEAGE
### 143. What is data lineage in Microsoft Fabric?
**Answer**

It provides visibility into where data originated and how it was transformed before reaching the final consumer.
**Example**

Source SQL Table
↓
Lakehouse
↓
Warehouse
↓
Semantic Model
↓
Power BI Report
This flow represents the lineage of the data.
### 144. Why is data lineage important?
**Answer**

It also helps users understand whether the data in a report comes from a trusted and expected source.
**Example**

## PART H — MONITORING
### 145. Why is monitoring important in Microsoft Fabric?
**Answer**

Regular monitoring is important for maintaining reliable production data pipelines.
**Example**

### 146. What should you monitor in a Fabric data pipeline?
**Answer**

It can also help identify workflows that are taking longer than expected.
**Example**

Pipeline: Daily Sales
Status: Failed
Failed Activity: Copy Sales Data
Error: Source connection problem
## PART I — CI/CD AND DEPLOYMENT
### 147. What is CI/CD in Microsoft Fabric?
**Answer**

In Fabric, deployment capabilities can be used to move developed items through environments such as development, testing, and production.
**Example**

Development
↓
Testing
↓
Production
A pipeline or report developed in the development environment can be validated before being deployed to production.
### 148. What are Deployment Pipelines in Microsoft Fabric?
**Answer**

They help teams maintain separation between development, testing, and production environments.
**Example**

DEV Workspace
↓
TEST Workspace
↓
PROD Workspace
**Interview Point:
Deployment Pipeline = Controlled movement of Fabric content across environments.**

### 149. Why are CI/CD and Deployment Pipelines important in Fabric?
**Answer**

They also support collaboration between developers and testing teams.
**Example**

150. Explain a complete Microsoft Fabric analytics workflow from data ingestion to reporting and governance.
**Answer**

Power BI can then connect to the curated data to create reports and dashboards. Security controls such as RLS and CLS, lineage, monitoring, and deployment processes help ensure that the overall solution is secure, traceable, reliable, and maintainable.
**Example**

Source Systems
↓
Data Factory
↓
Lakehouse
↓
Bronze
↓
Silver
↓
Gold
↓
Data Warehouse
↓
Star Schema
↓
Power BI
↓
Reports / Dashboards
Alongside this workflow:
Security -> RLS / CLS
Governance -> Lineage
Operations -> Monitoring
Deployment -> CI/CD / Deployment Pipelines
**Interview Point:
For the audit, remember the complete Fabric flow:**

Ingest -> Store -> Transform -> Model -> Analyze -> Visualize -> Govern -> Monitor -> Deploy
For your audit, I would not recommend trying to memorize all 150 equally. The most important preparation now is to be able to explain the end-to-end Fabric architecture verbally, because many audit questions can be connected together:
OneLake -> Lakehouse -> Bronze -> Silver -> Gold -> Warehouse -> Star Schema -> Power BI
with:
Data Factory -> ingestion/orchestration
Spark/PySpark -> transformation
RLS/CLS -> security
Lineage -> governance
Monitoring -> operations
Deployment Pipelines -> CI/CD


# Part C — Fabric Hands-On
# Microsoft Fabric — Hands-On Lab Playbook

## Lab 1 — Workspace
1. Open Fabric.
2. Create/select the project Workspace.
3. Verify the Workspace can contain Lakehouse, Notebook, Pipeline, Warehouse and related items.

## Lab 2 — OneLake + Lakehouse
1. Create a Lakehouse.
2. Open **Files**.
3. Upload a source CSV/JSON/Parquet file.
4. Confirm the file is present.
5. Create/load a structured table under **Tables**.

Mental model:

```text
Workspace
  ↓
Lakehouse
  ├── Files  ← raw/file data
  └── Tables ← structured Delta data
```

## Lab 3 — Notebook / PySpark

```python
from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("FabricPractice").getOrCreate()

df = spark.read.csv("Files/sales.csv", header=True, inferSchema=True)
df.printSchema()
df.show()
```

## Lab 4 — Bronze → Silver
Typical Silver transformations:
- select required columns
- cast types
- standardize strings
- handle nulls
- remove duplicates
- validate business rules

```python
from pyspark.sql.functions import col, trim

silver = (
    df.select("order_id", "customer_id", "amount", "region")
      .withColumn("region", trim(col("region")))
      .dropDuplicates(["order_id"])
)
```

Write as Delta table:

```python
silver.write.mode("overwrite").format("delta").saveAsTable("SalesSilver")
```

## Lab 5 — Gold
Build business aggregates:

```python
from pyspark.sql.functions import sum

gold = silver.groupBy("region").agg(
    sum("amount").alias("total_sales")
)
```

## Lab 6 — Data Factory pipeline
Conceptual pipeline:

```text
Source
  ↓
Copy Activity
  ↓
Bronze
  ↓
Notebook / Dataflow
  ↓
Silver
  ↓
Gold / Warehouse
```

Understand pipeline, activity, parameters, scheduling and monitoring.

## Lab 7 — Warehouse
Create a Warehouse, load curated Gold data, create fact/dimension structures and write T-SQL analytical queries.

## Lab 8 — Power BI
Connect Power BI to curated Lakehouse/Warehouse data. Build a report around business questions rather than raw columns.

## Lab 9 — RLS
Create a role/filtering rule so a user sees only the rows permitted for their region/business scope.

## Lab 10 — Monitoring
After running a pipeline, check activity status, duration, failures and data freshness.


# Part D — Power BI / Governance / CI-CD
# Power BI, Governance, Real-Time Analytics and CI/CD

## Power BI integration
The curriculum expects connecting Power BI to Lakehouse/Warehouse data and building dashboards/reports.

### Good modeling principle
Prefer curated Gold/Warehouse data rather than putting heavy data-cleansing logic into every report.

## Reports vs dashboards
A report contains pages and visuals for analysis. A dashboard provides a consolidated view of important metrics.

## RLS
Row-Level Security restricts which rows a user can see.

Example: a regional manager sees only their region.

## CLS
Column-Level Security controls visibility/access to sensitive columns where the platform supports it.

## Data lineage
Lineage shows upstream/downstream relationships between sources, transformations and analytical assets. It supports impact analysis and troubleshooting.

## Monitoring
Monitor pipeline failures, durations, freshness, row counts and quality checks.

## Real-time analytics
Real-time systems process continuously arriving events rather than waiting for a complete batch.

Key concepts:
- source
- event
- event time
- processing time
- window
- late data
- state
- sink

## CI/CD
Use source control and controlled promotion:

```text
Development → Validation/Test → Production
```

Before release:
- review changes
- run tests
- validate schema/security
- check parameters
- deploy through approved pipeline
- monitor production

## Interview answer
> "I would keep environments separated, store code in source control, use controlled deployment, test data and schema changes before production, and monitor the pipeline after deployment."


# Part E — Data-Engineering Scenarios

### Scenario 1 — Design a Fabric medallion pipeline
**Answer:** ingest raw source data into Bronze, clean/standardize in Silver, build business-ready Gold structures, then expose them to reporting/analytics.

### Scenario 2 — Daily incremental pipeline
**Answer:** use a reliable change indicator/watermark, parameterize the pipeline, validate the load, and advance progress only after successful completion.

### Scenario 3 — Restrict users to their own region
**Answer:** apply an appropriate row-level security design and validate it with representative user roles.

### Scenario 4 — Pipeline failed
**Answer:** inspect activity-level monitoring, identify the failed dependency, inspect input/output and error details, correct the root cause and rerun safely.

**Interview Point:** Monitoring and recovery are part of pipeline design, not an afterthought.
