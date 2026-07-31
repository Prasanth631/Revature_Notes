<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Topic 22](https://img.shields.io/badge/Topic_22-JSON_&_Logging-37474F?style=for-the-badge)
![Intermediate](https://img.shields.io/badge/Level-Intermediate-FF9800?style=for-the-badge)

</div>

---

## 1. JSON Handling in Python (`json` module)

**JSON (JavaScript Object Notation)** is a lightweight data format used to store and exchange data between client and server applications.

```python
import json
```

### JSON Methods Summary

| Method | Purpose | Source / Target |
|--------|---------|-----------------|
| `json.dumps()` | Convert Python object → **JSON String** | Memory |
| `json.loads()` | Convert **JSON String** → Python Dict | Memory |
| `json.dump()` | Write Python object → **JSON File** | File (`.json`) |
| `json.load()` | Read **JSON File** → Python Dict | File (`.json`) |

---

### Code Examples for JSON

#### 1. `json.dumps()` & `json.loads()` (In-Memory)

```python
import json

# Python Dictionary
employee = {
    "Id": 1001,
    "Name": "Kumar",
    "Salary": 50000,
    "Skills": ["Python", "SQL"]
}

# Convert Python Dict -> JSON String
json_str = json.dumps(employee, indent=4)
print(type(json_str))   # Output: <class 'str'>
print(json_str)

# Convert JSON String -> Python Dict
dict_data = json.loads(json_str)
print(type(dict_data))  # Output: <class 'dict'>
print(dict_data["Name"])# Output: Kumar
```

#### 2. `json.dump()` & `json.load()` (File Operations)

```python
import json

employee = {
    "Id": 1001,
    "Name": "Kumar",
    "Salary": 50000
}

# Write JSON to File
with open("employee.json", "w") as file:
    json.dump(employee, file, indent=4)
print("JSON Written Successfully")

# Read JSON from File
with open("employee.json", "r") as file:
    data = json.load(file)

print(data)
print(data["Salary"])   # Output: 50000
```

---

## 2. Logging Module (`logging`)

The `logging` module is used to record events, errors, and informational messages generated during application execution.

```python
import logging
```

### Logging Levels

| Level | Severity Value | Purpose |
|-------|:--------------:|---------|
| `DEBUG` | 10 | Detailed diagnostic information |
| `INFO` | 20 | General confirmation of system operations |
| `WARNING` | 30 | Indication of potential issues or unexpected events |
| `ERROR` | 40 | Runtime error preventing a specific task |
| `CRITICAL` | 50 | Serious failure; application may crash |

---

### Configuring Logging

By default, Python logs messages of `WARNING` level and higher to the console. You can configure logging using `basicConfig()`:

```python
import logging

# Configure logging level and output format
logging.basicConfig(
    filename='app.log',
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)

logging.debug("This is a DEBUG message")
logging.info("Application started successfully")
logging.warning("Low memory warning")
logging.error("Failed to connect to database")
logging.critical("System crash imminent!")
```

---

## Practice Exercises

1. Create a dictionary of 3 students with their grades and save it to `students.json` using `json.dump()`.
2. Read `students.json` back into Python and print each student's grade.
3. Configure logging to save `ERROR` and `CRITICAL` logs to `errors.log`.

---

<div align="center">

[![Previous](https://img.shields.io/badge/←_Previous-21_Regex-2196F3?style=for-the-badge)](./21_Regular_Expressions.md)
[![Next](https://img.shields.io/badge/Next_→-23_NumPy-2196F3?style=for-the-badge)](./23_NumPy_Basics.md)

</div>
