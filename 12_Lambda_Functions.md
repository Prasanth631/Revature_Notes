# 📘 Topic 12: Lambda Functions in Python

---

## 🧠 What is a Lambda Function?

A **lambda function** is a **small, anonymous (unnamed) function** written in **one line**.
Think of it as a **shortcut** for simple functions.

### Syntax:
```
lambda arguments : expression
```

### Comparison — Regular Function vs Lambda:
```python
# Regular function
def add(a, b):
    return a + b

# Lambda function (same thing, one line!)
add = lambda a, b: a + b

print(add(10, 20))   # Output: 30
```

> 📝 **Key Points:**
> - Lambda functions can have **any number of arguments**
> - But only **ONE expression** (no multiple lines!)
> - They **automatically return** the result (no `return` keyword needed)

---

## 📝 Lambda Examples

### 1. Square of a Number:
```python
square = lambda x: x * x
print(square(5))      # Output: 25
```

### 2. Find the Maximum of Two Numbers:
```python
maximum = lambda x, y: x if x > y else y
print(maximum(100, 50))   # Output: 100
```

### 3. Check Even or Odd:
```python
is_even = lambda x: x % 2 == 0
print(is_even(20))    # Output: True
print(is_even(9))     # Output: False
```

### 4. Convert to Uppercase:
```python
upper = lambda name: name.upper()
print(upper("Python"))   # Output: PYTHON
```

---

## ⚡ Lambda with `sort()` — Very Important!

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
# Output: [('Priya', 95), ('Rahul', 85), ('Amit', 80)]
```

> 💡 **How it works:**
> - `key=lambda student: student[1]` → tells Python to sort by the **2nd element** (marks)
> - `reverse=True` → sort in **descending** order

---

## 🔄 When to Use Lambda vs Regular Function?

| Use Lambda When | Use Regular Function When |
|----------------|--------------------------|
| Simple, one-line logic | Complex, multi-line logic |
| Used only once (throwaway) | Used multiple times |
| With `sort()`, `map()`, `filter()` | Needs a descriptive name |
| Quick calculations | Has documentation/comments |

---

## ⚠️ Lambda Limitations

```python
# ❌ You CANNOT do this with lambda:
add = lambda a, b:
    result = a + b    # ERROR! No multi-line allowed
    return result

# ✅ Use a regular function instead:
def add(a, b):
    result = a + b
    return result
```

---

## 🧪 Quick Practice

1. Write a lambda to calculate the cube of a number
2. Write a lambda that checks if a string starts with "A"
3. Sort a list of names by their length using lambda
4. Write a lambda that returns the absolute value of a number

---

*← [11 — Functions](./11_Functions.md) | Next: [13 — Built-in Functions →](./13_Builtin_Functions_and_Math.md)*
