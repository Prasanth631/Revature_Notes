# 📘 Topic 03: Operators in Python

---

## 🧠 What are Operators?

**Operators** are special symbols that **perform operations** on values and variables.
Think of them as the "verbs" of Python — they tell Python what action to take.

---

## ➕ 1. Arithmetic Operators (Math Operations)

| Operator | Name | Example | Result |
|----------|------|---------|--------|
| `+` | Addition | `10 + 5` | `15` |
| `-` | Subtraction | `10 - 5` | `5` |
| `*` | Multiplication | `10 * 5` | `50` |
| `/` | Division | `10 / 5` | `2.0` (always returns float!) |
| `%` | Modulo (Remainder) | `10 % 3` | `1` |
| `**` | Exponent (Power) | `10 ** 2` | `100` (10²) |
| `//` | Floor Division | `10 // 3` | `3` (removes decimal) |

### Example:
```python
a = 10
b = 5

print(a + b)     # 15  — Addition
print(a - b)     # 5   — Subtraction
print(a * b)     # 50  — Multiplication
print(a / b)     # 2.0 — Division (returns float!)
print(10 % 2)    # 0   — Remainder (10 ÷ 2 = 5, remainder 0)
print(a ** 2)    # 100 — 10 to the power 2
print(10 // 3)   # 3   — Floor division (drops the decimal)
```

> 💡 **Tip:** `/` always gives a float result. Use `//` if you want an integer.

> 📝 **Key Point:** `%` (modulo) is very useful to check if a number is even or odd:
> - `num % 2 == 0` → Even number
> - `num % 2 != 0` → Odd number

---

## ⚖️ 2. Comparison (Relational) Operators

These compare two values and return `True` or `False`:

| Operator | Meaning | Example | Result |
|----------|---------|---------|--------|
| `==` | Equal to | `10 == 5` | `False` |
| `!=` | Not equal to | `10 != 5` | `True` |
| `>` | Greater than | `10 > 5` | `True` |
| `<` | Less than | `10 < 5` | `False` |
| `>=` | Greater than or equal | `5 >= 5` | `True` |
| `<=` | Less than or equal | `10 <= 10` | `True` |

### Example:
```python
a = 10
b = 5

print(a == b)    # False — Are they equal? No
print(a != b)    # True  — Are they different? Yes
print(a > b)     # True  — Is 10 greater than 5? Yes
print(a < b)     # False — Is 10 less than 5? No
print(5 >= 5)    # True  — Is 5 greater than or equal to 5? Yes
print(10 <= 10)  # True  — Is 10 less than or equal to 10? Yes
```

---

## 📝 3. Assignment Operators

These **assign and update** values to variables:

| Operator | Same As | Example |
|----------|---------|---------|
| `=` | Assign | `x = 10` |
| `+=` | `x = x + 5` | `x += 5` → x becomes 15 |
| `-=` | `x = x - 5` | `x -= 5` → x becomes 5 |
| `*=` | `x = x * 5` | `x *= 5` → x becomes 50 |
| `/=` | `x = x / 5` | `x /= 5` → x becomes 2.0 |
| `//=` | `x = x // 3` | `x //= 3` → x becomes 3 |
| `**=` | `x = x ** 5` | `x **= 5` → x becomes 100000 |

### Example:
```python
x = 5
x += 5     # x = 5 + 5 = 10
print(x)   # Output: 10

x = 10
x -= 5     # x = 10 - 5 = 5
print(x)   # Output: 5

x = 10
x *= 5     # x = 10 * 5 = 50
print(x)   # Output: 50

x = 10
x /= 5     # x = 10 / 5 = 2.0
print(x)   # Output: 2.0

x = 10
x //= 3    # x = 10 // 3 = 3
print(x)   # Output: 3

x = 10
x **= 5    # x = 10 ** 5 = 100000
print(x)   # Output: 100000
```

---

## 🧩 4. Logical Operators

Used to combine conditions:

| Operator | Meaning | Example | Result |
|----------|---------|---------|--------|
| `and` | Both must be True | `10 > 5 and 10 > 3` | `True` |
| `or` | At least one True | `10 > 5 or 10 > 20` | `True` |
| `not` | Reverses the result | `not 10 < 20` | `False` |

### Example:
```python
# and — BOTH conditions must be True
print(10 > 5 and 10 > 3)    # True  (both are true)
print(10 < 5 and 10 > 20)   # False (both are false)

# or — AT LEAST ONE condition must be True
print(10 > 5 or 10 > 20)    # True  (first one is true)

# not — REVERSES True to False, False to True
print(not 10 < 20)           # False (10 < 20 is True, not True = False)
```

> 💡 **Tip — Truth Table for `and`:**
> - `True and True` → `True`
> - `True and False` → `False`
> - `False and True` → `False`
> - `False and False` → `False`

> 💡 **Tip — Truth Table for `or`:**
> - `True or True` → `True`
> - `True or False` → `True`
> - `False or True` → `True`
> - `False or False` → `False`

---

## 💻 5. Bitwise Operators (Advanced)

These work on numbers at the **binary (bit) level**:

| Operator | Name | Example | Binary Explanation |
|----------|------|---------|-------------------|
| `&` | AND | `10 & 20` = `0` | `01010 AND 10100 = 00000` |
| `\|` | OR | `10 \| 20` = `30` | `01010 OR 10100 = 11110` |
| `~` | NOT (Complement) | `~10` = `-11` | Formula: `-(n+1)` |
| `<<` | Left Shift | `8 << 2` = `32` | Shifts bits left by 2 |
| `>>` | Right Shift | `8 >> 2` = `2` | Shifts bits right by 2 |

### Example:
```python
# Bitwise AND
print(10 & 20)    # Output: 0
# 01010   (10 in binary)
# 10100   (20 in binary)
# -----
# 00000   = 0

# Bitwise OR
print(10 | 20)    # Output: 30
# 01010
# 10100
# -----
# 11110   = 30

# Bitwise NOT
print(~10)        # Output: -11  (formula: -(10+1) = -11)

# Left Shift (multiplies by 2 for each shift)
print(8 << 2)     # Output: 32  (8 × 2 × 2 = 32)

# Right Shift (divides by 2 for each shift)
print(8 >> 2)     # Output: 2   (8 ÷ 2 ÷ 2 = 2)
```

> 📝 **Key Point:** Left shift `<< n` = multiply by 2ⁿ, Right shift `>> n` = divide by 2ⁿ

---

## 🆔 6. Identity Operators

Check if two variables **point to the same object** in memory:

| Operator | Meaning |
|----------|---------|
| `is` | Returns True if both refer to the same object |
| `is not` | Returns True if they don't refer to the same object |

### Example:
```python
a = 10
b = a

print(id(a), id(b))   # Same memory address!
print(a is b)          # Output: True (they point to the same object)
```

> 💡 **Tip:** `==` checks if **values are equal**. `is` checks if they are the **same object in memory**.

---

## 🧪 Quick Practice

1. What is the result of `17 % 5`?
2. What is `2 ** 10`?
3. Is this True or False? `10 > 5 and 3 > 7`
4. What does `not True` return?
5. What is `16 >> 2`?

### Answers:
1. `2` (17 ÷ 5 = 3 remainder **2**)
2. `1024` (2 to the power 10)
3. `False` (second condition is False, so `and` returns False)
4. `False`
5. `4` (16 ÷ 2 ÷ 2 = 4)

---

*← [02 — Data Types](./02_Data_Types.md) | Next: [04 — Strings →](./04_Strings.md)*
