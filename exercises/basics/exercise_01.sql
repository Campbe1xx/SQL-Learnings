-- ============================================================
-- Root Exercises – Basics
-- Exercise 1: Beginner SELECT Practice
-- ============================================================
-- SETUP: Run this section first to create and populate tables
-- ============================================================

DROP TABLE IF EXISTS products;

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price NUMERIC(10,2) NOT NULL,
    in_stock BOOLEAN NOT NULL
);

INSERT INTO products (product_name, category, unit_price, in_stock) VALUES
    ('Servo Motor', 'Motion', 320.00, TRUE),
    ('Linear Rail', 'Motion', 85.00, TRUE),
    ('Laser Nozzle', 'Cutting', 24.50, FALSE),
    ('Pressure Sensor', 'Instrumentation', 48.99, TRUE),
    ('Hydraulic Seal Kit', 'Fluid Power', 39.75, TRUE);

-- ============================================================
-- EXERCISES
-- ============================================================

-- Q1: List all products.
-- Write your query below:


-- Q2: Show product_name and unit_price only.
-- Write your query below:


-- Q3: Return products where in_stock is TRUE.
-- Write your query below:


-- Q4: Order products by unit_price from highest to lowest.
-- Write your query below:


-- Q5: Return the first 3 rows only.
-- Write your query below:
