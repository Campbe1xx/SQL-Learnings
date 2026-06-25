-- ============================================================
-- Module 01 – Foundations
-- Exercise 2: Data Types and Constraints Reference
-- ============================================================
-- SETUP: Run this section first to create and populate tables
-- ============================================================

DROP TABLE IF EXISTS components;

CREATE TABLE components (
    component_id SERIAL PRIMARY KEY,
    component_name VARCHAR(100) NOT NULL,
    data_type_example TEXT NOT NULL,
    constraint_type VARCHAR(50) NOT NULL,
    notes TEXT
);

INSERT INTO components (component_name, data_type_example, constraint_type, notes) VALUES
    ('Machine Identifier', 'INTEGER', 'PRIMARY KEY', 'Whole-number surrogate key for each machine record.'),
    ('Serial Number', 'VARCHAR(30)', 'UNIQUE', 'Human-readable asset code that must not repeat.'),
    ('Operational Flag', 'BOOLEAN', 'DEFAULT', 'Defaults to TRUE when a machine is commissioned.'),
    ('Commission Date', 'DATE', 'NOT NULL', 'Required date showing when a machine entered service.'),
    ('Hourly Cost', 'NUMERIC(10,2)', 'CHECK', 'CHECK can ensure hourly cost is greater than or equal to zero.'),
    ('Maintenance Notes', 'TEXT', 'NULLABLE', 'Free-form text for engineering notes and observations.'),
    ('Last Telemetry Sync', 'TIMESTAMP', 'NOT NULL', 'Timestamp recorded when edge telemetry last synced.'),
    ('Inspection Score', 'INTEGER', 'CHECK', 'CHECK can keep scores between 0 and 100.'),
    ('Supplier Email', 'VARCHAR(120)', 'UNIQUE', 'Unique contact address for approved suppliers.'),
    ('Critical Spare Flag', 'BOOLEAN', 'NOT NULL', 'Required flag that marks critical replacement items.');

-- ============================================================
-- EXERCISES
-- ============================================================

-- Q1: List all components and their data types.
-- Write your query below:


-- Q2: Show all components with a NOT NULL constraint.
-- Write your query below:


-- Q3: Which data type is used most often?
-- Write your query below:


-- ============================================================
-- CHALLENGE
-- ============================================================

-- C1: Explain (via a comment) when you would use NUMERIC vs FLOAT for sensor readings.
-- Write your answer below as SQL comments:
