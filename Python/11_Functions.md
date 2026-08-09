<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Topic 11](https://img.shields.io/badge/Topic_11-Functions-1565C0?style=for-the-badge)
![Intermediate](https://img.shields.io/badge/Level-Intermediate-FF9800?style=for-the-badge)

</div>

---

## What is a Function?

A **function** is a **reusable block of code** that performs a specific task — like a recipe you write once and use whenever needed.

| Benefit | Description |
|---------|-------------|
| ![Reuse](https://img.shields.io/badge/Reusability-4CAF50?style=flat-square) | Write once, use many times |
| ![Clean](https://img.shields.io/badge/Organization-2196F3?style=flat-square) | Keep code clean and structured |
| ![Read](https://img.shields.io/badge/Readability-FF9800?style=flat-square) | Meaningful names for code blocks |

---

## 1. Simple Function

```python
def greet():
    print("Hello, World!!")

greet()   # Call the function
# Output: Hello, World!!
```

> [!NOTE]
> `def` → keyword to define | `greet` → name | `()` → parameters | `:` → start of body | `greet()` → calling/invoking

---

## 2. Functions with Parameters

```python
def greet(name):
    print("Hello", name)

greet("Alice")   # Output: Hello Alice
```

### Multiple Parameters

```python
def greet(greeting, name):
    print(greeting, name)

greet("hi", "ram")   # Output: hi ram
```

---

## 3. Functions with Return Values

```python
def add(a, b):
    return a + b

result = add(1, 2)
print(result)          # 3
print(add(10, 20) / 20)   # 1.5
```

> [!TIP]
> `print()` displays on screen. `return` sends a value back to the caller.

---

## 4. Default Parameters

```python
def greet(name="Guest"):
    print("Welcome", name)

greet()          # Welcome Guest    (uses default)
greet("John")   # Welcome John     (uses provided)
```

---

## 5. Keyword Arguments

Pass arguments **by name** in any order:

```python
def student(name, age):
    print("Name:", name)
    print("Age:", age)

student(age=22, name="Rahul")   # Order doesn't matter!
```

---

## 6. Functions with Conditions

```python
def is_eligible(age):
    if age >= 18:
        return "Eligible to Vote"
    else:
        return "Not Eligible to Vote"

print(is_eligible(10))   # Not Eligible to Vote
print(is_eligible(20))   # Eligible to Vote
```

---

## 7. `*args` — Variable Arguments ![Flexible](https://img.shields.io/badge/Flexible-Input-green?style=flat-square)

When you don't know how many arguments will be passed:

```python
def test(*args):
    for item in args:
        print(item)

test('ram', 'sham', 'sunil')   # 3 arguments
test(10, 20)                    # 2 arguments
```

> [!NOTE]
> `*args` collects all positional arguments into a **tuple**.

---

## 8. `**kwargs` — Variable Keyword Arguments

```python
def my_fun(**kwargs):
    print(kwargs)

my_fun(name="babjee", age=45, city="Chennai")
# Output: {'name': 'babjee', 'age': 45, 'city': 'Chennai'}
```

> [!NOTE]
> `**kwargs` collects all keyword arguments into a **dictionary**.

---

## 9. Returning Multiple Values

```python
def my_func():
    return 10, 20

a, b = my_func()
print(a)   # 10
print(b)   # 20
```

---

## 10. Passing a List

```python
def my_func(lst):
    return sum(lst)

result = my_func([10, 20, 20])
print(result)   # 50
```

---

## Function Types Summary

| Type | Example | Use Case |
|------|---------|----------|
| No params | `def greet(): print("Hi")` | Simple messages |
| With params | `def greet(name)` | Customizable |
| With return | `def add(a,b): return a+b` | Calculations |
| Default params | `def greet(name="Guest")` | Optional args |
| `*args` | `def test(*args)` | Unknown inputs |
| `**kwargs` | `def test(**kwargs)` | Named inputs |

---

## Practice Exercises

1. Write a function that returns the square of a number
2. Write a function with default greeting "Hello, Guest"
3. Write a function using `*args` that returns the sum
4. Write a function that returns both min and max of a list

---

<div align="center">

[![Previous](https://img.shields.io/badge/←_Previous-10_Loops-2196F3?style=for-the-badge)](./10_Loops.md)
[![Next](https://img.shields.io/badge/Next_→-12_Lambda-2196F3?style=for-the-badge)](./12_Lambda_Functions.md)

</div>
