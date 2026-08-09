<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Topic 03](https://img.shields.io/badge/Topic_03-Operators-FF6F00?style=for-the-badge)
![Beginner](https://img.shields.io/badge/Level-Beginner-4CAF50?style=for-the-badge)

</div>

---

## What are Operators?

**Operators** are special symbols that **perform operations** on values and variables — the "verbs" of Python.

---

## 1. Arithmetic Operators ![Math](https://img.shields.io/badge/Math-Operations-blue?style=flat-square)

| Operator | Name | Example | Result |
|:--------:|------|:-------:|:------:|
| `+` | Addition | `10 + 5` | `15` |
| `-` | Subtraction | `10 - 5` | `5` |
| `*` | Multiplication | `10 * 5` | `50` |
| `/` | Division | `10 / 5` | `2.0` |
| `%` | Modulo (Remainder) | `10 % 3` | `1` |
| `**` | Exponent (Power) | `10 ** 2` | `100` |
| `//` | Floor Division | `10 // 3` | `3` |

```python
a = 10
b = 5

print(a + b)     # 15  — Addition
print(a - b)     # 5   — Subtraction
print(a * b)     # 50  — Multiplication
print(a / b)     # 2.0 — Division (always returns float!)
print(10 % 2)    # 0   — Remainder
print(a ** 2)    # 100 — Power
print(10 // 3)   # 3   — Floor division
```

> [!TIP]
> `/` always gives a float result. Use `//` if you want an integer.

> [!NOTE]
> `%` (modulo) is very useful to check if a number is even or odd:
> - `num % 2 == 0` → Even number
> - `num % 2 != 0` → Odd number

---

## 2. Comparison Operators ![Compare](https://img.shields.io/badge/Comparison-Relational-blue?style=flat-square)

These compare two values and return `True` or `False`:

| Operator | Meaning | Example | Result |
|:--------:|---------|:-------:|:------:|
| `==` | Equal to | `10 == 5` | `False` |
| `!=` | Not equal to | `10 != 5` | `True` |
| `>` | Greater than | `10 > 5` | `True` |
| `<` | Less than | `10 < 5` | `False` |
| `>=` | Greater or equal | `5 >= 5` | `True` |
| `<=` | Less or equal | `10 <= 10` | `True` |

```python
a = 10
b = 5

print(a == b)    # False
print(a != b)    # True
print(a > b)     # True
print(a < b)     # False
print(5 >= 5)    # True
print(10 <= 10)  # True
```

---

## 3. Assignment Operators ![Assign](https://img.shields.io/badge/Assignment-Operators-blue?style=flat-square)

| Operator | Same As | Example |
|:--------:|---------|---------|
| `=` | Assign | `x = 10` |
| `+=` | `x = x + 5` | `x += 5` → 15 |
| `-=` | `x = x - 5` | `x -= 5` → 5 |
| `*=` | `x = x * 5` | `x *= 5` → 50 |
| `/=` | `x = x / 5` | `x /= 5` → 2.0 |
| `//=` | `x = x // 3` | `x //= 3` → 3 |
| `**=` | `x = x ** 5` | `x **= 5` → 100000 |

```python
x = 10
x += 5     # x = 10 + 5 = 15
print(x)   # Output: 15

x = 10
x *= 5     # x = 10 * 5 = 50
print(x)   # Output: 50

x = 10
x **= 5   # x = 10 ** 5 = 100000
print(x)   # Output: 100000
```

---

## 4. Logical Operators ![Logic](https://img.shields.io/badge/Logical-Operators-blue?style=flat-square)

Used to combine conditions:

| Operator | Meaning | Example | Result |
|:--------:|---------|:-------:|:------:|
| `and` | Both must be True | `10 > 5 and 10 > 3` | `True` |
| `or` | At least one True | `10 > 5 or 10 > 20` | `True` |
| `not` | Reverses the result | `not 10 < 20` | `False` |

```python
# and — BOTH conditions must be True
print(10 > 5 and 10 > 3)    # True
print(10 < 5 and 10 > 20)   # False

# or — AT LEAST ONE condition must be True
print(10 > 5 or 10 > 20)    # True

# not — REVERSES True ↔ False
print(not 10 < 20)           # False
```

> [!TIP]
> **Truth Table for `and`:**
> `True and True` → `True` | `True and False` → `False` | `False and False` → `False`
>
> **Truth Table for `or`:**
> `True or False` → `True` | `False or True` → `True` | `False or False` → `False`

---

## 5. Bitwise Operators ![Bitwise](https://img.shields.io/badge/Bitwise-Advanced-blue?style=flat-square)

These work on numbers at the **binary (bit) level**:

| Operator | Name | Example | Result |
|:--------:|------|:-------:|:------:|
| `&` | AND | `10 & 20` | `0` |
| `\|` | OR | `10 \| 20` | `30` |
| `~` | NOT | `~10` | `-11` |
| `<<` | Left Shift | `8 << 2` | `32` |
| `>>` | Right Shift | `8 >> 2` | `2` |

```python
print(10 & 20)    # 0   (binary AND)
print(10 | 20)    # 30  (binary OR)
print(~10)        # -11 (formula: -(n+1))
print(8 << 2)     # 32  (8 × 2 × 2)
print(8 >> 2)     # 2   (8 ÷ 2 ÷ 2)
```

> [!NOTE]
> Left shift `<< n` = multiply by 2ⁿ | Right shift `>> n` = divide by 2ⁿ

---

## 6. Identity Operators ![Identity](https://img.shields.io/badge/Identity-Operators-blue?style=flat-square)

Check if two variables **point to the same object** in memory:

| Operator | Meaning |
|:--------:|---------|
| `is` | Returns True if both refer to the same object |
| `is not` | Returns True if they don't |

```python
a = 10
b = a

print(id(a), id(b))   # Same memory address!
print(a is b)          # Output: True
```

> [!TIP]
> `==` checks if **values are equal**. `is` checks if they are the **same object in memory**.

---

## Practice Exercises

1. What is the result of `17 % 5`? → `2`
2. What is `2 ** 10`? → `1024`
3. Is this True or False? `10 > 5 and 3 > 7` → `False`
4. What does `not True` return? → `False`
5. What is `16 >> 2`? → `4`

---

<div align="center">

[![Previous](https://img.shields.io/badge/←_Previous-02_Data_Types-2196F3?style=for-the-badge)](./02_Data_Types.md)
[![Next](https://img.shields.io/badge/Next_→-04_Strings-2196F3?style=for-the-badge)](./04_Strings.md)

</div>
