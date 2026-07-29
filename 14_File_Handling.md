# 📘 Topic 14: File Handling in Python

---

## 🧠 What is File Handling?

**File handling** lets you **read from** and **write to** files on your computer.
This is how programs save data permanently (even after the program stops).

---

## 📂 File Modes

| Mode | What it Does | Creates New File? |
|------|-------------|-------------------|
| `"r"` | **Read** — Read content from a file | ❌ No (error if file doesn't exist) |
| `"w"` | **Write** — Write to a file (OVERWRITES existing content!) | ✅ Yes |
| `"a"` | **Append** — Add to the end of a file (keeps existing content) | ✅ Yes |

> ⚠️ **Warning:** `"w"` mode **erases everything** in the file before writing!
> Use `"a"` mode if you want to **add** without deleting existing content.

---

## 📖 1. Reading Files

### Read one line at a time with `readline()`:
```python
file = open("C:/Data/student.txt", "r")
print(file.readline())    # Reads the FIRST line only
file.close()

# Output: 101,John,Python
```

### Read all lines with a loop:
```python
file = open("C:/Data/student.txt", "r")
line = file.readline()

while line != "":
    print(line.strip())     # .strip() removes extra newline
    line = file.readline()

file.close()

# Output:
# 101,John,Python
# 102,Alice,SQL
# 103,David,Power BI
# 104,Emma,Tableau
# 105,Chris,PySpark
```

### Read all lines into a list with `readlines()`:
```python
file = open("C:/Data/student.txt", "r")
data = file.readlines()
print(data)
file.close()

# Output: ['101,John,Python\n', '102,Alice,SQL\n', ...]
```

### Read all lines — clean version:
```python
file = open("C:/Data/student.txt", "r")
students = file.readlines()

for student in students:
    print(student.strip())   # .strip() removes \n

file.close()
```

### Read entire file at once with `read()`:
```python
file = open("C:/Data/student.txt", "r")
print(file.read())    # Reads EVERYTHING as one big string
file.close()
```

---

## ✏️ 2. Writing to Files

### Write (OVERWRITES everything):
```python
file = open("C:/Data/student.txt", "w")
file.write("101,Rahul,Python")
file.close()
```

### Write multiple lines:
```python
file = open("C:/Data/student.txt", "w")
file.write("101,Praveen,Python\n")
file.write("102,Ram,SQL\n")
file.write("103,Ramesh,Power BI\n")
file.close()
```

> 💡 **Tip:** Add `\n` at the end of each line for a newline!

---

## ➕ 3. Appending to Files

Append adds content **to the end** without erasing:

```python
file = open("C:/Data/student.txt", "a")
file.write("104,Suresh,Java\n")
file.write("105,Kiran,React\n")
file.close()
```

---

## 🔒 4. The `with` Statement (Best Practice!)

Using `with` automatically **closes the file** when done — no need for `file.close()`:

```python
# Reading with 'with'
with open("C:/Data/student.txt", "r") as file:
    data = file.read()
    print(data)
# File is automatically closed here!

# Writing with 'with'
with open("C:/Data/output.txt", "w") as file:
    file.write("Hello, World!")
# File is automatically closed here!
```

> 💡 **Tip:** Always use `with` — it's safer and cleaner!
> You'll never forget to close the file.

---

## 🎯 Real-World Example: File Backup

```python
# Read from source file
with open("C:/Data/student.txt", "r") as source:
    data = source.read()

# Write to backup file
with open("C:/Data/backup.txt", "w") as target:
    target.write(data)

print("Backup created!")
```

---

## 📊 Reading Methods Comparison

| Method | What it Returns | Use Case |
|--------|----------------|----------|
| `read()` | Entire file as one string | Small files |
| `readline()` | One line at a time | Processing line by line |
| `readlines()` | List of all lines | When you need all lines as a list |

---

## ⚠️ Common Mistakes

1. **Forgetting to close the file** → Use `with` to avoid this
2. **Using `"w"` when you meant `"a"`** → Accidentally erasing data
3. **Not using `.strip()`** → Getting extra `\n` in your output
4. **File not found error** → Check the file path is correct

---

## 🧪 Quick Practice

1. Create a text file and write 3 student records
2. Read the file and print each line
3. Append 2 more records to the file
4. Create a backup of the file using `with`

---

*← [13 — Built-in Functions](./13_Builtin_Functions_and_Math.md) | Next: [15 — OS Module →](./15_OS_Module.md)*
