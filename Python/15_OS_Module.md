<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Topic 15](https://img.shields.io/badge/Topic_15-OS_Module-C62828?style=for-the-badge)
![Intermediate](https://img.shields.io/badge/Level-Intermediate-FF9800?style=for-the-badge)

</div>

---

## What is the OS Module?

The `os` module lets you **interact with your operating system** — create folders, list files, delete files, and navigate directories.

```python
import os
```

---

## 1. Working with Directories

```python
import os

print(os.getcwd())       # Get current directory
os.chdir("C:\\data")     # Change directory
print(os.listdir())      # List files/folders
```

---

## 2. Creating Directories

```python
# Single folder
os.mkdir("PythonNotes")

# Nested folders (multiple levels)
os.makedirs("Python/Class1/Programs")
```

> [!TIP]
> Use `makedirs()` when you need to create **multiple levels** of folders at once.

---

## 3. Removing Directories

```python
os.rmdir("PythonNotes")                   # Single empty folder
os.removedirs("Python/Class1/Programs")   # Nested empty folders
```

> [!WARNING]
> These only work on **empty** folders!

---

## 4. Renaming & Deleting Files

```python
os.rename("student.txt", "students.txt")

# Always check before deleting
if os.path.exists("backup.txt"):
    os.remove("backup.txt")
    print("File deleted")
else:
    print("File not found")
```

---

## 5. Checking Existence

| Function | Checks |
|----------|--------|
| `os.path.exists("name")` | File OR folder exists? |
| `os.path.isfile("name")` | Is it a file? |
| `os.path.isdir("name")` | Is it a directory? |

```python
print(os.path.exists("students.txt"))   # True
print(os.path.isfile("students.txt"))   # True
print(os.path.isdir("students.txt"))    # False
```

---

## 6. Environment Variables

```python
print(os.environ.get("USERNAME"))   # Your username
print(os.environ.get("PATH"))       # System PATH
```

---

## Cheat Sheet

```
┌──────────────────────────────────────────────┐
│          OS MODULE CHEAT SHEET               │
├──────────────────────────────────────────────┤
│ NAVIGATE:                                    │
│   os.getcwd()          → Current directory   │
│   os.chdir("path")     → Change directory    │
│   os.listdir()         → List contents       │
│                                              │
│ CREATE:                                      │
│   os.mkdir("name")     → Create folder       │
│   os.makedirs("a/b/c") → Nested folders      │
│                                              │
│ DELETE:                                      │
│   os.remove("file")    → Delete file         │
│   os.rmdir("folder")   → Delete folder       │
│                                              │
│ CHECK:                                       │
│   os.path.exists()     → Exists?             │
│   os.path.isfile()     → Is file?            │
│   os.path.isdir()      → Is directory?       │
│                                              │
│ OTHER:                                       │
│   os.rename(old, new)  → Rename              │
│   os.environ.get(key)  → Env variable        │
└──────────────────────────────────────────────┘
```

---

## Practice Exercises

1. Print your current working directory
2. Create a folder "MyProject" with subfolder "src"
3. List all files in your current directory
4. Check if "data.txt" exists
5. Get your system's USERNAME

---

<div align="center">

[![Previous](https://img.shields.io/badge/←_Previous-14_File_Handling-2196F3?style=for-the-badge)](./14_File_Handling.md)
[![Next](https://img.shields.io/badge/Next_→-16_Map_Filter-2196F3?style=for-the-badge)](./16_Map_Filter_Reduce.md)

</div>
