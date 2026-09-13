# 05 — PySpark & Scala for Data Engineering

## Part A — Curriculum Notes

### PySpark / Spark
- Spark provides distributed processing; know SparkSession, RDDs, DataFrames, transformations and actions.
- Understand lazy evaluation, partitions, shuffles, joins, aggregations, caching and cluster managers.
- Know JSON/Parquet, complex transformations and window functions.
- Performance topics include partition sizing, skew, caching, memory pressure and query optimization.
- Streaming topics include Event Hubs patterns, windows, watermarking, state and production best practices.

### Scala
- Know `val` vs `var`, expressions, functions, higher-order functions and collections.
- Understand classes/objects, tuples, pure/impure functions and exception handling.
- Know List, Map and Set and how functional programming ideas apply.
- Scala is important because Spark's ecosystem is strongly associated with Scala.
- Interview point: for data engineering, explain how Scala/PySpark concepts map to Spark execution.

## Part B — Source-Style PySpark Q&A
# PySpark — Complete Interview Notes (Source-Derived)
> Complete source-derived interview notes from `PySpark.docx`. The question/answer content is preserved and organized for Markdown study.
## PySpark Interview Notes
##  Module 1: Spark Fundamentals
### 1. What is Apache Spark?
**Answer**

**Example**

If we have data of 1 million employees processing those data using single machine would be very late process and the applications also becomes very slow using Apache spark we can distribute the data across multiple machines and make the process efficient and speed.
```text
df = spark.read.csv("employees.csv", header=True)
```
df.show()
**Remember:
Spark -> Distributed processing of large data.**

### 2. What is PySpark?
**Answer**

**Example**

```text
from pyspark.sql import SparkSession
spark = SparkSession.builder.appName("Demo").getOrCreate()
```
**Remember:
PySpark = Python interface for Apache Spark.**

### 3. Why is Apache Spark used for Big Data?
**Answer**

**Example**

### 4. What are the main components of the Spark ecosystem?
**Answer**

**Example**

**Remember:
Core -> SQL -> Streaming -> MLlib -> GraphX.**

### 5. What is Spark Core?
**Answer**

**Example**

```text
rdd = spark.sparkContext.parallelize([10, 20, 30])
```
**Remember:
Spark Core -> Foundation of Spark.**

### 6. What is Spark SQL?
**Answer**

**Example**

df.select("name", "salary").show()
**Remember:	
Spark SQL -> Structured data + SQL.**

### 7. What is Spark Structured Streaming?
**Answer**

**Example**

### 8. What is SparkSession?
**Answer**

**Example**

```text
from pyspark.sql import SparkSession
spark = SparkSession.builder \
```
.appName("Practice") \
.getOrCreate()
Your practice files create SparkSession using this approach.
**Remember:
SparkSession -> Main entry point to PySpark.**

### 9. What is SparkContext?
**Answer**

**Example**

```text
rdd = spark.sparkContext.parallelize([10, 20, 30])
```
Your Day 1 practice uses spark.sparkContext to create RDDs.
**Remember:
SparkContext -> RDD processing.**

### 10. What is the difference between SparkSession and SparkContext?
**Answer**

**Example**

```text
df = spark.createDataFrame(data)
rdd = spark.sparkContext.parallelize(data)
```
**Remember:
SparkSession -> DataFrame/SQL | SparkContext -> RDD.**

### 11. How do you install PySpark?
**Answer**

**Example**

pip install pyspark
### 12. What is a Spark application?
**Answer**

**Example**

```text
spark = SparkSession.builder \
```
.appName("EmployeeAnalysis") \
.getOrCreate()
### 13. What is local mode in Spark?
**Answer**

**Example**

```text
spark = SparkSession.builder \
```
.master("local[*]") \
.appName("Practice") \
.getOrCreate()
Your practice files use local[*].
**Remember:
Local mode -> Spark runs on your machine.**

### 14. What is cluster mode in Spark?
**Answer**

**Example**

**Remember:
Cluster mode -> Distributed processing across machines.**

### 15. What is the difference between local mode and cluster mode?
**Answer**

**Example**

Local Mode
Your Computer
↓
Spark
Cluster Mode
Driver
↓
Executors
↓  ↓  ↓
Workers
**Remember:
Local -> One machine | Cluster -> Multiple machines.**

### 16. What is the difference between Hadoop and Spark?
**Answer**

**Example**

**Remember:
Hadoop -> Ecosystem | Spark -> Processing engine.**

### 17. What is an RDD?
**Answer**

**Example**

```text
data = [10, 20, 30, 40, 50]
rdd = spark.sparkContext.parallelize(data)
print(rdd.collect())
```
Your Day 1 practice creates RDDs using parallelize().
**Remember:
RDD -> Distributed + Immutable + Fault-tolerant.**

### 18. What does RDD stand for?
**Answer**

Resilient -> Can recover lost data.
Distributed -> Data is divided across partitions.
Dataset -> Collection of data processed by Spark.
**Example**

```text
rdd = spark.sparkContext.parallelize([1, 2, 3])
```
### 19. What are the main characteristics of an RDD?
**Answer**

**Example**

**Remember:
RDD -> Immutable + Distributed + Fault-tolerant.**

### 20. Why is an RDD called resilient?
**Answer**

**Example**

### 21. Why are RDDs immutable?
**Answer**

**Example**

```text
rdd2 = rdd.map(lambda x: x * 2)
```
Here, rdd remains unchanged and rdd2 is a new RDD.
**Remember:
RDD operations create new RDDs.**

### 22. How do you create an RDD from a Python collection?
**Answer**

**Example**

```text
data = [10, 20, 30, 40]
rdd = spark.sparkContext.parallelize(data)
```
### 23. What is parallelize() in PySpark?
**Answer**

**Example**

```text
data = [1, 2, 3, 4, 5]
rdd = spark.sparkContext.parallelize(data)
```
**Remember:
parallelize() -> Python collection -> RDD.**

### 24. How do you create an RDD from a text file?
**Answer**

**Example**

```text
rdd = spark.sparkContext.textFile("orders.txt")
```
Your Day 1 practice uses textFile() to read order files.
### 25. What is an RDD partition?
**Answer**

**Example**

rdd.getNumPartitions()
This method is used in your practice to check the number of partitions.
**Remember:
Partition -> Smaller piece of an RDD processed by Spark.**

### 26. Why are RDD partitions important?
**Answer**

**Example**

### 27. What is an RDD transformation?
**Answer**

**Example**

```text
new_rdd = rdd.map(lambda x: x * 2)
```
**Remember:
Transformation -> Creates a new RDD.**

### 28. What is an RDD action?
**Answer**

**Example**

```text
result = rdd.collect()
```
**Remember:
Action -> Triggers execution.**

### 29. What is lazy evaluation in Spark?
**Answer**

**Example**

```text
rdd2 = rdd.map(lambda x: x * 2)  # No execution yet
```
rdd2.collect()                   # Execution starts
**Remember:
Transformation waits -> Action executes.**

### 30. What is the difference between transformations and actions?
**Answer**

**Example**

```text
rdd2 = rdd.map(lambda x: x * 2)  # Transformation
```
rdd2.collect()                   # Action
**Remember:
Transformation -> Build the plan | Action -> Execute the plan.**

### 31. What is map() in PySpark?
**Answer**

**Example**

```text
rdd = spark.sparkContext.parallelize([1, 2, 3, 4])
result = rdd.map(lambda x: x * 2)
print(result.collect())
```
Output:
[2, 4, 6, 8]
**Remember:
map() -> One input -> One output.**

### 32. What is filter() in PySpark?
**Answer**

**Example**

```text
rdd = spark.sparkContext.parallelize([1, 2, 3, 4, 5])
result = rdd.filter(lambda x: x % 2 == 0)
print(result.collect())
```
Output:
[2, 4]
**Remember:
filter() -> Keep matching records.**

### 33. What is flatMap() in PySpark?
**Answer**

**Example**

```text
rdd = spark.sparkContext.parallelize(["hello world", "spark python"])
result = rdd.flatMap(lambda x: x.split(" "))
print(result.collect())
```
Output:
['hello', 'world', 'spark', 'python']
**Remember:
flatMap() -> Map + Flatten.**

### 34. What is the difference between map() and flatMap()?
**Answer**

**Example**

```text
rdd = spark.sparkContext.parallelize(["A B", "C D"])
```
rdd.map(lambda x: x.split(" ")).collect()
# [['A', 'B'], ['C', 'D']]
rdd.flatMap(lambda x: x.split(" ")).collect()
# ['A', 'B', 'C', 'D']
**Remember:
map() -> Keeps structure | flatMap() -> Flattens structure.**

### 35. What is distinct() in PySpark?
**Answer**

**Example**

```text
rdd = spark.sparkContext.parallelize([1, 2, 2, 3, 3, 3])
result = rdd.distinct()
print(result.collect())
```
Output:
[1, 2, 3]
**Remember:
distinct() -> Removes duplicates.**

### 36. What is sortBy() in PySpark?
**Answer**

**Example**

```text
rdd = spark.sparkContext.parallelize([30, 10, 40, 20])
result = rdd.sortBy(lambda x: x)
print(result.collect())
```
Output:
[10, 20, 30, 40]
### 37. What is sortByKey() in PySpark?
**Answer**

**Example**

```text
rdd = spark.sparkContext.parallelize([
```
(103, "C"),
(101, "A"),
(102, "B")
])
```text
print(rdd.sortByKey().collect())
```
Output:
[(101, 'A'), (102, 'B'), (103, 'C')]
**Remember:
sortByKey() -> Sort using the key.**

##  Module 2: Key-Value RDDs
### 38. What is a key-value RDD?
**Answer**

**Example**

```text
rdd = spark.sparkContext.parallelize([
```
("Apple", 10),
("Banana", 20),
("Apple", 15)
])
**Remember:
Key-value RDD -> (key, value) pairs.**

### 39. What is mapValues() in PySpark?
**Answer**

**Example**

```text
rdd = spark.sparkContext.parallelize([
```
("Apple", 10),
("Banana", 20)
])
```text
result = rdd.mapValues(lambda x: x + 5)
print(result.collect())
```
Output:
[('Apple', 15), ('Banana', 25)]
**Remember:
mapValues() -> Change values, keep keys.**

### 40. What is reduceByKey() in PySpark?
**Answer**

**Example**

```text
rdd = spark.sparkContext.parallelize([
```
("Apple", 10),
("Banana", 20),
("Apple", 15)
])
```text
result = rdd.reduceByKey(lambda a, b: a + b)
print(result.collect())
```
Output:
[('Apple', 25), ('Banana', 20)]
**Remember:
reduceByKey() -> Same key -> Combine values.**

### 41. What is groupByKey() in PySpark?
**Answer**

**Example**

```text
rdd = spark.sparkContext.parallelize([
```
("Apple", 10),
("Apple", 20),
("Banana", 30)
])
```text
result = rdd.groupByKey()
print([(k, list(v)) for k, v in result.collect()])
```
Output:
[('Apple', [10, 20]), ('Banana', [30])]
**Remember:
groupByKey() -> Same key -> Group all values.**

### 42. What is the difference between reduceByKey() and groupByKey()?
**Answer**

**Example**

# reduceByKey
rdd.reduceByKey(lambda a, b: a + b)
# groupByKey
rdd.groupByKey()
**Remember:
Aggregation needed -> reduceByKey()
All values needed -> groupByKey()**

### 43. Why is reduceByKey() generally preferred over groupByKey() for aggregation?
**Answer**

**Example**

rdd.reduceByKey(lambda a, b: a + b)
**Remember:
reduceByKey() -> Local combine -> Less shuffle data.**

### 44. What is cogroup() in PySpark?
**Answer**

**Example**

```text
rdd1 = spark.sparkContext.parallelize([
```
("A", 10),
("B", 20)
])
```text
rdd2 = spark.sparkContext.parallelize([
```
("A", 100),
("B", 200)
])
```text
result = rdd1.cogroup(rdd2)
```
**Remember:
cogroup() -> Group multiple RDDs by key.**

##  Module 3: RDD Set Operations
### 45. What is union() in PySpark?
**Answer**

**Example**

```text
rdd1 = spark.sparkContext.parallelize([1, 2, 3])
rdd2 = spark.sparkContext.parallelize([3, 4, 5])
result = rdd1.union(rdd2)
print(result.collect())
```
Output:
[1, 2, 3, 3, 4, 5]
**Remember:
union() -> Combine RDDs.**

### 46. What is intersection() in PySpark?
**Answer**

**Example**

```text
rdd1 = spark.sparkContext.parallelize([1, 2, 3])
rdd2 = spark.sparkContext.parallelize([2, 3, 4])
result = rdd1.intersection(rdd2)
print(result.collect())
```
Output:
[2, 3]
**Remember:
intersection() -> Common values.**

### 47. What is subtract() in PySpark?
**Answer**

**Example**

```text
rdd1 = spark.sparkContext.parallelize([1, 2, 3, 4])
rdd2 = spark.sparkContext.parallelize([3, 4])
result = rdd1.subtract(rdd2)
print(result.collect())
```
Output:
[1, 2]
**Remember:
subtract() -> First RDD minus second RDD.**

##  Module 4: RDD Joins
### 48. What is a join in PySpark RDDs?
**Answer**

**Example**

```text
employees = spark.sparkContext.parallelize([
```
(1, "Vaseem"),
(2, "Rahul")
])
```text
salaries = spark.sparkContext.parallelize([
```
(1, 50000),
(2, 60000)
])
```text
result = employees.join(salaries)
print(result.collect())
```
Output:
[(1, ('Vaseem', 50000)), (2, ('Rahul', 60000))]
**Remember:
Join -> Match records using keys.**

### 49. What is leftOuterJoin() in PySpark?
**Answer**

**Example**

```text
employees = spark.sparkContext.parallelize([
```
(1, "Vaseem"),
(2, "Rahul")
])
```text
departments = spark.sparkContext.parallelize([
```
(1, "IT")
])
```text
result = employees.leftOuterJoin(departments)
print(result.collect())
```
Output:
[(1, ('Vaseem', 'IT')), (2, ('Rahul', None))]
**Remember:
Left outer join -> Keep everything from left RDD.**

### 50. What is rightOuterJoin() in PySpark?
**Answer**

**Example**

```text
result = employees.rightOuterJoin(departments)
```
**Remember:
Right outer join -> Keep everything from right RDD.**

### 51. What is fullOuterJoin() in PySpark?
**Answer**

**Example**

```text
result = employees.fullOuterJoin(departments)
```
**Remember:
Full outer join -> Keep everything from both sides.**

##  Module 5: RDD Actions
### 52. What is first() in PySpark?
**Answer**

**Example**

```text
rdd = spark.sparkContext.parallelize([10, 20, 30])
print(rdd.first())
```
Output:
10
### 53. What is takeSample() in PySpark?
**Answer**

**Example**

```text
sample = rdd.takeSample(False, 2)
print(sample)
```
Your practice files use takeSample() for sampling RDD data.
**Remember:
takeSample() -> Random sample from RDD.**

### 54. What is saveAsTextFile() in PySpark?
**Answer**

**Example**

rdd.saveAsTextFile("output/orders")
**Remember:
saveAsTextFile() -> RDD -> Text output.**

##  Module 6: Shared Variables
### 55. What is a broadcast variable in PySpark?
**Answer**

**Example**

```text
product_data = {
```
101: "Laptop",
102: "Mobile"
}
```text
broadcast_product = spark.sparkContext.broadcast(product_data)
```
Your Day 3 practice includes broadcast variables.
**Remember:
Broadcast -> Send small read-only data efficiently.**

### 56. Why are broadcast variables used?
**Answer**

**Example**

**Remember:
Small common data -> Broadcast it.**

### 57. What is an accumulator in PySpark?
**Answer**

**Example**

```text
counter = spark.sparkContext.accumulator(0)
def count_values(x):
```
counter.add(1)
return x
rdd.map(count_values).collect()
```text
print(counter.value)
```
**Remember:
Accumulator -> Tasks add values -> Driver reads result.**

### 58. What is the difference between a broadcast variable and an accumulator?
**Answer**

**Example**

Broadcast
Driver -> Executors
Accumulator
Executors -> Driver
**Remember:
Broadcast -> Driver to executors
Accumulator -> Executors to driver.**

##  Module 7: Important RDD Concepts
### 59. What is a narrow transformation?
**Answer**

**Example**

rdd.map(lambda x: x * 2)
**Remember:
Narrow -> No major shuffle.**

### 60. What is a wide transformation?
**Answer**

**Example**

rdd.reduceByKey(lambda a, b: a + b)
**Remember:
Wide -> Shuffle may occur.**

### 61. What is shuffle in Spark?
**Answer**

**Example**

rdd.reduceByKey(lambda a, b: a + b)
**Remember:
Shuffle -> Data moves between partitions.**

### 62. Why can shuffle affect Spark performance?
**Answer**

**Example**

**Remember:
More shuffle -> More network and processing cost.**

### 63. What is the difference between narrow and wide transformations?
**Answer**

**Example**

Narrow:
map()
filter()
Wide:
reduceByKey()
groupByKey()
join()
**Remember:
Narrow -> Limited dependency | Wide -> Shuffle dependency.**

### 64. What is a DataFrame in PySpark?
**Answer**

**Example**

```text
data = [
```
(101, "Vaseem", 50000),
(102, "Rahul", 60000)
]
```text
df = spark.createDataFrame(
```
data,
["id", "name", "salary"]
)
df.show()
**Remember:
DataFrame -> Distributed data organized into columns.**

### 65. Why are DataFrames used in PySpark?
**Answer**

**Example**

df.select("name", "salary").show()
### 66. How do you create a DataFrame in PySpark?
**Answer**

**Example**

```text
data = [
```
(1, "A"),
(2, "B")
]
```text
df = spark.createDataFrame(data, ["id", "name"])
```
Your practice files use createDataFrame() with data and column names.
### 67. What is a schema in PySpark?
**Answer**

**Example**

df.printSchema()
**Remember:
Schema -> Structure of DataFrame.**

### 68. What is show() in PySpark?
**Answer**

**Example**

df.show()
### 69. What is printSchema() in PySpark?
**Answer**

**Example**

df.printSchema()
**Remember:
show() -> Data | printSchema() -> Structure.**

##  Module 2: Selecting and Modifying Columns
### 70. What is select() in PySpark?
**Answer**

**Example**

df.select("name", "salary").show()
**Remember:
select() -> Choose columns.**

### 71. What is withColumn() in PySpark?
**Answer**

**Example**

```text
from pyspark.sql.functions import col
df2 = df.withColumn("bonus", col("salary") * 0.10)
```
df2.show()
### 72. What is withColumnRenamed() in PySpark?
**Answer**

**Example**

```text
df2 = df.withColumnRenamed("salary", "monthly_salary")
```
**Remember:
withColumnRenamed() -> Rename a column.**

### 73. What is drop() in PySpark?
**Answer**

**Example**

```text
df2 = df.drop("salary")
```
### 74. What is the difference between select() and drop()?
**Answer**

**Example**

df.select("name", "salary")
df.drop("salary")
**Remember:
select() -> Keep selected columns | drop() -> Remove selected columns.**

##  Module 3: Filtering and Sorting
### 75. What is filter() in DataFrames?
**Answer**

**Example**

df.filter(df.salary > 50000).show()
### 76. What is where() in PySpark?
**Answer**

**Example**

df.where(df.salary > 50000).show()
**Remember:
where() and filter() -> Filter rows.**

### 77. What is the difference between filter() and where()?
**Answer**

**Example**

df.filter(df.salary > 50000)
df.where(df.salary > 50000)
### 78. How do you filter rows using multiple conditions?
**Answer**

**Example**

df.filter(
```text
(df.salary > 50000) & (df.department == "IT")
```
).show()
### 79. How do you filter values using isin()?
**Answer**

**Example**

df.filter(
df.department.isin("IT", "HR")
).show()
### 80. How do you filter data using between()?
**Answer**

**Example**

df.filter(
df.salary.between(40000, 70000)
).show()
### 81. How do you filter data using like()?
**Answer**

**Example**

df.filter(
df.name.like("V%")
).show()
**Remember:
% -> Matches any number of characters.**

### 82. How do you sort a DataFrame?
**Answer**

**Example**

df.orderBy("salary").show()
Descending:
```text
from pyspark.sql.functions import desc
```
df.orderBy(desc("salary")).show()
##  Module 4: DataFrame Functions
### 83. What are built-in functions in PySpark?
**Answer**

**Example**

```text
from pyspark.sql.functions import upper
```
df.select(upper("name")).show()
### 84. What are string functions in PySpark?
**Answer**

**Example**

```text
from pyspark.sql.functions import upper
```
df.select(upper("name")).show()
### 85. What is upper() in PySpark?
**Answer**

**Example**

```text
from pyspark.sql.functions import upper
```
df.select(upper("name")).show()
### 86. What is lower() in PySpark?
**Answer**

**Example**

```text
from pyspark.sql.functions import lower
```
df.select(lower("name")).show()
### 87. What is length() in PySpark?
**Answer**

**Example**

```text
from pyspark.sql.functions import length
```
df.select("name", length("name")).show()
### 88. What are date functions in PySpark?
**Answer**

**Example**

```text
from pyspark.sql.functions import year
```
df.select(year("joining_date")).show()
### 89. What are mathematical functions in PySpark?
**Answer**

**Example**

```text
from pyspark.sql.functions import round
```
df.select(round("salary", 2)).show()
##  Module 5: Handling Null Values
### 90. What is a null value in PySpark?
**Answer**

**Example**

id    name      salary
1     Vaseem    50000
2     Rahul     NULL
### 91. What is dropna() in PySpark?
**Answer**

**Example**

```text
df2 = df.dropna()
```
**Remember:
dropna() -> Remove rows with nulls.**

### 92. What is fillna() in PySpark?
**Answer**

**Example**

```text
df2 = df.fillna({
```
"salary": 0
})
**Remember:
fillna() -> Replace nulls.**

### 93. What is the difference between dropna() and fillna()?
**Answer**

**Example**

df.dropna()
df.fillna({"salary": 0})
**Remember:
dropna() -> Remove | fillna() -> Replace.**

##  Module 6: Handling Duplicate Data
### 94. What is dropDuplicates() in PySpark?
**Answer**

**Example**

```text
df2 = df.dropDuplicates()
```
### 95. How do you remove duplicates based on a specific column?
**Answer**

**Example**

```text
df2 = df.dropDuplicates(["email"])
```
**Remember:
dropDuplicates() -> Remove repeated records.**

##  Module 7: DataFrame Aggregations
### 96. What is an aggregation in PySpark?
**Answer**

**Example**

```text
from pyspark.sql.functions import sum
```
df.select(sum("salary")).show()
### 97. What is groupBy() in PySpark?
**Answer**

**Example**

df.groupBy("department").count().show()
**Remember:
groupBy() -> Create groups for aggregation.**

### 98. What is count() in DataFrame aggregation?
**Answer**

**Example**

df.groupBy("department").count().show()
### 99. What is sum() in PySpark?
**Answer**

**Example**

```text
from pyspark.sql.functions import sum
```
df.groupBy("department") \
.agg(sum("salary")) \
.show()
### 100. What is avg() in PySpark?
**Answer**

**Example**

```text
from pyspark.sql.functions import avg
```
df.groupBy("department") \
.agg(avg("salary")) \
.show()
### 101. What is min() in PySpark?
**Answer**

**Example**

```text
from pyspark.sql.functions import min
```
df.groupBy("department") \
.agg(min("salary")) \
.show()
### 102. What is max() in PySpark?
**Answer**

**Example**

```text
from pyspark.sql.functions import max
```
df.groupBy("department") \
.agg(max("salary")) \
.show()
### 103. What is agg() in PySpark?
**Answer**

**Example**

```text
from pyspark.sql.functions import sum, avg, max
```
df.groupBy("department").agg(
sum("salary"),
avg("salary"),
max("salary")
).show()
**Remember:
agg() -> Multiple aggregate calculations together.**

### 104. What is the difference between groupBy() and agg()?
**Answer**

**Example**

df.groupBy("department").agg(
sum("salary"),
avg("salary")
).show()
**Remember:
groupBy() -> Group | agg() -> Calculate.**

##  Module 8: Datasets
### 105. What is a Dataset in Spark?
**Answer**

**Example**

**Remember:
Dataset -> Structured + Typed distributed data.**

### 106. What is the difference between RDD, DataFrame, and Dataset?
**Answer**

**Example**

RDD       -> Low-level distributed data
DataFrame -> Structured data
Dataset   -> Structured + strongly typed data
**Remember:
RDD -> Flexible | DataFrame -> Structured | Dataset -> Typed.**

### 107. Does PySpark support the Dataset API?
**Answer**

**Example**

```text
df = spark.createDataFrame(data)
```
**Remember:
PySpark -> DataFrame is the main structured API.**

##  Module 9: JSON Data
### 108. How can you read JSON data in PySpark?
**Answer**

**Example**

```text
df = spark.read.json("employees.json")
```
df.show()
### 109. How can you write a DataFrame to JSON in PySpark?
**Answer**

**Example**

df.write.json("output/employees")
**Remember:
Read -> spark.read.json()
Write -> df.write.json()**

### 110. Why is JSON commonly used in data processing?
**Answer**

**Example**

{
"id": 101,
"name": "Vaseem",
"skills": ["Python", "SQL"]
}
##  Module 1: DataFrame Joins
### 111. What is a join in PySpark?
**Answer**

**Example**

```text
result = employees.join(
```
departments,
```text
employees.dept_id == departments.dept_id,
```
"inner"
)
result.show()
**Remember:
Join -> Combine related data.**

### 112. What is an inner join?
**Answer**

**Example**

```text
result = employees.join(
```
departments,
"dept_id",
"inner"
)
**Remember:
Inner join -> Matching records only.**

### 113. What is a left join?
**Answer**

**Example**

```text
result = employees.join(
```
departments,
"dept_id",
"left"
)
**Remember:
Left join -> Keep everything from left.**

### 114. What is a right join?
**Answer**

**Example**

```text
result = employees.join(
```
departments,
"dept_id",
"right"
)
**Remember:
Right join -> Keep everything from right.**

### 115. What is a full outer join?
**Answer**

**Example**

```text
result = employees.join(
```
departments,
"dept_id",
"full"
)
**Remember:
Full join -> Keep everything from both.**

### 116. What is a left semi join?
**Answer**

**Example**

```text
result = employees.join(
```
departments,
"dept_id",
"left_semi"
)
**Remember:
Left semi -> Matching rows from left only.**

### 117. What is a left anti join?
**Answer**

**Example**

```text
result = employees.join(
```
departments,
"dept_id",
"left_anti"
)
**Remember:
Left anti -> Non-matching rows from left.**

### 118. What is a cross join?
**Answer**

**Example**

```text
result = employees.crossJoin(departments)
```
**Remember:
Cross join -> Every row with every row.**

### 119. What is the difference between inner join and left join?
**Answer**

**Example**

Inner -> Matching records
Left  -> All left + matching right
### 120. What is the difference between left semi join and left anti join?
**Answer**

**Example**

Left Semi -> Matching left records
Left Anti -> Non-matching left records
**Remember:
Semi -> Exists | Anti -> Does not exist.**

##  Module 2: DataFrame Set Operations
### 121. What is union() in DataFrames?
**Answer**

**Example**

```text
result = df1.union(df2)
```
### 122. What is unionByName() in PySpark?
**Answer**

**Example**

```text
result = df1.unionByName(df2)
```
**Remember:
union() -> Position | unionByName() -> Column name.**

### 123. What is intersect() in PySpark?
**Answer**

**Example**

```text
result = df1.intersect(df2)
```
**Remember:
intersect() -> Common rows.**

### 124. What is subtract() in PySpark DataFrames?
**Answer**

**Example**

```text
result = df1.subtract(df2)
```
**Remember:
subtract() -> First DataFrame minus second.**

##  Module 3: Window Functions
### 125. What is a window function in PySpark?
**Answer**

**Example**

```text
from pyspark.sql.window import Window
from pyspark.sql.functions import row_number
window = Window.partitionBy("department") \
```
.orderBy("salary")
df.withColumn(
"row_num",
row_number().over(window)
).show()
Your Day 4 practice extensively uses window functions with partitionBy() and orderBy().
**Remember:
Window -> Calculate across related rows without collapsing them.**

### 126. What is Window.partitionBy()?
**Answer**

**Example**

```text
window = Window.partitionBy("department") \
```
.orderBy("salary")
**Remember:
partitionBy() -> Create groups for window calculation.**

### 127. What is Window.orderBy()?
**Answer**

**Example**

```text
window = Window.partitionBy("department") \
```
.orderBy("salary")
### 128. What is row_number() in PySpark?
**Answer**

**Example**

```text
from pyspark.sql.functions import row_number
```
df.withColumn(
"row_num",
row_number().over(window)
).show()
**Remember:
row_number() -> Unique sequence for every row.**

### 129. What is rank() in PySpark?
**Answer**

**Example**

```text
from pyspark.sql.functions import rank
```
df.withColumn(
"rank",
rank().over(window)
).show()
**Remember:
Same value -> Same rank, gaps can occur.**

### 130. What is dense_rank() in PySpark?
**Answer**

**Example**

```text
from pyspark.sql.functions import dense_rank
```
df.withColumn(
"rank",
dense_rank().over(window)
).show()
**Remember:
Dense rank -> Same rank, no gaps.**

### 131. What is the difference between rank(), dense_rank(), and row_number()?
**Answer**

**Example**

Values:       100  100  90
row_number:     1    2   3
rank:           1    1   3
dense_rank:     1    1   2
**Remember:
row_number -> Unique | rank -> Gaps | dense_rank -> No gaps.**

### 132. What is lag() in PySpark?
**Answer**

**Example**

```text
from pyspark.sql.functions import lag
```
df.withColumn(
"previous_salary",
lag("salary", 1).over(window)
).show()
**Remember:
lag() -> Previous row.**

### 133. What is lead() in PySpark?
**Answer**

**Example**

```text
from pyspark.sql.functions import lead
```
df.withColumn(
"next_salary",
lead("salary", 1).over(window)
).show()
**Remember:
lead() -> Next row.**

### 134. What is first_value() in PySpark?
**Answer**

**Example**

```text
from pyspark.sql.functions import first_value
```
df.withColumn(
"first_salary",
first_value("salary").over(window)
).show()
### 135. What is last_value() in PySpark?
**Answer**

**Example**

```text
from pyspark.sql.functions import last_value
```
df.withColumn(
"last_salary",
last_value("salary").over(window)
).show()
### 136. Can aggregate functions be used with window functions?
**Answer**

**Example**

```text
from pyspark.sql.functions import sum
```
df.withColumn(
"dept_total",
sum("salary").over(window)
).show()
**Remember:
Window aggregation -> Calculate across rows without grouping them into one row.**

### 137. What is a running total in PySpark?
**Answer**

**Example**

```text
from pyspark.sql.functions import sum
from pyspark.sql.window import Window
window = Window.orderBy("date") \
```
.rowsBetween(Window.unboundedPreceding, Window.currentRow)
df.withColumn(
"running_total",
sum("amount").over(window)
).show()
##  Module 4: Spark SQL
### 138. What is Spark SQL?
**Answer**

**Example**

df.createOrReplaceTempView("employees")
spark.sql("""
```text
SELECT name, salary
```
FROM employees
WHERE salary > 50000
""").show()
Your Day 4 practice uses temporary views and spark.sql() for SQL queries.
### 139. What is a temporary view in PySpark?
**Answer**

**Example**

df.createOrReplaceTempView("employees")
spark.sql("SELECT * FROM employees").show()
**Remember:
Temporary view -> DataFrame accessible through SQL.**

### 140. What is createOrReplaceTempView()?
**Answer**

**Example**

df.createOrReplaceTempView("employees")
##  Module 5: Spark Execution
### 141. What is a DAG in Spark?
**Answer**

**Example**

Read Data
↓
Filter
↓
Map
↓
Reduce
**Remember:
DAG -> Execution plan of Spark transformations.**

### 142. What is a Spark job?
**Answer**

**Example**

rdd.map(lambda x: x * 2).count()
Here, count() triggers a Spark job.
**Remember:
Action -> Triggers a job.**

### 143. What is a Spark stage?
**Answer**

**Example**

Job
↓
Stage 1
↓ shuffle
Stage 2
**Remember:
Shuffle boundary -> New stage.**

### 144. What is a Spark task?
**Answer**

**Example**

**Remember:
One partition -> One task.**

### 145. What is an executor in Spark?
**Answer**

**Example**

Driver
↓
Executors
↓
Tasks
**Remember:
Executor -> Runs tasks.**

### 146. What is the Spark driver?
**Answer**

**Example**

Spark Application
↓
Driver
↓
Executors
**Remember:
Driver -> Coordinates the application.**

### 147. What is a worker node in Spark?
**Answer**

**Example**

Cluster
├── Worker 1 -> Executor
├── Worker 2 -> Executor
└── Worker 3 -> Executor
### 148. What is the relationship between driver, executor, task, and worker?
**Answer**

**Example**

Driver
↓
Job
↓
Stages
↓
Tasks
↓
Executors on Workers
**Remember:
Driver -> Schedules | Executor -> Executes.**

##  Module 6: Cluster Managers
### 149. What is a cluster manager in Spark?
**Answer**

**Example**

**Remember:
Cluster Manager -> Provides cluster resources.**

### 150. What are common cluster managers supported by Spark?
**Answer**

**Example**

Standalone
YARN
Kubernetes
### 151. What is Spark Standalone?
**Answer**

**Example**

### 152. What is YARN in Spark?
**Answer**

**Example**

### 153. What is Kubernetes in Spark?
**Answer**

**Example**

##  Module 7: spark-submit
### 154. What is spark-submit?
**Answer**

**Example**

spark-submit employee_analysis.py
**Remember:
spark-submit -> Run a Spark application.**

### 155. What is the --master option in spark-submit?
**Answer**

**Example**

spark-submit --master local[*] employee_analysis.py
### 156. What is the --deploy-mode option in spark-submit?
**Answer**

**Example**

spark-submit \
--master yarn \
--deploy-mode cluster \
employee_analysis.py
**Remember:
client -> Driver near submitting machine
cluster -> Driver inside cluster.**

##  Module 8: Caching and Persistence
### 157. What is caching in PySpark?
**Answer**

**Example**

df.cache()
df.count()
df.show()
Your practice files explicitly use .cache().
**Remember:
Cache -> Store computed data for reuse.**

### 158. What is persist() in PySpark?
**Answer**

**Example**

```text
from pyspark import StorageLevel
```
rdd.persist(StorageLevel.MEMORY_ONLY)
Your practice includes persist() with MEMORY_ONLY.
### 159. What is the difference between cache() and persist()?
**Answer**

**Example**

df.cache()
rdd.persist(StorageLevel.MEMORY_ONLY)
**Remember:
cache() -> Default storage | persist() -> Choose storage level.**

### 160. What is unpersist() in PySpark?
**Answer**

**Example**

rdd.unpersist()
Your practice explicitly uses unpersist().
### 161. What are common Spark storage levels?
**Answer**

**Example**

rdd.persist(StorageLevel.MEMORY_AND_DISK)
**Remember:
Storage level -> How persisted data is stored.**

##  Module 9: Spark Performance & Troubleshooting
### 162. Why is partitioning important for Spark performance?
**Answer**

**Example**

```text
print(rdd.getNumPartitions())
```
### 163. What is data skew in Spark?
**Answer**

**Example**

**Remember:
Data skew -> Uneven data distribution.**

### 164. What is an out-of-memory error in Spark?
**Answer**

**Example**

**Remember:
Huge data on driver -> Possible memory problem.**

### 165. Why should collect() be avoided on large datasets?
**Answer**

**Example**

# Risky for huge data
df.collect()
Instead, for inspection:
df.show(10)
**Remember:
collect() -> Brings everything to driver.**

### 166. How can you troubleshoot a slow Spark job?
**Answer**

**Example**

df.explain(True)
Your Day 4 practice uses explain(True) to inspect execution plans.
**Remember:
Slow job -> Check stages, shuffle, partitions, skew, and memory.**

### 167. What is explain() in PySpark?
**Answer**

**Example**

df.explain(True)
**Remember:
explain() -> View execution plan.**

### 168. What are common causes of Spark performance problems?
**Answer**

**Example**

##  Module 10: Memory Tuning
### 169. What is executor memory in Spark?
**Answer**

**Example**

spark-submit --executor-memory 4g employee_analysis.py
**Remember:
Executor memory -> Memory available to executor.**

### 170. What is driver memory in Spark?
**Answer**

**Example**

spark-submit --driver-memory 2g employee_analysis.py
**Remember:
Driver memory -> Memory available to driver.**

### 171. What is the difference between driver memory and executor memory?
**Answer**

**Example**

Driver Memory   -> Driver
Executor Memory -> Executors
##  Module 1: Real-Time / Structured Streaming
### 172. What is real-time data processing?
**Answer**

**Example**

**Remember:
Batch -> Process stored data | Streaming -> Process incoming data.**

### 173. What is Structured Streaming in PySpark?
**Answer**

**Example**

```text
stream_df = spark.readStream \
```
.format("json") \
.schema(schema) \
.load("input/")
**Remember:
Structured Streaming -> DataFrame API for streaming data.**

### 174. What is the difference between batch processing and stream processing?
**Answer**

**Example**

Batch     -> Process today's sales at midnight
Streaming -> Process each sale as it arrives
### 175. What is a streaming DataFrame?
**Answer**

**Example**

```text
stream_df = spark.readStream \
```
.format("json") \
.schema(schema) \
.load("input/")
**Remember:
read() -> Batch | readStream() -> Streaming.**

### 176. What is readStream in PySpark?
**Answer**

**Example**

```text
stream_df = spark.readStream \
```
.format("json") \
.schema(schema) \
.load("input/")
### 177. What is writeStream in PySpark?
**Answer**

**Example**

```text
query = stream_df.writeStream \
```
.format("console") \
.start()
**Remember:
readStream -> Read | writeStream -> Write.**

### 178. What is a streaming query?
**Answer**

**Example**

```text
query = stream_df.writeStream \
```
.format("console") \
.start()
### 179. What is a streaming source?
**Answer**

**Example**

**Remember:
Source -> Where streaming data comes from.**

### 180. What is a streaming sink?
**Answer**

**Example**

stream_df.writeStream \
.format("console") \
.start()
**Remember:
Source -> Input | Sink -> Output.**

##  Module 2: Azure Event Hubs
### 181. What is Azure Event Hubs?
**Answer**

**Example**

**Remember:
Event Hubs -> Large-scale event ingestion.**

### 182. Why is Azure Event Hubs used in streaming?
**Answer**

**Example**

IoT Devices
↓
Azure Event Hubs
↓
PySpark Streaming
↓
Analysis
### 183. What is an event in Azure Event Hubs?
**Answer**

**Example**

{
"device_id": 101,
"temperature": 32
}
**Remember:
Event -> One piece of incoming data.**

### 184. What is an Event Hub producer?
**Answer**

**Example**

**Remember:
Producer -> Sends events.**

### 185. What is an Event Hub consumer?
**Answer**

**Example**

Producer
↓
Event Hub
↓
Spark Consumer
**Remember:
Consumer -> Reads events.**

### 186. What is an Event Hub partition?
**Answer**

**Example**

Event Hub
├── Partition 0
├── Partition 1
└── Partition 2
**Remember:
Partition -> Parallel event processing.**

##  Module 3: Streaming Windowing
### 187. What is windowing in streaming?
**Answer**

**Example**

**Remember:
Window -> Group streaming data by time.**

### 188. Why is windowing needed in streaming?
**Answer**

**Example**

Continuous transactions
↓
5-minute windows
↓
Transaction count per window
### 189. What is a tumbling window?
**Answer**

**Example**

10:00–10:05
10:05–10:10
10:10–10:15
**Remember:
Tumbling -> Fixed + Non-overlapping.**

### 190. What is a sliding window?
**Answer**

**Example**

```text
Window = 10 minutes
Slide  = 5 minutes
```
**Remember:
Sliding -> Moving + Overlapping.**

### 191. What is the difference between tumbling and sliding windows?
**Answer**

**Example**

Tumbling:
10–15 | 15–20 | 20–25
Sliding:
10–20
15–25
20–30
##  Module 4: Watermarking
### 192. What is watermarking in Structured Streaming?
**Answer**

**Example**

df.withWatermark("event_time", "10 minutes")
**Remember:
Watermark -> Handle late data + clean old state.**

### 193. Why is watermarking required in streaming?
**Answer**

**Example**

### 194. What is late-arriving data?
**Answer**

**Example**

**Remember:
Event time ≠ Arrival time.**

### 195. What is event time in Structured Streaming?
**Answer**

**Example**

Event occurred -> 10:05
Spark received  -> 10:08
Event time      -> 10:05
Processing time -> 10:08
### 196. What is processing time in streaming?
**Answer**

**Example**

**Remember:
Processing time -> When Spark processes the event.**

### 197. What is the difference between event time and processing time?
**Answer**

**Example**

```text
Event time      = 10:05
Processing time = 10:08
```
##  Module 5: State Management
### 198. What is state management in Structured Streaming?
**Answer**

**Example**

**Remember:
State -> Information remembered between batches.**

### 199. Why is state management needed in streaming?
**Answer**

**Example**

```text
Previous count = 100
New event      = +1
Updated count  = 101
```
### 200. What is stateful processing?
**Answer**

**Example**

**Remember:
Stateful -> Uses previous information.**

### 201. What is stateless processing?
**Answer**

**Example**

**Remember:
Stateless -> Each event processed independently.**

### 202. What is the difference between stateful and stateless processing?
**Answer**

**Example**

Stateless -> Convert temperature
Stateful  -> Running transaction count
##  Module 6: Streaming Best Practices
### 203. What are best practices for Structured Streaming?
**Answer**

**Example**

**Remember:
Streaming -> Control state, late data, partitions, and monitoring.**

### 204. Why is checkpointing important in Structured Streaming?
**Answer**

**Example**

```text
query = stream_df.writeStream \
```
.option("checkpointLocation", "checkpoint/") \
.format("console") \
.start()
**Remember:
Checkpoint -> Recover streaming progress.**

### 205. Why should we monitor streaming applications?
**Answer**

**Example**

### 206. Why is controlling state size important?
**Answer**

**Example**

**Remember:
Large state -> More resource usage.**

### 207. Why is partitioning important in streaming?
**Answer**

**Example**

### 208. What should you consider when designing a streaming pipeline?
**Answer**

**Example**

Event Source
↓
Spark Streaming
↓
Window / State
↓
Processing
↓
Output Sink


# Part C — Source-Style Scala Q&A
# Scala — Complete Interview Notes (Source-Derived)
> Complete source-derived interview notes from `Scala.docx`. The question/answer content is preserved and organized for Markdown study.
## Phase 1 — Scala Core & Fundamentals
### Q1. What is Scala?
**Answer**

**Example**

```text
val name = "Vaseem"
```
println(name)
### Q2. What are the main features of Scala?
**Answer**

### Q3. Why is Scala used with Apache Spark?
**Answer**

### Q4. What is Functional Programming?
**Answer**

**Example**

```text
val numbers = List(1, 2, 3)
val result = numbers.map(x => x * 2)
```
### Q5. What does statically typed mean in Scala?
**Answer**

**Example**

```text
val age: Int = 25
```
### Q6. What is Scala setup and how can we run a Scala program?
**Answer**

Simple program:
@main
```text
def hello(): Unit = {
```
println("Hello Scala")
}
### Q7. What is the difference between val and var in Scala?
**Answer**

**Example**

```text
val age = 25
var name = "Vaseem"
name = "Rahul"
```
Here, name can change, but age cannot be reassigned.
### Q8. What is type inference in Scala?
**Answer**

**Example**

```text
val age = 25
val name = "Vaseem"
```
Scala understands that age is an Int and name is a String.
### Q9. What are the commonly used data types in Scala?
**Answer**

**Example**

```text
val age: Int = 25
val salary: Double = 50000.5
val grade: Char = 'A'
val active: Boolean = true
val name: String = "Vaseem"
```
### Q10. What is immutability in Scala?
**Answer**

**Example**

```text
val numbers = List(1, 2, 3)
val newNumbers = numbers.map(x => x * 2)
```
The original numbers List is not changed.
### Q11. What is the difference between an expression and a statement in Scala?
**Answer**

**Example**

```text
val result = if (10 > 5) "Yes" else "No"
```
Here, the if-else produces "Yes", so it is an expression.
println("Hello")
A statement performs an action rather than producing a value that we normally use.
### Q12. How does if-else work in Scala?
**Answer**

**Example**

```text
val age = 20
if (age >= 18)
```
println("Eligible")
else
println("Not Eligible")
### Q13. What is a nested if in Scala?
**Answer**

**Example**

```text
val age = 25
val citizen = true
if (age >= 18) {
if (citizen)
```
println("Eligible")
}
### Q14. What is a for loop in Scala?
**Answer**

**Example**

```text
for (i <- 1 to 5) {
```
println(i)
}
This prints numbers from 1 to 5.
### Q15. What is the difference between to and until in Scala?
**Answer**

**Example**

1 to 5
produces:
1 2 3 4 5
But:
1 until 5
produces:
1 2 3 4
### Q16. What is a while loop in Scala?
**Answer**

**Example**

```text
var i = 1
while (i <= 3) {
```
println(i)
```text
i += 1
```
}
### Q17. What is a function in Scala?
**Answer**

**Example**

```text
def add(a: Int, b: Int): Int = {
```
a + b
}
println(add(10, 20))
Output:
30
### Q18. What is a lambda function in Scala?
**Answer**

**Example**

```text
val square = (x: Int) => x * x
```
println(square(5))
Output:
25
### Q19. What is a pure function in Scala?
**Answer**

**Example**

```text
def add(a: Int, b: Int): Int = {
```
a + b
}
add(10, 20) will always return 30.
### Q20. What is an impure function in Scala?
**Answer**

**Example**

```text
var count = 0
def increment(): Unit = {
count += 1
```
}
Here, the function changes the external variable count, so it is impure.
### Q21. What is the difference between pure and impure functions?
**Answer**

### Q22. What is a higher-order function in Scala?
**Answer**

**Example**

```text
def calculate(
```
a: Int,
b: Int,
```text
operation: (Int, Int) => Int
): Int = {
```
operation(a, b)
}
```text
println(calculate(10, 20, (x, y) => x + y))
```
Here, (x, y) => x + y is passed as a function argument.
### Q23. What are map, filter, reduce, and foreach in Scala?
**Answer**

map -> transforms each element
filter -> selects elements based on a condition
reduce -> combines elements into one result
foreach -> performs an action on each element
**Example**

```text
val numbers = List(10, 20, 30)
println(numbers.map(x => x * 2))
println(numbers.filter(x => x > 10))
```
println(numbers.reduce(_ + _))
numbers.foreach(println)
### Q24. What are classes and objects in Scala?
**Answer**

**Example**

class Student(val name: String, val age: Int) {
```text
def display(): Unit = {
```
println(name)
}
}
```text
val student = new Student("Rahul", 25)
```
student.display()
Here, Student is the class and student is the object.
### Q25. How does exception handling work in Scala?
**Answer**

**Example**

try {
```text
val num = "abc".toInt
```
println(num)
}
catch {
```text
case e: NumberFormatException =>
```
println("Invalid number")
}
finally {
println("Program completed")
}
Here, catch handles the error and finally executes whether an error occurs or not.
## Phase 2 — Scala Collections, OOP, Case Classes & Interview Practice
Classes, OOP & Traits
### Q26. What is a constructor in Scala?
**Answer**

**Example**

class Student(val name: String, val age: Int)
```text
val s1 = new Student("Rahul", 25)
```
println(s1.name)
Here, "Rahul" and 25 are passed to the constructor.
### Q27. What is encapsulation in Scala?
**Answer**

**Example**

class BankAccount {
```text
private var balance = 0
def deposit(amount: Int): Unit = {
balance += amount
```
}
```text
def getBalance: Int = balance
```
}
Here, balance cannot be directly accessed from outside the class.
### Q28. What is inheritance in Scala?
**Answer**

**Example**

class Animal {
```text
def eat(): Unit = {
```
println("Animal eats")
}
}
class Dog extends Animal {
```text
def bark(): Unit = {
```
println("Dog barks")
}
}
Dog can use both eat() and bark().
### Q29. What is method overriding in Scala?
**Answer**

**Example**

class Animal {
```text
def sound(): Unit = {
```
println("Animal sound")
}
}
class Dog extends Animal {
```text
override def sound(): Unit = {
```
println("Dog barks")
}
}
When sound() is called on Dog, "Dog barks" is printed.
### Q30. What is method overloading in Scala?
**Answer**

**Example**

class Calculator {
```text
def add(a: Int, b: Int): Int = a + b
def add(a: Int, b: Int, c: Int): Int = a + b + c
```
}
Both methods are named add, but they accept different numbers of parameters.
### Q31. What is a trait in Scala?
**Answer**

**Example**

trait Logger {
```text
def log(message: String): Unit = {
```
println(message)
}
}
class Application extends Logger
```text
val app = new Application()
```
app.log("Application started")
### Q32. Can a class extend multiple traits in Scala?
**Answer**

**Example**

trait A {
```text
def methodA(): Unit = println("A")
```
}
trait B {
```text
def methodB(): Unit = println("B")
```
}
class C extends A with B
Here, class C can use both traits.
### Q33. What is the difference between overriding and overloading?
**Answer**

Collections
### Q34. What is an Array in Scala?
**Answer**

**Example**

```text
val fruits = Array("Apple", "Mango", "Orange")
```
println(fruits(0))
```text
fruits(1) = "Banana"
```
Here, fruits(1) can be updated.
### Q35. What is a List in Scala?
**Answer**

**Example**

```text
val numbers = List(10, 20, 30)
val newNumbers = numbers.map(x => x * 2)
```
println(numbers)
println(newNumbers)
The original List remains unchanged.
### Q36. What is a Set in Scala?
**Answer**

**Example**

```text
val numbers = Set(1, 2, 3, 3, 4)
```
println(numbers)
The second 3 is not stored separately.
### Q37. What is a Map in Scala?
**Answer**

**Example**

```text
val students = Map(
```
"Rahul" -> 25,
"Priya" -> 23
)
println(students("Rahul"))
Here, "Rahul" is the key and 25 is its value.
### Q38. What is a Tuple in Scala?
**Answer**

**Example**

```text
val person = ("Rahul", 25, "Engineer")
```
println(person._1)
println(person._2)
println(person._3)
The values can be accessed using _1, _2, _3, and so on.
### Q39. What is the difference between List, Array, Set, Map, and Tuple?
**Answer**

List -> Ordered collection, immutable by default
Array -> Indexed collection whose elements can be changed
Set -> Stores unique values
Map -> Stores key-value pairs
Tuple -> Groups a fixed number of values, possibly of different types
Easy way to remember:
List  -> Ordered data
Array -> Indexed data
Set   -> Unique data
Map   -> Key + Value
Tuple -> Group different values
### Q40. What is the difference between mutable and immutable collections?
**Answer**

**Example**

```text
val numbers = List(1, 2, 3)
val newNumbers = numbers :+ 4
```
The original numbers does not change; newNumbers is a new List.
### Q41. How are map, filter, and foreach used with collections?
**Answer**

**Example**

```text
val numbers = List(10, 20, 30, 40)
println(numbers.map(x => x * 2))
println(numbers.filter(x => x > 20))
numbers.foreach(x => println(x))
```
### Q42. What is the difference between get and getOrElse in a Map?
**Answer**

**Example**

```text
val marks = Map("Rahul" -> 90)
```
println(marks.get("Rahul"))
println(marks.get("John"))
println(marks.getOrElse("John", 0))
The last statement returns 0 because "John" is not present.
### Q43. What are union, intersection, and difference in Sets?
**Answer**

**Example**

```text
val set1 = Set(1, 2, 3, 4)
val set2 = Set(3, 4, 5, 6)
```
println(set1 union set2)
println(set1 intersect set2)
println(set1 diff set2)
Case Classes & Pattern Matching
### Q44. What is a case class in Scala?
**Answer**

**Example**

```text
case class Student(name: String, age: Int)
val s1 = Student("Rahul", 25)
```
println(s1.name)
### Q45. What are the advantages of case classes?
**Answer**

**Example**

```text
case class Student(name: String, age: Int)
val s1 = Student("Rahul", 25)
```
println(s1)
We don't need to manually create methods like toString() or equals().
### Q46. What is the difference between a normal class and a case class?
**Answer**

**Example**

class Student(val name: String, val age: Int)
```text
case class Employee(name: String, salary: Double)
```
A case class requires less code when working with data.
### Q47. What is copy() in a case class?
**Answer**

**Example**

```text
case class Student(name: String, age: Int)
val s1 = Student("Rahul", 25)
val s2 = s1.copy(age = 26)
```
println(s1)
println(s2)
Here, s1 remains unchanged and s2 has age 26.
### Q48. What is pattern matching in Scala?
**Answer**

**Example**

```text
val day = 2
```
day match {
```text
case 1 => println("Monday")
case 2 => println("Tuesday")
case 3 => println("Wednesday")
case _ => println("Other")
```
}
_ means any other value.
### Q49. What is a pattern guard in Scala?
**Answer**

**Example**

```text
val age = 20
```
age match {
```text
case x if x >= 18 => println("Adult")
case _ => println("Minor")
```
}
Here, if x >= 18 is the pattern guard.
### Q50. How does pattern matching work with case classes?
**Answer**

**Example**

```text
case class Student(name: String, age: Int)
val student = Student("Rahul", 25)
```
student match {
```text
case Student(name, age) =>
```
println(s"$name is $age")
}
Here, name and age are extracted from the Student object.
Spark & Interview-Oriented Scala
### Q51. What is a UDF in Scala?
**Answer**

Simple example:
```text
def square(x: Int): Int = {
```
x * x
}
println(square(5))
In Spark, such logic can be registered as a UDF and used with DataFrames or Spark SQL.
### Q52. Why should we prefer built-in Spark functions over UDFs?
**Answer**

Interview answer:
I would first try to use built-in Spark functions, and use a UDF only when custom business logic is required.
Practical Interview Questions
### Q53. How would you process a collection using map, filter, and reduce?
**Answer**

**Example**

```text
val numbers = List(10, 20, 30, 40)
val doubled = numbers.map(x => x * 2)
val filtered = numbers.filter(x => x > 20)
val total = numbers.reduce(_ + _)
```
println(doubled)
println(filtered)
println(total)
### Q54. What is the difference between apply() and unapply() in Scala?
**Answer**

**Example**

```text
case class Student(name: String, age: Int)
val s = Student("Rahul", 25)   // apply()
```
s match {
```text
case Student(name, age) =>   // unapply()
```
println(name)
}
Q55. Write a simple Scala program using case class, collection operations, higher-order function, and pattern matching.
**Answer**

**Example**

```text
case class Employee(
```
name: String,
department: String,
salary: Double
)
```text
val employees = List(
```
Employee("Rahul", "IT", 50000),
Employee("Priya", "HR", 60000),
Employee("John", "IT", 70000)
)
```text
val result = employees
.filter(e => e.salary > 50000)
.map(e => e.copy(salary = e.salary * 1.10))
result.foreach { e =>
```
e.department match {
```text
case "IT" => println(s"${e.name} - Technical")
case "HR" => println(s"${e.name} - Human Resources")
case _ => println("Other")
```
}
}
This single problem covers case class, List, filter, map, copy, foreach, lambda functions, and pattern matching, making it useful for interview practice.
### Q56. What is the Scala type hierarchy?
**Answer**

Simple structure:
Any
├── AnyVal -> Int, Double, Boolean, etc.
└── AnyRef -> String, Classes, Objects, etc.
### Q57. What is Java interoperability in Scala?
**Answer**

**Example**

```text
import java.util.ArrayList
val list = new ArrayList[String]()
```
list.add("Scala")
Here, Scala is using the Java ArrayList class.
### Q58. What are default parameters, named arguments, and varargs in Scala?
**Answer**

**Example**

```text
def greet(name: String = "Vaseem") = {
```
println(s"Hello $name")
}
```text
def addAll(numbers: Int*) = {
```
numbers.sum
}
greet()
println(addAll(10, 20, 30))
### Q59. What is the Scala collection hierarchy? What are Seq, Vector, and ArrayBuffer?
**Answer**

**Example**

```text
val numbers: Seq[Int] = Seq(10, 20, 30)
val vector = Vector(1, 2, 3)
import scala.collection.mutable.ArrayBuffer
val buffer = ArrayBuffer(10, 20)
buffer += 30
```
For interviews, remember: Seq -> general ordered sequence, Vector -> indexed sequence, ArrayBuffer -> mutable sequence.
### Q60. What is function composition in Scala?
**Answer**

**Example**

```text
val addOne = (x: Int) => x + 1
val double = (x: Int) => x * 2
val result = double(addOne(5))
```
println(result)
Output:
12
Here, addOne runs first and its result is passed to double.


# Part D — Data-Engineering Scenarios

### Spark job is slow
**Approach:** inspect execution plan/stages, identify shuffle-heavy operations, skew, excessive partitions or serialization/memory issues, then optimize the actual bottleneck.

### Spark job has data skew
**Approach:** identify the skewed key, inspect partition distribution, and consider an appropriate strategy such as salting or changing the join/partitioning approach where justified.

### Streaming pipeline receives late events
**Approach:** use event-time processing, appropriate windowing and watermarking, and define the acceptable lateness/state-retention behavior.

**Interview Point:** Streaming correctness depends on event time, late data and state management—not only on reading messages continuously.
