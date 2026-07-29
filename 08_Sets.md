# 📘 Topic 08: Sets in Python

---

## 🧠 What is a Set?

A **set** is an **unordered, mutable collection of unique elements**.
Think of it as a **bag of unique items** — no duplicates allowed!

```python
fruits = {'Apple', 'Banana', 'Orange'}
print(fruits)   # Output: {'Apple', 'Orange', 'Banana'} (order may vary!)
```

### Key Characteristics:
- ✅ **Unordered** — items don't have a fixed position (no indexing!)
- ✅ **Mutable** — you can add or remove elements
- ✅ **No duplicates** — automatically removes repeated values
- ❌ **No indexing** — you can't do `my_set[0]`

---

## 📝 Creating Sets

```python
# Creating a set
fruits = {'Apple', 'Banana', 'Orange'}

# Duplicates are automatically removed!
numbers = {10, 20, 20, 30, 30, 40}
print(numbers)   # Output: {40, 10, 20, 30} (only unique values!)
```

---

## 🔥 Remove Duplicates from a List Using Sets!

This is one of the most **common uses** of sets:

```python
numbers = [10, 20, 20, 30, 30, 40]
unique = list(set(numbers))
print(unique)   # Output: [40, 10, 20, 30] (order may change)
```

> 💡 **Tip:** Converting to a set removes duplicates, then convert back to a list!

---

## ➕ Adding & Removing Items

```python
fruits = {'Apple', 'Banana', 'Orange'}

# add() — add ONE item
fruits.add("Mango")

# remove() — removes an item (ERROR if not found!)
fruits.remove("Banana")

# discard() — removes an item (NO error if not found)
colors = {"Red", "Blue"}
colors.discard("Yellow")   # No error even though 'Yellow' isn't there!
print(colors)              # {'Red', 'Blue'}

# pop() — removes and returns a RANDOM item
fruits = {"Apple", "Orange"}
removed = fruits.pop()
print(removed)             # Could be 'Apple' or 'Orange'

# clear() — removes all items
numbers = {10, 20, 30}
numbers.clear()
```

> ⚠️ **Warning:** `.remove()` gives an error if the item doesn't exist.
> Use `.discard()` if you're not sure!

---

## 🔄 Looping Through a Set

```python
numbers = {10, 20, 30}
for x in numbers:
    print(x)

# Output (order may vary):
# 10
# 20
# 30
```

---

## 📏 Set Size & Membership

```python
numbers = {10, 20, 30, 40}

# Length
print(len(numbers))          # 4

# Membership check (in / not in)
fruits = {"Apple", "Orange"}
print("Apple" in fruits)     # True
print("Banana" not in fruits) # True
```

---

## 🤝 Set Operations (Very Important!)

Sets support mathematical operations like union, intersection, etc.

### Visual Guide:
```
Set A = {1, 2, 3}
Set B = {3, 4, 5}

Union (A ∪ B):        {1, 2, 3, 4, 5}    — All items from both
Intersection (A ∩ B): {3}                 — Items in BOTH
Difference (A - B):   {1, 2}              — Items in A but NOT in B
Difference (B - A):   {4, 5}              — Items in B but NOT in A
Symmetric Diff:       {1, 2, 4, 5}        — Items in either, but NOT both
```

### Code Examples:
```python
a = {1, 2, 3}
b = {3, 4, 5}

# Union — combine all unique items
print(a.union(b))             # {1, 2, 3, 4, 5}
print(a | b)                  # Same thing using operator

# Intersection — items in BOTH sets
print(a.intersection(b))      # {3}
print(a & b)                  # Same thing using operator

# Difference — items in A but not in B
print(a - b)                  # {1, 2}
print(b - a)                  # {4, 5}

# Symmetric Difference — items in either but NOT both
print(a.symmetric_difference(b))   # {1, 2, 4, 5}
```

---

## 🔄 In-Place Set Operations (Modify the Original Set)

These methods **change the original set**:

```python
a = {1, 2, 3}
b = {3, 4, 5}

# update() — adds all items from b to a (union in-place)
a.update(b)
print(a)                      # {1, 2, 3, 4, 5}

# intersection_update() — keeps only common items
a = {1, 2, 3}
a.intersection_update(b)
print(a)                      # {3}

# difference_update() — removes items found in b
a = {1, 2, 3}
a.difference_update(b)
print(a)                      # {1, 2}
```

---

## ✅ Subset & Superset

```python
a = {1, 2, 3}
b = {1, 2, 3, 4, 5}

print(a.issubset(b))       # True  — All items of A are in B
print(b.issuperset(a))     # True  — B contains all items of A
```

---

## 🎯 Real-World Examples

### 1. Find Common Skills Between Candidates:
```python
candidate1 = {"Python", "SQL", "Pandas"}
candidate2 = {"Python", "Spark", "SQL"}

common = candidate1 & candidate2
print(common)   # {'SQL', 'Python'}
```

### 2. Unique Website Visitors:
```python
visitors = {"Sai", "Rahul", "Sai", "Anil", "Rahul", "Kiran"}
print(visitors)   # Only unique names!
```

### 3. Merge Two Teams:
```python
team1 = {"A", "B"}
team2 = {"C", "D"}
team1.update(team2)
print(team1)      # {'C', 'B', 'D', 'A'}
```

---

## 📊 List vs Tuple vs Set vs Dictionary

| Feature | List | Tuple | Set | Dictionary |
|---------|------|-------|-----|------------|
| Syntax | `[1,2,3]` | `(1,2,3)` | `{1,2,3}` | `{"a":1}` |
| Ordered? | ✅ | ✅ | ❌ | ✅ |
| Mutable? | ✅ | ❌ | ✅ | ✅ |
| Duplicates? | ✅ | ✅ | ❌ | Keys: ❌ |
| Indexed? | ✅ | ✅ | ❌ | By key |

---

## 🧪 Quick Practice

1. Create two sets and find their union, intersection, and difference
2. Remove duplicates from `[5, 3, 5, 8, 3, 9, 8]` using a set
3. Check if `{1, 2}` is a subset of `{1, 2, 3, 4}`
4. Find common subjects between two students

---

*← [07 — Dictionaries](./07_Dictionaries.md) | Next: [09 — Conditional Statements →](./09_Conditional_Statements.md)*
