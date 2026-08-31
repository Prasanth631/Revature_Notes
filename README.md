<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![Revature Notes](https://img.shields.io/badge/Revature-Notes_%26_Assignments-C62828?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Complete-success?style=for-the-badge)

# Master Learning Repository — Python, SQL, Cloud, and Scala

**Study guides, executable examples, assignments, and interview preparation for Python, SQL, Cloud Fundamentals, and Scala 3.**

---

</div>

## 📌 Repository Organization

This repository is organized into dedicated learning modules:

```
Revature_Notes/
│
├── 🐍 Python/                           ──> Comprehensive Python 3 & Data Science Module
│   ├── README.md                        ──> Python Master Index & Guide
│   ├── All_Methods_Reference.md         ──> Master Method Reference (200+ Methods)
│   ├── 01_Python_Basics_and_Variables.md──> Python Basics & Syntax
│   └── ... (24 Topic-Wise Study Guides)
│
├── 🐬 SQL/                              ──> MySQL Database Notes & Solved Assignments Module
│   ├── README.md                        ──> SQL Master Index & Guide
│   ├── Topic_1.sql / .md                ──> Basic DDL & Data Types
│   └── ... (33 Files & Assignments)
│
└── ☁️ Cloud_Fundamentals/               ──> Cloud Computing & Hyperscalers Module
    ├── README.md                        ──> Cloud Master Index & Guide
    └── Day_01_Cloud_Fundamentals.md     ──> Day 1: Cloud Architecture, Models & Pricing
│
└── 🔷 scala/                            ──> Scala 3 Interview Preparation Module
    ├── README.md                        ──> Scala Study Index
    └── 01_... through 18_....md         ──> Beginner-first notes with runnable programs
```

---

## 🐍 Module 1: Python Programming & Data Science Notes

Click any hyperlink below to jump directly to that specific study guide:

| # | Topic / Concept Name | Direct Markdown Hyperlink | Core Concepts Covered | Level |
|:-:|----------------------|---------------------------|-----------------------|:-----:|
| ⭐ | **Master Method Reference** | [All_Methods_Reference.md](./Python/All_Methods_Reference.md) | **200+ Methods & Functions** across Core Python, NumPy & Pandas with usage examples | ![All](https://img.shields.io/badge/-Master-C62828?style=flat-square) |
| 01 | **Python Basics & Variables** | [01_Python_Basics_and_Variables.md](./Python/01_Python_Basics_and_Variables.md) | Syntax, `print()`, dynamic typing, variable assignment, multiple assignment | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 02 | **Data Types & Casting** | [02_Data_Types.md](./Python/02_Data_Types.md) | Numeric types (`int`, `float`, `complex`), `str`, `bool`, type conversion | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 03 | **Operators** | [03_Operators.md](./Python/03_Operators.md) | Arithmetic, Comparison, Logical (`and`, `or`, `not`), Bitwise, Identity, Membership | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 04 | **String Operations** | [04_Strings.md](./Python/04_Strings.md) | Indexing, Slicing `[start:stop:step]`, Immutability, String Methods (`upper`, `split`, `join`) | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 05 | **Lists & List Methods** | [05_Lists.md](./Python/05_Lists.md) | Mutability, Slicing, List Methods (`append`, `extend`, `pop`, `sort`), List Comprehensions | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 06 | **Tuples** | [06_Tuples.md](./Python/06_Tuples.md) | Immutable sequences, Unpacking, Tuple Methods (`count`, `index`), Memory efficiency | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 07 | **Dictionaries** | [07_Dictionaries.md](./Python/07_Dictionaries.md) | Key-Value mappings, Dict Methods (`keys`, `values`, `items`, `get`, `update`), Comprehensions | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 08 | **Sets & Set Operations** | [08_Sets.md](./Python/08_Sets.md) | Unique collections, Set Methods (`add`, `remove`), Math operations (`union`, `intersection`) | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 09 | **Conditional Statements** | [09_Conditional_Statements.md](./Python/09_Conditional_Statements.md) | Control flow `if`, `elif`, `else`, Ternary operators, Truthy/Falsy evaluation | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 10 | **Loops & Iteration** | [10_Loops.md](./Python/10_Loops.md) | `for` loops, `while` loops, Loop Control (`break`, `continue`), `else` with loops, `range()` | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 11 | **User-Defined Functions** | [11_Functions.md](./Python/11_Functions.md) | Function definition `def`, Positional/Keyword/Default arguments, `*args`, `**kwargs` | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 12 | **Lambda Functions** | [12_Lambda_Functions.md](./Python/12_Lambda_Functions.md) | Anonymous syntax `lambda args: expr`, Inline transforms, Sorting keys (`sort(key=lambda)`) | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 13 | **Built-in & Math Functions** | [13_Builtin_Functions_and_Math.md](./Python/13_Builtin_Functions_and_Math.md) | Built-ins (`len`, `max`, `min`, `sum`, `enumerate`, `zip`), `math` module (`sqrt`, `ceil`, `floor`) | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 14 | **File Handling** | [14_File_Handling.md](./Python/14_File_Handling.md) | Modes (`r`, `w`, `a`), Reading (`read`, `readline`), Writing, Context Managers (`with open()`) | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 15 | **OS Module & Filesystem** | [15_OS_Module.md](./Python/15_OS_Module.md) | Working directories (`getcwd`, `chdir`), Directory listing (`listdir`), Creation (`mkdir`), `os.path` | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 16 | **Map, Filter & Reduce** | [16_Map_Filter_Reduce.md](./Python/16_Map_Filter_Reduce.md) | Functional paradigms, `map()` transformations, `filter()` predicates, `functools.reduce()` | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 17 | **Collections Module** | [17_Collections_Module.md](./Python/17_Collections_Module.md) | Datatypes: `Counter`, `defaultdict`, `namedtuple`, `deque`, `OrderedDict`, `ChainMap` | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 18 | **Exception Handling** | [18_Exception_Handling.md](./Python/18_Exception_Handling.md) | `try`, `except`, `else`, `finally`, Raising errors (`raise`), Custom Exception classes | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 19 | **Date & Time Module** | [19_Date_and_Time.md](./Python/19_Date_and_Time.md) | `datetime`, `date`, `time`, `timedelta`, Formatting (`strftime`), Parsing (`strptime`), Date math | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 20 | **Python Array Module** | [20_Python_Arrays.md](./Python/20_Python_Arrays.md) | Low-level typed arrays (`from array import array`), Type codes (`'i'`, `'f'`), Array operations | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 21 | **Regular Expressions** | [21_Regular_Expressions.md](./Python/21_Regular_Expressions.md) | Pattern matching `re` (`match`, `search`, `findall`, `sub`), Metacharacters (`\d`, `\w`, `\s`, `+`) | ![Advanced](https://img.shields.io/badge/-Advanced-F44336?style=flat-square) |
| 22 | **JSON & Logging** | [22_JSON_and_Logging.md](./Python/22_JSON_and_Logging.md) | Serialization (`json.dumps/loads`), Logging levels (`DEBUG`, `INFO`, `WARNING`, `ERROR`), Handlers | ![Advanced](https://img.shields.io/badge/-Advanced-F44336?style=flat-square) |
| 23 | **NumPy Array Analytics** | [23_NumPy_Basics.md](./Python/23_NumPy_Basics.md) | N-dimensional arrays `ndarray`, Creation (`arange`, `zeros`, `linspace`), Vectorization, Stats | ![Advanced](https://img.shields.io/badge/-Advanced-F44336?style=flat-square) |
| 24 | **Pandas Data Analysis** | [24_Pandas_Data_Analysis.md](./Python/24_Pandas_Data_Analysis.md) | DataFrames, Series, File I/O (`read_csv`), Selection (`loc`, `iloc`), GroupBy, Merging, Missing Data | ![Advanced](https://img.shields.io/badge/-Advanced-F44336?style=flat-square) |

👉 **[Jump to Dedicated Python Index Page](./Python/README.md)**

---

## 🐬 Module 2: MySQL Database Engineering Notes & Solved Assignments

Click any hyperlink below to jump directly to the study guide (`.md`) or the executable SQL script (`.sql`):

| # | Topic / Module Name | Study Guide (.md) | Executable Script (.sql) | Core Concepts Covered | Level |
|:-:|---------------------|-------------------|--------------------------|-----------------------|:-----:|
| 01 | **Topic 1** | [Topic_1.md](./SQL/Topic_1.md) | [Topic_1.sql](./SQL/Topic_1.sql) | DDL (`CREATE`, `USE`, `DESC`), Data Types (`INT`, `VARCHAR`, `DECIMAL`, `FLOAT`, `DATE`) | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 02 | **Topic 2 & 3** | [Topic_2_3.md](./SQL/Topic_2_3.md) | [Topic_2_3.sql](./SQL/Topic_2_3.sql) | `DEFAULT` constraint, Dynamic defaults (`CURRENT_DATE`), `AUTO_INCREMENT` sequence rules | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 03 | **Topic 4** | [Topic_4.md](./SQL/Topic_4.md) | [Topic_4.sql](./SQL/Topic_4.sql) | `NOT NULL` constraint, Column data type refactoring (`ALTER TABLE ... MODIFY COLUMN`) | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 04 | **Topic 5** | [Topic_5.md](./SQL/Topic_5.md) | [Topic_5.sql](./SQL/Topic_5.sql) | `PRIMARY KEY` entity integrity, Uniqueness + Non-nullability, Clustered B-Tree Indexing | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 05 | **Topic 6** | [Topic_6.md](./SQL/Topic_6.md) | [Topic_6.sql](./SQL/Topic_6.sql) | `UNIQUE` key constraint, Multiple `NULL` handling, `VARCHAR` phone numbers, `RENAME` | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 06 | **Topic 7** | [Topic_7.md](./SQL/Topic_7.md) | [Topic_7.sql](./SQL/Topic_7.sql) | `CHECK` domain validation, Ranges (`>=`, `>`), Enum choice lists (`IN`), Closed intervals (`BETWEEN`) | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 07 | **Topic 8** | [Topic_8.md](./SQL/Topic_8.md) | [Topic_8.sql](./SQL/Topic_8.sql) | `FOREIGN KEY` constraint, Parent-Child tables, Referential integrity, `CASCADE` rules | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 08 | **Day 1 DDL Basics** | [Day_1_DDL.md](./SQL/Day_1_DDL.md) | [Day_1_DDL.sql](./SQL/Day_1_DDL.sql) | Server Inspection (`VERSION()`), CTAS (`CREATE TABLE AS SELECT`), Multi-row inserts | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 09 | **Day 1 DDL Advanced** | [Day_1_DDL_.md](./SQL/Day_1_DDL_.md) | [Day_1_DDL_.sql](./SQL/Day_1_DDL_.sql) | Advanced `ALTER TABLE` (`MODIFY`, `ADD`, `DROP`, `RENAME`), `TRUNCATE` vs `DELETE`, `UPDATE` | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 10 | **Day 3 Date & Windows** | [Day_3.md](./SQL/Day_3.md) | [Day_3.sql](./SQL/Day_3.sql) | Date math (`DATE_ADD`, `DATEDIFF`), `IFNULL`, `GROUP BY`, `HAVING`, Window Functions (`RANK`, `LAG`, `LEAD`) | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 11 | **Day 3 Joins & Views** | [Day_3_Joins.md](./SQL/Day_3_Joins.md) | [Day_3_Joins.sql](./SQL/Day_3_Joins.sql) | `INNER`/`LEFT`/`RIGHT`/`SELF` Joins, Non-Equi Joins, `UNION ALL`, Subqueries, Views, `CASE` | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 12 | **Day 4 Advanced SQL** | [Day_4.md](./SQL/Day_4.md) | [Day_4.sql](./SQL/Day_4.sql) | CTEs (`WITH`), Transactions (`SAVEPOINT`), Procedures, Functions, Triggers, Indexes & `EXPLAIN` | ![Advanced](https://img.shields.io/badge/-Advanced-F44336?style=flat-square) |
| 13 | **SQL Commands Reference** | [SQL_Commands.md](./SQL_Commands.md) | [SQL_Commands.sql](./SQL_Commands.sql) | Master reference: `WHERE` operators (`=`, `<>`, `IN`, `LIKE '%'`), `BETWEEN`, String & Math functions | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 14 | **Assignment Day 1** | [SQL_DAY1_ASSIGNMENT.md](./SQL/SQL_DAY1_ASSIGNMENT.md) | [SQL_DAY1_ASSIGNMENT.sql](./SQL/SQL_DAY1_ASSIGNMENT.sql) | Solved assignment set for Topics 1 through 8 (35 Exercises) | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 15 | **Assignment Day 2** | [SQL_DAY2_ASSIGNMENT.md](./SQL/SQL_DAY2_ASSIGNMENT.md) | [SQL_DAY2_ASSIGNMENT.sql](./SQL/SQL_DAY2_ASSIGNMENT.sql) | Solved assignment set for DDL Alterations, String Functions & Math Functions (83 Exercises) | ![Intermediate](https://img.shields.io/badge/-Intermediate-FF9800?style=flat-square) |
| 16 | **Assignment Day 3 (SalesDB)** | [SQL_DAY3_ASSIGNMENT.md](./SQL/SQL_DAY3_ASSIGNMENT.md) | [SQL_DAY3_ASSIGNMENT.sql](./SQL/SQL_DAY3_ASSIGNMENT.sql) | Solved SalesDB assignment set: Subqueries, JOIN Aggregations, Views & CTEs (35 Questions) | ![Advanced](https://img.shields.io/badge/-Advanced-F44336?style=flat-square) |

👉 **[Jump to Dedicated SQL Index Page](./SQL/README.md)**

---

## ☁️ Module 3: Cloud Fundamentals & Hyperscalers

Click any hyperlink below to jump directly to that specific study guide:

| # | Topic / Module Name | Study Guide (.md) | Core Concepts Covered | Level |
|:-:|---------------------|-------------------|-----------------------|:-----:|
| 01 | **Day 1: Cloud Architecture & Models** | [Day_01_Cloud_Fundamentals.md](./Cloud_Fundamentals/Day_01_Cloud_Fundamentals.md) | NIST Definition, 5 Characteristics, Deployment Models (Public/Private/Hybrid), Service Models (IaaS/PaaS/SaaS), AWS/Azure/GCP Comparison, Pricing Models (On-Demand, Reserved, Spot, CapEx vs OpEx) | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |
| 02 | **Day 2: Components, 3-Tier Architecture & Data Types** | [Day_02_Cloud_Fundamentals.md](./Cloud_Fundamentals/Day_02_Cloud_Fundamentals.md) | 6 Core Cloud Components, 3-Tier Web Architecture, Benefits vs Challenges, Shared Responsibility, Structured/Semi/Unstructured Data, Cloud File Types | ![Beginner](https://img.shields.io/badge/-Beginner-4CAF50?style=flat-square) |

👉 **[Jump to Dedicated Cloud Fundamentals Index Page](./Cloud_Fundamentals/README.md)**

---

## 🔷 Module 4: Scala 3 Interview Preparation

| # | Study Guide | Core Concepts Covered |
|:-:|---|---|
| 01–18 | [Beginner-first Scala Study Path](./scala/README.md) | Every requested Scala topic, real-life examples, standalone runnable Scala 3 programs, and interview answers |

👉 **[Jump to Dedicated Scala Index Page](./scala/README.md)**

---

<div align="center">

**Created by [Prasanth Golla](https://github.com/Prasanth631)**

</div>
