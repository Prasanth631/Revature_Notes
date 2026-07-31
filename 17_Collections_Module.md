<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Topic 17](https://img.shields.io/badge/Topic_17-Collections_Module-37474F?style=for-the-badge)
![Advanced](https://img.shields.io/badge/Level-Advanced-F44336?style=for-the-badge)

</div>

---

## What is the Collections Module?

The `collections` module provides **specialized container data types** that extend Python's built-in `list`, `tuple`, `dict`, and `set`.

```python
from collections import Counter, defaultdict, namedtuple, deque, OrderedDict
```

---

## 1. `Counter` — Count Element Frequencies ![Count](https://img.shields.io/badge/Counter-Frequency-blue?style=flat-square)

```python
from collections import Counter

lst = ['Apple', 'Mango', 'Apple', 'Mango', 'Orange']
print(Counter(lst))
# Counter({'Apple': 2, 'Mango': 2, 'Orange': 1})
```

### Count Characters in a String
```python
print(Counter("Python Programming"))
# Counter({'P': 2, 'o': 2, 'n': 2, 'r': 2, 'g': 2, 'm': 2, ...})
```

### Find Most Common Items
```python
marks = [80, 90, 80, 70, 80, 90, 50, 30, 20]
c = Counter(marks)
print(c.most_common(3))   # [(80, 3), (90, 2), (70, 1)]
```

> [!TIP]
> `most_common(n)` returns the `n` most frequently occurring elements.

---

## 2. `defaultdict` — Dictionary with Default Values ![Safe](https://img.shields.io/badge/No-KeyError-green?style=flat-square)

A dictionary that **automatically provides default values** for missing keys — no more `KeyError`!

```python
from collections import defaultdict

student = defaultdict(int)
student["Python"] += 1
print(student)   # defaultdict(<class 'int'>, {'Python': 1})
```

### Count Course Enrollments
```python
from collections import defaultdict

courses = ["Python", "SQL", "Python", "Java", "SQL", "Python"]
count = defaultdict(int)

for course in courses:
    count[course] += 1

print(count)
# defaultdict(<class 'int'>, {'Python': 3, 'SQL': 2, 'Java': 1})
```

> [!NOTE]
> With a regular `dict`, accessing a missing key throws `KeyError`. `defaultdict` returns a default value (`0` for `int`, `[]` for `list`).

---

## 3. `namedtuple` — Tuple with Named Fields ![Readable](https://img.shields.io/badge/More-Readable-purple?style=flat-square)

Creates a tuple where fields have **names** for better readability:

```python
from collections import namedtuple

Student = namedtuple("Student", ["id", "name", "marks"])
s1 = Student(101, "Rahul", 95)

print(s1)         # Student(id=101, name='Rahul', marks=95)
print(s1.name)    # Rahul
print(s1.marks)   # 95
```

> [!TIP]
> Instead of accessing `student[0]`, `student[1]`, you can use `student.name`, `student.marks` — much more readable!

---

## 4. `deque` — Double-Ended Queue ![Fast](https://img.shields.io/badge/Fast-Both_Ends-orange?style=flat-square)

A list-like container with fast **append and pop from both ends**:

```python
from collections import deque

dq = deque([10, 20, 30])

dq.append(40)       # Add to right  → [10, 20, 30, 40]
dq.appendleft(5)    # Add to left   → [5, 10, 20, 30, 40]
dq.pop()            # Remove right  → 40, deque = [5, 10, 20, 30]
dq.popleft()        # Remove left   → 5,  deque = [10, 20, 30]
```

---

## 5. `OrderedDict` — Order-Preserving Dictionary

```python
from collections import OrderedDict

d = OrderedDict()
d["A"] = 10
d["B"] = 20
d["C"] = 30

for k, v in d.items():
    print(k, v)
# A 10
# B 20
# C 30
```

> [!NOTE]
> In Python 3.7+, regular `dict` already maintains insertion order. `OrderedDict` is mainly useful for older Python versions or when order-equality matters.

---

## Collections Summary

| Class | Purpose | Key Benefit |
|-------|---------|-------------|
| `Counter` | Count frequencies | `most_common()` |
| `defaultdict` | Auto-default values | No `KeyError` |
| `namedtuple` | Named tuple fields | Readable access |
| `deque` | Double-ended queue | Fast both ends |
| `OrderedDict` | Ordered dictionary | Guaranteed order |

---

## Practice Exercises

1. Count the frequency of each word in `["python", "sql", "python", "java", "sql"]`
2. Use `defaultdict(list)` to group students by course
3. Create a `namedtuple` for Employee with id, name, salary
4. Use `deque` to implement a simple queue (FIFO)

---

<div align="center">

[![Previous](https://img.shields.io/badge/←_Previous-16_Map_Filter-2196F3?style=for-the-badge)](./16_Map_Filter_Reduce.md)
[![Next](https://img.shields.io/badge/Next_→-18_Exceptions-2196F3?style=for-the-badge)](./18_Exception_Handling.md)

</div>
