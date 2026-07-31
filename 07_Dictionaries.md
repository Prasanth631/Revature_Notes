<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Topic 07](https://img.shields.io/badge/Topic_07-Dictionaries-7B1FA2?style=for-the-badge)
![Beginner-Intermediate](https://img.shields.io/badge/Level-Beginner--Intermediate-2196F3?style=for-the-badge)

</div>

---

## What is a Dictionary?

A **dictionary** stores data in **key-value pairs** — like a real dictionary where a word (key) has a meaning (value).

```python
student = {
    "id": 101,
    "name": "Rahul",
    "age": 22,
    "course": "Python",
    "email": "rahul@gmail.com"
}
```

### Key Characteristics

| Feature | Status |
|---------|:------:|
| Mutable (changeable) | ![Yes](https://img.shields.io/badge/-Yes-4CAF50?style=flat-square) |
| Ordered (Python 3.7+) | ![Yes](https://img.shields.io/badge/-Yes-4CAF50?style=flat-square) |
| Duplicate keys | ![No](https://img.shields.io/badge/-No-F44336?style=flat-square) |
| Keys must be immutable | ![Yes](https://img.shields.io/badge/-Yes-4CAF50?style=flat-square) |
| Values can be anything | ![Yes](https://img.shields.io/badge/-Yes-4CAF50?style=flat-square) |

---

## Accessing Values

```python
student = {"id": 101, "name": "Rahul", "age": 22, "course": "Python"}

# Method 1: Square brackets
print(student['name'])     # Rahul

# Method 2: .get() — safer!
print(student.get('id'))   # 101
```

> [!WARNING]
> If the key doesn't exist:
> - `student['phone']` → **KeyError!**
> - `student.get('phone')` → Returns `None` (no error)
>
> Always use `.get()` when you're not sure if the key exists!

---

## Dictionary Methods

| Method | Returns |
|--------|---------|
| `.keys()` | All the keys |
| `.values()` | All the values |
| `.items()` | All key-value pairs as tuples |

```python
student = {"id": 101, "name": "Rahul", "age": 22}

print(student.keys())    # dict_keys(['id', 'name', 'age'])
print(student.values())  # dict_values([101, 'Rahul', 22])
print(student.items())   # dict_items([('id', 101), ...])
```

---

## Looping Through a Dictionary

```python
for key, value in student.items():
    print(key, ':', value)

# id : 101
# name : Rahul
# age : 22
```

---

## Removing Items

```python
student = {"id": 101, "name": "Rahul", "age": 22, "email": "rahul@gmail.com"}

# pop() — removes by key, returns the value
student.pop('email')

# del — deletes by key
del student['age']
```

---

## Nested Dictionaries

```python
students = {
    101: {"name": "Rahul", "marks": 85},
    102: {"name": "Priya", "marks": 92}
}

print(students[101]["name"])    # Rahul
print(students[102]["marks"])   # 92
```

> [!TIP]
> Nested dictionaries are great for structured data like student records, JSON data, or API responses.

---

## Dictionary vs List

| Feature | ![List](https://img.shields.io/badge/List-blue?style=flat-square) | ![Dictionary](https://img.shields.io/badge/Dict-purple?style=flat-square) |
|---------|:---:|:---:|
| Access by | Index (0, 1, 2...) | Key ("name", "age"...) |
| Best for | Sequential data | Labeled data |
| Example | `[90, 85, 78]` | `{"math": 90, "eng": 85}` |

---

## Practice Exercises

1. Create a dictionary with your name, age, city, and favorite language
2. Print only the keys, then only the values
3. Loop through and print each key-value pair
4. Create a nested dictionary with 2 students and print each student's name
5. Remove an item using `.pop()` and `del`

---

<div align="center">

[![Previous](https://img.shields.io/badge/←_Previous-06_Tuples-2196F3?style=for-the-badge)](./06_Tuples.md)
[![Next](https://img.shields.io/badge/Next_→-08_Sets-2196F3?style=for-the-badge)](./08_Sets.md)

</div>
