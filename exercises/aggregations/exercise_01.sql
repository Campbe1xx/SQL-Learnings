-- ============================================================
-- Root Exercises – Aggregations
-- Exercise 1: Aggregate Queries
-- ============================================================
-- SETUP: Run this section first to create and populate tables
-- ============================================================

DROP TABLE IF EXISTS sales;

CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    sales_region VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
    sale_value NUMERIC(10,2) NOT NULL,
    sale_date DATE NOT NULL
);

INSERT INTO sales (product_name, sales_region, quantity, sale_value, sale_date) VALUES
    ('Servo Motor', 'North', 5, 1600.00, '2025-04-01'),
    ('Servo Motor', 'South', 3, 960.00, '2025-04-03'),
    ('Laser Nozzle', 'North', 12, 294.00, '2025-04-04'),
    ('Pressure Sensor', 'East', 8, 391.92, '2025-04-05'),
    ('Pressure Sensor', 'West', 4, 195.96, '2025-04-06'),
    ('Hydraulic Seal Kit', 'South', 6, 238.50, '2025-04-07');

-- ============================================================
-- EXERCISES
-- ============================================================

-- Q1: Count total sales rows.
-- Write your query below:


-- Q2: Sum sale_value by sales_region.
-- Write your query below:


-- Q3: Calculate average quantity per product_name.
-- Write your query below:


-- Q4: Show the minimum and maximum sale_value.
-- Write your query below:


-- Q5: Return only regions with total sale_value greater than 500.
-- Write your query below:
