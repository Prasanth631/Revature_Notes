<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Topic 14](https://img.shields.io/badge/Topic_14-File_Handling-C62828?style=for-the-badge)
![Intermediate](https://img.shields.io/badge/Level-Intermediate-FF9800?style=for-the-badge)

</div>

---

## What is File Handling?

**File handling** lets you **read from** and **write to** files on your computer — how programs save data permanently.

---

## File Modes

| Mode | What it Does | Creates New File? |
|:----:|-------------|:-----------------:|
| `"r"` | **Read** content | ![No](https://img.shields.io/badge/-No-F44336?style=flat-square) (error if missing) |
| `"w"` | **Write** (OVERWRITES!) | ![Yes](https://img.shields.io/badge/-Yes-4CAF50?style=flat-square) |
| `"a"` | **Append** to end | ![Yes](https://img.shields.io/badge/-Yes-4CAF50?style=flat-square) |

> [!CAUTION]
> `"w"` mode **erases everything** in the file before writing! Use `"a"` to add without deleting.

---

## 1. Reading Files

### Read one line — `readline()`
```python
file = open("student.txt", "r")
print(file.readline())    # Reads first line only
file.close()
```

### Read all lines with a loop
```python
file = open("student.txt", "r")
line = file.readline()

while line != "":
    print(line.strip())     # .strip() removes \n
    line = file.readline()

file.close()
```

### Read all lines into a list — `readlines()`
```python
file = open("student.txt", "r")
data = file.readlines()
print(data)   # ['101,John,Python\n', '102,Alice,SQL\n', ...]
file.close()
```

### Read entire file — `read()`
```python
file = open("student.txt", "r")
print(file.read())    # Everything as one string
file.close()
```

---

## 2. Writing Files

```python
file = open("student.txt", "w")
file.write("101,Praveen,Python\n")
file.write("102,Ram,SQL\n")
file.write("103,Ramesh,Power BI\n")
file.close()
```

> [!TIP]
> Add `\n` at the end of each line for a newline.

---

## 3. Appending

```python
file = open("student.txt", "a")
file.write("104,Suresh,Java\n")
file.write("105,Kiran,React\n")
file.close()
```

---

## 4. The `with` Statement ![Best Practice](https://img.shields.io/badge/Best-Practice-4CAF50?style=flat-square)

Using `with` **automatically closes** the file — no need for `file.close()`:

```python
# Reading
with open("student.txt", "r") as file:
    data = file.read()
    print(data)
# File automatically closed!

# Writing
with open("output.txt", "w") as file:
    file.write("Hello, World!")
# File automatically closed!
```

> [!TIP]
> Always use `with` — it's safer, cleaner, and you'll never forget to close the file.

---

## Reading Methods Comparison

| Method | Returns | Best For |
|--------|---------|----------|
| `read()` | Entire file as string | Small files |
| `readline()` | One line at a time | Line-by-line processing |
| `readlines()` | List of all lines | All lines as a list |

---

## Common Mistakes

| Mistake | Solution |
|---------|----------|
| Forgetting to close the file | Use `with` statement |
| Using `"w"` when you meant `"a"` | Double-check the mode |
| Extra `\n` in output | Use `.strip()` |
| File not found error | Check the file path |

---

## Practice Exercises

1. Create a text file and write 3 student records
2. Read the file and print each line
3. Append 2 more records
4. Create a backup of the file using `with`

---

<div align="center">

[![Previous](https://img.shields.io/badge/←_Previous-13_Builtins-2196F3?style=for-the-badge)](./13_Builtin_Functions_and_Math.md)
[![Next](https://img.shields.io/badge/Next_→-15_OS_Module-2196F3?style=for-the-badge)](./15_OS_Module.md)

</div>
