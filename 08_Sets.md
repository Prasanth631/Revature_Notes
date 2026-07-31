<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Topic 08](https://img.shields.io/badge/Topic_08-Sets-7B1FA2?style=for-the-badge)
![Beginner-Intermediate](https://img.shields.io/badge/Level-Beginner--Intermediate-2196F3?style=for-the-badge)

</div>

---

## What is a Set?

A **set** is an **unordered, mutable collection of unique elements** — a bag where no duplicates are allowed.

```python
fruits = {'Apple', 'Banana', 'Orange'}
print(fruits)   # Order may vary!
```

### Key Characteristics

| Feature | Status |
|---------|:------:|
| Ordered | ![No](https://img.shields.io/badge/-No-F44336?style=flat-square) |
| Mutable | ![Yes](https://img.shields.io/badge/-Yes-4CAF50?style=flat-square) |
| Duplicates | ![No](https://img.shields.io/badge/-No-F44336?style=flat-square) |
| Indexing | ![No](https://img.shields.io/badge/-No-F44336?style=flat-square) |

---

## Creating Sets

```python
fruits = {'Apple', 'Banana', 'Orange'}

# Duplicates are automatically removed!
numbers = {10, 20, 20, 30, 30, 40}
print(numbers)   # {40, 10, 20, 30} (only unique values)
```

---

## Remove Duplicates from a List

One of the most **common uses** of sets:

```python
numbers = [10, 20, 20, 30, 30, 40]
unique = list(set(numbers))
print(unique)   # [40, 10, 20, 30] (order may change)
```

---

## Adding & Removing Items

```python
fruits = {'Apple', 'Banana', 'Orange'}

# add() — add ONE item
fruits.add("Mango")

# remove() — ERROR if not found!
fruits.remove("Banana")

# discard() — NO error if not found
fruits.discard("Yellow")   # No error

# pop() — removes a RANDOM item
removed = fruits.pop()

# clear() — removes all items
fruits.clear()
```

> [!WARNING]
> `.remove()` gives an error if the item doesn't exist. Use `.discard()` if you're not sure!

---

## Set Operations ![Math](https://img.shields.io/badge/Set-Math-purple?style=flat-square)

```
Set A = {1, 2, 3}    Set B = {3, 4, 5}

Union (A ∪ B):        {1, 2, 3, 4, 5}    — All items from both
Intersection (A ∩ B): {3}                 — Items in BOTH
Difference (A - B):   {1, 2}              — Items in A but NOT B
Symmetric Diff:       {1, 2, 4, 5}        — Items in either, NOT both
```

```python
a = {1, 2, 3}
b = {3, 4, 5}

print(a | b)     # {1, 2, 3, 4, 5}  — Union
print(a & b)     # {3}              — Intersection
print(a - b)     # {1, 2}           — Difference
print(a ^ b)     # {1, 2, 4, 5}    — Symmetric Difference
```

---

## In-Place Operations

```python
a = {1, 2, 3}
b = {3, 4, 5}

a.update(b)                # Union in-place → {1, 2, 3, 4, 5}
a.intersection_update(b)   # Keep common only → {3}
a.difference_update(b)     # Remove items in b → {1, 2}
```

---

## Subset & Superset

```python
a = {1, 2, 3}
b = {1, 2, 3, 4, 5}

print(a.issubset(b))       # True  — All of A are in B
print(b.issuperset(a))     # True  — B contains all of A
```

---

## Collections Comparison

| Feature | ![List](https://img.shields.io/badge/List-blue?style=flat-square) | ![Tuple](https://img.shields.io/badge/Tuple-orange?style=flat-square) | ![Set](https://img.shields.io/badge/Set-purple?style=flat-square) | ![Dict](https://img.shields.io/badge/Dict-green?style=flat-square) |
|---------|:---:|:---:|:---:|:---:|
| Syntax | `[1,2,3]` | `(1,2,3)` | `{1,2,3}` | `{"a":1}` |
| Ordered? | Yes | Yes | No | Yes |
| Mutable? | Yes | No | Yes | Yes |
| Duplicates? | Yes | Yes | No | Keys: No |
| Indexed? | Yes | Yes | No | By key |

---

## Practice Exercises

1. Create two sets and find their union, intersection, and difference
2. Remove duplicates from `[5, 3, 5, 8, 3, 9, 8]` using a set
3. Check if `{1, 2}` is a subset of `{1, 2, 3, 4}`
4. Find common skills between two job candidates

---

<div align="center">

[![Previous](https://img.shields.io/badge/←_Previous-07_Dictionaries-2196F3?style=for-the-badge)](./07_Dictionaries.md)
[![Next](https://img.shields.io/badge/Next_→-09_Conditionals-2196F3?style=for-the-badge)](./09_Conditional_Statements.md)

</div>
