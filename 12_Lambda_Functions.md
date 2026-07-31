<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Topic 12](https://img.shields.io/badge/Topic_12-Lambda_Functions-1565C0?style=for-the-badge)
![Intermediate](https://img.shields.io/badge/Level-Intermediate-FF9800?style=for-the-badge)

</div>

---

## What is a Lambda Function?

A **lambda function** is a **small, anonymous function** written in **one line** — a shortcut for simple functions.

### Syntax

```
lambda arguments : expression
```

---

## Regular Function vs Lambda

```python
# Regular function
def add(a, b):
    return a + b

# Lambda function (same thing!)
add = lambda a, b: a + b

print(add(10, 20))   # 30
```

> [!IMPORTANT]
> Lambda functions can have **any number of arguments** but only **ONE expression**. They **automatically return** the result.

---

## Examples

### Square of a Number
```python
square = lambda x: x * x
print(square(5))      # 25
```

### Max of Two Numbers
```python
maximum = lambda x, y: x if x > y else y
print(maximum(100, 50))   # 100
```

### Check Even or Odd
```python
is_even = lambda x: x % 2 == 0
print(is_even(20))    # True
print(is_even(9))     # False
```

### Convert to Uppercase
```python
upper = lambda name: name.upper()
print(upper("Python"))   # PYTHON
```

---

## Lambda with `sort()` ![Important](https://img.shields.io/badge/Most-Common_Use-red?style=flat-square)

Lambda functions are **most commonly used** with sorting:

```python
students = [
    ("Rahul", 85),
    ("Priya", 95),
    ("Amit", 80)
]

# Sort by marks (2nd element) in descending order
students.sort(key=lambda student: student[1], reverse=True)
print(students)
# [('Priya', 95), ('Rahul', 85), ('Amit', 80)]
```

> [!TIP]
> `key=lambda student: student[1]` tells Python to sort by the **2nd element** (marks).

---

## When to Use Lambda vs Regular Function

| ![Lambda](https://img.shields.io/badge/Lambda-purple?style=flat-square) Use When | ![Regular](https://img.shields.io/badge/Regular-blue?style=flat-square) Use When |
|:---|:---|
| Simple, one-line logic | Complex, multi-line logic |
| Used only once | Used multiple times |
| With `sort()`, `map()`, `filter()` | Needs documentation |
| Quick calculations | Needs a descriptive name |

---

## Lambda Limitations

```python
# You CANNOT do multi-line lambda
add = lambda a, b:
    result = a + b    # ERROR!
    return result

# Use regular function instead
def add(a, b):
    result = a + b
    return result
```

---

## Practice Exercises

1. Write a lambda to calculate the cube of a number
2. Write a lambda that checks if a string starts with "A"
3. Sort a list of names by their length using lambda
4. Write a lambda that returns the absolute value

---

<div align="center">

[![Previous](https://img.shields.io/badge/←_Previous-11_Functions-2196F3?style=for-the-badge)](./11_Functions.md)
[![Next](https://img.shields.io/badge/Next_→-13_Builtins-2196F3?style=for-the-badge)](./13_Builtin_Functions_and_Math.md)

</div>
