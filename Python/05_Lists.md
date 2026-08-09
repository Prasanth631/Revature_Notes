<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Topic 05](https://img.shields.io/badge/Topic_05-Lists-7B1FA2?style=for-the-badge)
![Beginner-Intermediate](https://img.shields.io/badge/Level-Beginner--Intermediate-2196F3?style=for-the-badge)

</div>

---

## What is a List?

A **list** is an **ordered, changeable (mutable) collection** of items — like a shopping list you can add to, remove from, or rearrange.

```python
fruits = ['Apple', 'Banana', 'Orange']
print(fruits)           # ['Apple', 'Banana', 'Orange']
print(type(fruits))     # <class 'list'>
```

### Key Characteristics

| Feature | Status |
|---------|:------:|
| Ordered | ![Yes](https://img.shields.io/badge/-Yes-4CAF50?style=flat-square) |
| Mutable (changeable) | ![Yes](https://img.shields.io/badge/-Yes-4CAF50?style=flat-square) |
| Allows duplicates | ![Yes](https://img.shields.io/badge/-Yes-4CAF50?style=flat-square) |
| Mixed data types | ![Yes](https://img.shields.io/badge/-Yes-4CAF50?style=flat-square) |

---

## Creating Lists

```python
# Direct creation
fruits = ['Apple', 'Banana', 'Orange']

# Using range
numbers = [*range(1, 10)]           # [1, 2, 3, ..., 9]
even_numbers = [*range(0, 11, 2)]   # [0, 2, 4, 6, 8, 10]

# From a tuple
lst = list((10, 20, 30))            # [10, 20, 30]

# Mixed data types
student = [101, "John", 93.5, True]
```

---

## Accessing Items (Indexing & Slicing)

```python
colors = ['Red', 'Green', 'Blue', 'Yellow']

print(colors[0])    # Red     (first item)
print(colors[1])    # Green   (second item)
print(colors[3])    # Yellow  (last item)

print(colors[:2])   # ['Red', 'Green']
print(colors[2:])   # ['Blue', 'Yellow']
print(colors[::2])  # ['Red', 'Blue']
```

> [!TIP]
> Index starts from `0`, not `1`! The first item is at `[0]`.

---

## Modifying Items

```python
fruits = ['Apple', 'Banana', 'Orange']
fruits[1] = "Mango"
print(fruits)   # ['Apple', 'Mango', 'Orange']
```

---

## Adding Items

| Method | What it Does |
|--------|-------------|
| `.append(item)` | Add ONE item to the **end** |
| `.insert(index, item)` | Add item at a **specific position** |
| `.extend(list)` | Add ALL items from another list |
| `+` operator | Combine two lists into a new one |

```python
numbers = [10, 20, 30]
numbers.append(40)          # [10, 20, 30, 40]
numbers.insert(3, 50)       # [10, 20, 30, 50, 40]

list1 = [1, 2, 3]
list2 = [-1, -2]
list2.extend(list1)         # [-1, -2, 1, 2, 3]

print(list1 + list2)        # [1, 2, 3, -1, -2, 1, 2, 3]
```

> [!NOTE]
> `append()` adds the item as-is. `extend()` unpacks and adds each element individually.

---

## Removing Items

| Method | What it Does |
|--------|-------------|
| `.remove(value)` | Remove the **first occurrence** of a value |
| `.pop()` | Remove and return the **last** item |
| `.pop(index)` | Remove item at a **specific index** |
| `del list[index]` | Delete item at specific index |
| `.clear()` | Remove **all** items |

```python
numbers = [10, 20, 30, 50, 40]

numbers.remove(50)         # [10, 20, 30, 40]
last = numbers.pop()       # returns 40, list becomes [10, 20, 30]

numbers = [10, 20, 30, 50]
del numbers[1]              # [10, 30, 50]

numbers.clear()             # []
```

---

## Sorting & Reversing

```python
numbers = [10, 50, 26, 12, 39, 20, 30]

numbers.sort()                        # [10, 12, 20, 26, 30, 39, 50]
numbers.sort(reverse=True)            # [50, 39, 30, 26, 20, 12, 10]
numbers.reverse()                     # reverses current order

# sorted() — returns NEW list, original unchanged
new_list = sorted(numbers, reverse=True)
```

> [!IMPORTANT]
> `sort()` changes the original list, returns `None`.
> `sorted()` returns a **new** sorted list, original is unchanged.

---

## Other Useful Methods

```python
fruits = ['Apple', 'Banana', 'Orange']

print(len(fruits))              # 3
print("Banana" in fruits)       # True
print("Mango" not in fruits)    # True
print(fruits.count("Apple"))    # 1
print(fruits.index("Orange"))   # 2

numbers = [1, 2, 3, 4, 5]
print(max(numbers))   # 5
print(min(numbers))   # 1
print(sum(numbers))   # 15
```

---

## Nested Lists (2D Lists)

```python
students = [
    ["John", 90, "Python"],
    ["Mary", 85, "SQL"],
    ["David", 95, "Java"]
]

print(students[0][0])   # John
print(students[0][1])   # 90

for name, age, course in students:
    print(f"Name: {name}, Marks: {age}, Course: {course}")
```

---

## List Comprehension ![Shortcut](https://img.shields.io/badge/Shortcut-One--Liner-purple?style=flat-square)

```python
# Regular way
lst = []
for x in range(1, 11):
    if x % 2 == 0:
        lst.append(x)

# List comprehension (same thing, one line!)
lst = [x for x in range(1, 11) if x % 2 == 0]
print(lst)    # [2, 4, 6, 8, 10]

# Squares
squares = [x * x for x in [1, 2, 3, 4, 5]]
print(squares)  # [1, 4, 9, 16, 25]
```

> [!TIP]
> **Formula:** `[expression for item in iterable if condition]`

---

## f-strings (String Interpolation)

```python
name = "Prasanth"
age = 21

# Old way (concatenation)
print("Name is " + name + " Age is " + str(age))

# New way (f-string) — much cleaner!
print(f'Name is {name} Age is {age}')

# f-strings can do math too
print(f'{10} + {20} = {10 + 20}')   # 10 + 20 = 30
```

---

## Remove Duplicates

```python
numbers = [10, 20, 20, 30, 40, 40, 50, 10]

unique = []
for num in numbers:
    if num not in unique:
        unique.append(num)
print(unique)   # [10, 20, 30, 40, 50]
```

---

## Practice Exercises

1. Create a list of 5 fruits, add "Mango" at position 2, remove "Banana"
2. Sort a list of numbers in descending order
3. Use list comprehension to get all odd numbers from 1 to 20
4. Create a nested list of 3 students and print each student's info

---

<div align="center">

[![Previous](https://img.shields.io/badge/←_Previous-04_Strings-2196F3?style=for-the-badge)](./04_Strings.md)
[![Next](https://img.shields.io/badge/Next_→-06_Tuples-2196F3?style=for-the-badge)](./06_Tuples.md)

</div>
