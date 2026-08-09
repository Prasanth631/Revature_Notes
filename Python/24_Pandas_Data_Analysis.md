<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)
![Topic 24](https://img.shields.io/badge/Topic_24-Pandas_Data_Analysis-37474F?style=for-the-badge)
![Advanced](https://img.shields.io/badge/Level-Advanced-F44336?style=for-the-badge)

</div>

---

## What is Pandas?

**Pandas** is an open-source data manipulation and analysis library for Python. It provides fast, flexible, and expressive data structures designed to work with structured (tabular) data effortlessly.

```python
import pandas as pd
import numpy as np
```

---

## Core Data Structures

Pandas has two primary data structures:
1. **Series**: 1-Dimensional labeled array (like a column in Excel/SQL).
2. **DataFrame**: 2-Dimensional labeled data structure (like an entire table with rows and columns).

---

## 1. Pandas Series

```python
import pandas as pd

# Creating a Series with custom index
s = pd.Series([10, 20, 30, 40], index=['A', 'B', 'C', 'D'])
print(s)
# Output:
# A    10
# B    20
# C    30
# D    40
# dtype: int64

print(s['A'])        # Access by index label -> 10
print(s.head(2))     # First 2 rows
print(s.tail(2))     # Last 2 rows
```

---

## 2. Pandas DataFrame

Creating a DataFrame from a dictionary or matrix:

```python
import pandas as pd

data = {
    'name': ['John', 'Alice', 'Bob', 'Emma'],
    'age': [25, 24, 30, 22],
    'city': ['Chennai', 'Bangalore', 'Chennai', 'Delhi'],
    'score': [85.5, 92.0, 78.0, 95.0]
}

df = pd.DataFrame(data)
print(df)
```

---

## 3. Data Inspection & Summaries

| Function | Purpose |
|----------|---------|
| `df.head(n)` | View first `n` rows |
| `df.tail(n)` | View last `n` rows |
| `df.info()` | Summary of columns, non-null counts, dtypes |
| `df.describe()` | Statistical summary (mean, std, min, max, quartiles) |
| `df.shape` | Tuple of `(rows, columns)` |
| `df.dtypes` | Data types of each column |

---

## 4. Selecting & Indexing (`loc` vs `iloc`)

| Selection Method | Indexing Type | Example |
|------------------|---------------|---------|
| `loc` | **Label-based** indexing | `df.loc[0, 'name']` or `df.loc['X', 'city']` |
| `iloc` | **Integer-based** (positional) indexing | `df.iloc[0, 1]` or `df.iloc[0:2, 1:3]` |

```python
# Selecting columns
print(df['name'])
print(df[['name', 'score']])

# Selecting rows by loc (label) and iloc (index position)
print(df.iloc[0])        # First row
print(df.iloc[0:2, 0:2]) # First 2 rows and first 2 columns
```

---

## 5. Filtering & Sorting

```python
# Filter rows where score > 80
high_scorers = df[df['score'] > 80]
print(high_scorers)

# Sort by column
df_sorted = df.sort_values(by='score', ascending=False)
print(df_sorted)

# Multi-column sort
df_sorted = df.sort_values(by=['city', 'score'], ascending=[True, False])
```

---

## 6. Handling Missing Data (`NaN`)

```python
df_null = pd.DataFrame({
    'A': [1, 2, np.nan, 4],
    'B': [5, np.nan, np.nan, 8]
})

# Check missing values
print(df_null.isnull().sum())

# Drop missing values
print(df_null.dropna())            # Drop rows with ANY null
print(df_null.dropna(how='all'))   # Drop rows where ALL values are null

# Fill missing values
df_filled = df_null.fillna(0)      # Fill with 0
df_null['A'].fillna(df_null['A'].mean(), inplace=True) # Fill with column mean
```

---

## 7. Grouping & Aggregation (`groupby`)

```python
# Group by city and get mean score
city_group = df.groupby('city')['score'].mean()
print(city_group)

# Multiple aggregate functions
agg_result = df.groupby('city')['score'].agg(['count', 'min', 'max', 'mean'])
print(agg_result)
```

---

## 8. Removing Duplicates

```python
df_dup = pd.DataFrame({
    'name': ['Alice', 'Bob', 'Alice', 'Charlie'],
    'score': [90, 80, 90, 85]
})

# Remove duplicate rows
clean_df = df_dup.drop_duplicates()
print(clean_df)

# Keep last duplicate
clean_last = df_dup.drop_duplicates(subset='name', keep='last')
```

---

## 9. Merging & Concatenation

```python
df1 = pd.DataFrame({'id': [1, 2], 'name': ['Alice', 'Bob']})
df2 = pd.DataFrame({'id': [1, 2], 'salary': [50000, 60000]})

# Merge (Inner Join)
merged_df = pd.merge(df1, df2, on='id', how='inner')
print(merged_df)

# Concatenate (Stack top-to-bottom)
concat_df = pd.concat([df1, df2], axis=0)
```

---

## Practice Exercises

1. Create a DataFrame with 5 employees (name, department, salary).
2. Filter employees with salary > 50000.
3. Calculate the average salary per department using `groupby`.
4. Fill missing values in a numeric column with its mean.

---

<div align="center">

[![Previous](https://img.shields.io/badge/←_Previous-23_NumPy-2196F3?style=for-the-badge)](./23_NumPy_Basics.md)
[![Home](https://img.shields.io/badge/↑_Home-Table_of_Contents-4CAF50?style=for-the-badge)](./README.md)

</div>
