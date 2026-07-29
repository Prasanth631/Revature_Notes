# 📘 Topic 13: Built-in Functions & Math Module

---

## 🧠 What are Built-in Functions?

**Built-in functions** are functions that come **pre-installed** with Python.
You can use them without importing anything!

---

## 🔢 Number Functions

| Function | What it Does | Example | Result |
|----------|-------------|---------|--------|
| `abs(x)` | Absolute value (remove negative sign) | `abs(-1)` | `1` |
| `round(x)` | Round to nearest integer | `round(10.6)` | `11` |
| `round(x, n)` | Round to n decimal places | `round(10.67, 1)` | `10.7` |
| `pow(x, y)` | x raised to power y | `pow(10, 2)` | `100` |
| `max(list)` | Largest value | `max([10, 20, 1])` | `20` |
| `min(list)` | Smallest value | `min([10, 20, 1])` | `1` |
| `sum(list)` | Sum of all values | `sum([10, 20, 1])` | `31` |

### Examples:
```python
print(abs(-1))              # 1
print(round(10.6))          # 11
print(round(10.5))          # 10  (Python uses "banker's rounding"!)
print(round(10.67, 1))      # 10.7
print(pow(10, 2))           # 100
print(max([10, 20, 1]))     # 20
print(min([10, 20, 1]))     # 1
print(sum([10, 20, 1]))     # 31
```

> ⚠️ **Gotcha:** `round(10.5)` returns `10`, not `11`!
> Python uses "banker's rounding" — when exactly halfway, it rounds to the **nearest even number**.

---

## 📏 Length & Sorting

```python
name = "python"
print(len(name))              # 6 (number of characters)

numbers = [0, 1, 6, 24, 6]
print(sorted(numbers))         # [0, 1, 6, 6, 24] (ascending)
print(sorted(numbers, reverse=True))  # [24, 6, 6, 1, 0] (descending)

# Sorting a string
print(sorted("python", reverse=True))  # ['y', 't', 'p', 'o', 'n', 'h']
```

---

## 🔢 `enumerate()` — Get Index + Value

```python
fruits = ['Apple', 'Banana', 'Cherry']

for index, fruit in enumerate(fruits):
    print(index, fruit)

# Output:
# 0 Apple
# 1 Banana
# 2 Cherry
```

> 💡 **Tip:** `enumerate()` is perfect when you need both the **index** and the **value** in a loop.

---

## 🔤 Character & ASCII Functions

```python
print(chr(65))    # 'A'  — ASCII code 65 → character 'A'
print(ord('A'))   # 65   — Character 'A' → ASCII code 65
```

---

## 🔢 Number System Conversions

```python
print(bin(10))    # '0b1010'  — Decimal to Binary
print(oct(10))    # '0o12'    — Decimal to Octal
print(hex(10))    # '0xa'     — Decimal to Hexadecimal
```

---

## ✅ `all()` and `any()`

| Function | What it Does |
|----------|-------------|
| `all()` | Returns `True` if **ALL** items are True |
| `any()` | Returns `True` if **ANY** item is True |

```python
marks = [80, 90, 75]

print(all(m > 50 for m in marks))   # True  — ALL marks > 50
print(any(m > 85 for m in marks))   # True  — At least ONE mark > 85
```

---

## 🔍 `isinstance()` — Check Data Type

```python
x = "100"
print(isinstance(x, int))    # False — it's a string, not int
print(isinstance(x, str))    # True  — yes, it's a string
```

---

## 📚 `help()` and `dir()`

```python
# help() — shows documentation for a function
help(len)
# Output: len(obj, /) — Return the number of items in a container.

# dir() — lists all methods available for a data type
print(dir(float))
# Shows all methods you can use with floats
```

---

## 📐 The `math` Module

For advanced math, **import the `math` module**:

```python
import math
```

### Math Functions:

| Function | What it Does | Example | Result |
|----------|-------------|---------|--------|
| `math.sqrt(x)` | Square root | `math.sqrt(9)` | `3.0` |
| `math.pow(x, y)` | Power (returns float) | `math.pow(10, 2)` | `100.0` |
| `math.ceil(x)` | Round UP | `math.ceil(16.2)` | `17` |
| `math.floor(x)` | Round DOWN | `math.floor(16.2)` | `16` |
| `math.factorial(n)` | n! (factorial) | `math.factorial(5)` | `120` |
| `math.pi` | Value of π | `math.pi` | `3.14159...` |
| `math.log(x)` | Natural log (ln) | `math.log(2)` | `0.693...` |
| `math.log2(x)` | Log base 2 | `math.log2(2)` | `1.0` |
| `math.log10(x)` | Log base 10 | `math.log10(2)` | `0.301...` |
| `math.exp(x)` | e raised to x | `math.exp(2)` | `7.389...` |
| `math.fabs(x)` | Absolute (float) | `math.fabs(-1)` | `1.0` |
| `math.fmod(x, y)` | Float modulo | `math.fmod(10, 2)` | `0.0` |
| `math.trunc(x)` | Remove decimal | `math.trunc(10.222)` | `10` |

### Examples:
```python
import math

print(math.sqrt(9))          # 3.0
print(math.pow(10, 2))       # 100.0
print(math.ceil(16.2))       # 17  (rounds UP)
print(math.floor(16.2))      # 16  (rounds DOWN)
print(math.factorial(5))     # 120 (5! = 5×4×3×2×1)
print(math.pi)               # 3.141592653589793
print(math.trunc(10.222))    # 10

# Calculate area of a circle
radius = 7
area = math.pi * radius ** 2
print("Area:", round(area, 2))   # Area: 153.94
```

---

## 📊 `ceil()` vs `floor()` vs `round()` vs `trunc()`

```
Number: 16.7

ceil(16.7)  → 17    (always rounds UP)
floor(16.7) → 16    (always rounds DOWN)
round(16.7) → 17    (rounds to nearest)
trunc(16.7) → 16    (just removes decimal)
```

---

## 🧪 Quick Practice

1. Find the absolute value of `-42`
2. Round `3.14159` to 2 decimal places
3. Check if all numbers in `[2, 4, 6, 8]` are even using `all()`
4. Calculate the area of a circle with radius 10 using `math.pi`
5. Find the factorial of 7

---

*← [12 — Lambda Functions](./12_Lambda_Functions.md) | Next: [14 — File Handling →](./14_File_Handling.md)*
