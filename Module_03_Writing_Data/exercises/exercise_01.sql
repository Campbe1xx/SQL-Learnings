-- ============================================================
-- Module 03 – Writing Data
-- Exercise 1: INSERT, UPDATE, DELETE, and Bulk Operations
-- ============================================================
-- SETUP: Run this section first to create and populate tables
-- ============================================================

DROP TABLE IF EXISTS spare_parts;

CREATE TABLE spare_parts (
    part_id SERIAL PRIMARY KEY,
    part_name VARCHAR(100) NOT NULL,
    stock_qty INT NOT NULL CHECK (stock_qty >= 0),
    reorder_level INT NOT NULL CHECK (reorder_level >= 0),
    unit_cost NUMERIC(10,2) NOT NULL CHECK (unit_cost >= 0),
    supplier VARCHAR(100) NOT NULL,
    last_updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO spare_parts (part_name, stock_qty, reorder_level, unit_cost, supplier, last_updated) VALUES
    ('Bearing Set B-210', 24, 10, 18.50, 'NorthMill Supplies', '2025-04-01 08:00:00'),
    ('Hydraulic Seal Kit HSK-9', 8, 6, 42.00, 'FluidTech UK', '2025-04-01 08:15:00'),
    ('Servo Drive SD-55', 4, 3, 245.00, 'Motion Works', '2025-04-01 08:30:00'),
    ('Obsolete Relay Mk1', 2, 0, 9.99, 'Legacy Controls', '2025-04-01 08:45:00');

-- ============================================================
-- EXERCISES
-- ============================================================

-- Q1: INSERT 5 new spare parts into the table.
-- Write your statements below:


-- Q2: UPDATE stock_qty for the part named 'Bearing Set B-210'.
-- Write your statement below:


-- Q3: DELETE the discontinued part named 'Obsolete Relay Mk1'.
-- Always use a WHERE clause.
-- Write your statement below:


-- Q4: Bulk INSERT 3 parts using a single INSERT statement.
-- Write your statement below:


-- Q5: UPDATE all parts from supplier 'NorthMill Supplies' with a 10% price increase.
-- Write your statement below:


-- ============================================================
-- CHALLENGE
-- ============================================================

-- C1: Write an UPDATE that only changes last_updated if stock_qty drops below reorder_level.
-- Write your statement below:
