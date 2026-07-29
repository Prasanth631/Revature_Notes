# 📘 Topic 06: Tuples in Python

---

## 🧠 What is a Tuple?

A **tuple** is an **ordered, immutable (unchangeable) collection** of items.
Think of it as a **sealed box** — once you put items in, you **can't add, remove, or change** them.

```python
fruits = ('Apple', 'Banana', 'Orange')
print(fruits)          # Output: ('Apple', 'Banana', 'Orange')
print(type(fruits))    # Output: <class 'tuple'>
```

---

## 📋 Tuple vs List — What's the Difference?

| Feature | List `[]` | Tuple `()` |
|---------|-----------|------------|
| Brackets | Square `[1, 2]` | Round `(1, 2)` |
| Mutable? | ✅ Yes (can change) | ❌ No (cannot change) |
| Speed | Slower | Faster |
| Use Case | Data that changes | Data that stays the same |

> 💡 **When to use Tuples?** Use tuples for data that should **NOT be modified**,
> like days of the week, coordinates, or database records.

---

## 📝 Creating Tuples

```python
# Simple tuple
fruits = ('Apple', 'Banana', 'Orange')

# Tuple with mixed data types
student = (101, "Ram", 93.5, True)
print(student)         # (101, 'Ram', 93.5, True)
print(type(student))   # <class 'tuple'>
```

---

## 🔢 Accessing Tuple Items (Indexing & Slicing)

```python
fruits = ('Apple', 'Banana', 'Orange')

# Indexing
print(fruits[0])      # Apple
print(fruits[1])      # Banana
print(fruits[2])      # Orange

# Slicing
print(fruits[0:2])    # ('Apple', 'Banana')
```

---

## 🚫 Tuples are Immutable — You CANNOT Change Them!

```python
fruits = ('Apple', 'Banana', 'Orange')

fruits[0] = "Mango"   # ❌ ERROR!
# TypeError: 'tuple' object does not support item assignment
```

> ⚠️ **This is the most important thing about tuples!**
> If you try to change a tuple item, Python will give an error.

---

## 📋 Tuple Methods (Only 2!)

Since tuples are immutable, they have very few methods:

| Method | What it Does | Example |
|--------|-------------|---------|
| `.count(value)` | Count how many times a value appears | `(10,20,20,30).count(20)` → `2` |
| `.index(value)` | Find the position of a value | `(10,20,20,30).index(30)` → `3` |

### Examples:
```python
numbers = (10, 20, 20, 30)

print(numbers.count(20))   # Output: 2  (20 appears twice)
print(numbers.index(30))   # Output: 3  (30 is at index 3)
```

---

## 📦 Tuple Unpacking

Just like lists, you can **unpack** tuple values into variables:

```python
employee = (101, "Rahul", "IT")
emp_id, name, department = employee

print(emp_id)      # 101
print(name)        # Rahul
print(department)  # IT
```

---

## 🤝 `zip()` — Combine Multiple Lists into Tuples

The `zip()` function pairs up items from multiple lists:

```python
names = ['Ram', 'Sham', 'Preethi']
marks = [500, 600, 700]

combined = list(zip(names, marks))
print(combined)
# Output: [('Ram', 500), ('Sham', 600), ('Preethi', 700)]
```

> 💡 **Tip:** `zip()` creates tuples by pairing items at the same index.
> It stops when the shortest list runs out.

---

## 📊 When to Use Tuples?

| Use Tuples For | Why? |
|----------------|------|
| Coordinates `(x, y)` | They shouldn't change |
| Database records | Read-only data |
| Dictionary keys | Tuples can be dict keys (lists can't!) |
| Function return values | Return multiple values |
| Config values | Settings that shouldn't be modified |

---

## 🧪 Quick Practice

1. Create a tuple with 4 colors and access the 3rd color
2. Try to change an item — what error do you get?
3. Count how many times `"Python"` appears in `("Python", "Java", "Python", "SQL")`
4. Use `zip()` to combine a list of names and ages into tuples

---

*← [05 — Lists](./05_Lists.md) | Next: [07 — Dictionaries →](./07_Dictionaries.md)*
