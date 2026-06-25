-- ============================================================
-- Root Exercises – Joins
-- Exercise 1: Customers and Orders
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
    customer_id INT REFERENCES customers (customer_id),
    order_date DATE NOT NULL,
    order_total NUMERIC(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL
);

INSERT INTO customers (customer_name, industry) VALUES
    ('NorthFab Ltd', 'Manufacturing'),
    ('Delta Motion', 'Automation'),
    ('Forge Systems', 'Metalwork'),
    ('Cobalt Engineering', 'Aerospace');

INSERT INTO orders (customer_id, order_date, order_total, status) VALUES
    (1, '2025-04-01', 1200.00, 'Shipped'),
    (1, '2025-04-05', 450.00, 'Pending'),
    (2, '2025-04-03', 980.00, 'Shipped'),
    (3, '2025-04-04', 1575.00, 'Cancelled');

-- ============================================================
-- EXERCISES
-- ============================================================

-- Q1: INNER JOIN customers to orders.
-- Write your query below:


-- Q2: LEFT JOIN customers to orders.
-- Write your query below:


-- Q3: Show customers without orders.
-- Write your query below:


-- Q4: Count orders per customer.
-- Write your query below:


-- Q5: Show only shipped orders with the customer name.
-- Write your query below:
