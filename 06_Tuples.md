<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Topic 06](https://img.shields.io/badge/Topic_06-Tuples-7B1FA2?style=for-the-badge)
![Beginner-Intermediate](https://img.shields.io/badge/Level-Beginner--Intermediate-2196F3?style=for-the-badge)

</div>

---

## What is a Tuple?

A **tuple** is an **ordered, immutable (unchangeable) collection** — a sealed box that can't be modified after creation.

```python
fruits = ('Apple', 'Banana', 'Orange')
print(fruits)          # ('Apple', 'Banana', 'Orange')
print(type(fruits))    # <class 'tuple'>
```

---

## Tuple vs List

| Feature | ![List](https://img.shields.io/badge/List-blue?style=flat-square) `[]` | ![Tuple](https://img.shields.io/badge/Tuple-purple?style=flat-square) `()` |
|---------|:---:|:---:|
| Mutable? | Yes (can change) | No (cannot change) |
| Speed | Slower | Faster |
| Use Case | Data that changes | Data that stays the same |

> [!TIP]
> Use tuples for data that should **NOT be modified** — coordinates, database records, or config values.

---

## Creating Tuples

```python
fruits = ('Apple', 'Banana', 'Orange')
student = (101, "Ram", 93.5, True)
```

---

## Accessing Items

```python
fruits = ('Apple', 'Banana', 'Orange')

print(fruits[0])      # Apple
print(fruits[1])      # Banana
print(fruits[0:2])    # ('Apple', 'Banana')
```

---

## Tuples are Immutable

```python
fruits = ('Apple', 'Banana', 'Orange')
fruits[0] = "Mango"   # ERROR!
# TypeError: 'tuple' object does not support item assignment
```

> [!CAUTION]
> This is the most important thing about tuples! Trying to change a tuple item causes an error.

---

## Tuple Methods (Only 2!)

| Method | What it Does | Example |
|--------|-------------|:-------:|
| `.count(value)` | Count occurrences | `(10,20,20,30).count(20)` → `2` |
| `.index(value)` | Find position | `(10,20,20,30).index(30)` → `3` |

```python
numbers = (10, 20, 20, 30)
print(numbers.count(20))   # 2
print(numbers.index(30))   # 3
```

---

## Tuple Unpacking

```python
employee = (101, "Rahul", "IT")
emp_id, name, department = employee

print(emp_id)      # 101
print(name)        # Rahul
print(department)  # IT
```

---

## `zip()` — Combine Lists into Tuples

```python
names = ['Ram', 'Sham', 'Preethi']
marks = [500, 600, 700]

combined = list(zip(names, marks))
print(combined)
# [('Ram', 500), ('Sham', 600), ('Preethi', 700)]
```

> [!TIP]
> `zip()` pairs up items at the same index. It stops when the shortest list runs out.

---

## When to Use Tuples

| Use Case | Why |
|----------|-----|
| Coordinates `(x, y)` | They shouldn't change |
| Database records | Read-only data |
| Dictionary keys | Tuples can be dict keys (lists can't!) |
| Function return values | Return multiple values |
| Config values | Settings that shouldn't be modified |

---

## Practice Exercises

1. Create a tuple with 4 colors and access the 3rd color
2. Try to change an item — what error do you get?
3. Count how many times `"Python"` appears in `("Python", "Java", "Python", "SQL")`
4. Use `zip()` to combine names and ages into tuples

---

<div align="center">

[![Previous](https://img.shields.io/badge/←_Previous-05_Lists-2196F3?style=for-the-badge)](./05_Lists.md)
[![Next](https://img.shields.io/badge/Next_→-07_Dictionaries-2196F3?style=for-the-badge)](./07_Dictionaries.md)

</div>
