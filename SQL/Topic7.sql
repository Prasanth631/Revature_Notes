/* ============================================================================
   TOPIC 7: CHECK CONSTRAINT & DOMAIN INTEGRITY VALIDATION RULES
   ============================================================================
   Author: Prasanth Golla
   Description: Comprehensive SQL Notes & Assignments covering CHECK constraints,
                domain validation, value ranges (BETWEEN), string choice lists (IN),
                and conditional logic.
   ============================================================================ */

-- ============================================================================
-- QUERY 1: Create Database
-- ============================================================================
CREATE DATABASE Topic7;

-- ============================================================================
-- QUERY 2: Select Active Database
-- ============================================================================
USE Topic7;

-- ============================================================================
-- QUERY 3: Create Student Table with Minimum Age Validation
-- ============================================================================
CREATE TABLE student (
    sid INT,
    sname VARCHAR(30),
    age INT CHECK (age >= 18)
);

-- ============================================================================
-- QUERY 4: Create Employee Table with Minimum Salary Validation
-- ============================================================================
CREATE TABLE employee (
    eid INT,
    ename VARCHAR(30),
    salary DECIMAL(10,2) CHECK (salary > 10000)
);

-- ============================================================================
-- QUERY 5: Create Product Table with Positive Price Validation
-- ============================================================================
CREATE TABLE product (
    pid INT,
    pname VARCHAR(30),
    price DECIMAL(10,2) CHECK (price > 0)
);

-- ============================================================================
-- QUERY 6: Create Customer Table with Gender Enumeration Validation
-- ============================================================================
CREATE TABLE Customer (
    cid INT,
    cname VARCHAR(30),
    gender VARCHAR(30) CHECK (gender IN ('Male', 'Female', 'Other'))
);

-- ============================================================================
-- QUERY 7: Create Exam Marks Table with Score Range Validation
-- ============================================================================
CREATE TABLE exam_marks (
    eid INT,
    ename VARCHAR(30),
    marks INT CHECK (marks BETWEEN 0 AND 100)
);
