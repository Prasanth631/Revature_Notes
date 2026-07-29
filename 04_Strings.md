# 📘 Topic 04: Strings in Python

---

## 🧠 What is a String?

A **string** is a **sequence of characters** (letters, numbers, symbols) enclosed in quotes.

```python
st = "hello python"
print(st)           # Output: hello python
```

> 📝 **Key Point:** Strings are **immutable** — once created, you cannot change individual characters.

---

## 🔠 String Case Methods

These methods change the case (uppercase/lowercase) of your string:

| Method | What it Does | Example | Result |
|--------|-------------|---------|--------|
| `.upper()` | ALL UPPERCASE | `"hello".upper()` | `"HELLO"` |
| `.lower()` | all lowercase | `"HELLO".lower()` | `"hello"` |
| `.capitalize()` | First letter uppercase | `"hello python".capitalize()` | `"Hello python"` |
| `.title()` | First Letter Of Each Word | `"hello python".title()` | `"Hello Python"` |
| `.swapcase()` | Swap cases | `"hello".swapcase()` | `"HELLO"` |

### Examples:
```python
st = "hello python"

print(st.upper())       # Output: HELLO PYTHON
print(st.lower())       # Output: hello python
print(st.capitalize())  # Output: Hello python
print(st.title())       # Output: Hello Python
print(st.swapcase())    # Output: HELLO PYTHON
```

> 💡 **Tip:** These methods return a **new string** — they don't change the original!

---

## 🔍 Finding & Searching in Strings

| Method | What it Does | Returns if Not Found |
|--------|-------------|---------------------|
| `.find("text")` | Find position of text | `-1` |
| `.index("text")` | Find position of text | **Error!** (ValueError) |
| `.count("char")` | Count occurrences | `0` |
| `.startswith("text")` | Does it start with...? | `True` / `False` |
| `.endswith("text")` | Does it end with...? | `True` / `False` |

### Examples:
```python
st = "hello python"

# find() — returns position (index), or -1 if not found
print(st.find("python"))       # Output: 6

# index() — same as find, but gives ERROR if not found
print(st.index("python"))      # Output: 6

# count() — how many times does 'o' appear?
print(st.count('o'))           # Output: 2

# startswith() and endswith()
print(st.startswith("hello"))  # Output: True
print(st.endswith("python"))   # Output: True
```

> ⚠️ **Warning:** Use `find()` when you're not sure if the text exists.
> Use `index()` only when you're sure it exists (otherwise it crashes!).

---

## ✂️ Stripping Whitespace

| Method | What it Does |
|--------|-------------|
| `.strip()` | Remove spaces from both sides |
| `.lstrip()` | Remove spaces from left side only |
| `.rstrip()` | Remove spaces from right side only |

### Examples:
```python
text = " Hello Python "

print(text.rstrip())   # Output: " Hello Python"  (right spaces removed)
print(text.lstrip())   # Output: "Hello Python "   (left spaces removed)
print(text.strip())    # Output: "Hello Python"     (both sides cleaned)
```

---

## 🔄 Replacing Text

```python
st = "hello python"

print(st.replace('python', 'java'))   # Output: hello java
```

---

## ✂️ Splitting & Joining Strings

### `split()` — Break a string into a list of words:
```python
st = "hello python"

words = st.split()          # Split by space (default)
print(words)                # Output: ['hello', 'python']
print(type(words))          # Output: <class 'list'>

# Split by custom separator
print("hello!python".split("!"))   # Output: ['hello', 'python']
```

### `join()` — Combine a list into a string:
```python
names = ['ram', 'kumar', 'reddy']
result = '-'.join(names)
print(result)              # Output: ram-kumar-reddy
```

### Combining split() and join() (Nested Functions):
```python
st = "hello python"
print('-'.join(st.split()))   # Output: hello-python
```

> 💡 **Tip:** In nested functions, the **inner function runs first**, then the outer one.

---

## ✅ String Checking Methods

| Method | What it Checks | Example | Result |
|--------|---------------|---------|--------|
| `.isalpha()` | All alphabets? | `"Python".isalpha()` | `True` |
| `.isdigit()` | All digits? | `"12345".isdigit()` | `True` |
| `.isalnum()` | Alphabets or digits? | `"Python123".isalnum()` | `True` |
| `.isspace()` | Only spaces? | `" ".isspace()` | `True` |

### Examples:
```python
print("Python".isalpha())        # True  (all letters)
print("Python1234".isalpha())    # False (contains numbers)

print("12345".isdigit())         # True  (all digits)
print("12A34".isdigit())         # False (contains a letter)

print("Python123".isalnum())     # True  (letters + digits)
print("Python@123".isalnum())    # False (@ is not allowed)

print(" ".isspace())             # True  (only space)
print("Python ".isspace())       # False (not only space)
```

---

## 📏 String Length & Useful Functions

```python
st = "Python"

print(len(st))            # Output: 6 (number of characters)
print(min(st))            # Output: P (smallest character by ASCII)
print(max(st))            # Output: y (largest character by ASCII)
print(sorted('python'))   # Output: ['h', 'n', 'o', 'p', 't', 'y'] (sorted list)
```

---

## 🔧 Formatting with `center()`

```python
st = "hello python"
print(st.center(40, '*'))
# Output: **************hello python**************
```

---

## 🎯 Real-World Examples

### 1. Extract Username from Email:
```python
email = "student@gmail.com"
username = email.split("@")[0]
print(username)              # Output: student
```

### 2. Validate Gmail Address:
```python
email = "student@gmail.com"
if email.endswith("@gmail.com"):
    print("Valid Gmail Address")
else:
    print("Invalid Email")
# Output: Valid Gmail Address
```

### 3. Clean Up a Username:
```python
username = "     SAI KUMAR       "
print(username.strip().lower())   # Output: sai kumar
```

### 4. Check Password Strength:
```python
password = input("Enter Password: ")
if len(password) >= 8:
    print("Strong Password")
else:
    print("Weak Password")
```

### 5. Count Words in a Sentence:
```python
sentence = "Python is easy to learn"
words = sentence.split()
print(len(words))             # Output: 5
```

### 6. Check Palindrome:
```python
pal = "mom"
if pal == pal[::-1]:
    print("Palindrome")       # Output: Palindrome
else:
    print("Not a Palindrome")
```

### 7. Remove Extra Spaces:
```python
text = "Python    is    Easy"
print(" ".join(text.split()))  # Output: Python is Easy
```

---

## 📋 String Methods Cheat Sheet

```
┌────────────────────────────────────────────────┐
│           STRING METHODS CHEAT SHEET           │
├────────────────────────────────────────────────┤
│  CASE:     upper() lower() capitalize()        │
│            title() swapcase()                  │
│                                                │
│  SEARCH:   find() index() count()              │
│            startswith() endswith()              │
│                                                │
│  MODIFY:   replace() strip() lstrip() rstrip() │
│            center()                            │
│                                                │
│  SPLIT:    split() join()                      │
│                                                │
│  CHECK:    isalpha() isdigit() isalnum()       │
│            isspace()                           │
│                                                │
│  OTHER:    len() min() max() sorted()          │
└────────────────────────────────────────────────┘
```

---

## 🧪 Quick Practice

1. Reverse the string `"Python"` using slicing
2. Count how many vowels are in `"Hello World"`
3. Check if `"racecar"` is a palindrome
4. Extract the domain from `"user@outlook.com"`
5. Convert `"hello WORLD"` to `"Hello World"`

---

*← [03 — Operators](./03_Operators.md) | Next: [05 — Lists →](./05_Lists.md)*
