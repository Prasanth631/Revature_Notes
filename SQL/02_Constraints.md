# 02 — Constraints

> **Topics Covered:** `DEFAULT`, `AUTO_INCREMENT`, `NOT NULL`, `PRIMARY KEY`, `UNIQUE`, `CHECK`, `FOREIGN KEY`, Referential Integrity, `ON DELETE CASCADE`

---

## 📌 Quick Reference

| Constraint | Purpose |
|------------|---------|
| `DEFAULT` | Fallback value when column is omitted on INSERT |
| `AUTO_INCREMENT` | Auto-generates sequential integer IDs |
| `NOT NULL` | Rejects NULL values — field is mandatory |
| `PRIMARY KEY` | Uniquely identifies each row (unique + not null) |
| `UNIQUE` | Prevents duplicate values; allows NULL |
| `CHECK` | Domain validation — enforces a boolean condition |
| `FOREIGN KEY` | Links child column to parent table primary key |

---

## 🎯 Key Concepts

### PRIMARY KEY vs UNIQUE Key

| Feature | `PRIMARY KEY` | `UNIQUE` Key |
|---------|---------------|--------------|
| **Purpose** | Row identity (Entity Integrity) | Prevents duplicates |
| **Per table** | Exactly **ONE** | **MULTIPLE** allowed |
| **NULL allowed?** | **NO** (implicitly NOT NULL) | **YES** (MySQL allows multiple NULLs) |
| **Index Type** | Clustered Index | Non-Clustered Index |

> [!NOTE]
> MySQL allows multiple `NULL`s in a `UNIQUE` column because `NULL != NULL` — unknown values are not comparable.

---

### NULL vs Empty String vs Zero

| Value | Meaning | Allowed in `NOT NULL` column? |
|-------|---------|-------------------------------|
| `NULL` | Unknown / Missing | **NO** — triggers Error 1048 |
| `''` | Empty string (valid) | **YES** |
| `0` | Zero integer (valid) | **YES** |

> [!IMPORTANT]
> `NOT NULL` only blocks SQL `NULL`. To also prevent empty strings, combine with `CHECK (LENGTH(col) > 0)`.

---

### AUTO_INCREMENT Critical Rules

1. Only **one** `AUTO_INCREMENT` column per table.
2. Must be declared as `PRIMARY KEY` or `UNIQUE`.
3. Must be a numeric type (`INT`, `BIGINT`).
4. Inserting `NULL` or `0` triggers auto-generation of the next sequence value.

> [!WARNING]
> If an `INSERT` fails or is rolled back, the generated AUTO_INCREMENT ID is **lost forever**. MySQL does not rewind sequence counters.

---

### CHECK Constraint Expressions

| Type | Example |
|------|---------|
| Numeric Range | `CHECK (age >= 18)`, `CHECK (price > 0)` |
| List Membership | `CHECK (gender IN ('Male', 'Female', 'Other'))` |
| Closed Interval | `CHECK (marks BETWEEN 0 AND 100)` |

> [!WARNING]
> MySQL 5.7 and earlier **parsed but ignored** `CHECK` constraints. MySQL **8.0.16+** fully enforces them (Error 3819 on violation).

---

### FOREIGN KEY — Referential Integrity Actions

| Action | Behavior |
|--------|----------|
| `RESTRICT` / `NO ACTION` (default) | Blocks parent delete/update if child rows exist (Error 1451) |
| `CASCADE` | Automatically deletes/updates all child rows |
| `SET NULL` | Sets child FK column to NULL when parent is deleted |

> [!IMPORTANT]
> **Creation Order**: Parent tables MUST be created BEFORE child tables.
> **Drop Order**: Child tables MUST be dropped BEFORE parent tables.

---

### Why Phone Numbers MUST be VARCHAR (Not INT)

1. **Leading Zero Truncation**: `'0987654321'` becomes `987654321`
2. **Country Codes**: Cannot store `'+91-9876543210'`
3. **Integer Overflow**: Standard `INT` max is `2,147,483,647` — a 10-digit number like `9876543210` causes overflow
4. **Domain Semantics**: Phone numbers are identifiers, not quantities — never add or multiply them

---

## 🔍 Query-by-Query Analysis

### Part 1 — DEFAULT Constraint

#### Static Default — City
```sql
CREATE TABLE Employees (
    EmployeeID   INT PRIMARY KEY,
    EmployeeName VARCHAR(30),
    Department   VARCHAR(30),
    Salary       DECIMAL(10,2),
    JoiningDate  DATE,
    City         VARCHAR(30) DEFAULT 'Hyderabad'
);
```
- `City` automatically fills with `'Hyderabad'` if omitted during `INSERT`.

#### Numeric Default — Quantity
```sql
CREATE TABLE Products (
    ProductID   INT,
    ProductName VARCHAR(100),
    Price       DECIMAL(10,2),
    Quantity    INT DEFAULT 0
);
```
- Prevents `Quantity` from becoming `NULL` — essential for arithmetic (`Quantity * Price`).

#### String Default — Course
```sql
CREATE TABLE student (
    StudentID   INT PRIMARY KEY,
    StudentName VARCHAR(30),
    Age         INT,
    city        VARCHAR(30),
    Course      VARCHAR(30) DEFAULT 'Python'
);
```

#### Status Default — Active
```sql
CREATE TABLE users (
    ID          INT,
    UserName    VARCHAR(30),
    User_Status VARCHAR(10) DEFAULT 'Active'
);
```

#### Dynamic Date Default (MySQL 8.0+)
```sql
CREATE TABLE Orders (
    OrderID      INT,
    CustomerName VARCHAR(30),
    OrderDate    DATE DEFAULT (CURRENT_DATE),
    TotalAmount  DECIMAL(10,2)
);
```
- `(CURRENT_DATE)` in parentheses evaluates dynamically at INSERT time — records today's date automatically.

---

### Part 2 — AUTO_INCREMENT

#### Basic AUTO_INCREMENT
```sql
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT
);
```
- `CustomerID` auto-generates `1, 2, 3...` for every inserted row.

#### AUTO_INCREMENT on orders, products, library
```sql
CREATE TABLE orders   (OrderID INT PRIMARY KEY AUTO_INCREMENT);
CREATE TABLE product  (ProductID INT PRIMARY KEY AUTO_INCREMENT);
CREATE TABLE library  (BookID INT PRIMARY KEY AUTO_INCREMENT);
```

---

### Part 3 — NOT NULL Constraint

#### Mandatory Student Name
```sql
CREATE TABLE student (
    StudentID   INT,
    StudentName VARCHAR(30) NOT NULL
);
```

#### Multiple NOT NULL Columns
```sql
CREATE TABLE employee (
    EmpId      INT,
    department VARCHAR(30) NOT NULL,
    salary     VARCHAR(30) NOT NULL   -- intentional flaw, fixed below
);
```

#### Fix Wrong Data Type with ALTER
```sql
-- salary was incorrectly defined as VARCHAR → fix to DECIMAL:
ALTER TABLE employee
MODIFY COLUMN salary DECIMAL(10,2);
```
- Storing salary as text prevents `SUM`, `AVG` aggregations — always use numeric types for math.

---

### Part 4 — PRIMARY KEY

#### Single Column PK
```sql
CREATE TABLE student     (StudentID    INT PRIMARY KEY);
CREATE TABLE employee    (EmployeeID   INT PRIMARY KEY);
CREATE TABLE product     (ProductID    INT PRIMARY KEY);
CREATE TABLE orders      (OrderID      INT PRIMARY KEY);
CREATE TABLE department  (DepartmentID INT PRIMARY KEY);
```

#### Composite Primary Key
```sql
CREATE TABLE OrderItems (
    OrderID   INT,
    ProductID INT,
    Quantity  INT,
    PRIMARY KEY (OrderID, ProductID)
);
```
- The **combination** of `OrderID + ProductID` must be unique — individual columns can repeat.

---

### Part 5 — UNIQUE Constraint

#### Unique Email
```sql
CREATE TABLE customer (
    email VARCHAR(30) UNIQUE
);
```

#### Fix Phone Number from INT to VARCHAR
```sql
-- Wrong initial design:
CREATE TABLE employee (mobile_no INT(10) UNIQUE);

-- Fix: change to VARCHAR to preserve leading zeros & country codes:
ALTER TABLE employee
MODIFY COLUMN mobile_no VARCHAR(15) UNIQUE;
```

#### Unique Roll Number & Product Code
```sql
CREATE TABLE student (roll_no      INT UNIQUE);
CREATE TABLE product (product_code INT UNIQUE);
CREATE TABLE user    (user_name    VARCHAR(30) UNIQUE);
```

#### Rename Table to Avoid Reserved Keyword
```sql
ALTER TABLE user RENAME TO users;
```
- `USER` is a reserved word in MySQL — rename to `users` to avoid parsing errors.

---

### Part 6 — CHECK Constraint

#### Age Minimum Validation
```sql
CREATE TABLE student (
    sid   INT,
    sname VARCHAR(30),
    age   INT CHECK (age >= 18)
);
```

#### Salary Minimum Threshold
```sql
CREATE TABLE employee (
    eid    INT,
    ename  VARCHAR(30),
    salary DECIMAL(10,2) CHECK (salary > 10000)
);
```

#### Positive Price Only
```sql
CREATE TABLE product (
    pid   INT,
    pname VARCHAR(30),
    price DECIMAL(10,2) CHECK (price > 0)
);
```

#### Gender Enum List
```sql
CREATE TABLE Customer (
    cid    INT,
    cname  VARCHAR(30),
    gender VARCHAR(30) CHECK (gender IN ('Male', 'Female', 'Other'))
);
```

#### Score Range Validation
```sql
CREATE TABLE exam_marks (
    eid   INT,
    ename VARCHAR(30),
    marks INT CHECK (marks BETWEEN 0 AND 100)
);
```

---

### Part 7 — FOREIGN KEY & Referential Integrity

#### Departments → Employees
```sql
-- Parent (create first):
CREATE TABLE departments (
    DepartmentID   INT PRIMARY KEY,
    DepartmentName VARCHAR(30)
);

-- Child (references parent):
CREATE TABLE Employees (
    EmployeeID   INT,
    EmployeeName VARCHAR(30),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES departments(DepartmentID)
);
```

#### Customers → Orders
```sql
CREATE TABLE Customers (CustomerID INT PRIMARY KEY, CustomerName VARCHAR(30));

CREATE TABLE Orders (
    OrderID    INT,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
```

#### Authors → Books
```sql
CREATE TABLE Authors (AuthorID INT PRIMARY KEY, AuthorName VARCHAR(30));

CREATE TABLE Books (
    BookID    INT,
    BookTitle VARCHAR(30),
    AuthorID  INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);
```

#### Categories → Products
```sql
CREATE TABLE categories (CategoryID INT PRIMARY KEY, CategoryName VARCHAR(30));

CREATE TABLE products (
    ProductID   INT,
    ProductName VARCHAR(30),
    CategoryID  INT,
    FOREIGN KEY (CategoryID) REFERENCES categories(CategoryID)
);
```

#### Teachers → Students (with ON DELETE CASCADE)
```sql
CREATE TABLE Teachers (TeacherID INT PRIMARY KEY, TeacherName VARCHAR(30));

CREATE TABLE Students (
    StudentID   INT PRIMARY KEY,
    StudentName VARCHAR(30),
    TeacherID   INT,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);
```

---

## 💡 Interview Tips

- **PRIMARY KEY** = unique + NOT NULL + clustered index. One per table only.
- **UNIQUE** allows multiple NULLs; PRIMARY KEY does not.
- **DEFAULT** with a function (e.g., `CURRENT_DATE`) must be wrapped in `()` in MySQL 8.0+.
- **AUTO_INCREMENT** gaps are permanent — failed transactions consume IDs.
- **FOREIGN KEY** order matters: create parent first, drop child first.
- **Phone numbers** → always `VARCHAR`, never `INT`.
- **CHECK** is only enforced in MySQL 8.0.16+; earlier versions silently ignore it.
