-- ============================================================
-- Module 02 – Reading Data
-- Exercise 3: JOIN Patterns
-- ============================================================
-- SETUP: Run this section first to create and populate tables
-- ============================================================

DROP TABLE IF EXISTS work_order_assignments;
DROP TABLE IF EXISTS work_orders;
DROP TABLE IF EXISTS technicians;

CREATE TABLE technicians (
    technician_id SERIAL PRIMARY KEY,
    technician_name VARCHAR(100) NOT NULL,
    skill_area VARCHAR(50) NOT NULL,
    mentor_id INT REFERENCES technicians (technician_id)
);

CREATE TABLE work_orders (
    work_order_id SERIAL PRIMARY KEY,
    work_order_code VARCHAR(20) NOT NULL UNIQUE,
    machine_name VARCHAR(100) NOT NULL,
    priority VARCHAR(20) NOT NULL,
    status VARCHAR(20) NOT NULL
);

CREATE TABLE work_order_assignments (
    assignment_id SERIAL PRIMARY KEY,
    work_order_id INT NOT NULL REFERENCES work_orders (work_order_id),
    technician_id INT NOT NULL REFERENCES technicians (technician_id),
    assigned_on DATE NOT NULL
);

INSERT INTO technicians (technician_name, skill_area, mentor_id) VALUES
    ('Ava Singh', 'Electrical', NULL),
    ('Liam Carter', 'Mechanical', 1),
    ('Noah Patel', 'Controls', 1),
    ('Mia Evans', 'Hydraulics', 2),
    ('Sofia Reed', 'Inspection', NULL);

INSERT INTO work_orders (work_order_code, machine_name, priority, status) VALUES
    ('WO-1001', 'CNC Mill Alpha', 'High', 'Open'),
    ('WO-1002', 'Laser Cutter L2', 'Medium', 'In Progress'),
    ('WO-1003', 'Hydraulic Press H5', 'High', 'Open'),
    ('WO-1004', 'Packaging Cell P4', 'Low', 'Closed'),
    ('WO-1005', 'Vision Scanner V1', 'Medium', 'Open');

INSERT INTO work_order_assignments (work_order_id, technician_id, assigned_on) VALUES
    (1, 1, '2025-04-01'),
    (1, 2, '2025-04-01'),
    (2, 3, '2025-04-02'),
    (3, 2, '2025-04-03'),
    (4, 4, '2025-04-04');

-- ============================================================
-- EXERCISES
-- ============================================================

-- Q1: Use an INNER JOIN to show each assigned work order with the technician name.
-- Write your query below:


-- Q2: Use a LEFT JOIN to show all work orders, even if they have no assignment yet.
-- Write your query below:


-- Q3: Use a RIGHT JOIN to show all technicians, even if they are not assigned to a work order.
-- Write your query below:


-- Q4: Use a SELF JOIN on technicians to show each technician and their mentor.
-- Write your query below:


-- Q5: Find unmatched records by listing work orders with no technician assigned.
-- Write your query below:
