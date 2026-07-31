<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Topic 21](https://img.shields.io/badge/Topic_21-Regular_Expressions-37474F?style=for-the-badge)
![Intermediate](https://img.shields.io/badge/Level-Intermediate-FF9800?style=for-the-badge)

</div>

---

## What is a Regular Expression (Regex)?

A **Regular Expression (Regex)** is a sequence of characters used to search, match, and manipulate text patterns in strings.

```python
import re
```

---

## Common Regex Functions

| Function | Description | Example |
|----------|-------------|---------|
| `re.match()` | Matches pattern **only at the beginning** of string | `re.match("I", text)` |
| `re.search()` | Searches for pattern **anywhere** in string | `re.search("Python", text)` |
| `re.findall()` | Returns **all matches as a list** | `re.findall(r'\d+', text)` |
| `re.sub()` | **Replaces** matching text with a substitute | `re.sub(r'\d+', 'X', text)` |
| `re.split()` | **Splits** string by pattern | `re.split(r'\s+', text)` |

---

## Pattern Syntax Cheat Sheet

| Metacharacter | Meaning | Example Match |
|:-------------:|---------|---------------|
| `\d` | Any digit (`0-9`) | `"123"` |
| `\D` | Any non-digit | `"abc"` |
| `\w` | Any word character (`a-z, A-Z, 0-9, _`) | `"Py_3"` |
| `\W` | Any non-word character | `"@#$"` |
| `\s` | Any whitespace (space, tab, newline) | `" "` |
| `+` | 1 or more occurrences | `\d+` matches `"456"` |
| `*` | 0 or more occurrences | `a*` matches `""`, `"a"`, `"aa"` |
| `?` | 0 or 1 occurrence | `colou?r` matches `"color"`, `"colour"` |
| `^` | Start of string | `^Hello` |
| `$` | End of string | `World$` |

---

## Code Examples

### 1. `re.match()` vs `re.search()`

```python
import re

text = "I love Python programming"

# match checks ONLY the start of the string
match_result = re.match("Python", text)
print(match_result)       # Output: None

# search checks ANYWHERE in the string
search_result = re.search("Python", text)
print(search_result.group()) # Output: Python
```

### 2. Extracting Numbers with `re.findall()`

```python
import re

text = "Order 5543 was processed on 2026-07-30 with total 1500"
numbers = re.findall(r'\d+', text)
print(numbers)
# Output: ['5543', '2026', '07', '30', '1500']
```

### 3. Replacing Text with `re.sub()`

```python
import re

text = "Contact us at support@example.com or info@domain.org"
masked = re.sub(r'[\w\.-]+@[\w\.-]+', '[REDACTED]', text)
print(masked)
# Output: Contact us at [REDACTED] or [REDACTED]
```

### 4. Splitting String with `re.split()`

```python
import re

text = "Apple, Banana; Cherry  Orange"
fruits = re.split(r'[,;\s]+', text)
print(fruits)
# Output: ['Apple', 'Banana', 'Cherry', 'Orange']
```

---

## Practice Exercises

1. Write a regex to extract all email addresses from a paragraph.
2. Use `re.sub()` to remove all special characters from `"Hello@World#2026!"`.
3. Check if a given string is a valid phone number (10 digits).

---

<div align="center">

[![Previous](https://img.shields.io/badge/←_Previous-20_Arrays-2196F3?style=for-the-badge)](./20_Python_Arrays.md)
[![Next](https://img.shields.io/badge/Next_→-22_JSON_&_Logging-2196F3?style=for-the-badge)](./22_JSON_and_Logging.md)

</div>
