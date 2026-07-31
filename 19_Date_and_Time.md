<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Topic 19](https://img.shields.io/badge/Topic_19-Date_&_Time-37474F?style=for-the-badge)
![Advanced](https://img.shields.io/badge/Level-Advanced-F44336?style=for-the-badge)

</div>

---

## What is the datetime Module?

The `datetime` module lets you work with **dates and times** in Python.

```python
from datetime import datetime
```

---

## 1. Getting Current Date & Time

```python
from datetime import datetime as dt

print(dt.now())     # 2026-07-30 11:12:20.720814
print(dt.today())   # 2026-07-30 11:12:27.203851
```

---

## 2. Extracting Components

```python
from datetime import datetime as dt

now = dt.now()

print(now.year)         # 2026
print(now.month)        # 7
print(now.day)          # 30
print(now.hour)         # 11
print(now.minute)       # 13
print(now.second)       # 34
print(now.microsecond)  # 835279
print(now.weekday())    # 3 (0=Mon, 6=Sun)
print(now.time())       # 11:13:34.834011
print(now.ctime())      # Thu Jul 30 11:13:34 2026
```

---

## 3. Formatting Dates — `strftime()` ![Format](https://img.shields.io/badge/Date-Formatting-blue?style=flat-square)

Convert datetime **to a formatted string**:

```python
from datetime import datetime as dt

d = dt.now()
print(d.strftime("%d/%m/%y %H:%M:%S %p"))
# Output: 30/07/26 11:20:34 AM
```

### Common Format Codes

| Code | Meaning | Example |
|:----:|---------|:-------:|
| `%d` | Day (01-31) | `30` |
| `%m` | Month (01-12) | `07` |
| `%y` | Year (2-digit) | `26` |
| `%Y` | Year (4-digit) | `2026` |
| `%H` | Hour (24hr) | `14` |
| `%I` | Hour (12hr) | `02` |
| `%M` | Minute | `30` |
| `%S` | Second | `45` |
| `%p` | AM/PM | `AM` |
| `%A` | Full weekday | `Thursday` |
| `%a` | Short weekday | `Thu` |
| `%B` | Full month | `July` |
| `%b` | Short month | `Jul` |

```python
from datetime import datetime

today = datetime.now()
print(today.strftime("%A"))   # Thursday
print(today.strftime("%a"))   # Thu
print(today.strftime("%B"))   # July
print(today.strftime("%b"))   # Jul
```

> [!TIP]
> Use `%H` for 24-hour format, `%I` for 12-hour format.

---

## 4. Parsing Strings — `strptime()` ![Parse](https://img.shields.io/badge/String-to_Date-green?style=flat-square)

Convert a **string to a datetime** object:

```python
from datetime import datetime

date_string = "29-07-2026"
date_obj = datetime.strptime(date_string, "%d-%m-%Y")
print(date_obj)   # 2026-07-29 00:00:00
```

> [!NOTE]
> `strftime` → datetime **to** string (format).
> `strptime` → string **to** datetime (parse).

---

## 5. Date Difference

```python
from datetime import date

d1 = date(2026, 7, 1)
d2 = date(2026, 7, 29)

difference = d2 - d1
print(difference.days)   # 28
```

---

## 6. `timedelta` — Add/Subtract Time ![Delta](https://img.shields.io/badge/Time-Delta-orange?style=flat-square)

```python
from datetime import datetime, timedelta

today = datetime.now()

# 10 days in the future
future = today + timedelta(days=10)
print(future)

# 10 days in the past
past = today - timedelta(days=10)
print(past)
```

> [!TIP]
> `timedelta` can also use `hours`, `minutes`, `seconds`, and `weeks`.

---

## Quick Reference

| Task | Code |
|------|------|
| Current date/time | `datetime.now()` |
| Extract year | `.year` |
| Format date | `.strftime("%d-%m-%Y")` |
| Parse string | `datetime.strptime(str, fmt)` |
| Date difference | `date2 - date1` |
| Add days | `+ timedelta(days=n)` |
| Subtract days | `- timedelta(days=n)` |

---

## Practice Exercises

1. Print today's date in `DD/MM/YYYY` format
2. Print the current day of the week (e.g., "Thursday")
3. Calculate days between your birthday and today
4. Find the date 30 days from now
5. Parse the string `"2026-12-25"` into a datetime object

---

<div align="center">

[![Previous](https://img.shields.io/badge/←_Previous-18_Exceptions-2196F3?style=for-the-badge)](./18_Exception_Handling.md)
[![Home](https://img.shields.io/badge/↑_Home-Table_of_Contents-4CAF50?style=for-the-badge)](./README.md)

</div>
