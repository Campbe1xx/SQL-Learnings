-- ============================================================
-- Module 08 – Security
-- Exercise 1: Roles, Permissions, Injection Prevention, and RLS
-- ============================================================
-- SETUP: Run this section first to create and populate tables
-- ============================================================

DROP TABLE IF EXISTS work_orders;
DROP TABLE IF EXISTS technicians;
DROP TABLE IF EXISTS production_runs;
DROP TABLE IF EXISTS machines;

CREATE TABLE machines (
    machine_id SERIAL PRIMARY KEY,
    machine_name VARCHAR(100) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE production_runs (
    run_id SERIAL PRIMARY KEY,
    machine_id INT NOT NULL REFERENCES machines (machine_id),
    units_produced INT NOT NULL,
    run_date DATE NOT NULL
);

CREATE TABLE technicians (
    technician_id SERIAL PRIMARY KEY,
    technician_name VARCHAR(100) NOT NULL,
    login_role VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE work_orders (
    work_order_id SERIAL PRIMARY KEY,
    technician_id INT NOT NULL REFERENCES technicians (technician_id),
    machine_id INT NOT NULL REFERENCES machines (machine_id),
    issue_summary VARCHAR(150) NOT NULL,
    status VARCHAR(20) NOT NULL
);

INSERT INTO machines (machine_name, is_active) VALUES
    ('CNC Mill Alpha', TRUE),
    ('Laser Cutter L2', TRUE),
    ('Robot Arm R7', FALSE);

INSERT INTO production_runs (machine_id, units_produced, run_date) VALUES
    (1, 120, '2025-04-01'),
    (1, 132, '2025-04-02'),
    (2, 98, '2025-04-01');

INSERT INTO technicians (technician_name, login_role) VALUES
    ('Ava Singh', 'tech_ava'),
    ('Liam Carter', 'tech_liam');

INSERT INTO work_orders (technician_id, machine_id, issue_summary, status) VALUES
    (1, 1, 'Inspect spindle vibration', 'Open'),
    (1, 2, 'Replace worn nozzle', 'In Progress'),
    (2, 3, 'Reset robot safety gate', 'Open');

-- ============================================================
-- EXERCISES
-- ============================================================

-- Q1: CREATE ROLE readonly_analyst with NOLOGIN and GRANT SELECT on all tables in schema public to it.
-- Write your SQL below:


-- Q2: CREATE USER jane_analyst with a practice password and GRANT the readonly_analyst role to her.
-- Write your SQL below:


-- Q3: REVOKE INSERT on machines from readonly_analyst.
-- Write your SQL below:


-- Q4: Show a SQL injection vulnerability example as comments, then show a parameterised query fix.
-- Write your comments and SQL below:


-- Q5: CREATE a row level security policy that restricts a technician to only see their own work orders.
-- Hint: use current_setting('app.current_technician_id') in the policy.
-- Write your SQL below:


-- ============================================================
-- CHALLENGE
-- ============================================================

-- C1: Write SQL to audit which roles have which privileges on production_runs.
-- Write your query below:
