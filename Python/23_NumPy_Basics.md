<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![NumPy](https://img.shields.io/badge/NumPy-013243?style=for-the-badge&logo=numpy&logoColor=white)
![Topic 23](https://img.shields.io/badge/Topic_23-NumPy_Basics-37474F?style=for-the-badge)
![Advanced](https://img.shields.io/badge/Level-Advanced-F44336?style=for-the-badge)

</div>

---

## What is NumPy?

**NumPy (Numerical Python)** is a powerful open-source Python library used for numerical computing, working with multi-dimensional arrays (`ndarray`), matrices, and mathematical operations.

```python
import numpy as np
```

### Why use NumPy instead of Python Lists?

| Feature | Python List | NumPy `ndarray` |
|---------|-------------|-----------------|
| Data Type | Mixed types allowed | Single type (homogenous) |
| Speed & Efficiency | Slower (overhead per element) | Fast (C implementation, contiguous memory) |
| Vectorized Operations | Requires loops | Built-in element-wise math |
| Dimensions | List of lists | Native N-dimensional arrays |

---

## 1. Creating NumPy Arrays

```python
import numpy as np

# 1D Array
arr1d = np.array([10, 20, 30, 40])
print(arr1d)         # Output: [10 20 30 40]
print(arr1d.ndim)    # Dimensions: 1
print(arr1d.shape)   # Shape: (4,)

# 2D Array (Matrix)
arr2d = np.array([[10, 20, 30], [40, 50, 60], [70, 80, 90]])
print(arr2d.ndim)    # Dimensions: 2
print(arr2d.shape)   # Shape: (3, 3)

# 3D Array (Tensor)
tensor = np.arange(27).reshape(3, 3, 3)
print(tensor.ndim)   # Dimensions: 3
```

---

## 2. Array Creation Functions

| Function | Description | Example |
|----------|-------------|---------|
| `np.arange(start, stop, step)` | Creates sequence of numbers | `np.arange(0, 10, 2)` → `[0, 2, 4, 6, 8]` |
| `np.zeros(shape)` | Array filled with zeros | `np.zeros((3, 3))` |
| `np.ones(shape)` | Array filled with ones | `np.ones((2, 4))` |
| `np.linspace(start, stop, num)` | Evenly spaced numbers | `np.linspace(0, 1, 5)` |
| `np.full(shape, value)` | Array filled with constant | `np.full((2, 2), 7)` |

---

## 3. Array Attributes

```python
arr = np.array([[1, 2, 3], [4, 5, 6]])

print(arr.ndim)     # Number of dimensions (2)
print(arr.shape)    # Tuple of array dimensions ((2, 3))
print(arr.size)     # Total number of elements (6)
print(arr.dtype)    # Data type of elements (int32 or int64)
```

---

## 4. Array Operations & Vectorization

NumPy supports **element-wise arithmetic**:

```python
a = np.array([1, 2, 3])
b = np.array([4, 5, 6])

print(a + b)     # Output: [5 7 9]
print(a * 2)     # Output: [2 4 6]
print(a ** 2)    # Output: [1 4 9]
```

---

## 5. Indexing & Slicing

```python
arr = np.array([10, 20, 30, 40, 50])

print(arr[2])      # 30
print(arr[1:4])    # [20 30 40]
print(arr[::-1])   # [50 40 30 20 10]

# 2D Slicing [row, col]
matrix = np.array([[10, 20, 30], [40, 50, 60], [70, 80, 90]])
print(matrix[0, 1])     # 20 (row 0, col 1)
print(matrix[:2, 1:])   # Sub-matrix: rows 0-1, cols 1-2
```

---

## 6. Reshaping & Stacking

```python
arr = np.arange(1, 13)      # 1D array of 12 elements
matrix = arr.reshape(3, 4)  # Reshape to 3x4 matrix

# Stacking
a = np.array([[1, 2]])
b = np.array([[3, 4]])

print(np.vstack((a, b)))   # Vertical stack (2x2)
print(np.hstack((a, b)))   # Horizontal stack (1x4)
```

---

## 7. Broadcasting

**Broadcasting** allows arithmetic operations between arrays of **different shapes**:

```python
matrix = np.array([[1, 2, 3], [4, 5, 6]])
scalar = 10

# 10 is added to every element in matrix
print(matrix + scalar)
# Output:
# [[11 12 13]
#  [14 15 16]]
```

---

## 8. Handling Missing Values (`np.nan`)

```python
arr = np.array([1, 2, np.nan, 4, 5])
print(np.isnan(arr))   # [False False  True False False]

# Mean ignoring NaN
print(np.nanmean(arr)) # 3.0
```

---

## Practice Exercises

1. Create a 1D NumPy array from 10 to 50 with a step of 5.
2. Reshape a 1D array of 16 elements into a 4x4 matrix.
3. Calculate element-wise multiplication of two 2x2 matrices.
4. Replace all `np.nan` values in an array with `0`.

---

<div align="center">

[![Previous](https://img.shields.io/badge/←_Previous-22_JSON_&_Logging-2196F3?style=for-the-badge)](./22_JSON_and_Logging.md)
[![Next](https://img.shields.io/badge/Next_→-24_Pandas-2196F3?style=for-the-badge)](./24_Pandas_Data_Analysis.md)

</div>
