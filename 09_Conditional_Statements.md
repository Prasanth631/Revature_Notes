<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Topic 09](https://img.shields.io/badge/Topic_09-Conditional_Statements-00897B?style=for-the-badge)
![Beginner-Intermediate](https://img.shields.io/badge/Level-Beginner--Intermediate-2196F3?style=for-the-badge)

</div>

---

## What are Conditional Statements?

Conditional statements let your program **make decisions** — like a fork in the road where Python chooses which path to take based on a condition.

---

## 1. The `if` Statement

Runs code **only if the condition is True**:

```python
num = 10
if num > 0:
    print("Positive Number")
print("Program Ended")

# Output:
# Positive Number
# Program Ended
```

> [!NOTE]
> The code **inside the if** (indented) only runs when the condition is True. Code **after the if** (not indented) always runs.

---

## 2. The `if-else` Statement

```python
age = 15
if age >= 18:
    print("Eligible to Vote")
else:
    print("Not Eligible to Vote")

# Output: Not Eligible to Vote
```

### Even or Odd

```python
num = int(input("Enter a number: "))
if num % 2 == 0:
    print(f"{num} is an even number")
else:
    print(f"{num} is an odd number")
```

---

## 3. The `if-elif-else` Statement

When you have **more than 2 options**:

```python
marks = int(input("Enter Your Marks: "))

if marks >= 90:
    print("Grade A+")
elif marks >= 80:
    print("Grade A")
elif marks >= 70:
    print("Grade B")
elif marks >= 60:
    print("Grade C")
else:
    print("Fail")
```

> [!TIP]
> Python checks each condition **from top to bottom**, runs the **first block** where the condition is True, then skips the rest.

---

## Real-World Examples

### Simple Calculator

```python
choice = int(input("Enter choice (1-5): "))
num1 = int(input("First Number: "))
num2 = int(input("Second Number: "))

if choice == 1:
    print(f"Addition: {num1 + num2}")
elif choice == 2:
    print(f"Subtraction: {num1 - num2}")
elif choice == 3:
    print(f"Multiplication: {num1 * num2}")
elif choice == 4:
    print(f"Division: {num1 / num2}")
elif choice == 5:
    print(f"Modulo: {num1 % num2}")
else:
    print("Invalid Choice")
```

### ATM Withdrawal

```python
balance = 5000
withdrawal = 2000

if withdrawal <= balance:
    balance -= withdrawal
    print("Withdrawal Successful")
    print("Remaining Balance:", balance)
else:
    print("Insufficient Balance")
```

### Login System

```python
username = "admin123"
password = "Python@123"

if username == "admin123" and password == "Python@123":
    print("Login Successful")
else:
    print("Invalid Username or Password")
```

---

## Important Concepts

### Indentation Matters

```python
if True:
    print("Inside the if")     # ← 4 spaces indent
    print("This too")          # ← 4 spaces indent
print("Outside the if")       # ← No indent
```

> [!CAUTION]
> Incorrect indentation causes an `IndentationError`!

### Using `and` / `or`

```python
if age >= 18 and has_id == True:
    print("Can vote")

if is_student or is_senior:
    print("Eligible for discount")
```

---

## Flowchart

```
         ┌──────────┐
         │ Condition │
         └─────┬─────┘
               │
        ┌──────┴──────┐
        │             │
     True?          False?
        │             │
   ┌────┴────┐   ┌────┴────┐
   │ if block│   │else block│
   └─────────┘   └─────────┘
```

---

## Practice Exercises

1. Check if a number is positive, negative, or zero
2. Create a grading system: A (90+), B (80+), C (70+), D (60+), Fail (<60)
3. Write a login system with username and password
4. Build a simple calculator using if-elif-else

---

<div align="center">

[![Previous](https://img.shields.io/badge/←_Previous-08_Sets-2196F3?style=for-the-badge)](./08_Sets.md)
[![Next](https://img.shields.io/badge/Next_→-10_Loops-2196F3?style=for-the-badge)](./10_Loops.md)

</div>
