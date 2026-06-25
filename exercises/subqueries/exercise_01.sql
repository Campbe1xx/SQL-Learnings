-- ============================================================
-- Root Exercises – Subqueries
-- Exercise 1: Nested Query Practice
-- ============================================================
-- SETUP: Run this section first to create and populate tables
-- ============================================================

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    industry VARCHAR(50) NOT NULL
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customers (customer_id),
    order_total NUMERIC(10,2) NOT NULL,
    order_date DATE NOT NULL
);

INSERT INTO customers (customer_name, industry) VALUES
    ('NorthFab Ltd', 'Manufacturing'),
    ('Delta Motion', 'Automation'),
    ('Forge Systems', 'Metalwork'),
    ('Cobalt Engineering', 'Aerospace');

INSERT INTO orders (customer_id, order_total, order_date) VALUES
    (1, 1200.00, '2025-04-01'),
    (1, 450.00, '2025-04-05'),
    (2, 980.00, '2025-04-03'),
    (3, 1575.00, '2025-04-04'),
    (3, 880.00, '2025-04-08');

-- ============================================================
-- EXERCISES
-- ============================================================

-- Q1: Find orders above the average order_total.
-- Write your query below:


-- Q2: List customers who have at least one order using EXISTS.
-- Write your query below:


-- Q3: Find the customer with the highest total order value using a subquery.
-- Write your query below:


-- Q4: Show orders placed by customers in the Manufacturing industry.
-- Use a subquery in the WHERE clause.
-- Write your query below:


-- Q5: Use a correlated subquery to find each customer's latest order.
-- Write your query below:
