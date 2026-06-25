-- ============================================================
-- Module 06 – Advanced SQL
-- Exercise 2: Stored Procedures and Functions
-- ============================================================
-- SETUP: Run this section first to create and populate tables
-- ============================================================

DROP PROCEDURE IF EXISTS create_work_order(INT, VARCHAR, INT);
DROP FUNCTION IF EXISTS calculate_oee(NUMERIC, NUMERIC, NUMERIC);
DROP FUNCTION IF EXISTS top_n_machines_by_downtime(INT);
DROP FUNCTION IF EXISTS validate_machine_exists(INT);
DROP TABLE IF EXISTS downtime_events;
DROP TABLE IF EXISTS work_orders;
DROP TABLE IF EXISTS machines;

CREATE TABLE machines (
    machine_id SERIAL PRIMARY KEY,
    machine_name VARCHAR(100) NOT NULL
);

CREATE TABLE work_orders (
    work_order_id SERIAL PRIMARY KEY,
    machine_id INT NOT NULL REFERENCES machines (machine_id),
    issue_summary VARCHAR(150) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE downtime_events (
    event_id SERIAL PRIMARY KEY,
    machine_id INT NOT NULL REFERENCES machines (machine_id),
    downtime_minutes INT NOT NULL,
    event_date DATE NOT NULL
);

INSERT INTO machines (machine_name) VALUES
    ('CNC Mill Alpha'),
    ('Laser Cutter L2'),
    ('Robot Arm R7');

INSERT INTO downtime_events (machine_id, downtime_minutes, event_date) VALUES
    (1, 30, '2025-04-01'),
    (1, 20, '2025-04-02'),
    (2, 45, '2025-04-01'),
    (3, 15, '2025-04-03'),
    (3, 25, '2025-04-05');

-- ============================================================
-- EXERCISES
-- ============================================================

-- Q1: CREATE FUNCTION calculate_oee(availability, performance, quality)
--     that returns availability * performance * quality as a percentage.
-- Write your SQL below:


-- Q2: CREATE PROCEDURE create_work_order that inserts a new work order and returns the new ID through an INOUT parameter.
-- Write your SQL below:


-- Q3: CREATE FUNCTION top_n_machines_by_downtime(top_n INT)
--     that returns a table of machine_id, machine_name, and total_downtime_minutes.
-- Write your SQL below:


-- ============================================================
-- CHALLENGE
-- ============================================================

-- C1: Write a function that raises an exception if a machine_id does not exist.
-- Write your SQL below:
