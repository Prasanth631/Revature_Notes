# 📘 Topic 07: Dictionaries in Python

---

## 🧠 What is a Dictionary?

A **dictionary** stores data in **key-value pairs** — like a real dictionary where a **word (key)** has a **meaning (value)**.

```python
student = {
    "id": 101,
    "name": "Rahul",
    "age": 22,
    "course": "Python",
    "email": "rahul@gmail.com"
}
print(student)
```

### Key Characteristics:
- ✅ **Mutable** — you can add, remove, and change items
- ✅ **Ordered** — maintains insertion order (Python 3.7+)
- ✅ **Keys must be unique** — no duplicate keys allowed
- ✅ **Keys must be immutable** — strings, numbers, tuples can be keys
- ✅ **Values can be anything** — strings, numbers, lists, even other dictionaries!

---

## 🔑 Accessing Dictionary Values

There are two ways to get a value:

```python
student = {
    "id": 101,
    "name": "Rahul",
    "age": 22,
    "course": "Python"
}

# Method 1: Using square brackets
print(student['name'])     # Output: Rahul
print(student['age'])      # Output: 22

# Method 2: Using .get() — safer!
print(student.get('id'))   # Output: 101
```

> ⚠️ **Warning:** If the key doesn't exist:
> - `student['phone']` → **Error!** (KeyError)
> - `student.get('phone')` → Returns `None` (no error)

> 💡 **Tip:** Always use `.get()` when you're not sure if the key exists!

---

## 📋 Dictionary Methods

| Method | What it Returns |
|--------|----------------|
| `.keys()` | All the keys |
| `.values()` | All the values |
| `.items()` | All key-value pairs as tuples |

### Examples:
```python
student = {"id": 101, "name": "Rahul", "age": 22, "course": "Python", "email": "rahul@gmail.com"}

print(student.keys())
# Output: dict_keys(['id', 'name', 'age', 'course', 'email'])

print(student.values())
# Output: dict_values([101, 'Rahul', 22, 'Python', 'rahul@gmail.com'])

print(student.items())
# Output: dict_items([('id', 101), ('name', 'Rahul'), ('age', 22), ...])
```

---

## 🔄 Looping Through a Dictionary

```python
for key, value in student.items():
    print(key, ':', value)

# Output:
# id : 101
# name : Rahul
# age : 22
# course : Python
# email : rahul@gmail.com
```

---

## ➖ Removing Items

```python
student = {"id": 101, "name": "Rahul", "age": 22, "course": "Python", "email": "rahul@gmail.com"}

# pop() — removes by key and returns the value
student.pop('email')
print(student)   # {'id': 101, 'name': 'Rahul', 'age': 22, 'course': 'Python'}

# del — deletes by key
del student['age']
print(student)   # {'id': 101, 'name': 'Rahul', 'course': 'Python'}
```

---

## 📦 Nested Dictionaries (Dictionary Inside a Dictionary)

```python
students = {
    101: {
        "name": "Rahul",
        "marks": 85
    },
    102: {
        "name": "Priya",
        "marks": 92
    }
}

# Access nested values
print(students[101]["name"])    # Output: Rahul
print(students[102]["marks"])   # Output: 92
```

> 💡 **Tip:** Nested dictionaries are great for representing structured data like
> student records, employee details, or JSON data from APIs.

---

## 📊 Dictionary vs List — When to Use What?

| Feature | List | Dictionary |
|---------|------|------------|
| Access by | Index (0, 1, 2...) | Key ("name", "age"...) |
| Ordered? | Yes | Yes (Python 3.7+) |
| Best for | Sequential data | Labeled data |
| Example | `[90, 85, 78]` | `{"math": 90, "english": 85}` |

---

## 🧪 Quick Practice

1. Create a dictionary with your name, age, city, and favorite language
2. Print only the keys, then only the values
3. Loop through and print each key-value pair
4. Create a nested dictionary with 2 students and print each student's name
5. Remove an item using `.pop()` and `del`

---

*← [06 — Tuples](./06_Tuples.md) | Next: [08 — Sets →](./08_Sets.md)*
