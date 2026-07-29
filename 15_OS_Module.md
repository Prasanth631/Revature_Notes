# 📘 Topic 15: OS Module in Python

---

## 🧠 What is the OS Module?

The `os` module lets you **interact with your operating system** — like creating folders,
listing files, deleting files, and navigating directories.

```python
import os
```

---

## 📂 1. Working with Directories (Folders)

### Get Current Working Directory:
```python
import os
print(os.getcwd())   # Output: C:\data (or wherever you are)
```

### Change Directory:
```python
os.chdir("C:\\data")
print(os.getcwd())   # Output: C:\data
```

### List Files in a Directory:
```python
files = os.listdir()
print(files)   # Output: ['backup.txt', 'student.txt']
```

---

## 📁 2. Creating Directories

### Create a Single Folder:
```python
os.mkdir("PythonNotes")
print("Folder Created")
```

### Create Nested Folders (multiple levels):
```python
os.makedirs("Python/Class1/Programs")
# Creates: Python → Class1 → Programs (all at once!)
```

> 💡 **Tip:** Use `makedirs()` when you need to create **multiple levels** of folders.

---

## 🗑️ 3. Removing Directories

### Remove a Single Empty Folder:
```python
os.rmdir("PythonNotes")
```

### Remove Nested Empty Folders:
```python
os.removedirs("Python/Class1/Programs")
# Removes Programs, then Class1, then Python (if empty)
```

> ⚠️ **Warning:** These only work on **empty** folders!

---

## 📝 4. Renaming Files

```python
os.rename("student.txt", "students.txt")
```

---

## 🗑️ 5. Deleting Files

```python
# Always check if file exists before deleting!
if os.path.exists("backup.txt"):
    os.remove("backup.txt")
    print("File deleted")
else:
    print("File not found")
```

---

## ✅ 6. Checking File/Folder Existence

| Function | What it Checks |
|----------|---------------|
| `os.path.exists("name")` | Does the file OR folder exist? |
| `os.path.isfile("name")` | Is it a file? |
| `os.path.isdir("name")` | Is it a directory (folder)? |

```python
print(os.path.exists("students.txt"))   # True
print(os.path.isfile("students.txt"))   # True
print(os.path.isdir("students.txt"))    # False (it's a file, not a folder)
```

---

## 🎯 Real-World Example: Smart File/Folder Reader

```python
import os

name = input("Enter file or folder name: ")

if os.path.isfile(name):
    with open(name, 'r') as file:
        print(file.read())
elif os.path.isdir(name):
    os.chdir(name)
    print(os.listdir())
else:
    print("File or folder not found")
```

---

## 🌍 7. Environment Variables

```python
import os

# Get your username
print(os.environ.get("USERNAME"))   # Output: Prasanth Golla

# Get the PATH variable
print(os.environ.get("PATH"))
```

---

## 📋 OS Module Cheat Sheet

```
┌─────────────────────────────────────────────────┐
│            OS MODULE CHEAT SHEET                │
├─────────────────────────────────────────────────┤
│  NAVIGATION:                                    │
│    os.getcwd()          → Get current directory │
│    os.chdir("path")     → Change directory      │
│    os.listdir()         → List files/folders    │
│                                                 │
│  CREATE:                                        │
│    os.mkdir("name")     → Create folder         │
│    os.makedirs("a/b/c") → Create nested folders │
│                                                 │
│  DELETE:                                        │
│    os.remove("file")    → Delete a file         │
│    os.rmdir("folder")   → Delete empty folder   │
│    os.removedirs("a/b") → Delete nested folders │
│                                                 │
│  CHECK:                                         │
│    os.path.exists()     → Does it exist?        │
│    os.path.isfile()     → Is it a file?         │
│    os.path.isdir()      → Is it a folder?       │
│                                                 │
│  OTHER:                                         │
│    os.rename(old, new)  → Rename file/folder    │
│    os.environ.get(key)  → Get environment var   │
└─────────────────────────────────────────────────┘
```

---

## 🧪 Quick Practice

1. Print your current working directory
2. Create a folder called "MyProject" and then create a subfolder "src" inside it
3. List all files in your current directory
4. Check if a file called "data.txt" exists
5. Get your system's USERNAME from environment variables

---

*← [14 — File Handling](./14_File_Handling.md) | Next: [16 — Map, Filter & Reduce →](./16_Map_Filter_Reduce.md)*
