/* ============================================================================
   SQL DAY 3 ASSIGNMENT - COMPLETE SOLVED EXERCISES & EXPLANATIONS
   ============================================================================
   Author: Prasanth Golla
   Description: Complete solved SQL queries for SalesDB covering:
                Setup: SalesDB Database Creation & Data Seeding
                Part A: Subquery Exercises (Q1 - Q10)
                Part B: Aggregate Functions with JOIN Exercises (Q11 - Q20)
                Part C: Database Views (Q21 - Q25)
                Part D: Advanced Analytical Queries & Views (Q26 - Q35)
   ============================================================================ */

-- ============================================================================
-- SCHEMA SETUP & DATA SEEDING (SalesDB)
-- ============================================================================

CREATE DATABASE IF NOT EXISTS SalesDB;
USE SalesDB;

CREATE TABLE IF NOT EXISTS Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT,
    supplier VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    product_id INT,
    quantity INT,
    order_date DATE,
    city VARCHAR(50),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Seed Data (TRUNCATE first if re-running)
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Orders;
TRUNCATE TABLE Products;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO Products (product_name, category, price, stock, supplier) VALUES
('Laptop', 'Electronics', 65000, 20, 'Dell'),
('Mouse', 'Electronics', 700, 100, 'Logitech'),
('Keyboard', 'Electronics', 1200, 80, 'HP'),
('Monitor', 'Electronics', 15000, 35, 'Samsung'),
('Printer', 'Electronics', 18000, 15, 'Canon'),
('Office Chair', 'Furniture', 8500, 25, 'Godrej'),
('Table', 'Furniture', 12000, 18, 'Godrej'),
('Pen', 'Stationery', 20, 500, 'Cello'),
('Notebook', 'Stationery', 120, 300, 'Classmate'),
('Water Bottle', 'Accessories', 450, 150, 'Milton');

INSERT INTO Orders (customer_name, product_id, quantity, order_date, city) VALUES
('Rahul', 1, 2, '2024-01-10', 'Hyderabad'),
('Priya', 2, 5, '2024-01-11', 'Chennai'),
('Arun', 3, 3, '2024-01-12', 'Bangalore'),
('Sneha', 1, 1, '2024-01-14', 'Hyderabad'),
('Kiran', 4, 2, '2024-01-15', 'Mumbai'),
('David', 5, 1, '2024-01-16', 'Pune'),
('John', 2, 10, '2024-01-18', 'Delhi'),
('Anu', 6, 2, '2024-01-19', 'Chennai'),
('Sai', 8, 20, '2024-01-20', 'Hyderabad'),
('Ravi', 9, 15, '2024-01-22', 'Bangalore'),
('Pooja', 10, 6, '2024-01-23', 'Delhi'),
('Ram', 1, 1, '2024-01-25', 'Hyderabad'),
('Deepa', 7, 2, '2024-01-27', 'Chennai'),
('Amit', 4, 1, '2024-01-28', 'Mumbai'),
('Karthik', 3, 4, '2024-01-30', 'Pune');


-- ============================================================================
-- PART A: SUBQUERY EXERCISES (QUESTIONS 1 - 10)
-- ============================================================================

/* Q1: Products whose price is greater than average product price */
SELECT * FROM Products 
WHERE price > (SELECT AVG(price) FROM Products);

/* Q2: Product having the highest price */
SELECT * FROM Products 
WHERE price = (SELECT MAX(price) FROM Products);

/* Q3: Customers who ordered the most expensive product */
SELECT DISTINCT customer_name FROM Orders 
WHERE product_id = (SELECT product_id FROM Products WHERE price = (SELECT MAX(price) FROM Products));

/* Q4: Products that have never been ordered */
SELECT * FROM Products 
WHERE product_id NOT IN (SELECT DISTINCT product_id FROM Orders);

/* Q5: Second highest priced product */
SELECT * FROM Products 
WHERE price = (
    SELECT MAX(price) FROM Products 
    WHERE price < (SELECT MAX(price) FROM Products)
);

/* Q6: Products whose stock is less than average stock */
SELECT * FROM Products 
WHERE stock < (SELECT AVG(stock) FROM Products);

/* Q7: Customers who ordered products costing more than ₹15,000 */
SELECT DISTINCT customer_name FROM Orders 
WHERE product_id IN (SELECT product_id FROM Products WHERE price > 15000);

/* Q8: Products ordered by customers from Hyderabad */
SELECT DISTINCT p.* FROM Products p
JOIN Orders o ON p.product_id = o.product_id
WHERE o.city = 'Hyderabad';

/* Q9: Products whose price is greater than EVERY Stationery product */
SELECT * FROM Products 
WHERE price > ALL (SELECT price FROM Products WHERE category = 'Stationery');

/* Q10: Categories whose average product price is greater than overall average price */
SELECT category, AVG(price) AS avg_cat_price FROM Products 
GROUP BY category 
HAVING AVG(price) > (SELECT AVG(price) FROM Products);


-- ============================================================================
-- PART B: AGGREGATE FUNCTIONS WITH JOIN (QUESTIONS 11 - 20)
-- ============================================================================

/* Q11: Each product name and total quantity ordered */
SELECT p.product_name, IFNULL(SUM(o.quantity), 0) AS total_quantity_ordered
FROM Products p
LEFT JOIN Orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name;

/* Q12: Total sales amount for each product (Price * Quantity) */
SELECT p.product_name, IFNULL(SUM(p.price * o.quantity), 0) AS total_sales_amount
FROM Products p
LEFT JOIN Orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name;

/* Q13: Number of orders placed for each product */
SELECT p.product_name, COUNT(o.order_id) AS total_orders
FROM Products p
LEFT JOIN Orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name;

/* Q14: Average quantity ordered for each category */
SELECT p.category, AVG(o.quantity) AS avg_ordered_quantity
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
GROUP BY p.category;

/* Q15: Highest order quantity for every product */
SELECT p.product_name, MAX(o.quantity) AS max_order_qty
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name;

/* Q16: Minimum quantity ordered for each category */
SELECT p.category, MIN(o.quantity) AS min_category_qty
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
GROUP BY p.category;

/* Q17: Total sales amount generated by each category */
SELECT p.category, SUM(p.price * o.quantity) AS category_total_sales
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
GROUP BY p.category;

/* Q18: City that purchased the maximum number of products */
SELECT city, SUM(quantity) AS total_items_bought
FROM Orders
GROUP BY city
ORDER BY total_items_bought DESC
LIMIT 1;

/* Q19: Supplier-wise total sales amount */
SELECT p.supplier, SUM(p.price * o.quantity) AS supplier_total_sales
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
GROUP BY p.supplier;

/* Q20: Products whose total ordered quantity is greater than 5 */
SELECT p.product_name, SUM(o.quantity) AS total_qty
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name
HAVING SUM(o.quantity) > 5;


-- ============================================================================
-- PART C: DATABASE VIEWS (QUESTIONS 21 - 25)
-- ============================================================================

/* Q21: Create ProductDetails View */
CREATE OR REPLACE VIEW ProductDetails AS
SELECT product_name, category, price, stock 
FROM Products;

/* Q22: Create OrderSummary View */
CREATE OR REPLACE VIEW OrderSummary AS
SELECT o.customer_name, p.product_name, o.quantity, o.order_date, o.city
FROM Orders o
JOIN Products p ON o.product_id = p.product_id;

/* Q23: Create ProductTotalSales View */
CREATE OR REPLACE VIEW ProductTotalSales AS
SELECT p.product_name, IFNULL(SUM(p.price * o.quantity), 0) AS total_sales_amount
FROM Products p
LEFT JOIN Orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name;

/* Q24: Create ElectronicsProducts View */
CREATE OR REPLACE VIEW ElectronicsProducts AS
SELECT * FROM Products 
WHERE category = 'Electronics';

/* Q25: Create HighValueCustomers View (> ₹20,000 in a single order) */
CREATE OR REPLACE VIEW HighValueCustomers AS
SELECT DISTINCT o.customer_name, (p.price * o.quantity) AS order_value
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
WHERE (p.price * o.quantity) > 20000;


-- ============================================================================
-- PART D: ADVANCED ANALYTICAL QUERIES & VIEWS (QUESTIONS 26 - 35)
-- ============================================================================

/* Q26: Top 3 most ordered products */
SELECT p.product_name, SUM(o.quantity) AS total_ordered
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_ordered DESC
LIMIT 3;

/* Q27: Customers who ordered more than one different product */
SELECT customer_name, COUNT(DISTINCT product_id) AS distinct_products_bought
FROM Orders
GROUP BY customer_name
HAVING COUNT(DISTINCT product_id) > 1;

/* Q28: Products with no stock but having orders */
SELECT p.product_name, p.stock, COUNT(o.order_id) AS order_count
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
WHERE p.stock = 0
GROUP BY p.product_id, p.product_name;

/* Q29: Suppliers whose products generated more than ₹50,000 in sales */
SELECT p.supplier, SUM(p.price * o.quantity) AS supplier_sales
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
GROUP BY p.supplier
HAVING SUM(p.price * o.quantity) > 50000;

/* Q30: View for Monthly Sales Reports */
CREATE OR REPLACE VIEW MonthlySalesReport AS
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
    COUNT(o.order_id) AS total_orders,
    SUM(o.quantity) AS total_quantity_sold,
    SUM(p.price * o.quantity) AS monthly_revenue
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m');

/* Q31: Category contributing highest revenue */
SELECT p.category, SUM(p.price * o.quantity) AS category_revenue
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
GROUP BY p.category
ORDER BY category_revenue DESC
LIMIT 1;

/* Q32: Customers whose total purchase amount is above average customer purchase amount */
WITH CustomerTotals AS (
    SELECT customer_name, SUM(p.price * o.quantity) AS total_spend
    FROM Orders o
    JOIN Products p ON o.product_id = p.product_id
    GROUP BY customer_name
)
SELECT customer_name, total_spend 
FROM CustomerTotals
WHERE total_spend > (SELECT AVG(total_spend) FROM CustomerTotals);

/* Q33: Products ordered in more than three different cities */
SELECT p.product_name, COUNT(DISTINCT o.city) AS distinct_cities
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name
HAVING COUNT(DISTINCT o.city) > 3;

/* Q34: Supplier with highest average product price */
SELECT supplier, AVG(price) AS avg_supplier_price
FROM Products
GROUP BY supplier
ORDER BY avg_supplier_price DESC
LIMIT 1;

/* Q35: View showing top-selling products */
CREATE OR REPLACE VIEW TopSellingProducts AS
SELECT p.product_name, p.category, SUM(o.quantity) AS total_units_sold, SUM(p.price * o.quantity) AS total_revenue
FROM Products p
JOIN Orders o ON p.product_id = o.product_id
GROUP BY p.product_id, p.product_name, p.category
ORDER BY total_revenue DESC;
