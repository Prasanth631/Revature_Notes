<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Topic 04](https://img.shields.io/badge/Topic_04-Strings-FF6F00?style=for-the-badge)
![Beginner](https://img.shields.io/badge/Level-Beginner-4CAF50?style=for-the-badge)

</div>

---

## What is a String?

A **string** is a **sequence of characters** (letters, numbers, symbols) enclosed in quotes.

```python
st = "hello python"
print(st)           # Output: hello python
```

> [!IMPORTANT]
> Strings are **immutable** — once created, you cannot change individual characters.

---

## String Case Methods

| Method | What it Does | Example | Result |
|--------|-------------|:-------:|:------:|
| `.upper()` | ALL UPPERCASE | `"hello".upper()` | `"HELLO"` |
| `.lower()` | all lowercase | `"HELLO".lower()` | `"hello"` |
| `.capitalize()` | First letter uppercase | `"hello python".capitalize()` | `"Hello python"` |
| `.title()` | First Letter Each Word | `"hello python".title()` | `"Hello Python"` |
| `.swapcase()` | Swap cases | `"hELLO".swapcase()` | `"Hello"` |

```python
st = "hello python"

print(st.upper())       # HELLO PYTHON
print(st.lower())       # hello python
print(st.capitalize())  # Hello python
print(st.title())       # Hello Python
print(st.swapcase())    # HELLO PYTHON
```

> [!TIP]
> These methods return a **new string** — they don't change the original!

---

## Finding & Searching

| Method | What it Does | If Not Found |
|--------|-------------|:------------:|
| `.find("text")` | Find position of text | `-1` |
| `.index("text")` | Find position of text | **Error!** |
| `.count("char")` | Count occurrences | `0` |
| `.startswith("text")` | Does it start with...? | `False` |
| `.endswith("text")` | Does it end with...? | `False` |

```python
st = "hello python"

print(st.find("python"))       # 6
print(st.index("python"))      # 6
print(st.count('o'))           # 2
print(st.startswith("hello"))  # True
print(st.endswith("python"))   # True
```

> [!WARNING]
> Use `find()` when you're not sure if the text exists. Use `index()` only when you're sure — otherwise it crashes!

---

## Stripping Whitespace

| Method | What it Does |
|--------|-------------|
| `.strip()` | Remove spaces from both sides |
| `.lstrip()` | Remove spaces from left only |
| `.rstrip()` | Remove spaces from right only |

```python
text = " Hello Python "

print(text.rstrip())   # " Hello Python"
print(text.lstrip())   # "Hello Python "
print(text.strip())    # "Hello Python"
```

---

## Replacing Text

```python
st = "hello python"
print(st.replace('python', 'java'))   # hello java
```

---

## Splitting & Joining

### `split()` — Break a string into a list

```python
st = "hello python"
words = st.split()
print(words)                # ['hello', 'python']

print("hello!python".split("!"))   # ['hello', 'python']
```

### `join()` — Combine a list into a string

```python
names = ['ram', 'kumar', 'reddy']
result = '-'.join(names)
print(result)              # ram-kumar-reddy
```

### Combining split() and join()

```python
st = "hello python"
print('-'.join(st.split()))   # hello-python
```

> [!NOTE]
> In nested functions, the **inner function runs first**, then the outer one.

---

## String Checking Methods

| Method | Checks For | Example | Result |
|--------|-----------|:-------:|:------:|
| `.isalpha()` | All alphabets? | `"Python".isalpha()` | `True` |
| `.isdigit()` | All digits? | `"12345".isdigit()` | `True` |
| `.isalnum()` | Alphabets or digits? | `"Python123".isalnum()` | `True` |
| `.isspace()` | Only spaces? | `" ".isspace()` | `True` |

```python
print("Python".isalpha())        # True
print("12345".isdigit())         # True
print("Python123".isalnum())     # True
print("Python@123".isalnum())    # False (@ not allowed)
```

---

## String Length & Useful Functions

```python
st = "Python"

print(len(st))            # 6
print(min(st))            # P (smallest by ASCII)
print(max(st))            # y (largest by ASCII)
print(sorted('python'))   # ['h', 'n', 'o', 'p', 't', 'y']
```

---

## Real-World Examples

### Extract Username from Email
```python
email = "student@gmail.com"
username = email.split("@")[0]
print(username)              # student
```

### Check Palindrome
```python
pal = "mom"
if pal == pal[::-1]:
    print("Palindrome")       # Palindrome
```

### Count Words in a Sentence
```python
sentence = "Python is easy to learn"
print(len(sentence.split()))  # 5
```

### Remove Extra Spaces
```python
text = "Python    is    Easy"
print(" ".join(text.split()))  # Python is Easy
```

---

## Cheat Sheet

```
┌─────────────────────────────────────────────┐
│        STRING METHODS CHEAT SHEET           │
├─────────────────────────────────────────────┤
│ CASE:   upper() lower() capitalize()        │
│         title() swapcase()                  │
│                                             │
│ SEARCH: find() index() count()              │
│         startswith() endswith()              │
│                                             │
│ MODIFY: replace() strip() lstrip() rstrip() │
│         center()                            │
│                                             │
│ SPLIT:  split() join()                      │
│                                             │
│ CHECK:  isalpha() isdigit() isalnum()       │
│         isspace()                           │
│                                             │
│ OTHER:  len() min() max() sorted()          │
└─────────────────────────────────────────────┘
```

---

## Practice Exercises

1. Reverse the string `"Python"` using slicing
2. Count how many vowels are in `"Hello World"`
3. Check if `"racecar"` is a palindrome
4. Extract the domain from `"user@outlook.com"`
5. Convert `"hello WORLD"` to `"Hello World"`

---

<div align="center">

[![Previous](https://img.shields.io/badge/←_Previous-03_Operators-2196F3?style=for-the-badge)](./03_Operators.md)
[![Next](https://img.shields.io/badge/Next_→-05_Lists-2196F3?style=for-the-badge)](./05_Lists.md)

</div>
