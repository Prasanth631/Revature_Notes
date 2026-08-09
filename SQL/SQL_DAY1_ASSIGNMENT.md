<div align="center">

![SQL](https://img.shields.io/badge/SQL-MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![Day 1 Assignment](https://img.shields.io/badge/Assignment-Day_1_Solved-4CAF50?style=for-the-badge)
![Level](https://img.shields.io/badge/Level-Beginner-blue?style=for-the-badge)

# SQL Day 1 Assignment — Solved Guide & Detailed Explanations

**Complete solutions for all 35 exercises in `SQL_DAY1_ASSIGNMENT.txt` spanning Topics 1 through 8: Table Creation, `DEFAULT`, `AUTO_INCREMENT`, `NOT NULL`, `PRIMARY KEY`, `UNIQUE`, `CHECK`, and `FOREIGN KEY` constraints.**

---

</div>

## 📚 Overview of Assignment Topics

| Topic # | Topic Name | Exercise Count | Key Concepts Tested |
|:-------:|------------|:--------------:|---------------------|
| **Topic 1** | `CREATE TABLE` | 5 | Data Types (`INT`, `VARCHAR`, `DECIMAL`, `DATE`) |
| **Topic 2** | `DEFAULT` Constraint | 5 | Fallback defaults (`'Hyderabad'`, `0`, `'Python'`, `'Active'`, `CURRENT_DATE`) |
| **Topic 3** | `AUTO_INCREMENT` | 5 | Surrogate primary keys (`AUTO_INCREMENT`) |
| **Topic 4** | `NOT NULL` Constraint | 5 | Mandatory fields enforcement |
| **Topic 5** | `PRIMARY KEY` | 5 | Entity integrity & uniqueness |
| **Topic 6** | `UNIQUE` Constraint | 5 | Duplicate prevention (`Email`, `MobileNumber`, `RollNumber`, `ProductCode`, `Username`) |
| **Topic 7** | `CHECK` Constraint | 5 | Domain validation (`>=`, `>`, `IN`, `BETWEEN`) |
| **Topic 8** | `FOREIGN KEY` | 5 | Parent-child relationships & referential integrity |

---

## 🔍 Solved Exercises with Explanations

---

### 🟢 Topic 1: `CREATE TABLE`

#### Exercise 1: Students Table
```sql
CREATE TABLE Students (
    StudentID INT,
    StudentName VARCHAR(50),
    Age INT,
    City VARCHAR(50)
);
```
* **What is this query?** DDL table creation query for Students.
* **What does it do?** Creates a `Students` table with `StudentID`, `StudentName`, `Age`, and `City`.
* **How keyword works:** `CREATE TABLE` defines column names and storage types (`INT`, `VARCHAR`).

#### Exercise 2: Employees Table
```sql
CREATE TABLE Employees (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    JoiningDate DATE
);
```
* **What is this query?** DDL table creation query for Employees.
* **What does it do?** Creates an `Employees` table with `EmployeeID`, `EmployeeName`, `Department`, `Salary`, and `JoiningDate`.
* **How keyword works:** `DECIMAL(10,2)` guarantees currency precision without rounding errors.

#### Exercise 3: Products Table
```sql
CREATE TABLE Products (
    ProductID INT,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    Quantity INT
);
```
* **What is this query?** DDL table creation query for Products.
* **What does it do?** Creates a `Products` table containing product catalog attributes.
* **How keyword works:** Combines text (`VARCHAR(100)`), currency (`DECIMAL`), and integer (`INT`) storage types.

---

### 🔵 Topic 2: `DEFAULT` Constraint

#### Exercise 1: Employees Table with Default City
```sql
CREATE TABLE Employees_T2 (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    City VARCHAR(50) DEFAULT 'Hyderabad'
);
```
* **What is this query?** Table creation with static string default constraint.
* **What does it do?** Creates `Employees_T2` where `City` defaults to `'Hyderabad'` if omitted during insertion.
* **How keyword works:** `DEFAULT 'Hyderabad'` supplies automatic fallback text data.

#### Exercise 5: Orders Table with Dynamic Current Date Default
```sql
CREATE TABLE Orders_T2 (
    OrderID INT,
    CustomerName VARCHAR(50),
    OrderDate DATE DEFAULT (CURRENT_DATE)
);
```
* **What is this query?** Table creation with dynamic date default expression.
* **What does it do?** Creates `Orders_T2` where `OrderDate` defaults to the current system date.
* **How keyword works:** Enclosing `(CURRENT_DATE)` in parentheses allows dynamic date evaluation upon insertion.

---

### 🟡 Topic 3: `AUTO_INCREMENT`

#### Exercise 1: Customer Table with Auto-Generated CustomerID
```sql
CREATE TABLE Customer_T3 (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(50)
);
```
* **What is this query?** Table creation with automated surrogate key.
* **What does it do?** Creates `Customer_T3` where `CustomerID` auto-increments (`1, 2, 3...`).
* **How keyword works:** `AUTO_INCREMENT` delegates primary key sequence generation to the database engine.

---

### 🟠 Topic 4: `NOT NULL` Constraint

#### Exercise 2: Employee Table with Mandatory Department and Salary
```sql
CREATE TABLE Employee_T4 (
    EmployeeID INT,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL
);
```
* **What is this query?** Table creation with multiple `NOT NULL` constraints.
* **What does it do?** Creates `Employee_T4` requiring both `Department` and `Salary`.
* **How keyword works:** `NOT NULL` rejects inserts lacking required department or salary values.

---

### 🔴 Topic 5: `PRIMARY KEY`

#### Exercise 5: Department Table with DepartmentID Primary Key
```sql
CREATE TABLE Department_T5 (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
```
* **What is this query?** Table creation with Primary Key entity integrity.
* **What does it do?** Creates `Department_T5` with `DepartmentID` as `PRIMARY KEY`.
* **How keyword works:** `PRIMARY KEY` forces uniqueness, non-nullability, and creates a clustered index.

---

### 🟣 Topic 6: `UNIQUE` Constraint

#### Exercise 2: Employee Table with Unique Mobile Number
```sql
CREATE TABLE Employee_T6 (
    EmployeeID INT,
    MobileNumber VARCHAR(15) UNIQUE
);
```
* **What is this query?** Table creation with unique mobile identifier.
* **What does it do?** Creates `Employee_T6` where `MobileNumber` (`VARCHAR(15)`) must be unique across all rows.
* **How keyword works:** `VARCHAR(15) UNIQUE` preserves phone formatting while blocking duplicate numbers.

---

### 🟤 Topic 7: `CHECK` Constraint

#### Exercise 4: Customer Table with Gender Enumeration List
```sql
CREATE TABLE Customer_T7 (
    CustomerID INT,
    Gender VARCHAR(20) CHECK (Gender IN ('Male', 'Female', 'Other'))
);
```
* **What is this query?** Table creation with `IN` operator list check.
* **What does it do?** Creates `Customer_T7` where `Gender` must be `'Male'`, `'Female'`, or `'Other'`.
* **How keyword works:** `CHECK (Gender IN (...))` restricts string inputs to an approved domain list.

#### Exercise 5: Exam Table with Score Interval Check
```sql
CREATE TABLE Exam_T7 (
    ExamID INT,
    Marks INT CHECK (Marks BETWEEN 0 AND 100)
);
```
* **What is this query?** Table creation with `BETWEEN` interval validation.
* **What does it do?** Creates `Exam_T7` requiring `Marks` to fall between 0 and 100 inclusive.
* **How keyword works:** `CHECK (Marks BETWEEN 0 AND 100)` forces test marks into valid 0–100 score bounds.

---

### 🟢 Topic 8: `FOREIGN KEY`

#### Exercise 1: Departments and Employees Relationship
```sql
CREATE TABLE Departments_T8 (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Employees_T8 (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments_T8(DepartmentID)
);
```
* **What is this query?** DDL foreign key link between Departments and Employees.
* **What does it do?** Creates parent `Departments_T8` and child `Employees_T8` referencing `DepartmentID`.
* **How keyword works:** `FOREIGN KEY (DepartmentID) REFERENCES Departments_T8(DepartmentID)` enforces parent-child referential integrity.

---

<div align="center">

[![Next Notes](https://img.shields.io/badge/Next-Day_2_Assignment_Solved-2196F3?style=for-the-badge)](./SQL_DAY2_ASSIGNMENT.md)

</div>
