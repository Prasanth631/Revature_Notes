# 📘 Topic 16: Map, Filter & Reduce

---

## 🧠 What are Map, Filter & Reduce?

These are **powerful built-in functions** that let you process data in lists
**without writing loops**. They work with regular functions or lambda functions.

---

## 🗺️ 1. `map()` — Apply a Function to Every Item

`map()` takes a function and applies it to **each element** in a list.

### Syntax:
```
map(function, iterable)
```

### Example with a Regular Function:
```python
def add(a, b):
    return a + b

l1 = [10, 20, 30]
l2 = [20, 30, 40]

result = list(map(add, l1, l2))
print(result)   # Output: [30, 50, 70]
```

> 💡 **How it works:**
> - `add(10, 20)` → 30
> - `add(20, 30)` → 50
> - `add(30, 40)` → 70

### Example with Lambda:
```python
l1 = [10, 20, 30]
l2 = [20, 30, 40]

result = list(map(lambda a, b: a + b, l1, l2))
print(result)   # Output: [30, 50, 70]
```

### Square Each Number:
```python
l1 = [10, 20, 30]
squares = list(map(lambda x: x * x, l1))
print(squares)   # Output: [100, 400, 900]
```

> 📝 **Key Point:** `map()` returns a map object — use `list()` to convert it to a list.

---

## 🔍 2. `filter()` — Keep Only Items That Match a Condition

`filter()` keeps only the elements where the function returns `True`.

### Syntax:
```
filter(function, iterable)
```

### Example with a Regular Function:
```python
def is_eligible(num):
    return num >= 18

l1 = [10, 20, 18, 30]

result = list(filter(is_eligible, l1))
print(result)   # Output: [20, 18, 30]
```

### Example with Lambda:
```python
l1 = [10, 20, 18, 30]
result = list(filter(lambda x: x >= 18, l1))
print(result)   # Output: [20, 18, 30]
```

### Extract Vowels from a String:
```python
st = list('babjee')
vowels = ['a', 'e', 'i', 'o', 'u']

result = list(filter(lambda x: x in vowels, st))
print(result)   # Output: ['a', 'e', 'e']
```

> 📝 **Key Point:** `filter()` returns items where the function returns `True`.
> Think of it as a **sieve** — only matching items pass through!

---

## 🔄 3. `map()` vs `filter()` — What's the Difference?

| Feature | `map()` | `filter()` |
|---------|---------|-----------|
| Purpose | **Transform** each item | **Select** items that match |
| Returns | Same number of items | Fewer or same number of items |
| Function returns | New value for each item | `True` or `False` |
| Example | Square each number | Keep only even numbers |

```python
numbers = [1, 2, 3, 4, 5]

# map — transforms each item
squared = list(map(lambda x: x**2, numbers))
print(squared)   # [1, 4, 9, 16, 25]  — ALL items, transformed

# filter — selects matching items
evens = list(filter(lambda x: x % 2 == 0, numbers))
print(evens)     # [2, 4]  — Only items that are even
```

---

## 📊 Visual Summary

```
map():    [1, 2, 3, 4, 5]  →  function(x*x)  →  [1, 4, 9, 16, 25]
          (ALL items transformed)

filter(): [1, 2, 3, 4, 5]  →  is_even?       →  [2, 4]
          (Only matching items kept)
```

---

## ⚡ Using `map()` and `filter()` with `set()` and `tuple()`

```python
# Convert result to a set (removes duplicates)
l1 = [10, 20, 18, 30]
result = set(filter(lambda x: x >= 18, l1))
print(result)   # {18, 20, 30}

# Convert result to a tuple
result = tuple(map(lambda x: x * 2, l1))
print(result)   # (20, 40, 36, 60)
```

---

## 🎯 Real-World Examples

### 1. Convert Temperatures (Celsius to Fahrenheit):
```python
celsius = [0, 10, 20, 30, 40]
fahrenheit = list(map(lambda c: (c * 9/5) + 32, celsius))
print(fahrenheit)   # [32.0, 50.0, 68.0, 86.0, 104.0]
```

### 2. Filter Adults from a List of Ages:
```python
ages = [12, 18, 25, 8, 30, 15]
adults = list(filter(lambda age: age >= 18, ages))
print(adults)   # [18, 25, 30]
```

### 3. Get Uppercase Names:
```python
names = ["alice", "bob", "charlie"]
upper_names = list(map(lambda name: name.upper(), names))
print(upper_names)   # ['ALICE', 'BOB', 'CHARLIE']
```

---

## 🧪 Quick Practice

1. Use `map()` to double every number in `[5, 10, 15, 20]`
2. Use `filter()` to get all numbers greater than 50 from `[10, 60, 35, 80, 45, 90]`
3. Use `map()` with lambda to add 10 to each number in a list
4. Use `filter()` to extract all strings with length > 4 from `["hi", "hello", "hey", "python"]`

---

## 🎉 Congratulations!

You've completed all 16 topics of your Python learning notes!
Here's what you've learned:

```
✅ 01. Python Basics & Variables
✅ 02. Data Types
✅ 03. Operators
✅ 04. Strings
✅ 05. Lists
✅ 06. Tuples
✅ 07. Dictionaries
✅ 08. Sets
✅ 09. Conditional Statements
✅ 10. Loops
✅ 11. Functions
✅ 12. Lambda Functions
✅ 13. Built-in Functions & Math Module
✅ 14. File Handling
✅ 15. OS Module
✅ 16. Map, Filter & Reduce
```

**Keep practicing, and you'll master Python in no time! 🐍🚀**

---

*← [15 — OS Module](./15_OS_Module.md) | [Back to Table of Contents →](./00_Table_of_Contents.md)*
