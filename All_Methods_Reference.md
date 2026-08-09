<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![NumPy](https://img.shields.io/badge/NumPy-013243?style=for-the-badge&logo=numpy&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)
![Reference](https://img.shields.io/badge/Complete-Methods_Reference-C62828?style=for-the-badge)

# All Methods & Functions Reference

**Every method and operation covered across Class, Day-1, Day-2, Day-3, Day-4, NumPy & Pandas**

</div>

---

## DAY-1

| Category | Method / Operation | Description |
|----------|-------------------|-------------|
| Output & Type | `print()` | Displays a value or result on the screen. |
| Output & Type | `type()` | Returns the data type of an object. |
| Assignment | `=` | Assigns a value to a variable. |
| Assignment | `a, b, c = 10, 20, 30` | Assigns different values to multiple variables at once. |
| Assignment | `x = y = z = 10` | Assigns the same value to multiple variables. |
| Assignment | `c = a + b` | Assigns the result of an expression to a variable. |
| Assignment | `a = 10 > 5` | Assigns the result of a Boolean expression to a variable. |
| Variable Manipulation | `a, b = b, a` | Swaps the values of two variables without a temporary variable. |
| Variable Manipulation | `x += 5` | Adds a value to the existing variable and assigns the result back. |
| Variable Manipulation | `x *= 2` | Multiplies the existing variable and assigns the result back. |
| Unpacking | `a, b, c = list` | Unpacks elements of a list into separate variables. |
| Unpacking | `a, b, c = tuple` | Unpacks elements of a tuple into separate variables. |
| Dynamic Typing | `x = 10` → `x = "Python"` | Allows the same variable to refer to values of different data types. |
| Complex Numbers | `x = 2 + 3j` | Creates a complex number with real and imaginary parts. |
| Complex Numbers | `x.real` | Returns the real part of a complex number. |
| Complex Numbers | `x.imag` | Returns the imaginary part of a complex number. |
| Strings | `type(st)` | Returns the data type of the string variable. |
| String Indexing | `st[0]` | Returns the character at index 0. |
| String Indexing | `st[5]` | Returns the character at index 5. |
| String Indexing | `st[-1]` | Returns the last character of the string. |
| String Slicing | `st[0:6]` | Returns characters from index 0 up to, but not including, index 6. |
| String Slicing | `st[10:]` | Returns characters from index 10 to the end. |
| String Slicing | `st[:6]` | Returns characters from the beginning up to, but not including, index 6. |
| String Slicing | `st[::2]` | Returns every second character from the string. |
| String Slicing | `st[::-1]` | Reverses the entire string. |

---

## DAY-2

| Category | Method / Operation | Description |
|----------|-------------------|-------------|
| String Methods | `st.upper()` | Converts all characters in the string to uppercase. |
| String Methods | `st.capitalize()` | Converts the first character to uppercase and the remaining characters to lowercase. |
| String Methods | `st.lower()` | Converts all characters in the string to lowercase. |
| String Methods | `st.title()` | Converts the first character of each word to uppercase. |
| String Methods | `st.swapcase()` | Converts uppercase characters to lowercase and lowercase characters to uppercase. |
| String Methods | `st.center(40, '*')` | Centers the string within the specified width and fills the extra space with the given character. |
| String Methods | `st.find("java")` | Returns the index of the first occurrence of the specified substring, or `-1` if not found. |
| String Methods | `st.index("python")` | Returns the index of the first occurrence of the specified substring and raises an error if not found. |
| String Methods | `st.count('o')` | Returns the number of times the specified character or substring occurs. |
| String Methods | `st.endswith('python')` | Checks whether the string ends with the specified value. |
| String Methods | `st.startswith("hello")` | Checks whether the string starts with the specified value. |
| String Methods | `st.rstrip()` | Removes whitespace from the right side of the string. |
| String Methods | `st.lstrip()` | Removes whitespace from the left side of the string. |
| String Methods | `st.strip()` | Removes whitespace from both sides of the string. |
| String Methods | `st.replace('python', 'java')` | Replaces occurrences of one substring with another substring. |
| String Methods | `st.split()` | Splits a string into a list using whitespace as the default separator. |
| String Methods | `st.split("!")` | Splits a string into a list using the specified separator. |
| String Methods | `' '.join(l1)` | Combines the elements of an iterable into one string using the specified separator. |
| String Methods | `'-'.join(st.split())` | Splits a string and joins its words using `-` as the separator. |
| String Methods | `st.isalpha()` | Checks whether all characters in the string are alphabetic. |
| String Methods | `st.isdigit()` | Checks whether all characters in the string are digits. |
| String Methods | `st.isalnum()` | Checks whether all characters in the string are alphabetic or numeric. |
| String Methods | `st.isspace()` | Checks whether all characters in the string are whitespace characters. |
| String Methods | `number.zfill(5)` | Adds leading zeros to make the string reach the specified width. |
| Built-in Functions | `len(st)` | Returns the number of characters or elements in an object. |
| Built-in Functions | `min(st)` | Returns the smallest character or element based on its value. |
| Built-in Functions | `max(st)` | Returns the largest character or element based on its value. |
| Built-in Functions | `sorted(st)` | Returns the characters or elements in sorted order as a list. |
| String Operations | `st + " " + "Programming"` | Concatenates two or more strings together. |
| String Operations | `st[::-1]` | Returns the string in reverse order. |
| String Operations | `ch in st` | Checks whether a character or substring exists in the string. |
| List Creation | `list()` | Creates a new list from an iterable. |
| List Creation | `[*range(1, 10)]` | Creates a list by unpacking the values generated by `range()`. |
| List Indexing | `fruits[0]` | Accesses the first element of a list. |
| List Indexing | `fruits[-1]` | Accesses the last element of a list. |
| List Slicing | `colors[:2]` | Returns elements from the beginning up to, but not including, index 2. |
| List Slicing | `colors[2:]` | Returns elements from index 2 to the end. |
| List Slicing | `colors[::2]` | Returns every second element from the list. |
| List Slicing | `colors[::-1]` | Reverses the list using slicing. |
| List Modification | `fruits[1] = "Mango"` | Changes the element at the specified index. |
| List Methods | `numbers.append(40)` | Adds one element to the end of the list. |
| List Methods | `numbers.insert(1, 15)` | Inserts an element at the specified index. |
| List Methods | `list1.extend(list2)` | Adds all elements of another iterable to the end of the list. |
| List Methods | `numbers.pop()` | Removes and returns the last element of the list. |
| List Methods | `numbers.remove(50)` | Removes the first occurrence of the specified value from the list. |
| List Methods | `numbers.clear()` | Removes all elements from the list. |
| List Methods | `numbers.copy()` | Creates a shallow copy of the list. |
| List Methods | `numbers.sort()` | Sorts the list in ascending order in place. |
| List Methods | `numbers.reverse()` | Reverses the order of elements in the list in place. |
| List Methods | `fruits.index("Orange")` | Returns the index of the first occurrence of the specified element. |
| List Methods | `numbers.count(2)` | Returns the number of times an element occurs in the list. |
| List Operations | `list1 + list2` | Concatenates two lists into a new list. |
| List Operations | `x in fruits` | Checks whether an element exists in the list. |
| List Operations | `x not in fruits` | Checks whether an element does not exist in the list. |
| List Functions | `len(fruits)` | Returns the number of elements in a list. |
| List Functions | `max(marks)` | Returns the largest element in a list. |
| List Functions | `min(marks)` | Returns the smallest element in a list. |
| List Functions | `sum(marks)` | Returns the sum of all elements in a numeric list. |
| List Functions | `sorted(numbers)` | Returns a new sorted list without modifying the original list. |
| List Comprehension | `[x for x in range(1, 11)]` | Creates a list using a compact loop-based syntax. |
| List Comprehension | `[x for x in range(1, 11) if x % 2 == 0]` | Creates a list containing only elements that satisfy a condition. |
| List Comprehension | `[x*x for x in numbers]` | Creates a new list by applying an expression to each element. |
| Tuple Creation | `tuple()` | Creates a tuple from an iterable. |
| Tuple Indexing | `fruits[0]` | Accesses an element of a tuple using its index. |
| Tuple Slicing | `fruits[0:2]` | Returns a portion of the tuple using slicing. |
| Tuple Methods | `numbers.count(20)` | Returns the number of times an element occurs in the tuple. |
| Tuple Methods | `numbers.index(30)` | Returns the index of the first occurrence of an element. |
| Tuple Unpacking | `emp_id, name, dept = employee` | Assigns tuple elements to separate variables. |
| Zip | `zip(name, marks)` | Combines corresponding elements from multiple iterables into pairs or tuples. |
| Set Creation | `set()` | Creates a set from an iterable. |
| Set Methods | `fruits.add("Orange")` | Adds a single element to a set. |
| Set Methods | `numbers.update([4, 5, 6])` | Adds multiple elements from an iterable to a set. |
| Set Methods | `colors.remove("Blue")` | Removes a specified element and raises an error if it does not exist. |
| Set Methods | `colors.discard("Yellow")` | Removes a specified element without raising an error if it does not exist. |
| Set Methods | `fruits.pop()` | Removes and returns an arbitrary element from the set. |
| Set Methods | `numbers.clear()` | Removes all elements from the set. |
| Set Methods | `a.intersection(b)` | Returns the elements that are common to both sets. |
| Set Methods | `a.difference(b)` | Returns elements present in the first set but not the second. |
| Set Methods | `a.symmetric_difference(b)` | Returns elements present in either set but not in both. |
| Set Methods | `a.issubset(b)` | Checks whether all elements of one set are present in another set. |
| Set Methods | `a.issuperset(b)` | Checks whether one set contains all elements of another set. |
| Set Methods | `a.difference_update(b)` | Removes elements from the first set that are also present in the second set. |
| Set Membership | `x in fruits` | Checks whether an element exists in the set. |
| Set Operations | `a & b` | Returns the intersection of two sets. |
| Set Operations | `a \| b` | Returns the union of two sets. |
| Set Operations | `a - b` | Returns the difference of two sets. |
| Set Operations | `a ^ b` | Returns the symmetric difference of two sets. |
| Set Operations | `set(numbers)` | Converts an iterable into a set and removes duplicate values. |
| Dictionary Creation | `{key: value}` | Creates a dictionary containing key-value pairs. |
| Dictionary Access | `student['name']` | Retrieves the value associated with a specified key. |
| Dictionary Methods | `student.get('id')` | Returns the value associated with a key without raising an error when the key is missing. |
| Dictionary Methods | `student.keys()` | Returns a view containing all dictionary keys. |
| Dictionary Methods | `student.values()` | Returns a view containing all dictionary values. |
| Dictionary Methods | `student.items()` | Returns a view containing key-value pairs. |
| Dictionary Methods | `student.update({...})` | Adds new key-value pairs or updates existing values. |
| Dictionary Methods | `student.pop('email')` | Removes the specified key and returns its value. |
| Dictionary Access | `student['city'] = "Chennai"` | Adds a new key-value pair to the dictionary. |
| Dictionary Update | `student['age'] = 26` | Updates the value associated with an existing key. |
| Dictionary Iteration | `for key, value in student.items()` | Iterates through dictionary keys and values simultaneously. |
| Dictionary Comprehension | `{x: x*x for x in range(1, 6)}` | Creates a dictionary using a compact expression and iteration. |
| String Formatting | `f'{name} {age}'` | Inserts variable values directly into a string using an f-string. |
| Deletion | `del numbers` | Deletes the entire variable or object. |
| Deletion | `del student['age']` | Removes a specific key-value pair from a dictionary. |

---

## DAY-3

| Category | Method / Operation | Description |
|----------|-------------------|-------------|
| Arithmetic Operators | `+` | Adds two values. |
| Arithmetic Operators | `-` | Subtracts the second value from the first. |
| Arithmetic Operators | `*` | Multiplies two values. |
| Arithmetic Operators | `/` | Performs division and returns a floating-point result. |
| Arithmetic Operators | `%` | Returns the remainder of a division. |
| Arithmetic Operators | `**` | Performs exponentiation or raises a value to a power. |
| Arithmetic Operators | `//` | Performs floor division and returns the quotient rounded down. |
| Comparison Operators | `==` | Checks whether two values are equal. |
| Comparison Operators | `!=` | Checks whether two values are not equal. |
| Comparison Operators | `>` | Checks whether the first value is greater than the second. |
| Comparison Operators | `<` | Checks whether the first value is less than the second. |
| Comparison Operators | `>=` | Checks whether the first value is greater than or equal to the second. |
| Comparison Operators | `<=` | Checks whether the first value is less than or equal to the second. |
| Assignment Operators | `+=` | Adds a value to a variable and assigns the result back. |
| Assignment Operators | `-=` | Subtracts a value from a variable and assigns the result back. |
| Assignment Operators | `*=` | Multiplies a variable by a value and assigns the result back. |
| Assignment Operators | `/=` | Divides a variable by a value and assigns the result back. |
| Assignment Operators | `//=` | Performs floor division and assigns the result back. |
| Assignment Operators | `**=` | Raises a variable to a power and assigns the result back. |
| Logical Operators | `and` | Returns True when both conditions are True. |
| Logical Operators | `or` | Returns True when at least one condition is True. |
| Logical Operators | `not` | Reverses the Boolean result of a condition. |
| Bitwise Operators | `&` | Performs bitwise AND operation between integers. |
| Bitwise Operators | `\|` | Performs bitwise OR operation between integers. |
| Bitwise Operators | `~` | Performs bitwise NOT operation on an integer. |
| Bitwise Operators | `<<` | Shifts the binary bits of a number to the left. |
| Bitwise Operators | `>>` | Shifts the binary bits of a number to the right. |
| Membership Operators | `in` | Checks whether a value exists in a sequence or collection. |
| Membership Operators | `not in` | Checks whether a value does not exist in a sequence or collection. |
| Identity Operators | `is` | Checks whether two variables refer to the same object in memory. |
| Identity Operators | `is not` | Checks whether two variables do not refer to the same object. |
| Conditional Statements | `if` | Executes a block of code when a condition is True. |
| Conditional Statements | `else` | Executes a block when the preceding condition is False. |
| Conditional Statements | `elif` | Checks another condition when previous conditions are False. |
| Conditional Statements | Nested `if` | Places one conditional statement inside another conditional statement. |
| Input & Conversion | `input()` | Reads input entered by the user as a string. |
| Input & Conversion | `int()` | Converts a value into an integer. |
| Input & Conversion | `bool()` | Converts a value into a Boolean value. |
| Loops | `for` | Iterates over elements of a sequence or iterable. |
| Loops | `while` | Repeatedly executes a block while a condition is True. |
| Loops | `range()` | Generates a sequence of numbers commonly used with loops. |
| Loop Control | `break` | Immediately terminates the current loop. |
| Loop Control | `continue` | Skips the current iteration and continues with the next iteration. |
| Loop Control | `else` with loop | Executes after a loop completes normally without encountering `break`. |
| Built-in Functions | `abs()` | Returns the absolute value of a number. |
| Built-in Functions | `round()` | Rounds a number to the specified number of decimal places. |
| Built-in Functions | `pow()` | Returns a number raised to a specified power. |
| Built-in Functions | `max()` | Returns the largest value from an iterable or arguments. |
| Built-in Functions | `min()` | Returns the smallest value from an iterable or arguments. |
| Built-in Functions | `sum()` | Returns the sum of elements in an iterable. |
| Built-in Functions | `len()` | Returns the number of elements or characters in an object. |
| Built-in Functions | `sorted()` | Returns a new sorted list from an iterable. |
| Built-in Functions | `enumerate()` | Returns index-value pairs while iterating over an iterable. |
| Built-in Functions | `chr()` | Converts an integer Unicode code point into its corresponding character. |
| Built-in Functions | `ord()` | Returns the Unicode code point of a character. |
| Built-in Functions | `bin()` | Converts an integer to its binary representation. |
| Built-in Functions | `oct()` | Converts an integer to its octal representation. |
| Built-in Functions | `hex()` | Converts an integer to its hexadecimal representation. |
| Built-in Functions | `all()` | Returns True if all elements or conditions are True. |
| Built-in Functions | `any()` | Returns True if at least one element or condition is True. |
| Built-in Functions | `help()` | Displays documentation and information about a Python object. |
| Built-in Functions | `dir()` | Returns a list of attributes and methods available for an object. |
| Built-in Functions | `isinstance()` | Checks whether an object belongs to a specified data type or class. |
| Math Module | `math.sqrt()` | Returns the square root of a number. |
| Math Module | `math.pow()` | Returns a number raised to a specified power as a floating-point value. |
| Math Module | `math.ceil()` | Rounds a number upward to the nearest integer. |
| Math Module | `math.floor()` | Rounds a number downward to the nearest integer. |
| Math Module | `math.factorial()` | Returns the factorial of a non-negative integer. |
| Math Module | `math.pi` | Provides the mathematical constant π. |
| Math Module | `math.log()` | Returns the natural logarithm of a number. |
| Math Module | `math.log2()` | Returns the base-2 logarithm of a number. |
| Math Module | `math.log10()` | Returns the base-10 logarithm of a number. |
| Math Module | `math.exp()` | Returns e raised to the given power. |
| Math Module | `math.fabs()` | Returns the absolute value of a number as a floating-point value. |
| Math Module | `math.fmod()` | Returns the floating-point remainder of division. |
| Math Module | `math.trunc()` | Removes the fractional part of a number and returns the integer portion. |
| User-defined Functions | `def` | Defines a function created by the programmer. |
| User-defined Functions | `return` | Sends a value or multiple values back from a function. |
| Function Arguments | Positional arguments | Passes arguments to parameters according to their position. |
| Function Arguments | Keyword arguments | Passes arguments by explicitly specifying parameter names. |
| Function Arguments | Default arguments | Provides a default value when an argument is not supplied. |
| Function Arguments | `*args` | Allows a function to accept any number of positional arguments. |
| Function Arguments | `**kwargs` | Allows a function to accept any number of keyword arguments. |
| Function Return | `return a, b` | Returns multiple values from a function as a tuple. |
| Lambda Functions | `lambda` | Creates a small anonymous function containing an expression. |
| Lambda Functions | `lambda x: x*x` | Creates a function that calculates the square of a value. |
| Lambda Functions | `lambda x: x % 2 == 0` | Creates a function that checks whether a value is even. |
| Lambda with sort | `lst.sort(key=lambda x: x[1])` | Sorts a list using a lambda function as the sorting key. |
| File Handling | `open()` | Opens a file in the specified mode for reading, writing, appending, or other operations. |
| File Handling | `file.read()` | Reads the entire file or a specified number of characters. |
| File Handling | `file.readline()` | Reads one line from the file. |
| File Handling | `file.readlines()` | Reads all lines from a file and returns them as a list. |
| File Handling | `file.write()` | Writes a string to a file. |
| File Handling | `file.close()` | Closes an opened file and releases its resources. |
| File Handling | `with open()` | Opens a file using a context manager that automatically closes the file. |
| File Modes | `r` | Opens a file for reading. |
| File Modes | `w` | Opens a file for writing and overwrites existing content. |
| File Modes | `a` | Opens a file for appending data at the end. |
| File Modes | `x` | Creates a new file and raises an error if it already exists. |
| File Modes | `rb` / `wb` | Opens a file for reading or writing in binary mode. |
| File Modes | `r+` / `w+` / `a+` | Opens a file for both reading and writing in the specified mode. |
| OS Module | `os.getcwd()` | Returns the current working directory. |
| OS Module | `os.chdir()` | Changes the current working directory. |
| OS Module | `os.listdir()` | Returns the files and folders in a directory. |
| OS Module | `os.mkdir()` | Creates a single directory. |
| OS Module | `os.makedirs()` | Creates a directory and any required parent directories. |
| OS Module | `os.rmdir()` | Removes a single empty directory. |
| OS Module | `os.removedirs()` | Removes nested empty directories. |
| OS Module | `os.remove()` | Deletes a file. |
| OS Module | `os.rename()` | Renames a file or directory. |
| OS Module | `os.path.exists()` | Checks whether a file or directory exists. |
| OS Module | `os.path.isfile()` | Checks whether the path refers to a file. |
| OS Module | `os.path.isdir()` | Checks whether the path refers to a directory. |
| OS Module | `os.environ.get()` | Retrieves the value of an environment variable. |
| Map / Filter | `map(func, iterable)` | Applies a function to each element of an iterable and returns the results. |
| Map / Filter | `filter(func, iterable)` | Returns elements from an iterable for which the function returns True. |
| Map / Filter | `list(map(lambda x: x*x, l1))` | Applies a lambda function to each element and converts the result to a list. |
| Map / Filter | `list(filter(lambda x: x >= 18, l1))` | Filters elements using a lambda condition and converts the result to a list. |

---

## DAY-4

| Category | Method / Operation | Description |
|----------|-------------------|-------------|
| **Array Module** | | |
| Array Creation | `from array import array` | Imports the array class from the array module. |
| Array Creation | `array('i', [10, 20, 30])` | Creates an integer array using type code `'i'`. |
| Array Type Codes | `'i'` / `'f'` / `'d'` / `'b'` | Type codes for Integer, Float, Double, and Signed Char respectively. |
| Array Methods | `numbers.append(50)` | Adds an element to the end of the array. |
| Array Methods | `numbers.insert(1, 15)` | Inserts an element at the specified index. |
| Array Methods | `numbers.remove(20)` | Removes the first occurrence of the specified value. |
| Array Methods | `numbers.pop(3)` | Removes and returns the element at the specified index. |
| Array Methods | `numbers.index(30)` | Returns the index of the first occurrence of the specified value. |
| Array Methods | `numbers.count(10)` | Returns the number of times a value occurs in the array. |
| Array Methods | `numbers.reverse()` | Reverses the order of elements in the array in place. |
| Array Methods | `a.extend(b)` | Extends the array by appending elements from another array. |
| Array Indexing | `numbers[0]` / `numbers[2:]` | Accesses or slices elements by index. |
| Array Functions | `len(numbers)` | Returns the number of elements in the array. |
| **Regular Expressions** | | |
| Regex Module | `import re` | Imports the regular expressions module. |
| Regex Functions | `re.match(pattern, text)` | Matches a pattern only at the beginning of the string. |
| Regex Functions | `re.search(pattern, text)` | Searches for a pattern anywhere in the string. |
| Regex Functions | `re.findall(pattern, text)` | Returns all non-overlapping matches as a list. |
| Regex Functions | `re.sub(pattern, repl, text)` | Replaces all occurrences of a pattern with the replacement string. |
| Regex Functions | `re.split(pattern, text)` | Splits a string by the occurrences of a pattern. |
| Regex Methods | `.group()` | Returns the matched string from a match object. |
| Regex Methods | `.span()` | Returns the start and end positions of the match. |
| Regex Patterns | `\d` / `\D` | Matches any digit / non-digit character. |
| Regex Patterns | `\w` / `\W` | Matches any word character / non-word character. |
| Regex Patterns | `\s` / `\S` | Matches any whitespace / non-whitespace character. |
| Regex Patterns | `+` / `*` / `?` | Matches 1+, 0+, or 0-1 occurrences respectively. |
| Regex Patterns | `^` / `$` | Matches start / end of string. |
| **JSON Module** | | |
| JSON Module | `import json` | Imports the JSON module. |
| JSON Functions | `json.dumps(obj, indent=4)` | Converts a Python object to a JSON formatted string. |
| JSON Functions | `json.loads(json_string)` | Parses a JSON string and returns a Python dictionary. |
| JSON Functions | `json.dump(obj, file)` | Writes a Python object as JSON to a file. |
| JSON Functions | `json.load(file)` | Reads JSON data from a file and returns a Python dictionary. |
| **DateTime Module** | | |
| DateTime Module | `from datetime import datetime` | Imports the datetime class. |
| DateTime Methods | `datetime.now()` | Returns the current local date and time. |
| DateTime Methods | `datetime.today()` | Returns the current local date and time. |
| DateTime Attributes | `.year` / `.month` / `.day` | Returns the year, month, or day from a datetime object. |
| DateTime Attributes | `.hour` / `.minute` / `.second` | Returns the hour, minute, or second from a datetime object. |
| DateTime Attributes | `.microsecond` | Returns the microsecond component. |
| DateTime Methods | `.weekday()` | Returns the day of the week as an integer (0 = Monday). |
| DateTime Methods | `.time()` | Returns only the time portion of a datetime object. |
| DateTime Methods | `.ctime()` | Returns a human-readable string representation of the date and time. |
| DateTime Methods | `.strftime(format)` | Converts a datetime object to a formatted string. |
| DateTime Methods | `datetime.strptime(string, format)` | Parses a date string into a datetime object using a format. |
| DateTime Format Codes | `%d` / `%m` / `%Y` / `%y` | Day, month, 4-digit year, 2-digit year. |
| DateTime Format Codes | `%H` / `%I` / `%M` / `%S` / `%p` | 24-hour, 12-hour, minute, second, AM/PM. |
| DateTime Format Codes | `%A` / `%a` / `%B` / `%b` | Full weekday, short weekday, full month, short month. |
| Date Difference | `date2 - date1` | Returns the difference between two dates as a timedelta object. |
| Date Difference | `.days` | Returns the number of days from a timedelta object. |
| Timedelta | `timedelta(days=10)` | Creates a duration representing a number of days. |
| Timedelta | `datetime.now() + timedelta(days=10)` | Adds a specified number of days to the current date. |
| Timedelta | `datetime.now() - timedelta(days=10)` | Subtracts a specified number of days from the current date. |
| **Collections Module** | | |
| Collections Module | `from collections import Counter` | Imports the Counter class. |
| Counter | `Counter(iterable)` | Counts the frequency of each element in an iterable. |
| Counter | `Counter("Python Programming")` | Counts the frequency of each character in a string. |
| Counter | `.most_common(n)` | Returns the n most frequently occurring elements. |
| Collections Module | `from collections import defaultdict` | Imports the defaultdict class. |
| defaultdict | `defaultdict(int)` | Creates a dictionary that returns a default value (0) for missing keys. |
| defaultdict | `defaultdict(list)` | Creates a dictionary that returns an empty list for missing keys. |
| Collections Module | `from collections import namedtuple` | Imports the namedtuple factory function. |
| namedtuple | `namedtuple("Name", ["field1", "field2"])` | Creates a tuple subclass with named fields for better readability. |
| Collections Module | `from collections import deque` | Imports the deque class. |
| deque | `deque(list)` | Creates a double-ended queue from a list. |
| deque Methods | `dq.append(x)` | Adds an element to the right end. |
| deque Methods | `dq.appendleft(x)` | Adds an element to the left end. |
| deque Methods | `dq.pop()` | Removes and returns an element from the right end. |
| deque Methods | `dq.popleft()` | Removes and returns an element from the left end. |
| Collections Module | `from collections import OrderedDict` | Imports the OrderedDict class. |
| OrderedDict | `OrderedDict()` | Creates a dictionary that preserves insertion order. |
| OrderedDict Methods | `.keys()` / `.values()` / `.items()` | Returns keys, values, or key-value pairs. |
| Collections Module | `from collections import ChainMap` | Imports the ChainMap class. |
| ChainMap | `ChainMap(dict1, dict2)` | Combines multiple dictionaries into a single searchable view. |
| **Iterators** | | |
| Iterators | `iter(iterable)` | Creates an iterator from an iterable. |
| Iterators | `next(iterator)` | Retrieves the next element from an iterator. |
| Iterators | `StopIteration` | Exception raised when an iterator is exhausted. |
| **Logging Module** | | |
| Logging Module | `import logging` | Imports the logging module. |
| Logging Config | `logging.basicConfig()` | Configures the logging system with level, format, and file. |
| Logging Levels | `logging.debug(msg)` | Logs a message with DEBUG level (severity 10). |
| Logging Levels | `logging.info(msg)` | Logs a message with INFO level (severity 20). |
| Logging Levels | `logging.warning(msg)` | Logs a message with WARNING level (severity 30). |
| Logging Levels | `logging.error(msg)` | Logs a message with ERROR level (severity 40). |
| Logging Levels | `logging.critical(msg)` | Logs a message with CRITICAL level (severity 50). |
| Logging Methods | `logging.getLogger(name)` | Creates or retrieves a named logger instance. |
| Logging Methods | `logger.setLevel(level)` | Sets the minimum severity level for a logger. |
| **Exception Handling** | | |
| Exception Handling | `try:` | Contains code that might raise an exception. |
| Exception Handling | `except ExceptionType as e:` | Catches and handles specific exceptions. |
| Exception Handling | `else:` | Executes only if no exception occurred in the try block. |
| Exception Handling | `finally:` | Always executes regardless of whether an exception occurred. |
| Exception Handling | `raise ExceptionName(msg)` | Manually raises an exception with a message. |
| Exception Types | `ZeroDivisionError` | Raised when dividing by zero. |
| Exception Types | `ValueError` | Raised when a function receives an argument of the wrong type. |
| Exception Types | `NameError` | Raised when a variable is not defined. |
| Exception Types | `FileNotFoundError` | Raised when a file or directory is not found. |
| Exception Types | `IndexError` | Raised when a list index is out of range. |
| Exception Types | `TypeError` | Raised when an operation is applied to an incompatible type. |
| Exception Types | `StopIteration` | Raised when an iterator has no more elements. |
| Custom Exceptions | `class MyError(Exception): pass` | Creates a user-defined exception class. |

---

## CLASS (OOP)

| Category | Method / Operation | Description |
|----------|-------------------|-------------|
| Class Definition | `class ClassName:` | Defines a new class. |
| Class Definition | `pass` | Placeholder for an empty class body. |
| Object Creation | `obj = ClassName()` | Creates a new instance (object) of a class. |
| Constructor | `def __init__(self, ...):` | Initializes object attributes when an instance is created. |
| Instance Method | `def method_name(self):` | A function defined inside a class that operates on instance data. |
| Class Variable | `brand = "Toyota"` | A variable shared by all instances of the class. |
| Instance Variable | `self.model = model` | A variable unique to each instance of the class. |
| Local Variable | `color = "Red"` (inside method) | A variable accessible only within the method it is defined in. |
| Attribute Access | `obj.attribute` | Accesses an attribute of an object. |
| Method Call | `obj.method()` | Calls a method on an object. |
| Public Variable | `self.color = "Red"` | An attribute accessible from anywhere without restriction. |
| Protected Variable | `self._engine = "Petrol"` | An attribute intended for internal use within the class and its subclasses. |
| Private Variable | `self.__price = 10000` | An attribute restricted to access only within the class. |
| Name Mangling | `obj._ClassName__price` | Accesses a private attribute using Python's internal name mangling. |
| Getter Method | `def get_price(self):` | A method that returns the value of a private attribute. |
| Setter Method | `def set_price(self, value):` | A method that modifies the value of a private attribute. |
| Inheritance | `class Child(Parent):` | Creates a new class that inherits attributes and methods from an existing class. |
| Super | `super().__init__(args)` | Calls the constructor or method of the parent class. |
| Single Inheritance | `class BMW(Car):` | A child class inherits from one parent class. |
| Multilevel Inheritance | `Vehicle → Car → BMW` | A class inherits from a class that already inherits from another class. |
| Multiple Inheritance | `class SmartCar(Engine, GPS):` | A class inherits from two or more parent classes. |
| Hierarchical Inheritance | `Car → BMW, Audi, Tesla` | Multiple child classes inherit from one parent class. |
| Method Overriding | `def start(self):` in child | A child class provides its own implementation of a method defined in the parent class. |
| Polymorphism | `for car in cars: car.start()` | The same method name behaves differently depending on the object type. |
| Method Overloading | `def add(self, a, b, c=0):` | Simulates overloading using default parameter values. |
| Encapsulation | Private variable + getter/setter | Binds data and methods into a single unit and restricts direct access. |
| Object Identity | `c1 is c2` | Checks whether two variables refer to the same object instance. |

---

## NUMPY

| Category | Method / Operation | Description |
|----------|-------------------|-------------|
| Import | `import numpy as np` | Imports the NumPy library. |
| **Array Creation** | | |
| Array Creation | `np.array([10, 20, 30])` | Creates a 1D NumPy array from a list. |
| Array Creation | `np.array([[10,20],[30,40]])` | Creates a 2D NumPy array (matrix) from nested lists. |
| Array Creation | `np.arange(start, stop, step)` | Creates an array with evenly spaced values within a range. |
| Array Creation | `np.zeros(shape)` | Creates an array filled with zeros. |
| Array Creation | `np.ones(shape)` | Creates an array filled with ones. |
| Array Creation | `np.full(shape, value)` | Creates an array filled with a specified constant value. |
| Array Creation | `np.eye(n)` | Creates an n×n identity matrix. |
| Array Creation | `np.linspace(start, stop, num)` | Creates an array of evenly spaced numbers over a specified interval. |
| Random | `np.random.rand(shape)` | Creates an array of random floats between 0 and 1. |
| Random | `np.random.randint(low, high, size)` | Creates an array of random integers within a range. |
| Random | `np.random.randn(n)` | Creates an array of random numbers from a standard normal distribution. |
| **Array Attributes** | | |
| Attributes | `arr.ndim` | Returns the number of dimensions of the array. |
| Attributes | `arr.shape` | Returns the shape of the array as a tuple. |
| Attributes | `arr.size` | Returns the total number of elements in the array. |
| Attributes | `arr.dtype` | Returns the data type of the elements in the array. |
| **Indexing & Slicing** | | |
| Indexing | `arr[2]` | Accesses the element at index 2. |
| Slicing | `arr[2:4]` | Returns elements from index 2 up to, but not including, index 4. |
| Slicing | `arr[::-1]` | Returns the array in reverse order. |
| 2D Indexing | `matrix[0, 1]` | Accesses the element at row 0, column 1 of a 2D array. |
| 2D Slicing | `matrix[:2, 1:]` | Returns a sub-matrix using row and column slices. |
| **Reshaping & Stacking** | | |
| Reshaping | `arr.reshape(rows, cols)` | Returns a new array with the same data but a different shape. |
| Reshaping | `arr.flatten()` | Returns a 1D copy of a multi-dimensional array. |
| Stacking | `np.vstack((a, b))` | Stacks arrays vertically (row-wise). |
| Stacking | `np.hstack((a, b))` | Stacks arrays horizontally (column-wise). |
| Splitting | `np.split(arr, n)` | Splits an array into n equal parts. |
| **Arithmetic Operations** | | |
| Arithmetic | `a + b` / `np.add(a, b)` | Performs element-wise addition on two arrays. |
| Arithmetic | `a - b` | Performs element-wise subtraction on two arrays. |
| Arithmetic | `a * b` | Performs element-wise multiplication on two arrays. |
| Arithmetic | `a / b` | Performs element-wise division on two arrays. |
| Arithmetic | `a ** 2` | Performs element-wise exponentiation. |
| Broadcasting | `matrix + scalar` | Applies an operation between arrays of different shapes. |
| **Math & Statistics** | | |
| Math | `np.sqrt(arr)` | Returns the element-wise square root. |
| Math | `np.abs(arr)` | Returns the element-wise absolute value. |
| Math | `np.log(arr)` | Returns the element-wise natural logarithm. |
| Math | `np.mod(a, b)` / `np.fmod(a, b)` | Returns the element-wise remainder of division. |
| Statistics | `arr.sum()` | Returns the sum of all elements. |
| Statistics | `arr.mean()` | Returns the arithmetic mean of elements. |
| Statistics | `arr.std()` | Returns the standard deviation of elements. |
| Statistics | `arr.min()` / `arr.max()` | Returns the minimum or maximum element. |
| Statistics | `np.argmin(arr)` | Returns the index of the minimum element. |
| Statistics | `np.argmax(arr)` | Returns the index of the maximum element. |
| **Sorting & Searching** | | |
| Sorting | `np.sort(arr)` | Returns a sorted copy of the array. |
| Searching | `np.where(condition, x, y)` | Returns elements chosen from x or y depending on condition. |
| Searching | `np.isin(arr, values)` | Tests whether each element is contained in a given list of values. |
| **Boolean Operations** | | |
| Boolean | `np.all(condition)` | Returns True if all elements satisfy the condition. |
| Boolean | `np.any(condition)` | Returns True if any element satisfies the condition. |
| **NaN Handling** | | |
| NaN | `np.nan` | Represents a missing or undefined numerical value. |
| NaN | `np.isnan(arr)` | Returns a Boolean array indicating which elements are NaN. |
| NaN | `np.nanmean(arr)` | Returns the mean of elements, ignoring NaN values. |
| NaN | `np.nansum(arr)` | Returns the sum of elements, ignoring NaN values. |
| NaN | `np.nanmin(arr)` / `np.nanmax(arr)` | Returns the min or max, ignoring NaN values. |
| NaN | `np.nanstd(arr)` | Returns the standard deviation, ignoring NaN values. |

---

## PANDAS

| Category | Method / Operation | Description |
|----------|-------------------|-------------|
| Import | `import pandas as pd` | Imports the Pandas library. |
| **Data Creation** | | |
| Series | `pd.Series(data, index)` | Creates a one-dimensional labeled array. |
| Series | `pd.Series(dict)` | Creates a Series from a dictionary. |
| DataFrame | `pd.DataFrame(data, index, columns)` | Creates a two-dimensional labeled table from a dictionary or matrix. |
| Date Range | `pd.date_range(start, periods)` | Generates a sequence of dates. |
| **Reading Data** | | |
| File I/O | `pd.read_csv(path)` | Reads data from a CSV file into a DataFrame. |
| File I/O | `pd.read_excel(path)` | Reads data from an Excel file into a DataFrame. |
| File I/O | `pd.read_json(path)` | Reads data from a JSON file into a DataFrame. |
| File I/O | `pd.read_html(url)` | Reads HTML tables from a URL into a list of DataFrames. |
| File I/O | `pd.read_parquet(path)` | Reads data from a Parquet file into a DataFrame. |
| File I/O | `pd.read_clipboard()` | Reads data from the system clipboard into a DataFrame. |
| **Writing Data** | | |
| File I/O | `df.to_csv(path)` | Writes a DataFrame to a CSV file. |
| File I/O | `df.to_excel(path)` | Writes a DataFrame to an Excel file. |
| File I/O | `df.to_json(path)` | Writes a DataFrame to a JSON file. |
| File I/O | `df.to_html(path)` | Writes a DataFrame to an HTML file. |
| File I/O | `df.to_parquet(path)` | Writes a DataFrame to a Parquet file. |
| File I/O | `df.to_clipboard()` | Copies a DataFrame to the system clipboard. |
| **Inspection** | | |
| Inspection | `df.head(n)` | Returns the first n rows of the DataFrame. |
| Inspection | `df.tail(n)` | Returns the last n rows of the DataFrame. |
| Inspection | `df.info()` | Displays a concise summary of the DataFrame including column types and non-null counts. |
| Inspection | `df.describe()` | Generates descriptive statistics (count, mean, std, min, quartiles, max). |
| Inspection | `df.shape` | Returns the dimensions of the DataFrame as a tuple (rows, columns). |
| Inspection | `df.dtypes` | Returns the data type of each column. |
| Inspection | `df.ndim` | Returns the number of dimensions of the DataFrame. |
| Inspection | `df.values` | Returns the underlying data as a NumPy array. |
| Inspection | `df.index` | Returns the row labels of the DataFrame. |
| **Selection & Indexing** | | |
| Selection | `df['column']` | Selects a single column by name. |
| Selection | `df[['col1', 'col2']]` | Selects multiple columns by name. |
| Label-based | `df.loc[row_label]` | Accesses a row or group of rows by label. |
| Label-based | `df.loc[rows, cols]` | Accesses specific rows and columns by label. |
| Position-based | `df.iloc[row_index]` | Accesses a row or group of rows by integer position. |
| Position-based | `df.iloc[r1:r2, c1:c2]` | Accesses rows and columns by integer position range. |
| **Filtering** | | |
| Filtering | `df[df['col'] > value]` | Filters rows where a column meets a condition. |
| Filtering | `df[df['col'].isin(list)]` | Filters rows where a column value is in a given list. |
| Filtering | `df.query("condition")` | Filters rows using a SQL-style query string. |
| Filtering | `df[df['col'].str.startswith('A')]` | Filters rows where a string column starts with a value. |
| Filtering | `df[df['col'].str.endswith('n')]` | Filters rows where a string column ends with a value. |
| Filtering | `df[df['col'].between(a, b)]` | Filters rows where a column value falls within a range. |
| Filtering | `df[df['col'].isnull()]` | Filters rows where a column contains null values. |
| Filtering | `df[df['col'].notnull()]` | Filters rows where a column does not contain null values. |
| **Sorting** | | |
| Sorting | `df.sort_values(by='col')` | Sorts the DataFrame by the values of a column in ascending order. |
| Sorting | `df.sort_values(by='col', ascending=False)` | Sorts the DataFrame by a column in descending order. |
| Sorting | `df.sort_values(by=['a','b'], ascending=[True,False])` | Sorts by multiple columns with different sort orders. |
| Sorting | `df.sort_values(by='col', na_position='first')` | Sorts and places null values at the beginning. |
| Sorting | `df.sort_values(by='col', inplace=True)` | Sorts the DataFrame in place without returning a new one. |
| Sorting | `df.sort_index()` | Sorts the DataFrame by its index labels. |
| **Modifying** | | |
| Modifying | `df.drop('col', axis=1)` | Removes a column from the DataFrame. |
| Modifying | `df.drop(index)` | Removes a row by its index label. |
| Modifying | `df.drop(..., inplace=True)` | Removes a row or column and modifies the DataFrame in place. |
| Modifying | `df.reset_index()` | Resets the index to the default integer index. |
| Modifying | `df.set_index('col')` | Sets a column as the new row index. |
| Modifying | `df['col'].apply(func)` | Applies a function to each element of a column. |
| Modifying | `df.round(n)` | Rounds all numeric values to n decimal places. |
| **Missing Data** | | |
| Missing Data | `df.isnull()` | Returns a Boolean DataFrame indicating where values are null. |
| Missing Data | `df.isnull().sum()` | Returns the count of null values per column. |
| Missing Data | `df.isnull().values.any()` | Checks whether any null value exists in the entire DataFrame. |
| Missing Data | `df.notnull()` | Returns a Boolean DataFrame indicating where values are not null. |
| Missing Data | `pd.isnull(value)` | Checks whether a single value is null. |
| Missing Data | `df.dropna()` | Removes rows containing any null values. |
| Missing Data | `df.dropna(how='all')` | Removes rows where all values are null. |
| Missing Data | `df.dropna(thresh=n)` | Keeps rows that have at least n non-null values. |
| Missing Data | `df.dropna(axis=1)` | Removes columns containing any null values. |
| Missing Data | `df.fillna(value)` | Replaces null values with a specified constant. |
| Missing Data | `df['col'].fillna(df['col'].mean())` | Replaces null values in a column with the column mean. |
| Missing Data | `df.fillna(method='ffill')` | Fills null values using the previous row's value (forward fill). |
| Missing Data | `df.fillna(method='bfill')` | Fills null values using the next row's value (backward fill). |
| **Aggregation & Grouping** | | |
| Grouping | `df.groupby('col')` | Groups the DataFrame by the values of a column. |
| Grouping | `.agg(['sum', 'mean', 'max', 'min'])` | Applies multiple aggregate functions to grouped data. |
| Aggregation | `.sum()` / `.mean()` | Returns the sum or mean of grouped values. |
| Aggregation | `.min()` / `.max()` | Returns the minimum or maximum of grouped values. |
| Aggregation | `.count()` | Returns the count of non-null values per group. |
| Aggregation | `df['col'].idxmax()` | Returns the index of the maximum value in a column. |
| Aggregation | `df['col'].idxmin()` | Returns the index of the minimum value in a column. |
| Aggregation | `df['col'].value_counts()` | Returns the frequency count of unique values in a column. |
| Aggregation | `df['col'].unique()` | Returns an array of unique values in a column. |
| **Duplicates** | | |
| Duplicates | `df.drop_duplicates()` | Removes duplicate rows from the DataFrame. |
| Duplicates | `df.drop_duplicates(subset='col')` | Removes duplicates based on a specific column. |
| Duplicates | `df.drop_duplicates(keep='last')` | Keeps the last occurrence of each duplicate. |
| Duplicates | `df.drop_duplicates(keep=False)` | Removes all occurrences of duplicate rows. |
| **Combining DataFrames** | | |
| Combining | `pd.concat([df1, df2])` | Concatenates DataFrames vertically (stacks rows). |
| Combining | `pd.concat([df1, df2], axis=1)` | Concatenates DataFrames horizontally (stacks columns). |
| Combining | `pd.merge(df1, df2, on='col')` | Merges two DataFrames on a common column (SQL-style join). |
| Combining | `pd.merge(df1, df2, how='inner')` | Performs an inner join keeping only matching rows. |
| Combining | `pd.merge(df1, df2, how='left')` | Performs a left join keeping all rows from the left DataFrame. |
| **Plotting** | | |
| Plotting | `df.plot()` | Creates a line plot of the DataFrame columns. |
| Plotting | `df.plot.bar()` | Creates a bar chart. |
| Plotting | `df.plot.hist()` | Creates a histogram. |
| Plotting | `df.plot.scatter(x, y)` | Creates a scatter plot using two columns. |
| Plotting | `df.plot.pie(y)` | Creates a pie chart from a column. |
| Plotting | `df.plot.area()` | Creates an area chart. |

---

<div align="center">

![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)
![NumPy](https://img.shields.io/badge/NumPy-013243?style=flat-square&logo=numpy&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=flat-square&logo=pandas&logoColor=white)

**All methods extracted from: `Class.ipynb` · `day1` · `day2` · `day3` · `day4` · `Numpy.ipynb` · `Pandas.ipynb`**

</div>
