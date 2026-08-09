/* ============================================================================
   TOPIC 8: FOREIGN KEY CONSTRAINT & REFERENTIAL INTEGRITY
   ============================================================================
   Author: Prasanth Golla
   Description: Comprehensive SQL Notes & Assignments covering FOREIGN KEY constraints,
                parent-child table relationships, candidate keys, and referential
                integrity enforcement.
   ============================================================================ */

-- ============================================================================
-- QUERY 1: Create Database
-- ============================================================================
CREATE DATABASE topic8;

-- ============================================================================
-- QUERY 2: Select Active Database
-- ============================================================================
USE topic8;

-- ============================================================================
-- QUERY 3: Create Parent Table - Departments
-- ============================================================================
CREATE TABLE departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(30)
);

-- ============================================================================
-- QUERY 4: Create Child Table - Employees with Foreign Key Referencing Departments
-- ============================================================================
CREATE TABLE Employees (
    EmployeeID INT,
    EmployeeName VARCHAR(30),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES departments(DepartmentID)
);

-- ============================================================================
-- QUERY 5: Describe Departments Table Schema
-- ============================================================================
DESC departments;

-- ============================================================================
-- QUERY 6: Create Parent Table - Customers
-- ============================================================================
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(30)
);

-- ============================================================================
-- QUERY 7: Create Child Table - Orders with Foreign Key Referencing Customers
-- ============================================================================
CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- ============================================================================
-- QUERY 8: Describe Orders Table Schema
-- ============================================================================
DESC Orders;

-- ============================================================================
-- QUERY 9: Create Parent Table - Authors
-- ============================================================================
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(30)
);

-- ============================================================================
-- QUERY 10: Create Child Table - Books with Foreign Key Referencing Authors
-- ============================================================================
CREATE TABLE Books (
    BookID INT,
    BookTitle VARCHAR(30),
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- ============================================================================
-- QUERY 11: Create Parent Table - Categories
-- ============================================================================
CREATE TABLE categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(30)
);

-- ============================================================================
-- QUERY 12: Create Child Table - Products with Foreign Key Referencing Categories
-- ============================================================================
CREATE TABLE products (
    ProductID INT,
    ProductName VARCHAR(30),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES categories(CategoryID)
);

-- ============================================================================
-- QUERY 13: Create Parent Table - Teachers
-- ============================================================================
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    TeacherName VARCHAR(30)
);

-- ============================================================================
-- QUERY 14: Create Child Table - Students with Foreign Key Referencing Teachers
-- ============================================================================
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(30),
    TeacherID INT,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);