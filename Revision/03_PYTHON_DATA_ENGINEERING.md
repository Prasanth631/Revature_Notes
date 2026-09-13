# 03 — Python for Data Engineering

> **Primary focus:** Python is treated as a data-engineering skill, not merely a programming-language topic.

## Part A — Curriculum Notes

### Python fundamentals
- Python is high-level, readable, dynamically typed and supports multiple programming styles.
- Know syntax, variables/types, operators, strings, collections, control flow and functions.
- Understand namespaces, LEGB scope, modules, iterators and exceptions.
- Know files, JSON, regex, logging, pip, Pylint and testing.
- Know NumPy, Matplotlib, Pandas and the collections module at interview level.

### Python data-engineering mindset
- Use Python to ingest data from files/APIs/databases, validate records, transform data and automate workflows.
- Prefer reusable functions, modules, logging, tests and controlled exception handling in production pipelines.
- Use generators/iterators when data should be processed lazily.
- Use Pandas for appropriate local tabular workloads and PySpark when distributed processing is required.
- Be explicit about data types, timestamps, nulls, malformed records and idempotent processing.

### High-value Python code patterns
```python
# safe file handling
with open("data.txt", "r", encoding="utf-8") as f:
    for line in f:
        process(line)

# JSON
import json
record = json.loads(payload)

# exception handling
try:
    value = int(raw_value)
except ValueError:
    # quarantine / handle invalid data
    pass

# frequency
from collections import Counter
counts = Counter(error_codes)
```


# Part B — Full Interview Q&A

# 03 — Python Full Interview Q&A

> **Purpose:** Interview preparation based on the complete Python curriculum list supplied by the user. Every curriculum topic has direct questions, detailed interview-oriented answers, examples, an interview point, and a scenario question.

> **Format:** Question → Answer → Example → Interview Point → Scenario.

## Topic 1: Full-stack overview

### 1. What is full-stack development?

**Answer:**
Full-stack development refers to working across the major layers of an application, such as frontend, backend, database, APIs and deployment. A full-stack view helps a developer understand how data and requests travel through the system.

**Example / Interview Point:**
Interview Point: A full-stack system connects user interface → backend/API → data store → deployment/infrastructure.

### 2. Where does Python fit in a full-stack/data-engineering environment?

**Answer:**
Python can implement backend services and automation, but in data engineering it is especially common for ingestion, transformation, testing, orchestration and analytics. It can communicate with databases, APIs and distributed processing frameworks.

**Example / Interview Point:**
Interview Point: Python is not limited to web development; it is a major data-engineering language.

### Scenario 3. A data application has a UI, API, database and reporting layer. Explain where Python could be used and how data would move across the layers.

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 2: Interpreter vs compiler

### 4. What is the difference between an interpreter and a compiler?

**Answer:**
A compiler translates source code before execution, while an interpreter/runtime executes instructions through a runtime environment. Modern language implementations can combine these ideas. Python source is commonly compiled to bytecode and then executed by the Python runtime.

**Example / Interview Point:**
Interview Point: Avoid saying Python is '100% interpreted'; Python uses bytecode compilation plus runtime execution.

### 5. Is Python interpreted or compiled?

**Answer:**
The interview-safe answer is: Python source is compiled to bytecode by the implementation and that bytecode is executed by the Python runtime. The exact implementation details can vary.

**Example / Interview Point:**
Interview Point: Python is commonly described as interpreted because of its runtime model, but the simplified label hides bytecode compilation.

### Scenario 6. A teammate says 'Python is interpreted, so there is no compilation.' Correct the statement in an interview-safe way.

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 3: REPL/Jupyter

### 7. What is REPL?

**Answer:**
REPL stands for Read-Eval-Print Loop. It repeatedly reads code, evaluates it, displays the result and waits for the next input.

**Example / Interview Point:**
Example: `>>> 2 + 3` returns `5`.

**Example / Interview Point:**
Interview Point: REPL is useful for quick experiments.

### 8. What is Jupyter Notebook?

**Answer:**
Jupyter Notebook is an interactive environment where code cells, output, Markdown and visualizations can be kept together. It is widely used for exploration and data analysis.

**Example / Interview Point:**
Example: run a Pandas transformation in one cell and inspect a chart in the next.

**Example / Interview Point:**
Interview Point: Jupyter supports interactive, exploratory development.

### Scenario 9. You want to test a five-line transformation before putting it into a pipeline. Which environment would you use and why?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 4: What is Python & why Python

### 10. What is Python?

**Answer:**
Python is a high-level, general-purpose programming language with readable syntax and a large ecosystem. It supports multiple programming styles and is widely used in automation, web development, analytics and data engineering.

**Example / Interview Point:**
Interview Point: Python = readable, productive, general-purpose language.

### 11. Why is Python popular in data engineering?

**Answer:**
Python has mature libraries and integrations for data processing, Spark, databases, cloud services, testing and automation. Its concise syntax also makes pipeline logic relatively easy to develop and maintain.

**Example / Interview Point:**
Interview Point: readability + ecosystem + data tooling are key reasons.

### Scenario 12. Your interviewer asks why the team should use Python for a data-engineering utility instead of a different language. Give a balanced answer.

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 5: Syntax

### 13. What is Python syntax?

**Answer:**
Python syntax is the set of rules that defines valid Python programs. One important feature is significant indentation: indentation normally defines blocks for if statements, loops, functions and classes.

**Example / Interview Point:**
Example: `if x > 0:\n    print(x)`

**Example / Interview Point:**
Interview Point: indentation is syntactically meaningful.

### 14. Why is indentation important in Python?

**Answer:**
Python uses indentation to determine the beginning and end of code blocks. Inconsistent indentation can produce syntax or indentation errors.

**Example / Interview Point:**
Interview Point: Python avoids braces for normal block structure.

### Scenario 15. A Python script raises an indentation error after an if statement. Explain the likely cause and fix.

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 6: Comments

### 16. What are comments in Python?

**Answer:**
Comments are notes for human readers and are not executed as normal Python statements. A single-line comment starts with `#`.

**Example / Interview Point:**
Example: `# validate order_id before loading`

**Example / Interview Point:**
Interview Point: comments should explain intent, not obvious syntax.

### 17. What is the difference between a comment and a docstring?

**Answer:**
A comment is explanatory text ignored by the program, while a docstring is a string associated with a module, class or function and can be inspected as documentation.

**Example / Interview Point:**
Interview Point: use docstrings to document reusable program elements.

### Scenario 18. You review a file containing comments that merely repeat every line of code. What would you improve?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 7: Variables and datatypes

### 19. What is a variable in Python?

**Answer:**
A variable is a name bound to an object. Python does not require a fixed type declaration for the variable name, so the same name can later reference another type of object.

**Example / Interview Point:**
Example: `x = 10; x = 'ten'`

**Example / Interview Point:**
Interview Point: Python is dynamically typed.

### 20. What are common Python data types?

**Answer:**
Common built-in types include int, float, complex, bool, str, list, tuple, set, dict, bytes and NoneType.

**Example / Interview Point:**
Interview Point: know both scalar types and collection types.

### Scenario 21. A CSV column arrives as text but must be compared numerically. Explain the type problem and your approach.

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 8: Operators

### 22. What are the major types of operators in Python?

**Answer:**
Arithmetic, comparison, logical, assignment, membership and identity operators are common categories. Examples include `+`, `==`, `and`, `in` and `is`.

**Example / Interview Point:**
Interview Point: operator categories matter more than memorizing isolated symbols.

### 23. What is the difference between == and is?

**Answer:**
`==` checks value equality, while `is` checks object identity. Use `is None` for the standard None check.

**Example / Interview Point:**
Example: `a=[1]; b=[1]; a == b` is True while `a is b` is normally False.

**Example / Interview Point:**
Interview Point: equality ≠ identity.

### Scenario 24. A developer uses `is` instead of `==` to compare two strings. Explain the risk.

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 9: User input/output

### 25. What does input() return?

**Answer:**
`input()` reads a line from standard input and returns it as a string. Convert it when a numeric or other type is required.

**Example / Interview Point:**
Example: `age = int(input('Age: '))`

**Example / Interview Point:**
Interview Point: input() returns str.

### 26. How does print() work?

**Answer:**
`print()` writes values to standard output and supports separators, endings and formatted strings.

**Example / Interview Point:**
Example: `print(f'Total = {total}')`

**Example / Interview Point:**
Interview Point: use f-strings for readable formatting.

### Scenario 27. A value read with input() is causing a TypeError during addition. Diagnose it.

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 10: Namespaces

### 28. What is a namespace?

**Answer:**
A namespace is a mapping between names and objects. Python has namespaces associated with scopes such as local, enclosing, global and built-in contexts.

**Example / Interview Point:**
Interview Point: namespaces prevent unrelated names from colliding.

### 29. What is LEGB?

**Answer:**
LEGB is the usual name lookup order: Local, Enclosing, Global, Built-in. Python searches these scopes in that order when resolving a name.

**Example / Interview Point:**
Interview Point: LEGB explains many scope-related interview questions.

### Scenario 30. A function unexpectedly uses a global variable instead of its local value. Explain LEGB and how you would debug it.

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 11: Strings

### 31. What is a string in Python?

**Answer:**
A string (`str`) is an immutable sequence of Unicode characters. It supports indexing, slicing and many text-processing methods.

**Example / Interview Point:**
Example: `text='Python'; text[1:4]` gives `'yth'`.

**Example / Interview Point:**
Interview Point: strings are immutable.

### 32. How do you split and join strings?

**Answer:**
`split()` converts text into a list using a separator; `join()` combines strings using a separator.

**Example / Interview Point:**
Example: `'a,b,c'.split(',')` and `'-'.join(['a','b'])`.

**Example / Interview Point:**
Interview Point: split = string → list; join = strings → string.

### Scenario 33. A pipeline receives filenames with extra spaces and inconsistent case. Which string operations could normalize them?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 12: Sets

### 34. What is a set?

**Answer:**
A set is an unordered collection of unique hashable elements. It is useful for removing duplicates and fast membership-style operations.

**Example / Interview Point:**
Example: `set([1,1,2])` produces `{1,2}`.

**Example / Interview Point:**
Interview Point: uniqueness is the key property.

### 35. What are common set operations?

**Answer:**
Union combines elements, intersection keeps common elements, difference removes elements present in another set, and symmetric difference keeps elements present in exactly one set.

**Example / Interview Point:**
Interview Point: sets are useful for deduplication and comparisons.

### Scenario 36. You need to find IDs present in today's file but not yesterday's file. Which collection operation is useful?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 13: Casting

### 37. What is type casting in Python?

**Answer:**
Type casting/conversion creates a value in another type, such as converting text to an integer with `int()` or text to a float with `float()`.

**Example / Interview Point:**
Example: `int('100')` → `100`.

**Example / Interview Point:**
Interview Point: conversion can raise an exception if the input is incompatible.

### 38. When is casting important in data engineering?

**Answer:**
External data often arrives as strings, especially from files, APIs or user input. Explicit conversion ensures calculations and comparisons use the intended types.

**Example / Interview Point:**
Interview Point: validate before casting when source data is unreliable.

### Scenario 39. A source contains the value 'N/A' in a numeric column. How would you avoid a pipeline crash during conversion?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 14: Boolean

### 40. What is a Boolean in Python?

**Answer:**
`bool` represents `True` or `False`. Boolean expressions are used in conditions, filters and validation logic.

**Example / Interview Point:**
Example: `is_valid = amount >= 0`.

**Example / Interview Point:**
Interview Point: Boolean values drive control flow.

### 41. What values are falsey in Python?

**Answer:**
Common falsey values include `False`, `None`, numeric zero, and empty strings/collections. Other objects are generally truthy unless their truth-value behavior says otherwise.

**Example / Interview Point:**
Interview Point: falsey is broader than just False.

### Scenario 42. A filter treats an empty string and None the same way. Explain truth-value testing and whether that is always appropriate.

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 15: Lists

### 43. What is a list?

**Answer:**
A list is an ordered, mutable collection that allows duplicates. It supports indexing, slicing and operations such as append, insert, remove and pop.

**Example / Interview Point:**
Example: `items=[1,2]; items.append(3)`.

**Example / Interview Point:**
Interview Point: list = ordered + mutable.

### 44. List vs tuple?

**Answer:**
Both are ordered sequences, but lists are mutable while tuples are immutable. Use a list when the collection changes and a tuple when it represents a fixed grouping.

**Example / Interview Point:**
Interview Point: mutability is the primary distinction.

### Scenario 45. A list is being modified while it is being iterated. What problems can this cause and how would you redesign it?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 16: Tuples

### 46. What is a tuple?

**Answer:**
A tuple is an ordered, immutable sequence. It is useful for fixed groups of values and supports unpacking.

**Example / Interview Point:**
Example: `x,y = (10,20)`.

**Example / Interview Point:**
Interview Point: tuple = ordered + immutable.

### 47. Can a tuple contain a list?

**Answer:**
Yes. The tuple itself cannot replace its elements, but an element that is a mutable object can still be modified.

**Example / Interview Point:**
Interview Point: tuple immutability does not make nested mutable objects immutable.

### Scenario 48. A fixed pair of coordinates should not be reassigned. Would you choose list or tuple and why?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 17: Range

### 49. What is range()?

**Answer:**
`range()` represents a sequence of integers commonly used in loops. The stop value is excluded.

**Example / Interview Point:**
Example: `list(range(1,5))` → `[1,2,3,4]`.

**Example / Interview Point:**
Interview Point: stop is exclusive.

### 50. Can range() count backwards?

**Answer:**
Yes. Supply a negative step, such as `range(5,0,-1)`.

**Example / Interview Point:**
Interview Point: range(start, stop, step).

### Scenario 51. A loop intended to process 1 through 5 processes only 1 through 4. Explain the range boundary.

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 18: Binary type

### 52. What is bytes in Python?

**Answer:**
`bytes` represents immutable binary data. It is commonly used for files, network data and encoded text.

**Example / Interview Point:**
Example: `b'hello'`.

**Example / Interview Point:**
Interview Point: bytes is binary data, not normal text.

### 53. bytes vs bytearray?

**Answer:**
Both represent binary data, but bytes is immutable while bytearray is mutable.

**Example / Interview Point:**
Interview Point: choose bytearray when in-place modification of binary data is needed.

### Scenario 54. An API returns bytes but your parser expects text. What conversion is required and what must you know first?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 19: None type

### 55. What is None in Python?

**Answer:**
None represents the absence of a value or no meaningful result. It is a singleton object of type NoneType.

**Example / Interview Point:**
Example: `result = None`.

**Example / Interview Point:**
Interview Point: None is not 0 or False.

### 56. How should you check for None?

**Answer:**
Use identity: `if value is None:`. This expresses that the object is the None singleton.

**Example / Interview Point:**
Interview Point: prefer `is None` over `== None`.

### Scenario 57. A database lookup returns None and the code calls `.upper()` on it. How would you prevent the error?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 20: Dictionaries

### 58. What is a dictionary?

**Answer:**
A dictionary stores key-value pairs and provides key-based lookup. Keys must be hashable.

**Example / Interview Point:**
Example: `employee={'id':101,'name':'A'}`.

**Example / Interview Point:**
Interview Point: dict = key → value mapping.

### 59. What is the difference between get() and [] for dictionaries?

**Answer:**
`d[key]` raises KeyError when the key is absent; `d.get(key)` can return None or a supplied default instead.

**Example / Interview Point:**
Interview Point: use get() when missing keys are expected.

### Scenario 60. A dictionary lookup fails with KeyError for optional data. How could get() improve the code?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 21: Numbers

### 61. What numeric types are common in Python?

**Answer:**
Common numeric types are int, float and complex. Python integers support arbitrary precision within practical memory limits.

**Example / Interview Point:**
Interview Point: know integer and floating-point behavior.

### 62. Why can float arithmetic be surprising?

**Answer:**
Binary floating-point cannot represent every decimal fraction exactly, so calculations such as 0.1 + 0.2 may not equal exactly 0.3.

**Example / Interview Point:**
Interview Point: use Decimal when exact decimal arithmetic is required.

### Scenario 63. A financial calculation shows a tiny rounding difference. Explain why float can cause this and what you would consider.

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 22: Datetime

### 64. How does Python handle dates and times?

**Answer:**
The datetime module provides date, time, datetime and timedelta types. datetime values can be timezone-naive or timezone-aware.

**Example / Interview Point:**
Interview Point: know date vs datetime and timezone awareness.

### 65. What are strftime() and strptime()?

**Answer:**
`strftime()` formats a date/time as a string; `strptime()` parses a string into a date/time using a specified format.

**Example / Interview Point:**
Example: `datetime.strptime('2026-09-13','%Y-%m-%d')`.

**Example / Interview Point:**
Interview Point: format vs parse.

### Scenario 66. Two systems exchange timestamps but disagree around time zones. What should your Python code consider?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 23: If-else

### 67. How does if-elif-else work?

**Answer:**
`if` checks the first condition, `elif` checks additional conditions if earlier ones failed, and `else` handles the remaining case.

**Example / Interview Point:**
Example: `if score>=90: grade='A' ...`.

**Example / Interview Point:**
Interview Point: conditions are evaluated in order.

### 68. How would you validate a data-quality rule with if?

**Answer:**
Use a condition to classify or reject invalid data, for example `if amount < 0: raise ValueError(...)`.

**Example / Interview Point:**
Interview Point: combine control flow with validation, but keep rules readable.

### Scenario 69. A data-quality rule has many nested if statements and is difficult to read. How would you improve it?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 24: For loop

### 70. What is a for loop in Python?

**Answer:**
A for loop iterates over an iterable and assigns each produced value to the loop variable.

**Example / Interview Point:**
Example: `for name in names: print(name)`.

**Example / Interview Point:**
Interview Point: Python for loops are iterable-driven.

### 71. How do break and continue work?

**Answer:**
`break` exits the loop completely; `continue` skips the rest of the current iteration and moves to the next one.

**Example / Interview Point:**
Interview Point: know the difference in control flow.

### Scenario 72. You need both row number and value while iterating through a list. Which built-in is appropriate?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 25: While loop

### 73. When would you use a while loop?

**Answer:**
Use while when repetition depends on a condition and the number of iterations is not necessarily known in advance.

**Example / Interview Point:**
Example: retry while `attempt < 3`.

**Example / Interview Point:**
Interview Point: update state so the loop can terminate.

### 74. What is an infinite loop?

**Answer:**
An infinite loop is a loop whose condition never becomes false and which does not exit through another mechanism such as break.

**Example / Interview Point:**
Interview Point: always identify the termination condition.

### Scenario 75. A retry loop never ends when a service is unavailable. What termination controls should be added?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 26: Functions

### 76. What is a function?

**Answer:**
A function is a reusable block of logic that can receive inputs and return outputs. It improves reuse, testing and readability.

**Example / Interview Point:**
Example: `def add(a,b): return a+b`.

**Example / Interview Point:**
Interview Point: clear inputs and outputs make functions easier to test.

### 77. What are *args and **kwargs?

**Answer:**
`*args` collects extra positional arguments into a tuple; `**kwargs` collects extra keyword arguments into a dictionary.

**Example / Interview Point:**
Example: `def f(*args, **kwargs): ...`.

**Example / Interview Point:**
Interview Point: use them when a flexible interface is genuinely needed.

### Scenario 78. A 100-line function performs extraction, validation and transformation. How would you refactor it?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 27: Arrays

### 79. Does Python have arrays?

**Answer:**
Python has the `array` module for typed arrays, but ordinary lists are the common general-purpose sequence. NumPy's ndarray is the standard choice for numerical array operations.

**Example / Interview Point:**
Interview Point: distinguish list, array.array and NumPy ndarray.

### 80. Why are NumPy arrays useful compared with lists?

**Answer:**
NumPy arrays support vectorized numerical operations and compact typed storage, which can make numerical processing more efficient and expressive.

**Example / Interview Point:**
Interview Point: NumPy is designed for numerical computing.

### Scenario 81. You have millions of numeric values and many vector operations. Would you choose a list or NumPy array and why?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 28: Lambda

### 82. What is a lambda function?

**Answer:**
A lambda is an anonymous function expression containing a single expression. It is useful for short operations passed as arguments.

**Example / Interview Point:**
Example: `sorted(data, key=lambda x: x['salary'])`.

**Example / Interview Point:**
Interview Point: lambda is best for simple behavior.

### 83. Lambda vs def?

**Answer:**
Both create callable functions, but `def` supports named, multi-statement functions and documentation more naturally. Lambda is concise for small expressions.

**Example / Interview Point:**
Interview Point: don't force complex logic into lambdas.

### Scenario 84. A lambda contains complicated nested logic. Would you keep it? Explain your choice.

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 29: Classes and objects

### 85. What is a class and what is an object?

**Answer:**
A class defines a structure and behavior; an object is an instance created from that class. Instance attributes store object-specific state.

**Example / Interview Point:**
Example: `class Employee: ...; e=Employee()`.

**Example / Interview Point:**
Interview Point: class = blueprint, object = instance.

### 86. What is __init__?

**Answer:**
`__init__` initializes an instance after it is created, commonly by assigning initial attributes.

**Example / Interview Point:**
Example: `def __init__(self,id): self.id=id`.

**Example / Interview Point:**
Interview Point: __init__ initializes instance state.

### Scenario 87. Several source connectors need shared behavior but different implementations. How could classes help?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 30: OOP concepts

### 88. Explain the four OOP concepts in Python.

**Answer:**
Encapsulation bundles data and behavior; inheritance reuses/extends parent behavior; polymorphism allows common operations across different implementations; abstraction exposes essential behavior while hiding details.

**Example / Interview Point:**
Interview Point: give one simple example for each.

### 89. Which OOP concept would you use for multiple data-source implementations?

**Answer:**
Polymorphism and abstraction are useful when different classes expose the same interface, such as CSVSource and APIDataSource both implementing `read()`.

**Example / Interview Point:**
Interview Point: common interface + different implementations = polymorphism.

### Scenario 90. CSV, API and database sources all expose a `read()` operation. Which OOP concepts can make this design extensible?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 31: Iterators

### 91. What is an iterator?

**Answer:**
An iterator produces values one at a time through the iterator protocol. `iter()` obtains an iterator and `next()` retrieves the next value.

**Example / Interview Point:**
Example: `it=iter([1,2]); next(it)`.

**Example / Interview Point:**
Interview Point: iterator supports sequential consumption.

### 92. Why are iterators useful for large data?

**Answer:**
They can produce values lazily rather than requiring all values to be held in memory at once.

**Example / Interview Point:**
Interview Point: lazy iteration can reduce memory usage.

### Scenario 93. A large file cannot fit comfortably in memory. How can iteration help?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 32: Scope

### 94. What is scope in Python?

**Answer:**
Scope defines where a name can be resolved. Python's common lookup order is Local, Enclosing, Global and Built-in.

**Example / Interview Point:**
Interview Point: know LEGB.

### 95. What is the difference between global and nonlocal?

**Answer:**
`global` refers to a module-level variable from inside a function; `nonlocal` refers to a variable in an enclosing function scope.

**Example / Interview Point:**
Interview Point: both change assignment behavior, but they target different scopes.

### Scenario 96. An inner function must update a variable from its enclosing function. Which keyword might be appropriate?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 33: Module

### 97. What is a Python module?

**Answer:**
A module is a Python source file containing reusable code such as functions, classes and variables. It can be imported by another module.

**Example / Interview Point:**
Example: `import math`.

**Example / Interview Point:**
Interview Point: modules organize reusable code.

### 98. Why use modules in a project?

**Answer:**
Modules separate responsibilities, reduce duplication and make code easier to test and maintain.

**Example / Interview Point:**
Interview Point: split large programs by responsibility.

### Scenario 99. A project has one 2,000-line Python file. How would modules improve it?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 34: Logging

### 100. Why use logging instead of print()?

**Answer:**
Logging provides severity levels, timestamps, configurable handlers and structured diagnostics. Print statements are less suitable for production observability.

**Example / Interview Point:**
Interview Point: logging is configurable and operationally useful.

### 101. What are common logging levels?

**Answer:**
DEBUG is detailed diagnostic information, INFO is normal progress, WARNING indicates something unexpected, ERROR indicates failure, and CRITICAL indicates severe failure.

**Example / Interview Point:**
Interview Point: choose the level based on operational meaning.

### Scenario 102. A production pipeline fails overnight and print statements are unavailable. Why would logging have helped?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 35: JSON

### 103. How do you convert JSON to Python and Python to JSON?

**Answer:**
Use `json.loads()` for a JSON string to Python object and `json.dumps()` for a Python object to JSON string. File APIs include `json.load()` and `json.dump()`.

**Example / Interview Point:**
Interview Point: loads/dumps work with strings; load/dump work with file-like objects.

### 104. How would you handle malformed JSON in a pipeline?

**Answer:**
Parse inside controlled exception handling, quarantine or reject the invalid record/file, log the reason, and continue only if the business process permits it.

**Example / Interview Point:**
Interview Point: bad input should be isolated rather than silently ignored.

### Scenario 105. One record contains malformed JSON and the entire batch currently fails. Design a safer handling approach.

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 36: Regex

### 106. What is regex used for?

**Answer:**
Regex is used for pattern matching, validation, extraction and replacement in text. Python exposes it through the re module.

**Example / Interview Point:**
Example: `re.findall(r'\d+', 'Order 101')` → `['101']`.

**Example / Interview Point:**
Interview Point: regex is for pattern-based text processing.

### 107. Give a data-engineering use case for regex.

**Answer:**
Regex can validate simple identifiers, extract IDs from filenames, normalize text patterns or identify malformed values before loading.

**Example / Interview Point:**
Interview Point: use regex for text patterns, not for parsing complex structured formats.

### Scenario 108. You need to extract an order number from filenames such as `sales_20260913_12345.csv`. How could regex help?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 37: pip and installing pip

### 109. What is pip?

**Answer:**
pip is the standard Python package installation tool. It installs and manages packages for a Python environment.

**Example / Interview Point:**
Example: `python -m pip install pandas`.

**Example / Interview Point:**
Interview Point: use the interpreter's pip explicitly.

### 110. Why use a requirements file or isolated environment?

**Answer:**
A requirements file records dependencies and a virtual environment isolates them from other projects. Together they improve reproducibility and reduce dependency conflicts.

**Example / Interview Point:**
Interview Point: reproducible dependencies matter in production.

### Scenario 111. Two projects require incompatible package versions. How would you isolate them?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 38: Pylint

### 112. What is Pylint?

**Answer:**
Pylint is a static code-analysis and linting tool that checks Python source for potential errors, style problems and maintainability issues.

**Example / Interview Point:**
Interview Point: linting finds issues before runtime.

### 113. How would Pylint fit into a team workflow?

**Answer:**
Run it locally and/or in CI so pull requests can be checked consistently. Teams can configure rules and review justified suppressions.

**Example / Interview Point:**
Interview Point: automated quality checks belong in CI where practical.

### Scenario 114. A pull request introduces unused variables and poor naming. Which tool can catch these before merge?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 39: Errors

### 115. What are common types of errors in Python?

**Answer:**
Syntax errors prevent parsing, runtime errors occur during execution and logical errors produce incorrect results without necessarily raising exceptions.

**Example / Interview Point:**
Interview Point: logical errors can be hardest because the program may appear to work.

### 116. How would you debug a logical error?

**Answer:**
Reproduce the problem, inspect inputs and intermediate results, add focused logs or breakpoints, write a failing test, and fix the underlying logic.

**Example / Interview Point:**
Interview Point: tests turn debugging discoveries into regression protection.

### Scenario 117. A pipeline returns incorrect totals but raises no exception. What type of problem is this and how would you debug it?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 40: Exception handling

### 118. Why is exception handling important?

**Answer:**
It lets programs handle expected failures such as invalid input, missing files or network/database errors in a controlled way.

**Example / Interview Point:**
Interview Point: exceptions should be handled at the layer that can meaningfully recover or report.

### 119. Why should you avoid `except Exception:` everywhere?

**Answer:**
Broad catches can hide programming defects and make failures harder to diagnose. Catch specific exceptions when possible and log useful context.

**Example / Interview Point:**
Interview Point: don't silently swallow exceptions.

### Scenario 120. A developer catches every exception and returns an empty DataFrame. Why can this be dangerous?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 41: Try-except

### 121. Explain try-except-else-finally.

**Answer:**
`try` contains risky code, `except` handles matching exceptions, `else` runs when no exception occurs, and `finally` is for cleanup that should happen regardless.

**Example / Interview Point:**
Interview Point: know the purpose of each block.

### 122. How would you handle a file-not-found error?

**Answer:**
Catch `FileNotFoundError`, log or report the missing path, and decide whether to use a fallback or fail the pipeline based on business requirements.

**Example / Interview Point:**
Interview Point: catch the specific expected exception.

### Scenario 123. A file is optional but a malformed record is not. How might you handle those failures differently?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 42: File handling

### 124. How should files normally be opened in Python?

**Answer:**
Use a context manager such as `with open(path, mode) as f:` so the resource is closed automatically.

**Example / Interview Point:**
Interview Point: context managers prevent resource leaks.

### 125. What is the difference between text and binary file handling?

**Answer:**
Text mode reads/writes strings with an encoding; binary mode reads/writes bytes and is used for formats such as images or raw binary content.

**Example / Interview Point:**
Interview Point: text → str; binary → bytes.

### Scenario 126. A program sometimes leaves files open after an error. What Python pattern prevents this?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 43: Read/write/create/delete files

### 127. What are common file modes?

**Answer:**
`r` reads, `w` writes/overwrites and creates if needed, `a` appends and creates if needed, and `x` creates a new file but fails if it already exists. Add `b` for binary mode.

**Example / Interview Point:**
Interview Point: remember r/w/a/x.

### 128. How would you safely process a large text file?

**Answer:**
Open it with a context manager and iterate line by line instead of calling read() on the entire file. This keeps memory usage bounded by the processing pattern.

**Example / Interview Point:**
Interview Point: streaming/iteration is safer for large files.

### Scenario 129. You need to append daily records without overwriting yesterday's output. Which mode is appropriate?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 44: NumPy and Matplotlib

### 130. What is NumPy?

**Answer:**
NumPy is a numerical-computing library centered on arrays and vectorized operations.

**Example / Interview Point:**
Interview Point: NumPy is for efficient numerical array processing.

### 131. What is Matplotlib?

**Answer:**
Matplotlib is a Python visualization library used to create plots such as line, bar, scatter and histogram charts.

**Example / Interview Point:**
Interview Point: Matplotlib visualizes data; NumPy computes numerical arrays.

### Scenario 132. You want to understand whether numeric values contain outliers. Which library could help visualize the distribution?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 45: Pytest

### 133. What is Pytest?

**Answer:**
Pytest is a testing framework for Python. It supports simple test functions, fixtures, parametrization and rich failure reporting.

**Example / Interview Point:**
Example: `def test_add(): assert add(2,3)==5`.

**Example / Interview Point:**
Interview Point: Pytest is widely used for automated testing.

### 134. What is a fixture in Pytest?

**Answer:**
A fixture provides reusable setup/data/cleanup for tests. It reduces duplication and keeps test preparation separate from assertions.

**Example / Interview Point:**
Interview Point: fixture = reusable test setup/teardown.

### Scenario 135. A transformation worked manually but broke after a refactor. How would Pytest help?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 46: Pandas

### 136. What is Pandas?

**Answer:**
Pandas is a Python library for tabular data analysis. Its primary structures are Series and DataFrame.

**Example / Interview Point:**
Interview Point: Pandas is commonly used for local data preparation and analysis.

### 137. Pandas vs PySpark DataFrame?

**Answer:**
Pandas DataFrames are generally in-memory on one machine, while PySpark DataFrames are distributed and can process much larger datasets across a cluster.

**Example / Interview Point:**
Interview Point: choose based on data size, distribution and workload.

### Scenario 138. A 500 MB local CSV needs filtering and aggregation. Would Pandas be reasonable? What would you consider before using it?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Topic 47: Collections module

### 139. What is the collections module?

**Answer:**
It provides specialized container types beyond the basic list, tuple, set and dict. Common curriculum examples are Counter, namedtuple and OrderedDict.

**Example / Interview Point:**
Interview Point: know the purpose of each specialized container.

### 140. What is Counter, namedtuple and OrderedDict?

**Answer:**
Counter counts hashable values; namedtuple creates immutable tuple-like records with named fields; OrderedDict is an ordered mapping with APIs useful for ordering operations. Modern dicts also preserve insertion order.

**Example / Interview Point:**
Interview Point: Counter = frequency, namedtuple = named record, OrderedDict = ordering-oriented mapping.

### Scenario 141. You need the frequency of each error code in a batch. Which collections type is the best fit?

**How to answer in an interview:**
Start with the core concept, explain the practical decision, then mention one Python feature or example that supports your choice. Avoid jumping directly into code without explaining the reasoning.

**Interview Point:** Connect the Python concept to reliability, readability, maintainability, data quality, or performance when the question is scenario-based.

## Collections Module — Dedicated Subsection

### What is Counter?

**Answer:** `collections.Counter` counts hashable values and returns a mapping-like object from values to their frequencies.

**Example:**
```python
from collections import Counter
counts = Counter(['A', 'B', 'A', 'A'])
print(counts['A'])  # 3
```

**Interview Point:** Counter is the quickest standard-library answer for frequency-count problems.

### What is namedtuple?

**Answer:** `collections.namedtuple` creates tuple-like immutable records whose fields can be accessed by name as well as position.

**Example:**
```python
from collections import namedtuple
Employee = namedtuple('Employee', ['id', 'name'])
e = Employee(101, 'Raj')
print(e.name)
```

**Interview Point:** namedtuple gives a lightweight named record while retaining tuple behavior.

### What is OrderedDict?

**Answer:** `collections.OrderedDict` is an ordered mapping type with ordering-oriented operations. Modern normal dictionaries preserve insertion order too, but OrderedDict remains useful when its specialized ordering APIs are desired.

**Example:**
```python
from collections import OrderedDict
od = OrderedDict([('a', 1), ('b', 2)])
```

**Interview Point:** do not claim modern dicts are unordered; insertion order is preserved in current Python versions.

# Part C — Data-Engineering Scenarios

### Scenario 1 — CSV contains invalid numeric values
**Approach:** inspect schema → validate → convert valid values → quarantine invalid records → log reason → continue/fail according to business rules.

**Interview Point:** Do not silently convert bad data to an incorrect value.

### Scenario 2 — Pipeline fails halfway and is rerun
**Approach:** design the write step to be idempotent, identify the successful processing boundary, avoid duplicate output, and update progress/watermark only after successful completion.

**Interview Point:** Python pipeline code should be safe to retry.

### Scenario 3 — Large file does not fit comfortably in memory
**Approach:** process incrementally with file iteration/generators rather than loading the complete file into a list.

**Interview Point:** lazy processing reduces memory pressure.

### Scenario 4 — Production pipeline failed overnight
**Approach:** inspect logs and metrics, identify the failing stage, reproduce with the smallest failing input, fix the root cause, add a regression test, then rerun safely.

**Interview Point:** logging + testing turn one failure into a more reliable pipeline.

### Scenario 5 — Pandas or PySpark?
**Answer:** Use Pandas when the workload is appropriately sized for one machine and benefits from local tabular analysis. Use PySpark when the data/workload needs distributed processing.

**Interview Point:** choose based on data size, compute requirements, performance and operational environment—not simply preference.
