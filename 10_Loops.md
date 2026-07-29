# 📘 Topic 10: Loops in Python (for & while)

---

## 🧠 What are Loops?

Loops let you **repeat a block of code** multiple times.
Instead of writing the same code 10 times, you write it once and loop it!

---

## 🔁 1. The `for` Loop

A `for` loop repeats code **for each item** in a sequence (list, string, range, etc.):

### Basic for loop with `range()`:
```python
for i in range(1, 11):
    print(f"Loop Value: {i}")

# Output:
# Loop Value: 1
# Loop Value: 2
# ... (up to 10)
```

### Understanding `range()`:
| Code | What it Generates |
|------|-------------------|
| `range(5)` | 0, 1, 2, 3, 4 |
| `range(1, 11)` | 1, 2, 3, ..., 10 |
| `range(0, 11, 2)` | 0, 2, 4, 6, 8, 10 (step = 2) |
| `range(10, 0, -1)` | 10, 9, 8, ..., 1 (reverse!) |

### Reverse loop:
```python
for i in range(10, 0, -1):
    print(f"Loop Value: {i}")
# Output: 10, 9, 8, 7, 6, 5, 4, 3, 2, 1
```

---

## 📝 Looping Through Strings

Each character is visited one by one:

```python
for char in "Python Programming":
    print(char)
# Output: P, y, t, h, o, n, (space), P, r, o, g, ...
```

---

## 📋 Looping Through Lists

```python
fruits = ["Apple", "Banana", "Cherry"]
for fruit in fruits:
    print(fruit)

# Output:
# Apple
# Banana
# Cherry
```

### Filter while looping:
```python
fruits = ["Apple", "Banana", "Cherry"]
for fruit in fruits:
    if fruit[0].lower() in ['a', 'b']:
        print(fruit)

# Output:
# Apple
# Banana
```

### Build a new list while looping:
```python
fruits = ["Apple", "Banana", "Cherry"]
uppercase_fruits = []
for fruit in fruits:
    uppercase_fruits.append(fruit.upper())
print(uppercase_fruits)   # ['APPLE', 'BANANA', 'CHERRY']
```

---

## 🔄 Even and Odd Numbers:

```python
for i in range(0, 12):
    if i % 2 == 0:
        print(f"{i} is an Even Number")
    else:
        print(f"{i} is an Odd Number")
```

---

## 🔁 2. The `while` Loop

A `while` loop keeps running **as long as the condition is True**:

```python
i = 1
while i <= 5:
    print(i)
    i += 1      # Don't forget this! Otherwise infinite loop!

# Output: 1, 2, 3, 4, 5
```

> ⚠️ **Warning:** Always make sure the condition will eventually become False!
> Otherwise, you'll have an **infinite loop** (the program never stops).

---

## 🛑 3. `break` — Stop the Loop Early

`break` **exits the loop immediately** when a condition is met:

```python
for i in range(1, 6):
    if i == 4:
        break          # Stop! Don't continue
    print(i)

# Output: 1, 2, 3   (4 and 5 are NOT printed)
```

---

## ⏭️ 4. `continue` — Skip to the Next Iteration

`continue` **skips the current iteration** and moves to the next one:

```python
for i in range(0, 11):
    if i % 2 == 0:
        continue       # Skip even numbers
    print(i)

# Output: 1, 3, 5, 7, 9   (even numbers are skipped)
```

### Remove spaces from a string:
```python
for char in "Python is a Programming Language":
    if char == " ":
        continue       # Skip spaces
    print(char, end='')

# Output: PythonisaProgrammingLanguage
```

> 💡 **Tip:** `end=''` in `print()` prevents it from going to a new line.

---

## 🔲 5. Nested Loops (Loop Inside a Loop)

```python
for i in range(5):
    print(f"Outer Loop: {i}")
    for j in range(5):
        print(f"\tInner Loop: {j}")
```

> 📝 **Key Point:** For each iteration of the **outer loop**, the **inner loop runs completely**.

### Multiplication Tables (1 to 10):
```python
for i in range(1, 11):
    print(f"Table {i}")
    for j in range(1, 11):
        print(f"\t{i} * {j} = {i * j}")
    print()    # Blank line between tables
```

---

## ✅ 6. `for-else` — Loop Completed Successfully

The `else` block runs **only if the loop finished normally** (without `break`):

```python
for i in range(3):
    print(i)
else:
    print("Loop Completed")

# Output:
# 0
# 1
# 2
# Loop Completed
```

---

## ⭐ 7. Star Patterns (Great Practice!)

### Right Triangle (increasing):
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

### Inverted Triangle (decreasing):
```
*****
****
***
**
*
```
```python
for i in range(5, 0, -1):
    for j in range(i):
        print("*", end='')
    print()
```

---

## 📊 for vs while — When to Use What?

| Feature | `for` Loop | `while` Loop |
|---------|-----------|-------------|
| Use when | You know how many times to loop | You don't know how many times |
| Common with | Lists, ranges, strings | User input, conditions |
| Risk | None | Infinite loop if not careful |
| Example | `for i in range(10)` | `while user_input != "quit"` |

---

## 🧪 Quick Practice

1. Print numbers from 1 to 20 using a for loop
2. Print only odd numbers from 1 to 50 using `continue`
3. Find the first number divisible by 7 between 1 and 100 using `break`
4. Print a multiplication table for any number using nested loops
5. Create a right triangle pattern with 10 rows

---

*← [09 — Conditional Statements](./09_Conditional_Statements.md) | Next: [11 — Functions →](./11_Functions.md)*
