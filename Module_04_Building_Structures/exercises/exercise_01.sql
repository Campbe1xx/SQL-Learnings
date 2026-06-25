-- ============================================================
-- Module 04 – Building Structures
-- Exercise 1: CREATE, ALTER, DROP, and Indexes
-- ============================================================
-- SETUP: Run this section first to create supporting tables
-- ============================================================

DROP TABLE IF EXISTS machines CASCADE;

CREATE TABLE machines (
    machine_id SERIAL PRIMARY KEY,
    machine_name VARCHAR(100) NOT NULL
);

INSERT INTO machines (machine_name) VALUES
    ('CNC Mill Alpha'),
    ('Laser Cutter L2'),
    ('Robot Arm R7');

-- ============================================================
-- EXERCISES
-- ============================================================

-- Q1: CREATE a sensors table with:
--     sensor_id, machine_id (FK), sensor_type, unit, min_value, max_value, installed_date
--     Include PRIMARY KEY, FOREIGN KEY, NOT NULL, and CHECK constraints.
-- Write your DDL below:


-- Q2: ALTER the sensors table to add a calibration_date column.
-- Write your DDL below:


-- Q3: ALTER the sensors table to add a CHECK constraint ensuring min_value < max_value.
-- Write your DDL below:


-- Q4: CREATE an index on machine_id.
-- Write your DDL below:


-- Q5: DROP the single-column index, then recreate it as a composite index on (machine_id, sensor_type).
-- Write your DDL below:


-- ============================================================
-- CHALLENGE
-- ============================================================

-- C1: Write the DDL to rename the table and then rename a column.
-- Write your DDL below:
