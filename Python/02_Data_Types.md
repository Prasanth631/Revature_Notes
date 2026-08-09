<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Topic 02](https://img.shields.io/badge/Topic_02-Data_Types-FF6F00?style=for-the-badge)
![Beginner](https://img.shields.io/badge/Level-Beginner-4CAF50?style=for-the-badge)

</div>

---

## What is a Data Type?

A **data type** tells Python what **kind of value** a variable holds — like the label on a box that tells you what's inside.

---

## Python's Main Data Types

| Data Type | Python Name | Example | Description |
|-----------|:-----------:|---------|-------------|
| Integer | `int` | `10`, `-5`, `0` | Whole numbers (no decimals) |
| Float | `float` | `10.5`, `-3.14` | Numbers with decimals |
| String | `str` | `"Hello"`, `'Python'` | Text (characters) |
| Boolean | `bool` | `True`, `False` | Only two values |
| Complex | `complex` | `2+3j` | Real + imaginary parts |
| List | `list` | `[1, 2, 3]` | Ordered, changeable collection |
| Tuple | `tuple` | `(1, 2, 3)` | Ordered, unchangeable collection |
| Dictionary | `dict` | `{"name": "Ram"}` | Key-value pairs |
| Set | `set` | `{1, 2, 3}` | Unordered, unique items |

---

## Numbers

### ![int](https://img.shields.io/badge/int-Integer-blue?style=flat-square) Whole Numbers

```python
age = 25
count = -10
print(type(age))    # Output: <class 'int'>
```

### ![float](https://img.shields.io/badge/float-Decimal-blue?style=flat-square) Decimal Numbers

```python
salary = 50000.50
pi = 3.14
print(type(salary)) # Output: <class 'float'>
```

### ![complex](https://img.shields.io/badge/complex-Complex-blue?style=flat-square) Real + Imaginary

```python
x = 2 + 3j

print(x.real)       # Output: 2.0  (the real part)
print(x.imag)       # Output: 3.0  (the imaginary part)
print(type(x))      # Output: <class 'complex'>
```

> [!NOTE]
> Complex numbers are used in advanced math and science applications. You won't use them often as a beginner.

---

## Strings ![str](https://img.shields.io/badge/str-String-blue?style=flat-square)

Strings are **text values** enclosed in quotes:

```python
name = "Python"
print(type(name))   # Output: <class 'str'>
```

You can use **single quotes** `'hello'` or **double quotes** `"hello"` — both work!

### Accessing Characters

```python
st = "Python"

print(st[0])     # Output: P     (first character)
print(st[-1])    # Output: n     (last character)
print(st[0:6])   # Output: Python (slicing)
print(st[2:])    # Output: thon  (from index 2 to end)
print(st[::-1])  # Output: nohtyP (reversed!)
```

> [!IMPORTANT]
> Strings are **immutable** — you cannot change individual characters after creation.

---

## Boolean ![bool](https://img.shields.io/badge/bool-Boolean-blue?style=flat-square)

Booleans only have **two possible values**: `True` or `False`

```python
is_active = True
print(type(is_active))  # Output: <class 'bool'>

result = 10 > 5
print(result)            # Output: True
```

> [!TIP]
> Booleans are used in conditions (`if` statements) to make decisions.

---

## Checking the Type of a Variable

```python
x = 10
print(type(x))    # Output: <class 'int'>

x = "Ram"
print(type(x))    # Output: <class 'str'>

x = True
print(type(x))    # Output: <class 'bool'>
```

---

## Type Conversion (Casting)

You can **convert** one data type to another:

```python
# String to Integer
num = int("10")       # "10" → 10

# Integer to String
text = str(25)        # 25 → "25"

# Integer to Float
decimal = float(10)   # 10 → 10.0

# Float to Integer (removes decimal, doesn't round!)
whole = int(10.9)     # 10.9 → 10
```

> [!WARNING]
> `int("hello")` will cause an **error** because `"hello"` is not a number!

---

## Quick Reference

```
             Python Data Types
            ┌─────────────────┐
            │     Numbers     │
            │  int, float,    │
            │    complex      │
            ├─────────────────┤
            │     Text        │
            │     str         │
            ├─────────────────┤
            │    Boolean      │
            │     bool        │
            ├─────────────────┤
            │   Collections   │
            │  list, tuple,   │
            │  dict, set      │
            └─────────────────┘
```

---

## Practice Exercises

1. Create one variable of each type: `int`, `float`, `str`, `bool`
2. Use `type()` to check each one
3. Convert the string `"100"` to an integer and add `50` to it
4. Create a complex number and print its real and imaginary parts

---

<div align="center">

[![Previous](https://img.shields.io/badge/←_Previous-01_Basics-2196F3?style=for-the-badge)](./01_Python_Basics_and_Variables.md)
[![Next](https://img.shields.io/badge/Next_→-03_Operators-2196F3?style=for-the-badge)](./03_Operators.md)

</div>
