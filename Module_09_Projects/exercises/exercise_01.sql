-- ============================================================
-- Module 09 – Projects
-- Exercise 1: Downtime and OEE Capstone
-- ============================================================
-- SETUP: Run this section first to create and populate tables
-- ============================================================

DROP VIEW IF EXISTS machine_oee_summary;
DROP TABLE IF EXISTS machine_dependencies;
DROP TABLE IF EXISTS downtime_events;
DROP TABLE IF EXISTS work_orders;
DROP TABLE IF EXISTS technicians;
DROP TABLE IF EXISTS spare_parts;
DROP TABLE IF EXISTS production_runs;
DROP TABLE IF EXISTS machines;

CREATE TABLE machines (
    machine_id SERIAL PRIMARY KEY,
    machine_name VARCHAR(100) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Running',
    is_active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE downtime_events (
    event_id SERIAL PRIMARY KEY,
    machine_id INT NOT NULL REFERENCES machines (machine_id),
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    downtime_minutes INT NOT NULL,
    cause_category VARCHAR(50) NOT NULL
);

CREATE TABLE technicians (
    technician_id SERIAL PRIMARY KEY,
    technician_name VARCHAR(100) NOT NULL
);

CREATE TABLE work_orders (
    work_order_id SERIAL PRIMARY KEY,
    machine_id INT NOT NULL REFERENCES machines (machine_id),
    technician_id INT NOT NULL REFERENCES technicians (technician_id),
    issue_summary VARCHAR(150) NOT NULL,
    status VARCHAR(20) NOT NULL
);

CREATE TABLE spare_parts (
    part_id SERIAL PRIMARY KEY,
    part_name VARCHAR(100) NOT NULL,
    stock_qty INT NOT NULL
);

CREATE TABLE production_runs (
    run_id SERIAL PRIMARY KEY,
    machine_id INT NOT NULL REFERENCES machines (machine_id),
    units_produced INT NOT NULL,
    good_units INT NOT NULL,
    planned_minutes INT NOT NULL,
    runtime_minutes INT NOT NULL,
    ideal_cycle_seconds NUMERIC(10,2) NOT NULL,
    run_date DATE NOT NULL
);

CREATE TABLE machine_dependencies (
    machine_id INT NOT NULL REFERENCES machines (machine_id),
    depends_on_machine_id INT NOT NULL REFERENCES machines (machine_id),
    PRIMARY KEY (machine_id, depends_on_machine_id)
);

INSERT INTO machines (machine_name, status, is_active) VALUES
    ('CNC Mill Alpha', 'Running', TRUE),
    ('Laser Cutter L2', 'Running', TRUE),
    ('Robot Arm R7', 'Running', TRUE),
    ('Hydraulic Press H5', 'Running', TRUE);

INSERT INTO downtime_events (machine_id, start_time, end_time, downtime_minutes, cause_category) VALUES
    (1, '2025-02-03 09:00', '2025-02-03 09:35', 35, 'Mechanical'),
    (1, '2025-03-10 13:00', '2025-03-10 13:20', 20, 'Electrical'),
    (1, '2025-04-11 07:40', '2025-04-11 08:25', 45, 'Mechanical'),
    (2, '2025-02-12 10:00', '2025-02-12 10:15', 15, 'Material Shortage'),
    (2, '2025-03-22 15:30', '2025-03-22 16:20', 50, 'Mechanical'),
    (2, '2025-04-06 11:00', '2025-04-06 11:40', 40, 'Setup'),
    (3, '2025-02-18 08:10', '2025-02-18 08:55', 45, 'Electrical'),
    (3, '2025-03-28 17:00', '2025-03-28 17:25', 25, 'Software'),
    (3, '2025-04-14 12:00', '2025-04-14 12:20', 20, 'Electrical'),
    (4, '2025-02-20 06:30', '2025-02-20 07:05', 35, 'Hydraulic'),
    (4, '2025-03-05 09:00', '2025-03-05 09:50', 50, 'Hydraulic'),
    (4, '2025-04-16 14:15', '2025-04-16 15:05', 50, 'Mechanical');

INSERT INTO technicians (technician_name) VALUES
    ('Ava Singh'),
    ('Liam Carter'),
    ('Noah Patel');

INSERT INTO work_orders (machine_id, technician_id, issue_summary, status) VALUES
    (1, 1, 'Inspect spindle cooling loop', 'Closed'),
    (2, 2, 'Replace laser nozzle', 'Open'),
    (3, 3, 'Diagnose controller alarm', 'In Progress'),
    (4, 2, 'Repair hydraulic leak', 'Open');

INSERT INTO spare_parts (part_name, stock_qty) VALUES
    ('Bearing Set B-210', 24),
    ('Laser Nozzle LN-4', 8),
    ('Servo Drive SD-55', 4),
    ('Hydraulic Seal Kit HSK-9', 10);

INSERT INTO production_runs (machine_id, units_produced, good_units, planned_minutes, runtime_minutes, ideal_cycle_seconds, run_date) VALUES
    (1, 120, 117, 480, 445, 180.00, '2025-02-25'),
    (1, 130, 126, 480, 460, 180.00, '2025-03-25'),
    (1, 125, 121, 480, 435, 180.00, '2025-04-25'),
    (2, 210, 204, 480, 455, 90.00, '2025-02-25'),
    (2, 205, 199, 480, 430, 90.00, '2025-03-25'),
    (2, 215, 208, 480, 425, 90.00, '2025-04-25'),
    (3, 180, 177, 480, 440, 120.00, '2025-02-25'),
    (3, 176, 170, 480, 455, 120.00, '2025-03-25'),
    (3, 182, 179, 480, 460, 120.00, '2025-04-25'),
    (4, 140, 136, 480, 445, 150.00, '2025-02-25'),
    (4, 138, 133, 480, 430, 150.00, '2025-03-25'),
    (4, 142, 137, 480, 420, 150.00, '2025-04-25');

INSERT INTO machine_dependencies (machine_id, depends_on_machine_id) VALUES
    (2, 1),
    (3, 2),
    (4, 2);

-- ============================================================
-- EXERCISES
-- ============================================================

-- Q1: Write a query showing total downtime per machine per month.
-- Include a window function alongside the grouped result.
-- Write your query below:


-- Q2: Find machines where downtime this month exceeds the 3-month average.
-- Use a CTE and a subquery.
-- Write your query below:


-- Q3: Show the top 3 most common downtime causes with percentage of total downtime.
-- Use an aggregate and a window function.
-- Write your query below:


-- Q4: Create a VIEW that summarises OEE metrics per machine.
-- Write your SQL below:


-- Q5: Write a transaction that logs a new downtime event and updates the machine status atomically.
-- Write your SQL below:


-- ============================================================
-- CHALLENGE
-- ============================================================

-- C1: Use a recursive CTE to traverse the machine dependency tree and identify cascade failure risks.
-- Write your query below:
