<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Topic 13](https://img.shields.io/badge/Topic_13-Builtin_Functions_&_Math-C62828?style=for-the-badge)
![Intermediate](https://img.shields.io/badge/Level-Intermediate-FF9800?style=for-the-badge)

</div>

---

## Number Functions

| Function | What it Does | Example | Result |
|----------|-------------|:-------:|:------:|
| `abs(x)` | Absolute value | `abs(-1)` | `1` |
| `round(x)` | Round to nearest | `round(10.6)` | `11` |
| `round(x, n)` | Round to n decimals | `round(10.67, 1)` | `10.7` |
| `pow(x, y)` | x to the power y | `pow(10, 2)` | `100` |
| `max(list)` | Largest value | `max([10, 20, 1])` | `20` |
| `min(list)` | Smallest value | `min([10, 20, 1])` | `1` |
| `sum(list)` | Sum of all values | `sum([10, 20, 1])` | `31` |

```python
print(abs(-1))              # 1
print(round(10.6))          # 11
print(round(10.5))          # 10  (banker's rounding!)
print(round(10.67, 1))      # 10.7
print(pow(10, 2))           # 100
```

> [!WARNING]
> `round(10.5)` returns `10`, not `11`! Python uses "banker's rounding" — when exactly halfway, it rounds to the **nearest even number**.

---

## Length & Sorting

```python
print(len("python"))                        # 6
print(sorted([0, 1, 6, 24, 6]))            # [0, 1, 6, 6, 24]
print(sorted([0, 1, 6, 24], reverse=True)) # [24, 6, 1, 0]
```

---

## `enumerate()` — Index + Value

```python
fruits = ['Apple', 'Banana', 'Cherry']

for index, fruit in enumerate(fruits):
    print(index, fruit)
# 0 Apple
# 1 Banana
# 2 Cherry
```

> [!TIP]
> Use `enumerate()` when you need both the **index** and the **value** in a loop.

---

## Character & ASCII

```python
print(chr(65))    # 'A'  — ASCII code → character
print(ord('A'))   # 65   — Character → ASCII code
```

---

## Number System Conversions

```python
print(bin(10))    # '0b1010'  — Decimal → Binary
print(oct(10))    # '0o12'    — Decimal → Octal
print(hex(10))    # '0xa'     — Decimal → Hex
```

---

## `all()` and `any()`

| Function | Returns True if... |
|----------|-------------------|
| `all()` | **ALL** items are True |
| `any()` | **ANY** item is True |

```python
marks = [80, 90, 75]
print(all(m > 50 for m in marks))   # True
print(any(m > 85 for m in marks))   # True
```

---

## `isinstance()` — Check Data Type

```python
x = "100"
print(isinstance(x, int))    # False
print(isinstance(x, str))    # True
```

---

## The `math` Module ![Import](https://img.shields.io/badge/import-math-blue?style=flat-square)

```python
import math
```

| Function | What it Does | Example | Result |
|----------|-------------|:-------:|:------:|
| `math.sqrt(x)` | Square root | `math.sqrt(9)` | `3.0` |
| `math.pow(x, y)` | Power (float) | `math.pow(10, 2)` | `100.0` |
| `math.ceil(x)` | Round UP | `math.ceil(16.2)` | `17` |
| `math.floor(x)` | Round DOWN | `math.floor(16.2)` | `16` |
| `math.factorial(n)` | n! | `math.factorial(5)` | `120` |
| `math.pi` | Value of π | `math.pi` | `3.14159...` |
| `math.log(x)` | Natural log | `math.log(2)` | `0.693...` |
| `math.trunc(x)` | Remove decimal | `math.trunc(10.222)` | `10` |

```python
import math

print(math.sqrt(9))          # 3.0
print(math.ceil(16.2))       # 17
print(math.floor(16.2))      # 16
print(math.factorial(5))     # 120

# Area of a circle
radius = 7
area = math.pi * radius ** 2
print("Area:", round(area, 2))   # Area: 153.94
```

---

## Rounding Comparison

```
Number: 16.7

ceil(16.7)  → 17    (always UP)
floor(16.7) → 16    (always DOWN)
round(16.7) → 17    (nearest)
trunc(16.7) → 16    (removes decimal)
```

---

## Practice Exercises

1. Find the absolute value of `-42`
2. Round `3.14159` to 2 decimal places
3. Check if all numbers in `[2, 4, 6, 8]` are even using `all()`
4. Calculate the area of a circle with radius 10
5. Find the factorial of 7

---

<div align="center">

[![Previous](https://img.shields.io/badge/←_Previous-12_Lambda-2196F3?style=for-the-badge)](./12_Lambda_Functions.md)
[![Next](https://img.shields.io/badge/Next_→-14_File_Handling-2196F3?style=for-the-badge)](./14_File_Handling.md)

</div>
