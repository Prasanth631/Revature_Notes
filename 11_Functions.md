# 📘 Topic 11: Functions in Python

---

## 🧠 What is a Function?

A **function** is a **reusable block of code** that performs a specific task.
Think of it as a **recipe** — you write it once, and use it whenever you need it.

### Why use functions?
- ✅ **Reusability** — Write once, use many times
- ✅ **Organization** — Keep your code clean and structured
- ✅ **Readability** — Give meaningful names to blocks of code

---

## 📝 1. Defining a Simple Function

```python
def greet():
    print("Hello, World!!")

greet()   # Call the function

# Output: Hello, World!!
```

> 📝 **Key Points:**
> - `def` → keyword to **define** a function
> - `greet` → the function **name**
> - `()` → parentheses (can contain parameters)
> - `:` → colon at the end of the line
> - Indented code → the function **body**
> - `greet()` → **calling/invoking** the function

---

## 📥 2. Functions with Parameters (Input)

Parameters let you **pass data** into a function:

```python
def greet(name):
    print("Hello", name)

greet("Alice")   # Output: Hello Alice
```

### Multiple parameters:
```python
def greet(greeting, name):
    print(greeting, name)

greet("hi", "ram")   # Output: hi ram
```

---

## 📤 3. Functions with Return Values (Output)

Use `return` to **send a value back** from the function:

```python
def add(a, b):
    return a + b

result = add(1, 2)
print(result)          # Output: 3

# You can use the result directly:
print(add(10, 20) / 20)   # Output: 1.5
```

> 💡 **Tip:** `print()` displays something on screen. `return` sends a value back to the code.

---

## 🏷️ 4. Default Parameter Values

You can give parameters a **default value**:

```python
def greet(name="Guest"):
    print("Welcome", name)

greet()          # Output: Welcome Guest   (uses default)
greet("John")   # Output: Welcome John    (uses provided value)
```

### Multiple defaults:
```python
def test(name="Ram", age=20):
    print(name, age)

test(age=22)     # Output: Ram 22   (only age is changed)
```

---

## 🏷️ 5. Keyword Arguments

You can pass arguments **by name** (in any order):

```python
def student(name, age):
    print("Name:", name)
    print("Age:", age)

student(age=22, name="Rahul")   # Order doesn't matter!

# Output:
# Name: Rahul
# Age: 22
```

---

## ✅ 6. Functions with Conditions

```python
def is_eligible(age):
    if age >= 18:
        return "Eligible to Vote"
    else:
        return "Not Eligible to Vote"

print(is_eligible(10))   # Output: Not Eligible to Vote
print(is_eligible(20))   # Output: Eligible to Vote
```

---

## 📦 7. `*args` — Variable Number of Arguments

When you don't know how many arguments will be passed:

```python
def test(*args):
    for item in args:
        print(item)

test('ram', 'sham', 'sunil')   # 3 arguments
# Output: ram, sham, sunil

test(10, 20)                    # 2 arguments
# Output: 10, 20
```

> 📝 **Key Point:** `*args` collects all positional arguments into a **tuple**.

---

## 📦 8. `**kwargs` — Variable Keyword Arguments

When you want to pass **named arguments** of unknown count:

```python
def my_fun(**kwargs):
    print(kwargs)

my_fun(name="babjee", age=45, city="Chennai")
# Output: {'name': 'babjee', 'age': 45, 'city': 'Chennai'}
```

> 📝 **Key Point:** `**kwargs` collects all keyword arguments into a **dictionary**.

---

## 📋 9. Returning Multiple Values

A function can return **more than one value** — Python packs them into a tuple:

```python
def my_func():
    return 10, 20

result = my_func()
print(result)       # Output: (10, 20)

# Unpack the values:
a, b = my_func()
print(a)            # 10
print(b)            # 20
```

---

## 📋 10. Returning a List

```python
def my_fun(num):
    return [*range(num)]

lst = my_fun(10)
print(lst)          # [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
print(type(lst))    # <class 'list'>
```

---

## 📋 11. Passing a List to a Function

```python
def my_func(lst):
    return sum(lst)

result = my_func([10, 20, 20])
print(result)       # Output: 50
```

---

## 📊 Function Types Summary

| Type | Example | Use Case |
|------|---------|----------|
| No params, no return | `def greet(): print("Hi")` | Simple messages |
| With params | `def greet(name)` | Customizable behavior |
| With return | `def add(a,b): return a+b` | Calculations |
| Default params | `def greet(name="Guest")` | Optional arguments |
| `*args` | `def test(*args)` | Unknown number of inputs |
| `**kwargs` | `def test(**kwargs)` | Unknown named inputs |

---

## 🧪 Quick Practice

1. Write a function that takes a number and returns its square
2. Write a function with a default greeting that says "Hello, Guest" if no name is given
3. Write a function that takes `*args` and returns the sum of all arguments
4. Write a function that takes a list of numbers and returns the largest one
5. Write a function that returns both the minimum and maximum of a list

---

*← [10 — Loops](./10_Loops.md) | Next: [12 — Lambda Functions →](./12_Lambda_Functions.md)*
