<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Topic 18](https://img.shields.io/badge/Topic_18-Exception_Handling-37474F?style=for-the-badge)
![Advanced](https://img.shields.io/badge/Level-Advanced-F44336?style=for-the-badge)

</div>

---

## What is Exception Handling?

**Exception handling** deals with **runtime errors** so your program can continue or terminate **gracefully** instead of crashing.

| Term | Meaning |
|------|---------|
| **Error** | Serious problem that prevents running (e.g., syntax error) |
| **Exception** | Runtime problem during execution (e.g., dividing by zero) |

---

## Basic Syntax

```python
try:
    # Code that might cause an error
except ExceptionType as e:
    # Handle the error
else:
    # Runs ONLY if no exception occurred
finally:
    # ALWAYS runs (cleanup code)
```

---

## 1. `try-except` — Catch Errors ![Catch](https://img.shields.io/badge/Catch-Errors-blue?style=flat-square)

```python
try:
    num1 = int(input("Enter Number 1: "))
    num2 = int(input("Enter Number 2: "))
    result = num1 / num2
    print(result)
except Exception as e:
    print("Error Occurred:", e)
```

> [!NOTE]
> `Exception` catches **all** types of errors. It's the parent class of all exceptions.

---

## 2. Catching Specific Exceptions

```python
try:
    num1 = int(input("Enter Number 1: "))
    num2 = int(input("Enter Number 2: "))
    result = num1 / num2
    print(result)
except ZeroDivisionError:
    print("Cannot Divide By Zero")
```

---

## 3. Common Exception Types

| Exception | When it Happens | Example |
|-----------|----------------|---------|
| `ZeroDivisionError` | Dividing by zero | `10 / 0` |
| `ValueError` | Wrong value type | `int("hello")` |
| `NameError` | Undefined variable | `print(x)` when x doesn't exist |
| `FileNotFoundError` | File doesn't exist | `open("missing.txt")` |
| `IndexError` | List index out of range | `[1,2,3][10]` |
| `TypeError` | Wrong type operation | `"text" + 5` |
| `StopIteration` | Iterator exhausted | `next()` beyond items |

### Examples

```python
# NameError
try:
    print(name)
except NameError as e:
    print(f"Error: {e}")
# Output: Error: name 'name' is not defined

# FileNotFoundError
try:
    file = open('missing.txt', 'r')
except FileNotFoundError as e:
    print(e)
# Output: [Errno 2] No such file or directory: 'missing.txt'

# IndexError
try:
    lst = [10, 20, 30, 40]
    print(lst[10])
except IndexError as e:
    print(e)
# Output: list index out of range
```

---

## 4. Multiple Except Blocks

```python
try:
    print(10 / 2)
    print(int('a'))
    print(z)
except ZeroDivisionError as e:
    print(e)
except ValueError as e:
    print(e)
except NameError as e:
    print(e)
```

> [!TIP]
> Python catches the **first** matching exception and skips the rest.

---

## 5. `else` Block — No Exception Occurred

```python
try:
    num1 = int(input("Enter Number: "))
    print(num1)
except ValueError as e:
    print(e)
else:
    print("Program Executed Successfully")
```

> [!NOTE]
> The `else` block only executes when **no exception** occurs.

---

## 6. `finally` Block — Always Runs ![Always](https://img.shields.io/badge/Always-Executes-green?style=flat-square)

```python
try:
    print(x)
except Exception as e:
    print(e)
finally:
    print("The End")   # This ALWAYS runs!

# Output:
# name 'x' is not defined
# The End
```

> [!IMPORTANT]
> `finally` is commonly used for **cleanup tasks** like closing files or database connections.

---

## 7. Custom Exceptions ![Custom](https://img.shields.io/badge/Custom-Exception-purple?style=flat-square)

You can create your **own exception** classes:

```python
class InvalidAgeError(Exception):
    pass

try:
    age = int(input("Enter your Age: "))
    if age < 18:
        raise InvalidAgeError("Age Must be 18 or Above.")
    print("You are eligible to vote")
except InvalidAgeError as e:
    print("Error:", e)
```

> [!NOTE]
> `raise` is used to **manually trigger** an exception.

---

## Exception Handling Flow

```
try block
    │
    ├── No Error? ──→ else block ──→ finally block
    │
    └── Error? ──→ except block ──→ finally block
```

---

## Practice Exercises

1. Write a try-except that handles `ZeroDivisionError`
2. Handle `FileNotFoundError` when opening a non-existent file
3. Write a program with multiple except blocks for different errors
4. Create a custom exception `InvalidPasswordError`
5. Use `finally` to print "Program Complete" regardless of errors

---

<div align="center">

[![Previous](https://img.shields.io/badge/←_Previous-17_Collections-2196F3?style=for-the-badge)](./17_Collections_Module.md)
[![Next](https://img.shields.io/badge/Next_→-19_Date_Time-2196F3?style=for-the-badge)](./19_Date_and_Time.md)

</div>
