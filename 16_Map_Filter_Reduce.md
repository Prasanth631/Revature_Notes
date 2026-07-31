<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Topic 16](https://img.shields.io/badge/Topic_16-Map_Filter_Reduce-C62828?style=for-the-badge)
![Intermediate](https://img.shields.io/badge/Level-Intermediate-FF9800?style=for-the-badge)

</div>

---

## What are Map, Filter & Reduce?

Powerful built-in functions that let you process data in lists **without writing explicit loops**.

---

## 1. `map()` — Transform Every Item ![Transform](https://img.shields.io/badge/Action-Transform-blue?style=flat-square)

Applies a function to **each element**:

```python
# With regular function
def add(a, b):
    return a + b

l1 = [10, 20, 30]
l2 = [20, 30, 40]

result = list(map(add, l1, l2))
print(result)   # [30, 50, 70]
```

```python
# With lambda
result = list(map(lambda a, b: a + b, l1, l2))
print(result)   # [30, 50, 70]

# Square each number
squares = list(map(lambda x: x * x, [10, 20, 30]))
print(squares)   # [100, 400, 900]
```

> [!NOTE]
> `map()` returns a map object — use `list()` to convert it.

---

## 2. `filter()` — Keep Matching Items ![Select](https://img.shields.io/badge/Action-Select-green?style=flat-square)

Keeps only elements where the function returns `True`:

```python
l1 = [10, 20, 18, 30]

result = list(filter(lambda x: x >= 18, l1))
print(result)   # [20, 18, 30]
```

### Extract Vowels
```python
st = list('babjee')
vowels = ['a', 'e', 'i', 'o', 'u']

result = list(filter(lambda x: x in vowels, st))
print(result)   # ['a', 'e', 'e']
```

---

## `map()` vs `filter()`

| Feature | ![map](https://img.shields.io/badge/map-blue?style=flat-square) | ![filter](https://img.shields.io/badge/filter-green?style=flat-square) |
|---------|:---:|:---:|
| Purpose | **Transform** each item | **Select** matching items |
| Output size | Same count | Fewer or same count |
| Function returns | New value | `True` / `False` |

```
map():    [1, 2, 3, 4, 5]  → x*x  → [1, 4, 9, 16, 25]
filter(): [1, 2, 3, 4, 5]  → even? → [2, 4]
```

---

## Real-World Examples

### Celsius to Fahrenheit
```python
celsius = [0, 10, 20, 30, 40]
fahrenheit = list(map(lambda c: (c * 9/5) + 32, celsius))
print(fahrenheit)   # [32.0, 50.0, 68.0, 86.0, 104.0]
```

### Filter Adults
```python
ages = [12, 18, 25, 8, 30, 15]
adults = list(filter(lambda age: age >= 18, ages))
print(adults)   # [18, 25, 30]
```

### Uppercase Names
```python
names = ["alice", "bob", "charlie"]
upper = list(map(lambda n: n.upper(), names))
print(upper)   # ['ALICE', 'BOB', 'CHARLIE']
```

---

## Practice Exercises

1. Use `map()` to double every number in `[5, 10, 15, 20]`
2. Use `filter()` to get numbers > 50 from `[10, 60, 35, 80, 45, 90]`
3. Use `map()` to add 10 to each number in a list
4. Use `filter()` to extract strings with length > 4

---

<div align="center">

[![Previous](https://img.shields.io/badge/←_Previous-15_OS_Module-2196F3?style=for-the-badge)](./15_OS_Module.md)
[![Next](https://img.shields.io/badge/Next_→-17_Collections-2196F3?style=for-the-badge)](./17_Collections_Module.md)

</div>
