/* ============================================================================
   SQL DAY 1 ASSIGNMENT - COMPLETE SOLUTIONS & EXPLANATIONS
   ============================================================================
   Author: Prasanth Golla
   Description: Complete solved SQL solutions for Day 1 Assignment covering Topics 1-8:
                Create Table, DEFAULT, AUTO_INCREMENT, NOT NULL, PRIMARY KEY,
                UNIQUE, CHECK, and FOREIGN KEY constraints.
   ============================================================================ */

CREATE DATABASE IF NOT EXISTS Day1_AssignmentDB;
USE Day1_AssignmentDB;

-- ============================================================================
-- TOPIC 1: CREATE TABLE
-- ============================================================================

/*
   TOPIC 1 - EXERCISE 1: Create Students Table
   - WHAT IS THIS QUERY? DDL table creation query for Students.
   - WHAT DOES IT DO? Creates a 'Students' table with StudentID, StudentName, Age, City.
   - HOW KEYWORD WORKS: `CREATE TABLE` specifies column names and data types.
*/
CREATE TABLE Students (
    StudentID INT,
    StudentName VARCHAR(50),
    Age INT,
    City VARCHAR(50)
);

/*
   TOPIC 1 - EXERCISE 2: Create Employees Table
   - WHAT IS THIS QUERY? DDL table creation query for Employees.
   - WHAT DOES IT DO? Creates an 'Employees' table with EmployeeID, EmployeeName, Department, Salary, JoiningDate.
   - HOW KEYWORD WORKS: `DECIMAL(10,2)` handles currency; `DATE` stores joining date.
*/
CREATE TABLE Employees (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    JoiningDate DATE
);

/*
   TOPIC 1 - EXERCISE 3: Create Products Table
   - WHAT IS THIS QUERY? DDL table creation query for Products.
   - WHAT DOES IT DO? Creates a 'Products' table with ProductID, ProductName, Price, Quantity.
   - HOW KEYWORD WORKS: Specifies numeric types for price and stock quantity.
*/
CREATE TABLE Products (
    ProductID INT,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    Quantity INT
);

/*
   TOPIC 1 - EXERCISE 4: Create Orders Table
   - WHAT IS THIS QUERY? DDL table creation query for Orders.
   - WHAT DOES IT DO? Creates an 'Orders' table with OrderID, CustomerName, OrderDate, TotalAmount.
   - HOW KEYWORD WORKS: Defines transactional fields for order tracking.
*/
CREATE TABLE Orders (
    OrderID INT,
    CustomerName VARCHAR(50),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2)
);

/*
   TOPIC 1 - EXERCISE 5: Create Books Table
   - WHAT IS THIS QUERY? DDL table creation query for Books.
   - WHAT DOES IT DO? Creates a 'Books' table with BookID, BookTitle, Author, Price, PublishedYear.
   - HOW KEYWORD WORKS: `INT` for 4-digit PublishedYear; `VARCHAR(100)` for titles.
*/
CREATE TABLE Books (
    BookID INT,
    BookTitle VARCHAR(100),
    Author VARCHAR(50),
    Price DECIMAL(10,2),
    PublishedYear INT
);


-- ============================================================================
-- TOPIC 2: DEFAULT CONSTRAINT
-- ============================================================================

/*
   TOPIC 2 - EXERCISE 1: Employees Table with Default City
   - WHAT IS THIS QUERY? Table creation with static string default.
   - WHAT DOES IT DO? Creates Employees_T2 table where City defaults to 'Hyderabad'.
   - HOW KEYWORD WORKS: `DEFAULT 'Hyderabad'` assigns fallback string value.
*/
CREATE TABLE Employees_T2 (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    City VARCHAR(50) DEFAULT 'Hyderabad'
);

/*
   TOPIC 2 - EXERCISE 2: Products Table with Default Quantity 0
   - WHAT IS THIS QUERY? Table creation with numeric default.
   - WHAT DOES IT DO? Creates Products_T2 table where Quantity defaults to 0.
   - HOW KEYWORD WORKS: `DEFAULT 0` sets stock quantity to 0 when unspecified.
*/
CREATE TABLE Products_T2 (
    ProductID INT,
    ProductName VARCHAR(100),
    Quantity INT DEFAULT 0
);

/*
   TOPIC 2 - EXERCISE 3: Students Table with Default Course Python
   - WHAT IS THIS QUERY? Table creation with course default.
   - WHAT DOES IT DO? Creates Students_T2 table where Course defaults to 'Python'.
   - HOW KEYWORD WORKS: `DEFAULT 'Python'` sets default elective course.
*/
CREATE TABLE Students_T2 (
    StudentID INT,
    StudentName VARCHAR(50),
    Course VARCHAR(50) DEFAULT 'Python'
);

/*
   TOPIC 2 - EXERCISE 4: Users Table with Default Status Active
   - WHAT IS THIS QUERY? Table creation with status default.
   - WHAT DOES IT DO? Creates Users_T2 table where Status defaults to 'Active'.
   - HOW KEYWORD WORKS: `DEFAULT 'Active'` auto-activates new user accounts.
*/
CREATE TABLE Users_T2 (
    UserID INT,
    Username VARCHAR(50),
    Status VARCHAR(20) DEFAULT 'Active'
);

/*
   TOPIC 2 - EXERCISE 5: Orders Table with Dynamic Date Default
   - WHAT IS THIS QUERY? Table creation with dynamic date default expression.
   - WHAT DOES IT DO? Creates Orders_T2 table where OrderDate defaults to current system date.
   - HOW KEYWORD WORKS: `DEFAULT (CURRENT_DATE)` evaluates current system date dynamically.
*/
CREATE TABLE Orders_T2 (
    OrderID INT,
    CustomerName VARCHAR(50),
    OrderDate DATE DEFAULT (CURRENT_DATE)
);


-- ============================================================================
-- TOPIC 3: AUTO_INCREMENT MECHANISM
-- ============================================================================

/*
   TOPIC 3 - EXERCISE 1: Customer Table with Auto-Generated CustomerID
   - WHAT IS THIS QUERY? Table creation with AUTO_INCREMENT primary key.
   - WHAT DOES IT DO? Creates Customer_T3 table where CustomerID auto-increments (1, 2, 3...).
   - HOW KEYWORD WORKS: `AUTO_INCREMENT` delegates key sequence generation to database engine.
*/
CREATE TABLE Customer_T3 (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(50)
);

/*
   TOPIC 3 - EXERCISE 2: Employee Table with Auto-Generated EmployeeID
   - WHAT IS THIS QUERY? Table creation with AUTO_INCREMENT key.
   - WHAT DOES IT DO? Creates Employee_T3 table with auto-generated EmployeeID.
   - HOW KEYWORD WORKS: `PRIMARY KEY AUTO_INCREMENT` enforces unique sequential ID.
*/
CREATE TABLE Employee_T3 (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeName VARCHAR(50)
);

/*
   TOPIC 3 - EXERCISE 3: Product Table with Auto-Generated ProductID
   - WHAT IS THIS QUERY? Table creation with auto-incrementing ProductID.
   - WHAT DOES IT DO? Creates Product_T3 table where ProductID increases automatically.
   - HOW KEYWORD WORKS: `AUTO_INCREMENT` assigns next integer value for product codes.
*/
CREATE TABLE Product_T3 (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100)
);

/*
   TOPIC 3 - EXERCISE 4: Orders Table with Auto-Generated OrderID
   - WHAT IS THIS QUERY? Table creation with auto-incrementing transaction ID.
   - WHAT DOES IT DO? Creates Orders_T3 table with auto-generated OrderID.
   - HOW KEYWORD WORKS: Auto-assigns sequential order transaction numbers.
*/
CREATE TABLE Orders_T3 (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(50)
);

/*
   TOPIC 3 - EXERCISE 5: Library Table with Auto-Generated BookID
   - WHAT IS THIS QUERY? Table creation with auto-generated book accession numbers.
   - WHAT DOES IT DO? Creates Library_T3 table where BookID is automatically assigned.
   - HOW KEYWORD WORKS: `BookID INT PRIMARY KEY AUTO_INCREMENT` auto-numbers catalog items.
*/
CREATE TABLE Library_T3 (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    BookTitle VARCHAR(100)
);


-- ============================================================================
-- TOPIC 4: NOT NULL CONSTRAINT
-- ============================================================================

/*
   TOPIC 4 - EXERCISE 1: Student Table with Mandatory StudentName
   - WHAT IS THIS QUERY? Table creation with NOT NULL constraint.
   - WHAT DOES IT DO? Creates Student_T4 table where StudentName cannot be NULL.
   - HOW KEYWORD WORKS: `NOT NULL` rejects inserts lacking student name data.
*/
CREATE TABLE Student_T4 (
    StudentID INT,
    StudentName VARCHAR(50) NOT NULL
);

/*
   TOPIC 4 - EXERCISE 2: Employee Table with Mandatory Department and Salary
   - WHAT IS THIS QUERY? Table creation with multiple NOT NULL constraints.
   - WHAT DOES IT DO? Creates Employee_T4 requiring Department and Salary.
   - HOW KEYWORD WORKS: `NOT NULL` applied to both columns forces required data entry.
*/
CREATE TABLE Employee_T4 (
    EmployeeID INT,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL
);

/*
   TOPIC 4 - EXERCISE 3: Product Table with Mandatory ProductName
   - WHAT IS THIS QUERY? Table creation with mandatory product title.
   - WHAT DOES IT DO? Creates Product_T4 where ProductName cannot be NULL.
   - HOW KEYWORD WORKS: `NOT NULL` enforces catalog item naming.
*/
CREATE TABLE Product_T4 (
    ProductID INT,
    ProductName VARCHAR(100) NOT NULL
);

/*
   TOPIC 4 - EXERCISE 4: Customer Table with Mandatory Email
   - WHAT IS THIS QUERY? Table creation with mandatory email address.
   - WHAT DOES IT DO? Creates Customer_T4 requiring Email to be non-null.
   - HOW KEYWORD WORKS: `NOT NULL` prevents uncontactable customer entries.
*/
CREATE TABLE Customer_T4 (
    CustomerID INT,
    Email VARCHAR(100) NOT NULL
);

/*
   TOPIC 4 - EXERCISE 5: Course Table with Mandatory CourseName
   - WHAT IS THIS QUERY? Table creation with mandatory course title.
   - WHAT DOES IT DO? Creates Course_T4 where CourseName cannot be NULL.
   - HOW KEYWORD WORKS: `NOT NULL` forces course identification.
*/
CREATE TABLE Course_T4 (
    CourseID INT,
    CourseName VARCHAR(100) NOT NULL
);


-- ============================================================================
-- TOPIC 5: PRIMARY KEY CONSTRAINT
-- ============================================================================

/*
   TOPIC 5 - EXERCISE 1: Student Table with StudentID Primary Key
   - WHAT IS THIS QUERY? Table creation with Primary Key entity integrity.
   - WHAT DOES IT DO? Creates Student_T5 with StudentID as PRIMARY KEY.
   - HOW KEYWORD WORKS: `PRIMARY KEY` forces uniqueness and non-nullability.
*/
CREATE TABLE Student_T5 (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50)
);

/*
   TOPIC 5 - EXERCISE 2: Employee Table with EmployeeID Primary Key
   - WHAT IS THIS QUERY? Table creation with primary key identification.
   - WHAT DOES IT DO? Creates Employee_T5 with EmployeeID as PRIMARY KEY.
   - HOW KEYWORD WORKS: Uniquely identifies employee records.
*/
CREATE TABLE Employee_T5 (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50)
);

/*
   TOPIC 5 - EXERCISE 3: Product Table with ProductID Primary Key
   - WHAT IS THIS QUERY? Table creation with inventory primary key.
   - WHAT DOES IT DO? Creates Product_T5 with ProductID as PRIMARY KEY.
   - HOW KEYWORD WORKS: Uniquely identifies product items.
*/
CREATE TABLE Product_T5 (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100)
);

/*
   TOPIC 5 - EXERCISE 4: Orders Table with OrderID Primary Key
   - WHAT IS THIS QUERY? Table creation with order primary key.
   - WHAT DOES IT DO? Creates Orders_T5 with OrderID as PRIMARY KEY.
   - HOW KEYWORD WORKS: Uniquely identifies sales orders.
*/
CREATE TABLE Orders_T5 (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

/*
   TOPIC 5 - EXERCISE 5: Department Table with DepartmentID Primary Key
   - WHAT IS THIS QUERY? Table creation with department primary key.
   - WHAT DOES IT DO? Creates Department_T5 with DepartmentID as PRIMARY KEY.
   - HOW KEYWORD WORKS: Prepares parent lookup table for organizational departments.
*/
CREATE TABLE Department_T5 (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);


-- ============================================================================
-- TOPIC 6: UNIQUE CONSTRAINT
-- ============================================================================

/*
   TOPIC 6 - EXERCISE 1: Customer Table with Unique Email
   - WHAT IS THIS QUERY? Table creation with UNIQUE key constraint.
   - WHAT DOES IT DO? Creates Customer_T6 where Email must be unique.
   - HOW KEYWORD WORKS: `UNIQUE` prevents duplicate customer emails.
*/
CREATE TABLE Customer_T6 (
    CustomerID INT,
    Email VARCHAR(100) UNIQUE
);

/*
   TOPIC 6 - EXERCISE 2: Employee Table with Unique Mobile Number
   - WHAT IS THIS QUERY? Table creation with unique mobile identifier.
   - WHAT DOES IT DO? Creates Employee_T6 where MobileNumber (VARCHAR) is unique.
   - HOW KEYWORD WORKS: `VARCHAR(15) UNIQUE` preserves phone formatting while blocking duplicate numbers.
*/
CREATE TABLE Employee_T6 (
    EmployeeID INT,
    MobileNumber VARCHAR(15) UNIQUE
);

/*
   TOPIC 6 - EXERCISE 3: Student Table with Unique Roll Number
   - WHAT IS THIS QUERY? Table creation with unique roll number.
   - WHAT DOES IT DO? Creates Student_T6 where RollNumber is unique.
   - HOW KEYWORD WORKS: `UNIQUE` prevents assigning identical roll numbers.
*/
CREATE TABLE Student_T6 (
    StudentID INT,
    RollNumber INT UNIQUE
);

/*
   TOPIC 6 - EXERCISE 4: Product Table with Unique Product Code
   - WHAT IS THIS QUERY? Table creation with unique SKU code.
   - WHAT DOES IT DO? Creates Product_T6 where ProductCode is unique.
   - HOW KEYWORD WORKS: `UNIQUE` prevents duplicate product barcode/SKU entries.
*/
CREATE TABLE Product_T6 (
    ProductID INT,
    ProductCode VARCHAR(30) UNIQUE
);

/*
   TOPIC 6 - EXERCISE 5: User Table with Unique Username
   - WHAT IS THIS QUERY? Table creation with unique username constraint.
   - WHAT DOES IT DO? Creates User_T6 where Username must be unique.
   - HOW KEYWORD WORKS: `UNIQUE` prevents two users from choosing identical usernames.
*/
CREATE TABLE User_T6 (
    UserID INT,
    Username VARCHAR(50) UNIQUE
);


-- ============================================================================
-- TOPIC 7: CHECK CONSTRAINT
-- ============================================================================

/*
   TOPIC 7 - EXERCISE 1: Student Table with Minimum Age Check
   - WHAT IS THIS QUERY? Table creation with CHECK range validation.
   - WHAT DOES IT DO? Creates Student_T7 requiring Age >= 18.
   - HOW KEYWORD WORKS: `CHECK (Age >= 18)` rejects students under 18 years old.
*/
CREATE TABLE Student_T7 (
    StudentID INT,
    Age INT CHECK (Age >= 18)
);

/*
   TOPIC 7 - EXERCISE 2: Employee Table with Minimum Salary Check
   - WHAT IS THIS QUERY? Table creation with minimum salary validation.
   - WHAT DOES IT DO? Creates Employee_T7 requiring Salary > 10000.
   - HOW KEYWORD WORKS: `CHECK (Salary > 10000)` enforces wage threshold validation.
*/
CREATE TABLE Employee_T7 (
    EmployeeID INT,
    Salary DECIMAL(10,2) CHECK (Salary > 10000)
);

/*
   TOPIC 7 - EXERCISE 3: Product Table with Positive Price Check
   - WHAT IS THIS QUERY? Table creation with price validation.
   - WHAT DOES IT DO? Creates Product_T7 requiring Price > 0.
   - HOW KEYWORD WORKS: `CHECK (Price > 0)` prevents 0 or negative product prices.
*/
CREATE TABLE Product_T7 (
    ProductID INT,
    Price DECIMAL(10,2) CHECK (Price > 0)
);

/*
   TOPIC 7 - EXERCISE 4: Customer Table with Gender Enumeration Check
   - WHAT IS THIS QUERY? Table creation with IN operator list check.
   - WHAT DOES IT DO? Creates Customer_T7 where Gender must be 'Male', 'Female', or 'Other'.
   - HOW KEYWORD WORKS: `CHECK (Gender IN ('Male', 'Female', 'Other'))` restricts gender string entries.
*/
CREATE TABLE Customer_T7 (
    CustomerID INT,
    Gender VARCHAR(20) CHECK (Gender IN ('Male', 'Female', 'Other'))
);

/*
   TOPIC 7 - EXERCISE 5: Exam Table with Score Interval Check
   - WHAT IS THIS QUERY? Table creation with BETWEEN interval validation.
   - WHAT DOES IT DO? Creates Exam_T7 requiring Marks BETWEEN 0 AND 100.
   - HOW KEYWORD WORKS: `CHECK (Marks BETWEEN 0 AND 100)` forces test marks into valid 0-100 score bounds.
*/
CREATE TABLE Exam_T7 (
    ExamID INT,
    Marks INT CHECK (Marks BETWEEN 0 AND 100)
);


-- ============================================================================
-- TOPIC 8: FOREIGN KEY CONSTRAINT
-- ============================================================================

/*
   TOPIC 8 - EXERCISE 1: Departments and Employees Relationship
   - WHAT IS THIS QUERY? DDL foreign key link between Departments and Employees.
   - WHAT DOES IT DO? Creates parent Departments_T8 and child Employees_T8 referencing DepartmentID.
   - HOW KEYWORD WORKS: `FOREIGN KEY (DepartmentID) REFERENCES Departments_T8(DepartmentID)` enforces parent-child referential integrity.
*/
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

/*
   TOPIC 8 - EXERCISE 2: Customers and Orders Relationship
   - WHAT IS THIS QUERY? DDL foreign key link between Customers and Orders.
   - WHAT DOES IT DO? Creates parent Customers_T8 and child Orders_T8 referencing CustomerID.
   - HOW KEYWORD WORKS: `FOREIGN KEY (CustomerID) REFERENCES Customers_T8(CustomerID)` prevents orphaned order records.
*/
CREATE TABLE Customers_T8 (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

CREATE TABLE Orders_T8 (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers_T8(CustomerID)
);

/*
   TOPIC 8 - EXERCISE 3: Authors and Books Relationship
   - WHAT IS THIS QUERY? DDL foreign key link between Authors and Books.
   - WHAT DOES IT DO? Creates parent Authors_T8 and child Books_T8 referencing AuthorID.
   - HOW KEYWORD WORKS: `FOREIGN KEY (AuthorID) REFERENCES Authors_T8(AuthorID)` links books to registered authors.
*/
CREATE TABLE Authors_T8 (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(50)
);

CREATE TABLE Books_T8 (
    BookID INT PRIMARY KEY,
    BookTitle VARCHAR(100),
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors_T8(AuthorID)
);

/*
   TOPIC 8 - EXERCISE 4: Categories and Products Relationship
   - WHAT IS THIS QUERY? DDL foreign key link between Categories and Products.
   - WHAT DOES IT DO? Creates parent Categories_T8 and child Products_T8 referencing CategoryID.
   - HOW KEYWORD WORKS: `FOREIGN KEY (CategoryID) REFERENCES Categories_T8(CategoryID)` enforces inventory category tracking.
*/
CREATE TABLE Categories_T8 (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

CREATE TABLE Products_T8 (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Categories_T8(CategoryID)
);

/*
   TOPIC 8 - EXERCISE 5: Teachers and Students Relationship
   - WHAT IS THIS QUERY? DDL foreign key link between Teachers and Students.
   - WHAT DOES IT DO? Creates parent Teachers_T8 and child Students_T8 referencing TeacherID.
   - HOW KEYWORD WORKS: `FOREIGN KEY (TeacherID) REFERENCES Teachers_T8(TeacherID)` links students to mentor teachers.
*/
CREATE TABLE Teachers_T8 (
    TeacherID INT PRIMARY KEY,
    TeacherName VARCHAR(50)
);

CREATE TABLE Students_T8 (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    TeacherID INT,
    FOREIGN KEY (TeacherID) REFERENCES Teachers_T8(TeacherID)
);
