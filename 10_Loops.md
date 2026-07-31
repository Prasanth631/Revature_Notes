<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Topic 10](https://img.shields.io/badge/Topic_10-Loops-00897B?style=for-the-badge)
![Beginner-Intermediate](https://img.shields.io/badge/Level-Beginner--Intermediate-2196F3?style=for-the-badge)

</div>

---

## What are Loops?

Loops let you **repeat a block of code** multiple times. Instead of writing the same code 10 times, write it once and loop it.

---

## 1. The `for` Loop

Repeats code **for each item** in a sequence:

```python
for i in range(1, 11):
    print(f"Loop Value: {i}")
# Prints 1 through 10
```

### Understanding `range()`

| Code | Generates |
|------|-----------|
| `range(5)` | 0, 1, 2, 3, 4 |
| `range(1, 11)` | 1, 2, 3, ..., 10 |
| `range(0, 11, 2)` | 0, 2, 4, 6, 8, 10 |
| `range(10, 0, -1)` | 10, 9, 8, ..., 1 |

---

## Looping Through Collections

```python
# Through a string
for char in "Python":
    print(char)    # P, y, t, h, o, n

# Through a list
fruits = ["Apple", "Banana", "Cherry"]
for fruit in fruits:
    print(fruit)
```

---

## 2. The `while` Loop

Keeps running **as long as the condition is True**:

```python
i = 1
while i <= 5:
    print(i)
    i += 1      # Don't forget this!
# Output: 1, 2, 3, 4, 5
```

> [!CAUTION]
> Always make sure the condition will eventually become `False`! Otherwise you get an **infinite loop**.

---

## 3. `break` — Stop Early ![Control](https://img.shields.io/badge/Control-Flow-teal?style=flat-square)

```python
for i in range(1, 6):
    if i == 4:
        break          # Stop immediately
    print(i)
# Output: 1, 2, 3
```

---

## 4. `continue` — Skip Current Iteration

```python
for i in range(0, 11):
    if i % 2 == 0:
        continue       # Skip even numbers
    print(i)
# Output: 1, 3, 5, 7, 9
```

### Remove spaces from a string

```python
for char in "Python is a Language":
    if char == " ":
        continue
    print(char, end='')
# Output: PythonisaLanguage
```

> [!TIP]
> `end=''` in `print()` prevents going to a new line.

---

## 5. Nested Loops

```python
for i in range(1, 11):
    print(f"Table {i}")
    for j in range(1, 11):
        print(f"\t{i} * {j} = {i * j}")
    print()
```

> [!NOTE]
> For each iteration of the **outer loop**, the **inner loop runs completely**.

---

## 6. `for-else`

The `else` block runs **only if the loop finished normally** (without `break`):

```python
for i in range(3):
    print(i)
else:
    print("Loop Completed")
```

---

## Star Patterns

### Right Triangle
```
*
**
***
****
*****
```
```python
for i in range(1, 6):
    for j in range(i):
        print("*", end='')
    print()
```

### Inverted Triangle
```python
for i in range(5, 0, -1):
    for j in range(i):
        print("*", end='')
    print()
```

---

## `for` vs `while`

| Feature | ![for](https://img.shields.io/badge/for-Loop-blue?style=flat-square) | ![while](https://img.shields.io/badge/while-Loop-orange?style=flat-square) |
|---------|:---:|:---:|
| Use when | You know how many times | You don't know how many times |
| Common with | Lists, ranges, strings | User input, conditions |
| Infinite loop risk | None | Yes, if not careful |

---

## Practice Exercises

1. Print numbers from 1 to 20 using a for loop
2. Print only odd numbers from 1 to 50 using `continue`
3. Find the first number divisible by 7 between 1 and 100 using `break`
4. Print a multiplication table using nested loops
5. Create a right triangle pattern with 10 rows

---

<div align="center">

[![Previous](https://img.shields.io/badge/←_Previous-09_Conditionals-2196F3?style=for-the-badge)](./09_Conditional_Statements.md)
[![Next](https://img.shields.io/badge/Next_→-11_Functions-2196F3?style=for-the-badge)](./11_Functions.md)

</div>
