# 📘 Topic 09: Conditional Statements (if, elif, else)

---

## 🧠 What are Conditional Statements?

Conditional statements let your program **make decisions**.
Think of it like a fork in the road — Python chooses which path to take based on a condition.

---

## ✅ 1. The `if` Statement

Runs a block of code **only if the condition is True**:

```python
num = 10
if num > 0:
    print("Positive Number")
print("Program Ended")

# Output:
# Positive Number
# Program Ended
```

> 📝 **Key Point:** The code **inside the if** (indented) only runs when the condition is True.
> The code **after the if** (not indented) always runs.

---

## 🔀 2. The `if-else` Statement

If the condition is True → run the `if` block.
If the condition is False → run the `else` block.

```python
age = 15
if age >= 18:
    print("Eligible to Vote")
else:
    print("Not Eligible to Vote")

# Output: Not Eligible to Vote
```

### Example — Even or Odd:
```python
num = int(input("Enter a number: "))
if num % 2 == 0:
    print(f"{num} is an even number")
else:
    print(f"{num} is an odd number")
```

---

## 🔀🔀 3. The `if-elif-else` Statement (Multiple Conditions)

When you have **more than 2 options**, use `elif` (else if):

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

> 💡 **How it works:**
> - Python checks each condition **from top to bottom**
> - It runs the **first block** where the condition is True
> - If **none** are True, it runs the `else` block

---

## 🎯 Real-World Examples

### 1. Simple Calculator:
```python
print("1. Addition")
print("2. Subtraction")
print("3. Multiplication")
print("4. Division")
print("5. Modulo")

choice = int(input("Enter your choice: "))
num1 = int(input("Enter First Number: "))
num2 = int(input("Enter Second Number: "))

if choice == 1:
    print(f"Addition: {num1} + {num2} = {num1 + num2}")
elif choice == 2:
    print(f"Subtraction: {num1} - {num2} = {num1 - num2}")
elif choice == 3:
    print(f"Multiplication: {num1} * {num2} = {num1 * num2}")
elif choice == 4:
    print(f"Division: {num1} / {num2} = {num1 / num2}")
elif choice == 5:
    print(f"Modulo: {num1} % {num2} = {num1 % num2}")
else:
    print("Invalid Choice")
```

### 2. Discount Calculator:
```python
amount = int(input("Enter the amount: "))

if amount >= 10000:
    discount = amount * 10 // 100    # 10% discount
elif amount > 5000:
    discount = amount * 5 // 100     # 5% discount
elif amount > 1000:
    discount = amount * 2 // 100     # 2% discount
else:
    discount = 0

print(f"Discount: {discount}, Total Bill: {amount - discount}")
```

### 3. ATM Withdrawal:
```python
balance = 5000
withdrawal = 2000

if withdrawal <= balance:
    balance -= withdrawal
    print("Withdrawal Successful")
    print("Remaining Balance:", balance)
else:
    print("Insufficient Balance")

# Output:
# Withdrawal Successful
# Remaining Balance: 3000
```

### 4. Login System:
```python
username = "admin123"
password = "Python@123"

if username == "admin123" and password == "Python@123":
    print("Login Successful")
else:
    print("Invalid Username or Password")
```

---

## ⚡ Important Concepts

### Indentation Matters!
In Python, **indentation (spaces/tabs)** defines which code belongs to which block:

```python
if True:
    print("This is inside the if")     # ← 4 spaces indent
    print("This too")                   # ← 4 spaces indent
print("This is outside the if")        # ← No indent
```

> ⚠️ **Warning:** Incorrect indentation will cause an `IndentationError`!

### Using `and` / `or` in Conditions:
```python
# Both conditions must be True
if age >= 18 and has_id == True:
    print("Can vote")

# At least one condition must be True
if is_student or is_senior:
    print("Eligible for discount")
```

---

## 📊 Flowchart

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

## 🧪 Quick Practice

1. Write a program to check if a number is positive, negative, or zero
2. Create a grading system: A (90+), B (80+), C (70+), D (60+), Fail (<60)
3. Write a login system that accepts username and password
4. Create a simple calculator using if-elif-else

---

*← [08 — Sets](./08_Sets.md) | Next: [10 — Loops →](./10_Loops.md)*
