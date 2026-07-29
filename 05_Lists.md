# 📘 Topic 05: Lists in Python

---

## 🧠 What is a List?

A **list** is an **ordered, changeable (mutable) collection** of items.
Think of it as a **shopping list** — you can add, remove, or change items.

```python
fruits = ['Apple', 'Banana', 'Orange']
print(fruits)           # Output: ['Apple', 'Banana', 'Orange']
print(type(fruits))     # Output: <class 'list'>
```

### Key Characteristics:
- ✅ **Ordered** — items stay in the order you added them
- ✅ **Mutable** — you can add, remove, or change items
- ✅ **Allows duplicates** — `[1, 1, 2, 2]` is valid
- ✅ **Mixed types** — `[101, "John", 93.5, True]` is valid

---

## 📝 Creating Lists

```python
# Method 1: Direct creation
fruits = ['Apple', 'Banana', 'Orange']

# Method 2: Using range (creates a sequence of numbers)
numbers = [*range(1, 10)]           # [1, 2, 3, 4, 5, 6, 7, 8, 9]
even_numbers = [*range(0, 11, 2)]   # [0, 2, 4, 6, 8, 10]

# Method 3: From a tuple
lst = list((10, 20, 30))            # [10, 20, 30]

# Method 4: Mixed data types
student = [101, "John", 93.5, True]
```

---

## 🔢 Accessing List Items (Indexing & Slicing)

```python
colors = ['Red', 'Green', 'Blue', 'Yellow']

# Indexing (starts from 0!)
print(colors[0])    # Red     (first item)
print(colors[1])    # Green   (second item)
print(colors[3])    # Yellow  (last item)

# Slicing
print(colors[:2])   # ['Red', 'Green']       (first 2 items)
print(colors[2:])   # ['Blue', 'Yellow']     (from index 2 to end)
print(colors[::2])  # ['Red', 'Blue']        (every 2nd item)
```

> 💡 **Tip:** Index starts from `0`, not `1`! So the first item is at `[0]`.

---

## ✏️ Modifying List Items

```python
fruits = ['Apple', 'Banana', 'Orange']
fruits[1] = "Mango"              # Change 'Banana' to 'Mango'
print(fruits)                     # ['Apple', 'Mango', 'Orange']
```

---

## ➕ Adding Items to a List

| Method | What it Does |
|--------|-------------|
| `.append(item)` | Add ONE item to the **end** |
| `.insert(index, item)` | Add item at a **specific position** |
| `.extend(list)` | Add ALL items from another list |
| `+` operator | Combine two lists into a new one |

### Examples:
```python
# append — adds to the end
numbers = [10, 20, 30]
numbers.append(40)
print(numbers)           # [10, 20, 30, 40]

# insert — adds at a specific position
numbers.insert(3, 50)    # Insert 50 at index 3
print(numbers)           # [10, 20, 30, 50, 40]

# extend — adds all items from another list
list1 = [1, 2, 3]
list2 = [-1, -2]
list2.extend(list1)
print(list2)             # [-1, -2, 1, 2, 3]

# + operator — creates a NEW combined list
print(list1 + list2)     # [1, 2, 3, -1, -2, 1, 2, 3]
```

> 💡 **Tip:** `append()` adds the item as-is. `extend()` unpacks and adds each element.

---

## ➖ Removing Items from a List

| Method | What it Does |
|--------|-------------|
| `.remove(value)` | Remove the **first occurrence** of a value |
| `.pop()` | Remove and return the **last** item |
| `.pop(index)` | Remove and return item at a **specific index** |
| `del list[index]` | Delete item at a specific index |
| `.clear()` | Remove **all** items (empty the list) |

### Examples:
```python
numbers = [10, 20, 30, 50, 40]

# remove — removes first occurrence of value
numbers.remove(50)
print(numbers)           # [10, 20, 30, 40]

# pop — removes and returns last item
last = numbers.pop()
print(last)              # 40
print(numbers)           # [10, 20, 30]

# pop with index — removes at specific position
fruits = ['Apple', 'Banana', 'Orange']
removed = fruits.pop(1)  # Removes 'Banana'
print(removed)           # Banana

# del — delete by index
numbers = [10, 20, 30, 50]
del numbers[1]
print(numbers)           # [10, 30, 50]

# clear — empty the entire list
numbers.clear()
print(numbers)           # []
```

---

## 🔄 Sorting & Reversing

```python
numbers = [10, 50, 26, 12, 39, 20, 30]

# sort() — sorts IN PLACE (changes the original list)
numbers.sort()
print(numbers)           # [10, 12, 20, 26, 30, 39, 50]

# Sort in descending order
numbers.sort(reverse=True)
print(numbers)           # [50, 39, 30, 26, 20, 12, 10]

# reverse() — reverses the list IN PLACE
numbers.reverse()
print(numbers)           # [10, 12, 20, 26, 30, 39, 50]

# sorted() — returns a NEW sorted list (doesn't change original)
numbers = [50, 39, 30, 26, 20, 12, 10]
new_list = sorted(numbers, reverse=True)
print(new_list)          # [50, 39, 30, 26, 20, 12, 10]
```

> 📝 **Key Point:**
> - `sort()` → changes the original list, returns `None`
> - `sorted()` → returns a **new** sorted list, original is unchanged

---

## 📋 Other Useful Methods

```python
fruits = ['Apple', 'Banana', 'Orange']

# len() — number of items
print(len(fruits))           # 3

# Membership operators (in / not in)
print("Banana" in fruits)    # True
print("Mango" not in fruits) # True

# count() — count occurrences
marks = [55, 60, 70, 80, 25, 12, 89]
print(marks.count(55))      # 1

# index() — find position of an item
print(fruits.index("Orange"))  # 2

# max, min, sum
numbers = [1, 2, 3, 4, 5]
print(max(numbers))   # 5
print(min(numbers))   # 1
print(sum(marks))     # 391

# copy() — create a copy
list1 = [1, 2, 3]
list2 = list1.copy()
print(list2)          # [1, 2, 3]
```

---

## 🔲 Nested Lists (2D Lists)

A list **inside a list** — like a table with rows and columns:

```python
students = [
    ["John", 90, "Python"],
    ["Mary", 85, "SQL"],
    ["David", 95, "Java"]
]

# Access specific items
print(students[0][0])   # John   (row 0, column 0)
print(students[0][1])   # 90     (row 0, column 1)

# Loop through nested list
for name, age, course in students:
    print(f"Name: {name}, Age: {age}, Course: {course}")
# Output:
# Name: John, Age: 90, Course: Python
# Name: Mary, Age: 85, Course: SQL
# Name: David, Age: 95, Course: Java
```

### Flatten a Nested List:
```python
flatten = []
for row in students:
    for item in row:
        flatten.append(item)
print(flatten)
# Output: ['John', 90, 'Mary', 85, 'David', 95]
```

---

## ⚡ List Comprehension (Shortcut to Create Lists)

Instead of writing a full loop, use **list comprehension** for a one-liner:

```python
# Regular way:
lst = []
for x in range(1, 11):
    if x % 2 == 0:
        lst.append(x)

# List comprehension (same thing in one line!):
lst = [x for x in range(1, 11) if x % 2 == 0]
print(lst)    # [2, 4, 6, 8, 10]

# Squares of numbers:
numbers = [1, 2, 3, 4, 5]
squares = [x * x for x in numbers]
print(squares)  # [1, 4, 9, 16, 25]
```

> 💡 **Formula:** `[expression for item in iterable if condition]`

---

## 📝 List Unpacking

```python
lst = ["Ram", 30, "Chennai"]
name, age, city = lst
print(name, age, city)   # Ram 30 Chennai
```

---

## 📝 String Interpolation (f-strings)

```python
name = "Prasanth"
age = 21
city = "Chennai"

# Old way (concatenation):
print("Name is " + name + " Age is " + str(age) + " City is " + city)

# New way (f-string) — much cleaner!
print(f'Name is {name} Age is {age} City is {city}')

# f-strings can do math too!
num1 = 10
num2 = 20
print(f'{num1} + {num2} = {num1 + num2}')   # 10 + 20 = 30
```

---

## 🔥 Remove Duplicates from a List

```python
numbers = [10, 20, 20, 30, 40, 40, 50, 10]

# Method 1: Using a loop
unique = []
for num in numbers:
    if num not in unique:
        unique.append(num)
print(unique)   # [10, 20, 30, 40, 50]

# Method 2: Using list comprehension
unique = []
[unique.append(x) for x in numbers if x not in unique]
print(unique)   # [10, 20, 30, 40, 50]
```

---

## 🧪 Quick Practice

1. Create a list of 5 fruits, add "Mango" at position 2, and remove "Banana"
2. Sort a list of numbers in descending order
3. Use list comprehension to get all odd numbers from 1 to 20
4. Create a nested list of 3 students with name, marks, and subject — then print each student's info

---

*← [04 — Strings](./04_Strings.md) | Next: [06 — Tuples →](./06_Tuples.md)*
