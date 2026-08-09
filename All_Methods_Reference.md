<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![NumPy](https://img.shields.io/badge/NumPy-013243?style=for-the-badge&logo=numpy&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)
![Methods](https://img.shields.io/badge/Complete-Methods_Reference-C62828?style=for-the-badge)

# All Methods & Functions Reference

**Every method covered across Class, day1, day2, day3, day4, NumPy & Pandas — with usage examples**

![Source](https://img.shields.io/badge/Source-7_Notebooks-blue?style=flat-square)
![Methods](https://img.shields.io/badge/Methods-200+-blue?style=flat-square)

</div>

---

## Table of Contents

| # | Category | Jump |
|:-:|----------|:----:|
| 1 | [Built-in Functions](#1-built-in-functions) | ↓ |
| 2 | [String Methods](#2-string-methods) | ↓ |
| 3 | [List Methods](#3-list-methods) | ↓ |
| 4 | [Tuple Methods](#4-tuple-methods) | ↓ |
| 5 | [Dictionary Methods](#5-dictionary-methods) | ↓ |
| 6 | [Set Methods](#6-set-methods) | ↓ |
| 7 | [File Handling Methods](#7-file-handling-methods) | ↓ |
| 8 | [Math Module](#8-math-module) | ↓ |
| 9 | [OS Module](#9-os-module) | ↓ |
| 10 | [Functional Programming](#10-functional-programming-map-filter-lambda) | ↓ |
| 11 | [Array Module](#11-array-module) | ↓ |
| 12 | [Regular Expressions (re)](#12-regular-expressions-re-module) | ↓ |
| 13 | [JSON Module](#13-json-module) | ↓ |
| 14 | [DateTime Module](#14-datetime-module) | ↓ |
| 15 | [Collections Module](#15-collections-module) | ↓ |
| 16 | [Iterators](#16-iterators) | ↓ |
| 17 | [Logging Module](#17-logging-module) | ↓ |
| 18 | [OOP — Classes & Objects](#18-oop--classes--objects) | ↓ |
| 19 | [NumPy](#19-numpy) | ↓ |
| 20 | [Pandas](#20-pandas) | ↓ |

---

## 1. Built-in Functions

> [!NOTE]
> Source: `day1`, `day2`, `day3`

| Method | Purpose | Example | Output |
|--------|---------|---------|--------|
| `print()` | Display output | `print("Hello")` | `Hello` |
| `type()` | Check data type | `type(10)` | `<class 'int'>` |
| `len()` | Length of object | `len("Python")` | `6` |
| `int()` | Convert to integer | `int("10")` | `10` |
| `float()` | Convert to float | `float(10)` | `10.0` |
| `str()` | Convert to string | `str(25)` | `"25"` |
| `bool()` | Convert to boolean | `bool(0)` | `False` |
| `input()` | Read user input | `name = input("Name: ")` | *(waits for input)* |
| `abs()` | Absolute value | `abs(-10)` | `10` |
| `round()` | Round number | `round(10.67, 1)` | `10.7` |
| `pow()` | Power / exponent | `pow(10, 2)` | `100` |
| `max()` | Maximum value | `max([10, 20, 1])` | `20` |
| `min()` | Minimum value | `min([10, 20, 1])` | `1` |
| `sum()` | Sum of all values | `sum([10, 20, 1])` | `31` |
| `sorted()` | Return new sorted list | `sorted([5, 2, 8])` | `[2, 5, 8]` |
| `enumerate()` | Index + Value in loop | `list(enumerate(["a","b"]))` | `[(0,'a'), (1,'b')]` |
| `zip()` | Pair up iterables | `list(zip([1,2], ["a","b"]))` | `[(1,'a'), (2,'b')]` |
| `range()` | Generate number sequence | `list(range(1, 6))` | `[1, 2, 3, 4, 5]` |
| `chr()` | ASCII code → character | `chr(65)` | `'A'` |
| `ord()` | Character → ASCII code | `ord('A')` | `65` |
| `bin()` | Decimal → binary | `bin(10)` | `'0b1010'` |
| `oct()` | Decimal → octal | `oct(10)` | `'0o12'` |
| `hex()` | Decimal → hexadecimal | `hex(10)` | `'0xa'` |
| `id()` | Memory address | `id(10)` | `140730916...` |
| `isinstance()` | Type check | `isinstance("hi", str)` | `True` |
| `all()` | All items truthy? | `all([True, True, False])` | `False` |
| `any()` | Any item truthy? | `any([False, True, False])` | `True` |
| `iter()` | Create iterator | `it = iter([1, 2, 3])` | *iterator object* |
| `next()` | Get next from iterator | `next(it)` | `1` |
| `open()` | Open a file | `f = open("file.txt", "r")` | *file object* |
| `dir()` | List all attributes | `dir(str)` | `['capitalize', ...]` |
| `help()` | Get documentation | `help(len)` | *(help text)* |

---

## 2. String Methods

> [!NOTE]
> Source: `day2`, `Strings.ipynb`

| Method | Purpose | Example | Output |
|--------|---------|---------|--------|
| `.upper()` | ALL UPPERCASE | `"hello".upper()` | `"HELLO"` |
| `.lower()` | all lowercase | `"HELLO".lower()` | `"hello"` |
| `.capitalize()` | First letter uppercase | `"hello python".capitalize()` | `"Hello python"` |
| `.title()` | First Letter Each Word | `"hello python".title()` | `"Hello Python"` |
| `.swapcase()` | Swap upper/lower | `"hELLO".swapcase()` | `"Hello"` |
| `.strip()` | Remove spaces both sides | `" hi ".strip()` | `"hi"` |
| `.lstrip()` | Remove left spaces | `" hi ".lstrip()` | `"hi "` |
| `.rstrip()` | Remove right spaces | `" hi ".rstrip()` | `" hi"` |
| `.find()` | Find position (returns -1) | `"hello".find("ll")` | `2` |
| `.index()` | Find position (raises error) | `"hello".index("ll")` | `2` |
| `.count()` | Count occurrences | `"hello".count('l')` | `2` |
| `.startswith()` | Starts with...? | `"hello".startswith("he")` | `True` |
| `.endswith()` | Ends with...? | `"hello".endswith("lo")` | `True` |
| `.replace()` | Replace text | `"hello".replace("l", "r")` | `"herro"` |
| `.split()` | Split into list | `"a-b-c".split("-")` | `['a','b','c']` |
| `.join()` | Join list into string | `"-".join(["a","b","c"])` | `"a-b-c"` |
| `.center()` | Center with padding | `"hi".center(10, '*')` | `"****hi****"` |
| `.zfill()` | Zero-fill left | `"42".zfill(5)` | `"00042"` |
| `.isalpha()` | All alphabets? | `"Python".isalpha()` | `True` |
| `.isdigit()` | All digits? | `"12345".isdigit()` | `True` |
| `.isalnum()` | Alphanumeric? | `"Py123".isalnum()` | `True` |
| `.isspace()` | All whitespace? | `"  ".isspace()` | `True` |

---

## 3. List Methods

> [!NOTE]
> Source: `day2`, `Lists.ipynb`

| Method | Purpose | Example | Output |
|--------|---------|---------|--------|
| `.append(x)` | Add to end | `[1,2].append(3)` | `[1, 2, 3]` |
| `.insert(i, x)` | Insert at index | `[1,3].insert(1, 2)` | `[1, 2, 3]` |
| `.extend(lst)` | Add all from another list | `[1].extend([2,3])` | `[1, 2, 3]` |
| `.remove(x)` | Remove first occurrence | `[1,2,3].remove(2)` | `[1, 3]` |
| `.pop()` | Remove & return last | `[1,2,3].pop()` | returns `3` |
| `.pop(i)` | Remove & return at index | `[1,2,3].pop(0)` | returns `1` |
| `.clear()` | Remove all items | `[1,2,3].clear()` | `[]` |
| `.sort()` | Sort in-place | `[3,1,2].sort()` | `[1, 2, 3]` |
| `.sort(reverse=True)` | Sort descending | `[3,1,2].sort(reverse=True)` | `[3, 2, 1]` |
| `.reverse()` | Reverse in-place | `[1,2,3].reverse()` | `[3, 2, 1]` |
| `.copy()` | Shallow copy | `lst2 = lst.copy()` | new list |
| `.index(x)` | Find position | `[10,20,30].index(20)` | `1` |
| `.count(x)` | Count occurrences | `[1,1,2].count(1)` | `2` |

---

## 4. Tuple Methods

> [!NOTE]
> Source: `day2`, `Tuple.ipynb`

| Method | Purpose | Example | Output |
|--------|---------|---------|--------|
| `.count(x)` | Count occurrences | `(10,20,20,30).count(20)` | `2` |
| `.index(x)` | Find position | `(10,20,30).index(30)` | `2` |

> [!IMPORTANT]
> Tuples only have **2 methods** because they are immutable!

---

## 5. Dictionary Methods

> [!NOTE]
> Source: `day2`, `Dictionaries.ipynb`

| Method | Purpose | Example | Output |
|--------|---------|---------|--------|
| `.keys()` | All keys | `{"a":1}.keys()` | `dict_keys(['a'])` |
| `.values()` | All values | `{"a":1}.values()` | `dict_values([1])` |
| `.items()` | All key-value pairs | `{"a":1}.items()` | `dict_items([('a',1)])` |
| `.get(key)` | Get value (safe) | `{"a":1}.get("b")` | `None` |
| `.pop(key)` | Remove & return value | `d.pop("a")` | value of `"a"` |
| `.update(d2)` | Merge another dict | `d.update({"b": 2})` | adds `"b":2` |

---

## 6. Set Methods

> [!NOTE]
> Source: `day2`, `Set.ipynb`

| Method | Purpose | Example | Output |
|--------|---------|---------|--------|
| `.add(x)` | Add one item | `{1,2}.add(3)` | `{1, 2, 3}` |
| `.remove(x)` | Remove (error if missing) | `{1,2,3}.remove(2)` | `{1, 3}` |
| `.discard(x)` | Remove (no error) | `{1,2}.discard(5)` | `{1, 2}` |
| `.pop()` | Remove random item | `{1,2,3}.pop()` | *random* |
| `.clear()` | Remove all | `{1,2,3}.clear()` | `set()` |
| `.update(s2)` | Union in-place | `{1}.update({2,3})` | `{1, 2, 3}` |
| `.union(s2)` or `\|` | All items from both | `{1,2} \| {3}` | `{1, 2, 3}` |
| `.intersection(s2)` or `&` | Common items | `{1,2,3} & {2,3,4}` | `{2, 3}` |
| `.difference(s2)` or `-` | Items in A not B | `{1,2,3} - {2,3}` | `{1}` |
| `.symmetric_difference(s2)` or `^` | Items in A or B, not both | `{1,2,3} ^ {2,3,4}` | `{1, 4}` |
| `.difference_update(s2)` | Remove items found in s2 | `a.difference_update(b)` | in-place |
| `.issubset(s2)` | All of A in B? | `{1,2}.issubset({1,2,3})` | `True` |
| `.issuperset(s2)` | A contains all of B? | `{1,2,3}.issuperset({1,2})` | `True` |

---

## 7. File Handling Methods

> [!NOTE]
> Source: `day3`

| Method | Purpose | Example |
|--------|---------|---------|
| `open(path, mode)` | Open file | `f = open("data.txt", "r")` |
| `.read()` | Read entire file | `content = f.read()` |
| `.readline()` | Read one line | `line = f.readline()` |
| `.readlines()` | Read all lines → list | `lines = f.readlines()` |
| `.write(text)` | Write text to file | `f.write("hello\n")` |
| `.close()` | Close the file | `f.close()` |
| `with open(...) as f:` | Auto-close file | `with open("f.txt") as f:` |

**File Modes:**

| Mode | Description |
|:----:|-------------|
| `"r"` | Read (default) |
| `"w"` | Write (overwrites!) |
| `"a"` | Append (adds to end) |

---

## 8. Math Module

> [!NOTE]
> Source: `day3`

```python
import math
```

| Method | Purpose | Example | Output |
|--------|---------|---------|--------|
| `math.sqrt(x)` | Square root | `math.sqrt(9)` | `3.0` |
| `math.pow(x, y)` | Power (float) | `math.pow(10, 2)` | `100.0` |
| `math.ceil(x)` | Round UP | `math.ceil(16.2)` | `17` |
| `math.floor(x)` | Round DOWN | `math.floor(16.2)` | `16` |
| `math.factorial(n)` | n! | `math.factorial(5)` | `120` |
| `math.pi` | Value of π | `math.pi` | `3.14159...` |
| `math.log(x)` | Natural log (ln) | `math.log(2)` | `0.693...` |
| `math.log2(x)` | Log base 2 | `math.log2(8)` | `3.0` |
| `math.log10(x)` | Log base 10 | `math.log10(100)` | `2.0` |
| `math.exp(x)` | e^x | `math.exp(2)` | `7.389...` |
| `math.fabs(x)` | Absolute (float) | `math.fabs(-1)` | `1.0` |
| `math.fmod(x, y)` | Float modulo | `math.fmod(10, 3)` | `1.0` |
| `math.trunc(x)` | Remove decimal | `math.trunc(10.9)` | `10` |

---

## 9. OS Module

> [!NOTE]
> Source: `day3`

```python
import os
```

| Method | Purpose | Example |
|--------|---------|---------|
| `os.getcwd()` | Current working directory | `os.getcwd()` |
| `os.chdir(path)` | Change directory | `os.chdir("C:\\data")` |
| `os.listdir()` | List files/folders | `os.listdir()` |
| `os.mkdir(name)` | Create single folder | `os.mkdir("notes")` |
| `os.makedirs(path)` | Create nested folders | `os.makedirs("a/b/c")` |
| `os.rmdir(name)` | Remove empty folder | `os.rmdir("notes")` |
| `os.removedirs(path)` | Remove nested empty folders | `os.removedirs("a/b/c")` |
| `os.remove(file)` | Delete a file | `os.remove("temp.txt")` |
| `os.rename(old, new)` | Rename file/folder | `os.rename("a.txt", "b.txt")` |
| `os.path.exists(name)` | Does it exist? | `os.path.exists("data.txt")` |
| `os.path.isfile(name)` | Is it a file? | `os.path.isfile("data.txt")` |
| `os.path.isdir(name)` | Is it a directory? | `os.path.isdir("data")` |
| `os.environ.get(key)` | Get environment variable | `os.environ.get("USERNAME")` |

---

## 10. Functional Programming (map, filter, lambda)

> [!NOTE]
> Source: `day3`

| Concept | Syntax | Example | Output |
|---------|--------|---------|--------|
| `lambda` | `lambda args: expr` | `square = lambda x: x*x; square(5)` | `25` |
| `map()` | `map(func, iterable)` | `list(map(lambda x: x*2, [1,2,3]))` | `[2, 4, 6]` |
| `filter()` | `filter(func, iterable)` | `list(filter(lambda x: x>2, [1,2,3,4]))` | `[3, 4]` |

**Multi-iterable map:**
```python
l1, l2 = [10, 20, 30], [1, 2, 3]
result = list(map(lambda a, b: a + b, l1, l2))
# Output: [11, 22, 33]
```

---

## 11. Array Module

> [!NOTE]
> Source: `day4`

```python
from array import array
numbers = array('i', [10, 20, 30, 40])
```

| Method | Purpose | Example | Output |
|--------|---------|---------|--------|
| `.append(x)` | Add to end | `numbers.append(50)` | adds `50` |
| `.insert(i, x)` | Insert at index | `numbers.insert(1, 15)` | inserts `15` at 1 |
| `.remove(x)` | Remove first occurrence | `numbers.remove(20)` | removes `20` |
| `.pop(i)` | Remove & return at index | `numbers.pop(3)` | returns element |
| `.index(x)` | Find position | `numbers.index(30)` | `2` |
| `.count(x)` | Count occurrences | `numbers.count(10)` | `1` |
| `.reverse()` | Reverse in-place | `numbers.reverse()` | reversed |
| `.extend(arr2)` | Extend with another array | `a.extend(b)` | merged |
| `len()` | Length | `len(numbers)` | `4` |

**Type Codes:** `'i'` int · `'f'` float · `'d'` double · `'b'` signed char

---

## 12. Regular Expressions (`re` module)

> [!NOTE]
> Source: `day4`

```python
import re
```

| Method | Purpose | Example | Output |
|--------|---------|---------|--------|
| `re.match(pat, text)` | Match at **start** only | `re.match("I", "I love Python")` | `<Match>` |
| `re.search(pat, text)` | Search **anywhere** | `re.search("Python", "I love Python")` | `<Match>` |
| `re.findall(pat, text)` | **All** matches as list | `re.findall(r'\d+', "a1b2c3")` | `['1','2','3']` |
| `re.sub(pat, repl, text)` | **Replace** matches | `re.sub(r'\d', 'X', "a1b2")` | `"aXbX"` |
| `re.split(pat, text)` | **Split** by pattern | `re.split(r'\s+', "a b  c")` | `['a','b','c']` |
| `.group()` | Get matched text | `re.search("Py", "Python").group()` | `"Py"` |
| `.span()` | Get start/end positions | `re.search("Py", "Python").span()` | `(0, 2)` |

**Common Patterns:** `\d` digit · `\w` word char · `\s` space · `+` 1+ · `*` 0+ · `?` 0 or 1

---

## 13. JSON Module

> [!NOTE]
> Source: `day4`

```python
import json
```

| Method | Direction | Example |
|--------|-----------|---------|
| `json.dumps(obj)` | Python dict → JSON **string** | `json.dumps({"a": 1}, indent=4)` |
| `json.loads(s)` | JSON string → Python **dict** | `json.loads('{"a": 1}')` |
| `json.dump(obj, file)` | Python dict → JSON **file** | `json.dump(data, open("f.json","w"))` |
| `json.load(file)` | JSON file → Python **dict** | `json.load(open("f.json","r"))` |

> [!TIP]
> **Memory trick:** `s` at end = **s**tring. No `s` = **f**ile.
> `dumps` / `loads` → string. `dump` / `load` → file.

---

## 14. DateTime Module

> [!NOTE]
> Source: `day4`

```python
from datetime import datetime, date, timedelta
```

| Method / Attribute | Purpose | Example | Output |
|--------------------|---------|---------|--------|
| `datetime.now()` | Current date & time | `datetime.now()` | `2026-07-30 11:12:20` |
| `datetime.today()` | Same as now() | `datetime.today()` | `2026-07-30 11:12:27` |
| `.year` | Extract year | `datetime.now().year` | `2026` |
| `.month` | Extract month | `datetime.now().month` | `7` |
| `.day` | Extract day | `datetime.now().day` | `30` |
| `.hour` | Extract hour | `datetime.now().hour` | `11` |
| `.minute` | Extract minute | `datetime.now().minute` | `13` |
| `.second` | Extract second | `datetime.now().second` | `34` |
| `.weekday()` | Day of week (0=Mon) | `datetime.now().weekday()` | `3` |
| `.time()` | Time portion only | `datetime.now().time()` | `11:13:34` |
| `.ctime()` | Human-readable format | `datetime.now().ctime()` | `"Thu Jul 30..."` |
| `.strftime(fmt)` | Format date → string | `dt.strftime("%d/%m/%Y")` | `"30/07/2026"` |
| `datetime.strptime(s, fmt)` | Parse string → date | `datetime.strptime("29-07-2026", "%d-%m-%Y")` | datetime obj |
| `timedelta(days=n)` | Add/subtract time | `datetime.now() + timedelta(days=10)` | 10 days later |

**Format Codes:** `%d` day · `%m` month · `%Y` year4 · `%y` year2 · `%H` 24hr · `%I` 12hr · `%M` min · `%S` sec · `%A` weekday · `%B` month name

---

## 15. Collections Module

> [!NOTE]
> Source: `day4`, `Collections.ipynb`

```python
from collections import Counter, defaultdict, namedtuple, deque, OrderedDict, ChainMap
```

| Class / Method | Purpose | Example | Output |
|----------------|---------|---------|--------|
| `Counter(iter)` | Count frequencies | `Counter("aabbc")` | `{'a':2, 'b':2, 'c':1}` |
| `.most_common(n)` | Top n frequent | `Counter("aabbc").most_common(1)` | `[('a', 2)]` |
| `defaultdict(type)` | Dict with default value | `d = defaultdict(int); d["x"] += 1` | `{'x': 1}` |
| `namedtuple(name, fields)` | Tuple with named fields | `Point = namedtuple("Point", ["x","y"])` | `Point(x=1, y=2)` |
| `deque(list)` | Double-ended queue | `dq = deque([1,2,3])` | `deque([1,2,3])` |
| `dq.append(x)` | Add right | `dq.append(4)` | `deque([1,2,3,4])` |
| `dq.appendleft(x)` | Add left | `dq.appendleft(0)` | `deque([0,1,2,3])` |
| `dq.pop()` | Remove right | `dq.pop()` | `3` |
| `dq.popleft()` | Remove left | `dq.popleft()` | `1` |
| `OrderedDict()` | Order-preserving dict | `d = OrderedDict()` | ordered |
| `ChainMap(d1, d2)` | Combine dicts | `ChainMap({"a":1}, {"b":2})` | combined view |

---

## 16. Iterators

> [!NOTE]
> Source: `day4`

| Function | Purpose | Example | Output |
|----------|---------|---------|--------|
| `iter(iterable)` | Create an iterator | `it = iter([10, 20, 30])` | iterator |
| `next(iterator)` | Get next element | `next(it)` | `10` |
| `StopIteration` | Exception when exhausted | *auto-raised when no more items* | — |

```python
it = iter("Python")
print(next(it))   # P
print(next(it))   # y
print(next(it))   # t
```

---

## 17. Logging Module

> [!NOTE]
> Source: `day4`

```python
import logging
```

| Method / Config | Purpose | Example |
|-----------------|---------|---------|
| `logging.basicConfig()` | Configure logging | `logging.basicConfig(level=logging.DEBUG, filename='app.log')` |
| `logging.debug(msg)` | Log DEBUG level | `logging.debug("Debug message")` |
| `logging.info(msg)` | Log INFO level | `logging.info("App started")` |
| `logging.warning(msg)` | Log WARNING level | `logging.warning("Low memory")` |
| `logging.error(msg)` | Log ERROR level | `logging.error("DB failed")` |
| `logging.critical(msg)` | Log CRITICAL level | `logging.critical("System crash!")` |
| `logging.getLogger(name)` | Get named logger | `logger = logging.getLogger("myapp")` |
| `logger.setLevel(level)` | Set minimum level | `logger.setLevel(logging.INFO)` |

**Levels (low → high):** `DEBUG(10)` → `INFO(20)` → `WARNING(30)` → `ERROR(40)` → `CRITICAL(50)`

---

## 18. OOP — Classes & Objects

> [!NOTE]
> Source: `Class.ipynb`

### Creating a Class

```python
class Car:
    brand = "Toyota"               # Class variable (shared by all)

    def __init__(self, model, color):  # Constructor
        self.model = model         # Instance variable
        self.color = color

    def show_details(self):        # Instance method
        print(f"Brand: {self.brand}, Model: {self.model}, Color: {self.color}")

c1 = Car("Fortuner", "Red")
c1.show_details()
# Output: Brand: Toyota, Model: Fortuner, Color: Red
```

### Variable Types

| Type | Syntax | Scope |
|------|--------|-------|
| Class variable | `brand = "Toyota"` | Shared by all objects |
| Instance variable | `self.model = model` | Unique per object |
| Local variable | `color = "Red"` inside method | Only inside that method |

### Access Modifiers (Encapsulation)

| Access | Syntax | Can Access From |
|--------|--------|-----------------|
| **Public** | `self.color` | Anywhere |
| **Protected** | `self._engine` | Class + subclasses (convention) |
| **Private** | `self.__price` | Only inside class |

```python
class Car:
    def __init__(self):
        self.__price = 10000        # Private

    def get_price(self):            # Getter
        return self.__price

    def set_price(self, value):     # Setter
        self.__price = value

car = Car()
car.set_price(20000)
print(car.get_price())              # 20000
print(car._Car__price)              # 20000 (name mangling bypass)
```

### Inheritance

```python
class Car:
    def __init__(self, brand, color):
        self.brand = brand
        self.color = color
    def start(self):
        print(f"{self.brand} started.")

class BMW(Car):                     # BMW inherits from Car
    def __init__(self, brand, model):
        super().__init__(brand, "Black")  # Call parent constructor
        self.model = model

bmw = BMW("BMW", "X5")
bmw.start()                         # BMW started.
```

### Method Overriding (Polymorphism)

```python
class Car:
    def start(self):
        print("Car started with key.")

class Tesla(Car):
    def start(self):                # Overrides parent method
        print("Tesla started silently.")

t = Tesla()
t.start()                           # Tesla started silently.
```

### Inheritance Types

| Type | Description | Diagram |
|------|-------------|---------|
| Single | One parent → one child | `Car → BMW` |
| Multilevel | Chain | `Vehicle → Car → BMW` |
| Multiple | Two parents → one child | `Engine, GPS → SmartCar` |
| Hierarchical | One parent → many children | `Car → BMW, Audi, Tesla` |

---

## 19. NumPy

> [!NOTE]
> Source: `Numpy.ipynb`

```python
import numpy as np
```

### Array Creation

| Method | Purpose | Example | Output |
|--------|---------|---------|--------|
| `np.array(list)` | Create array from list | `np.array([1, 2, 3])` | `array([1, 2, 3])` |
| `np.arange(start, stop, step)` | Range array | `np.arange(0, 10, 2)` | `[0, 2, 4, 6, 8]` |
| `np.zeros(shape)` | All zeros | `np.zeros((2, 3))` | 2x3 zero matrix |
| `np.ones(shape)` | All ones | `np.ones((3, 3))` | 3x3 ones matrix |
| `np.full(shape, val)` | Filled with value | `np.full((2, 2), 7)` | `[[7,7],[7,7]]` |
| `np.eye(n)` | Identity matrix | `np.eye(3)` | 3x3 identity |
| `np.linspace(a, b, n)` | n evenly spaced | `np.linspace(0, 1, 5)` | `[0, .25, .5, .75, 1]` |
| `np.random.rand(shape)` | Random 0-1 | `np.random.rand(3)` | `[0.3, 0.8, 0.1]` |
| `np.random.randint(lo, hi, n)` | Random integers | `np.random.randint(1, 10, 5)` | `[3, 7, 1, 9, 2]` |
| `np.random.randn(n)` | Standard normal dist | `np.random.randn(5)` | *5 random floats* |

### Array Attributes

| Attribute | Purpose | Example |
|-----------|---------|---------|
| `.ndim` | Number of dimensions | `arr.ndim` → `2` |
| `.shape` | Shape tuple | `arr.shape` → `(3, 3)` |
| `.dtype` | Data type | `arr.dtype` → `int64` |
| `.size` | Total elements | `arr.size` → `9` |

### Reshaping & Stacking

| Method | Purpose | Example |
|--------|---------|---------|
| `.reshape(rows, cols)` | Reshape | `np.arange(6).reshape(2, 3)` |
| `.flatten()` | 2D → 1D | `matrix.flatten()` |
| `np.vstack((a, b))` | Vertical stack | `np.vstack(([1,2], [3,4]))` |
| `np.hstack((a, b))` | Horizontal stack | `np.hstack(([1,2], [3,4]))` |
| `np.split(arr, n)` | Split into n parts | `np.split(arr, 3)` |

### Math & Statistics

| Method | Purpose | Example | Output |
|--------|---------|---------|--------|
| `np.add(a, b)` | Element-wise add | `np.add([1,2], [3,4])` | `[4, 6]` |
| `np.sqrt(arr)` | Square root | `np.sqrt([4, 9])` | `[2, 3]` |
| `np.abs(arr)` | Absolute values | `np.abs([-1, -2])` | `[1, 2]` |
| `np.log(arr)` | Natural log | `np.log([1, 2.718])` | `[0, 1]` |
| `arr.sum()` | Sum | `np.array([1,2,3]).sum()` | `6` |
| `arr.mean()` | Mean | `np.array([1,2,3]).mean()` | `2.0` |
| `arr.std()` | Standard deviation | `np.array([1,2,3]).std()` | `0.816...` |
| `arr.min()` / `arr.max()` | Min / Max | `np.array([1,2,3]).max()` | `3` |
| `np.argmin(arr)` | Index of min | `np.argmin([30, 10, 20])` | `1` |
| `np.argmax(arr)` | Index of max | `np.argmax([30, 10, 20])` | `0` |
| `np.sort(arr)` | Sorted copy | `np.sort([3, 1, 2])` | `[1, 2, 3]` |
| `np.where(cond, x, y)` | Conditional replace | `np.where([T,F,T], "Y", "N")` | `['Y','N','Y']` |

### NaN Handling

| Method | Purpose | Example |
|--------|---------|---------|
| `np.isnan(arr)` | Check for NaN | `np.isnan([1, np.nan])` → `[F, T]` |
| `np.nanmean(arr)` | Mean ignoring NaN | `np.nanmean([1, np.nan, 3])` → `2.0` |
| `np.nansum(arr)` | Sum ignoring NaN | `np.nansum([1, np.nan, 3])` → `4.0` |
| `np.nanmin(arr)` | Min ignoring NaN | `np.nanmin([5, np.nan, 1])` → `1.0` |
| `np.nanmax(arr)` | Max ignoring NaN | `np.nanmax([5, np.nan, 1])` → `5.0` |
| `np.nanstd(arr)` | Std ignoring NaN | `np.nanstd([1, np.nan, 3])` → `1.0` |

### Boolean Operations

| Method | Purpose | Example |
|--------|---------|---------|
| `np.all(cond)` | All True? | `np.all([True, True])` → `True` |
| `np.any(cond)` | Any True? | `np.any([False, True])` → `True` |
| `np.isin(arr, vals)` | Element in list? | `np.isin([1,2,3], [2,3])` → `[F,T,T]` |

---

## 20. Pandas

> [!NOTE]
> Source: `Pandas.ipynb`

```python
import pandas as pd
import numpy as np
```

### Creating Data

| Method | Purpose | Example |
|--------|---------|---------|
| `pd.Series(data, index)` | Create a Series | `pd.Series([10,20,30], ['A','B','C'])` |
| `pd.DataFrame(data)` | Create DataFrame from dict | `pd.DataFrame({"name": ["A","B"], "age": [25,30]})` |
| `pd.date_range(start, periods)` | Date sequence | `pd.date_range("2026-01-01", periods=5)` |

### Reading & Writing Data

| Method | Purpose | Example |
|--------|---------|---------|
| `pd.read_csv(path)` | Read CSV file | `df = pd.read_csv("data.csv")` |
| `pd.read_excel(path)` | Read Excel file | `df = pd.read_excel("data.xlsx")` |
| `pd.read_json(path)` | Read JSON file | `df = pd.read_json("data.json")` |
| `pd.read_html(url)` | Read HTML tables | `dfs = pd.read_html("https://...")` |
| `pd.read_parquet(path)` | Read Parquet | `df = pd.read_parquet("data.parquet")` |
| `pd.read_clipboard()` | Read from clipboard | `df = pd.read_clipboard()` |
| `df.to_csv(path)` | Write CSV | `df.to_csv("output.csv")` |
| `df.to_excel(path)` | Write Excel | `df.to_excel("output.xlsx")` |
| `df.to_json(path)` | Write JSON | `df.to_json("output.json")` |
| `df.to_html(path)` | Write HTML | `df.to_html("output.html")` |
| `df.to_parquet(path)` | Write Parquet | `df.to_parquet("output.parquet")` |
| `df.to_clipboard()` | Write to clipboard | `df.to_clipboard()` |

### Inspection

| Method | Purpose | Example | Output |
|--------|---------|---------|--------|
| `df.head(n)` | First n rows | `df.head(3)` | top 3 rows |
| `df.tail(n)` | Last n rows | `df.tail(3)` | bottom 3 rows |
| `df.info()` | Column types & counts | `df.info()` | summary |
| `df.describe()` | Statistics | `df.describe()` | mean, std, min, max |
| `df.shape` | (rows, cols) | `df.shape` | `(100, 5)` |
| `df.dtypes` | Column types | `df.dtypes` | dtype per col |
| `df.ndim` | Number of dimensions | `df.ndim` | `2` |
| `df.values` | As NumPy array | `df.values` | ndarray |
| `df.index` | Row labels | `df.index` | RangeIndex |

### Selection & Indexing

| Method | Type | Example | Description |
|--------|------|---------|-------------|
| `df['col']` | Column by name | `df['name']` | Single column |
| `df[['A','B']]` | Multiple columns | `df[['name', 'age']]` | Multiple columns |
| `df.loc[label]` | **Label**-based | `df.loc[0, 'name']` | By label |
| `df.loc[[r1,r2], [c1,c2]]` | Multi-label | `df.loc[['X','Y'], ['A','B']]` | Rows + cols |
| `df.iloc[pos]` | **Integer**-based | `df.iloc[0]` | By position |
| `df.iloc[r1:r2, c1:c2]` | Slice | `df.iloc[0:2, 1:3]` | Row/col slice |

### Filtering

```python
df[df['score'] > 80]                      # Filter rows
df[df['city'].isin(['Chennai', 'Delhi'])]  # Multiple values
df.query("age > 25 and score > 80")        # SQL-style query
df[df['name'].str.startswith('A')]         # String filter
df[df['name'].str.endswith('n')]           # String filter
df[df['score'].between(70, 90)]            # Range filter
```

### Sorting

| Method | Purpose | Example |
|--------|---------|---------|
| `df.sort_values(by='col')` | Sort by column | `df.sort_values('score')` |
| `df.sort_values(by='col', ascending=False)` | Sort descending | `df.sort_values('score', ascending=False)` |
| `df.sort_values(by=['a','b'], ascending=[T,F])` | Multi-column sort | `df.sort_values(by=['city','score'])` |
| `df.sort_index()` | Sort by index | `df.sort_index()` |

### Modifying

| Method | Purpose | Example |
|--------|---------|---------|
| `df.drop('col', axis=1)` | Remove column | `df.drop('E', axis=1)` |
| `df.drop(index)` | Remove row | `df.drop(0)` |
| `df.drop(..., inplace=True)` | Modify in place | `df.drop('E', axis=1, inplace=True)` |
| `df.reset_index()` | Reset row index | `df.reset_index()` |
| `df.set_index('col')` | Set column as index | `df.set_index('name')` |
| `df['col'].apply(func)` | Apply function to column | `df['score'].apply(lambda x: x*2)` |

### Missing Data

| Method | Purpose | Example |
|--------|---------|---------|
| `df.isnull()` | Check nulls (boolean) | `df.isnull()` |
| `df.isnull().sum()` | Count nulls per column | `df.isnull().sum()` |
| `df.isnull().values.any()` | Any null in entire df? | `True` or `False` |
| `df.notnull()` | Inverse of isnull | `df.notnull()` |
| `pd.isnull(value)` | Check single value | `pd.isnull(np.nan)` → `True` |
| `df.dropna()` | Drop rows with any null | `df.dropna()` |
| `df.dropna(how='all')` | Drop only if all null | `df.dropna(how='all')` |
| `df.dropna(thresh=n)` | Keep rows with n+ non-null | `df.dropna(thresh=2)` |
| `df.dropna(axis=1)` | Drop columns with null | `df.dropna(axis=1)` |
| `df.fillna(value)` | Fill with constant | `df.fillna(0)` |
| `df['col'].fillna(mean)` | Fill with mean | `df['A'].fillna(df['A'].mean())` |
| `df.fillna(method='ffill')` | Forward fill | `df.fillna(method='ffill')` |
| `df.fillna(method='bfill')` | Backward fill | `df.fillna(method='bfill')` |

### Aggregation & Grouping

| Method | Purpose | Example |
|--------|---------|---------|
| `df.groupby('col')` | Group by column | `df.groupby('city')` |
| `.agg(['sum','mean'])` | Multiple aggregations | `df.groupby('city')['score'].agg(['sum','mean'])` |
| `.sum()` / `.mean()` | Aggregate function | `df.groupby('city')['score'].sum()` |
| `.min()` / `.max()` | Min / Max | `df.groupby('city')['score'].max()` |
| `.count()` | Count per group | `df.groupby('city')['name'].count()` |
| `.idxmax()` | Index of max | `df['score'].idxmax()` |
| `.idxmin()` | Index of min | `df['score'].idxmin()` |
| `.value_counts()` | Frequency count | `df['city'].value_counts()` |
| `.unique()` | Unique values | `df['city'].unique()` |

### Duplicates

| Method | Purpose | Example |
|--------|---------|---------|
| `df.drop_duplicates()` | Remove duplicate rows | `df.drop_duplicates()` |
| `df.drop_duplicates(subset='col')` | Deduplicate by column | `df.drop_duplicates(subset='name')` |
| `df.drop_duplicates(keep='last')` | Keep last occurrence | `df.drop_duplicates(keep='last')` |
| `df.drop_duplicates(keep=False)` | Remove ALL duplicates | `df.drop_duplicates(keep=False)` |

### Combining DataFrames

| Method | Purpose | Example |
|--------|---------|---------|
| `pd.concat([df1, df2])` | Stack vertically | `pd.concat([df1, df2])` |
| `pd.concat([df1, df2], axis=1)` | Stack horizontally | `pd.concat([df1, df2], axis=1)` |
| `pd.merge(df1, df2, on='col')` | SQL-style join | `pd.merge(df1, df2, on='id')` |
| `pd.merge(..., how='inner')` | Inner join | `pd.merge(df1, df2, how='inner')` |
| `pd.merge(..., how='left')` | Left join | `pd.merge(df1, df2, how='left')` |

### Plotting (via Matplotlib)

| Method | Chart Type | Example |
|--------|-----------|---------|
| `df.plot()` | Line plot | `df.plot()` |
| `df.plot.bar()` | Bar chart | `df.plot.bar(x='name', y='score')` |
| `df.plot.hist()` | Histogram | `df['score'].plot.hist()` |
| `df.plot.scatter(x, y)` | Scatter plot | `df.plot.scatter(x='age', y='score')` |
| `df.plot.pie(y)` | Pie chart | `df.plot.pie(y='score')` |
| `df.plot.area()` | Area chart | `df.plot.area(x='Year')` |

---

<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)
![NumPy](https://img.shields.io/badge/NumPy-013243?style=flat-square&logo=numpy&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=flat-square&logo=pandas&logoColor=white)

**All methods extracted from: `Class.ipynb` · `day1` · `day2` · `day3` · `day4` · `Numpy.ipynb` · `Pandas.ipynb`**

</div>
