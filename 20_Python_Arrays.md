<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Topic 20](https://img.shields.io/badge/Topic_20-Python_Arrays-37474F?style=for-the-badge)
![Intermediate](https://img.shields.io/badge/Level-Intermediate-FF9800?style=for-the-badge)

</div>

---

## What is an Array?

An **array** is a data structure used to store multiple values of the **same data type** in a single variable.

| Feature | List | Array (`array` module) |
|---------|:----:|:---------------------:|
| Data Types | Can store mixed types (`[1, "a", True]`) | Stores **only one** type (`array('i', [1, 2])`) |
| Memory Efficiency | Higher memory overhead | More memory-efficient |
| Module Required | Built-in (no import) | Requires `from array import array` |

---

## Importing the `array` Module

```python
from array import array
```

---

## Array Type Codes

When creating an array, you must specify a **type code** that defines what data type the array can hold:

| Type Code | Data Type | Size (Bytes) | Example Elements |
|:---------:|-----------|:------------:|------------------|
| `'i'` | Signed Integer | 2 or 4 | `10, -20, 30` |
| `'f'` | Float | 4 | `1.5, 2.7, -3.14` |
| `'d'` | Double (Float) | 8 | `3.14159265` |
| `'b'` | Signed Char / Small Int | 1 | `-128 to 127` |
| `'u'` | Unicode Character | 2 or 4 | `'a', 'b', 'c'` |

---

## Creating an Array

```python
from array import array

# Creating an integer array
numbers = array('i', [10, 20, 30, 40, 50])
print(numbers)
# Output: array('i', [10, 20, 30, 40, 50])
```

---

## Array Operations

### 1. Accessing & Slicing Elements

```python
print(numbers[0])     # Output: 10
print(numbers[2])     # Output: 30
print(numbers[1:4])   # Output: array('i', [20, 30, 40])
print(numbers[::-1])  # Output: array('i', [50, 40, 30, 20, 10])
```

### 2. Iterating Through an Array

```python
for num in numbers:
    print(num)
```

### 3. Adding Elements (`append` & `insert`)

```python
numbers.append(60)          # Adds 60 to the end
numbers.insert(1, 15)       # Inserts 15 at index 1
print(numbers)
# Output: array('i', [10, 15, 20, 30, 40, 50, 60])
```

### 4. Removing Elements (`remove` & `pop`)

```python
numbers.remove(15)          # Removes first occurrence of 15
removed_val = numbers.pop(3) # Removes and returns element at index 3
print(removed_val)          # Output: 30
print(numbers)
# Output: array('i', [10, 20, 40, 50, 60])
```

### 5. Updating Elements

```python
numbers[0] = 100
print(numbers)
# Output: array('i', [100, 20, 40, 50, 60])
```

### 6. Finding Index & Counting Occurrences

```python
print(numbers.index(40))    # Output: 2 (position of value 40)
print(numbers.count(20))    # Output: 1 (how many times 20 appears)
print(len(numbers))         # Output: 5 (total length)
```

---

## When to Use `array` vs `list` vs `NumPy`

| Use Case | Best Choice |
|----------|-------------|
| General programming, mixed data types | `list` |
| Low-level memory savings for homogenous data | `array` module |
| Advanced math, linear algebra, data science | `NumPy` |

---

## Practice Exercises

1. Create a float array (`'f'`) containing temperatures: `[98.6, 99.1, 100.4, 98.2]`.
2. Add a new temperature `99.5` using `append()`.
3. Find the maximum temperature using `max()`.
4. Reverse the array and print all elements.

---

<div align="center">

[![Previous](https://img.shields.io/badge/←_Previous-19_Date_Time-2196F3?style=for-the-badge)](./19_Date_and_Time.md)
[![Next](https://img.shields.io/badge/Next_→-21_Regex-2196F3?style=for-the-badge)](./21_Regular_Expressions.md)

</div>
