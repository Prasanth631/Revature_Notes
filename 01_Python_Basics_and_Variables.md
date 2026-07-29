# 📘 Topic 01: Python Basics & Variables

---

## 🧠 What is Python?

Python is a **high-level, interpreted programming language**. This means:
- **High-level** → You write code in English-like words (not complex machine code)
- **Interpreted** → Python runs your code line by line (no separate compilation step)

---

## 📦 What is a Variable?

A **variable** is like a **labeled box** where you store a value.

Think of it this way:
- 📦 Box labeled `name` → contains `"Prasanth"`
- 📦 Box labeled `age` → contains `21`

In Python, you **don't need to declare the data type** before creating a variable — Python figures it out automatically!

---

## ✏️ Creating Variables

```python
name = "John"          # This is a string (text)
age = 25               # This is an integer (whole number)
salary = 50000.50      # This is a float (decimal number)
is_active = True       # This is a boolean (True or False)

print(name)            # Output: John
print(age)             # Output: 25
print(salary)          # Output: 50000.5
print(is_active)       # Output: True
print(type(is_active)) # Output: <class 'bool'>
```

> 💡 **Tip:** The `type()` function tells you what kind of data a variable holds.

---

## 🔄 Multiple Variable Assignment

You can create **multiple variables in one line**:

```python
name, age, city = "Alice", 24, "Chennai"

print(name)   # Output: Alice
print(age)    # Output: 24
print(city)   # Output: Chennai
```

You can also assign the **same value** to multiple variables:

```python
x = y = z = 10

print(x)   # Output: 10
print(y)   # Output: 10
print(z)   # Output: 10
```

---

## 🔀 Variable Swapping

In Python, you can **swap two values without a temporary variable**:

```python
a = 10
b = 20

a, b = b, a     # Magic swap!

print(a)   # Output: 20
print(b)   # Output: 10
```

> 💡 **Tip:** In many other languages, you'd need a third variable to swap.
> Python makes it easy with `a, b = b, a`

---

## 📦 Unpacking (Taking values out of a collection)

### Unpacking a List:
```python
numbers = [10, 20, 30]
a, b, c = numbers

print(a)   # Output: 10
print(b)   # Output: 20
print(c)   # Output: 30
```

### Unpacking a Tuple:
```python
student = ("John", 25, "Python")
name, age, course = student

print(name)    # Output: John
print(age)     # Output: 25
print(course)  # Output: Python
```

> ⚠️ **Important:** The number of variables on the left must match the number of items in the list/tuple!

---

## 🔢 Assign Values from an Expression

```python
a = 10
b = 20
c = a + b

print(c)   # Output: 30
```

You can also assign the result of a comparison:

```python
a = 10 > 5
print(a)   # Output: True (because 10 IS greater than 5)
```

---

## 🔄 Dynamic Typing

In Python, a variable can **change its type** during the program:

```python
x = 10
print(type(x))    # Output: <class 'int'>

x = "Python"
print(type(x))    # Output: <class 'str'>

x = 10.5
print(type(x))    # Output: <class 'float'>
```

> 📝 **Key Point:** Python is **dynamically typed** — the same variable can hold
> different types of data at different times.

---

## ➕ Assignment with Operations (Shorthand)

Instead of writing `x = x + 5`, Python lets you write `x += 5`:

```python
x = 10
print(x)     # Output: 10

x += 5       # Same as: x = x + 5
print(x)     # Output: 15

x *= 2       # Same as: x = x * 2
print(x)     # Output: 30
```

---

## 📝 Variable Naming Rules

| ✅ Allowed | ❌ Not Allowed |
|-----------|---------------|
| `my_name` | `my-name` (no hyphens) |
| `_age` | `2name` (can't start with a number) |
| `student1` | `my name` (no spaces) |
| `SALARY` | `class` (reserved keyword) |

> 💡 **Tip:** Use descriptive names! `student_name` is better than `sn`.

---

## 🧪 Quick Practice

Try these in your Python environment:

1. Create variables for your name, age, and favorite color. Print them all.
2. Swap two numbers using Python's shorthand.
3. Create a list with 3 items and unpack them into separate variables.
4. Check `type()` of different variables.

---

*Next Topic: [02 — Data Types →](./02_Data_Types.md)*
