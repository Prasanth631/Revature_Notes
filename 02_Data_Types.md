# 📘 Topic 02: Data Types in Python

---

## 🧠 What is a Data Type?

A **data type** tells Python what **kind of value** a variable holds.
Think of it as the **label on the box** — it tells you what's inside.

---

## 📊 Python's Main Data Types

| Data Type | Python Name | Example | Description |
|-----------|-------------|---------|-------------|
| Integer | `int` | `10`, `-5`, `0` | Whole numbers (no decimals) |
| Float | `float` | `10.5`, `-3.14` | Numbers with decimals |
| String | `str` | `"Hello"`, `'Python'` | Text (characters) |
| Boolean | `bool` | `True`, `False` | Only two values: True or False |
| Complex | `complex` | `2+3j` | Numbers with real + imaginary parts |
| List | `list` | `[1, 2, 3]` | Ordered, changeable collection |
| Tuple | `tuple` | `(1, 2, 3)` | Ordered, unchangeable collection |
| Dictionary | `dict` | `{"name": "Ram"}` | Key-value pairs |
| Set | `set` | `{1, 2, 3}` | Unordered, unique items |

---

## 🔢 Numbers

### Integer (`int`) — Whole Numbers
```python
age = 25
count = -10
print(type(age))    # Output: <class 'int'>
```

### Float (`float`) — Decimal Numbers
```python
salary = 50000.50
pi = 3.14
print(type(salary)) # Output: <class 'float'>
```

### Complex (`complex`) — Real + Imaginary
```python
x = 2 + 3j

print(x.real)       # Output: 2.0  (the real part)
print(x.imag)       # Output: 3.0  (the imaginary part)
print(type(x))      # Output: <class 'complex'>
```

> 💡 **Tip:** You probably won't use complex numbers much as a beginner.
> They're used in advanced math and science applications.

---

## 📝 Strings (`str`) — Text

Strings are **text values** enclosed in quotes:

```python
name = "Python"
print(type(name))   # Output: <class 'str'>
```

You can use **single quotes** `'hello'` or **double quotes** `"hello"` — both work!

### Accessing Characters:
```python
st = "Python"

print(st[0])     # Output: P     (first character)
print(st[-1])    # Output: n     (last character)
print(st[0:6])   # Output: Python (slicing — from index 0 to 5)
print(st[2:])    # Output: thon  (from index 2 to the end)
print(st[::-1])  # Output: nohtyP (reversed string!)
```

> 📝 **Key Point:** Strings are **immutable** — you cannot change individual characters.

---

## ✅ Boolean (`bool`) — True or False

Booleans only have **two possible values**: `True` or `False`

```python
is_active = True
print(type(is_active))  # Output: <class 'bool'>

result = 10 > 5
print(result)            # Output: True
```

> 💡 **Tip:** Booleans are used in conditions (if statements) to make decisions.

---

## 🔍 Checking the Type of a Variable

Use `type()` to find out what data type a variable is:

```python
x = 10
print(type(x))    # Output: <class 'int'>

x = "Ram"
print(type(x))    # Output: <class 'str'>

x = True
print(type(x))    # Output: <class 'bool'>
```

---

## 🔄 Type Conversion (Casting)

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

> ⚠️ **Warning:** `int("hello")` will cause an **error** because "hello" is not a number!

---

## 📊 Data Types at a Glance

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

## 🧪 Quick Practice

1. Create one variable of each type: `int`, `float`, `str`, `bool`
2. Use `type()` to check each one
3. Convert the string `"100"` to an integer and add `50` to it
4. Create a complex number and print its real and imaginary parts

---

*← [01 — Python Basics](./01_Python_Basics_and_Variables.md) | Next: [03 — Operators →](./03_Operators.md)*
