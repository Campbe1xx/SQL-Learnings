-- ============================================================
-- Module 02 – Reading Data
-- Exercise 1: SELECT, WHERE, ORDER BY, and LIMIT
-- ============================================================
-- SETUP: Run this section first to create and populate tables
-- ============================================================

DROP TABLE IF EXISTS equipment;

CREATE TABLE equipment (
    equipment_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    plant_area VARCHAR(50) NOT NULL,
    hourly_rate_gbp NUMERIC(10,2) NOT NULL,
    last_service_date DATE NOT NULL,
    is_operational BOOLEAN NOT NULL DEFAULT TRUE
);

INSERT INTO equipment (name, category, plant_area, hourly_rate_gbp, last_service_date, is_operational) VALUES
    ('CNC Mill Alpha', 'Machining', 'Machining Bay A', 95.00, '2025-01-14', TRUE),
    ('CNC Mill Beta', 'Machining', 'Machining Bay B', 102.50, '2025-03-02', TRUE),
    ('Laser Cutter L2', 'Fabrication', 'Fabrication Cell 1', 120.00, '2024-12-11', TRUE),
    ('Robot Arm R7', 'Assembly', 'Assembly Line 2', 85.75, '2025-02-20', TRUE),
    ('Vision Scanner V1', 'Inspection', 'Quality Lab', 67.40, '2025-04-05', TRUE),
    ('Paint Booth P9', 'Finishing', 'Finishing Zone', 58.00, '2024-10-19', FALSE),
    ('Hydraulic Press H5', 'Forming', 'Press Hall', 110.00, '2024-11-28', TRUE),
    ('Conveyor C3', 'Material Handling', 'Dispatch Lane', 42.00, '2025-03-18', TRUE),
    ('Welding Station W9', 'Fabrication', 'Fabrication Cell 2', 78.25, '2025-01-31', FALSE),
    ('Packaging Cell P4', 'Packaging', 'Dispatch Lane', 49.99, '2025-04-12', TRUE);

-- ============================================================
-- EXERCISES
-- ============================================================

-- Q1: Return all columns for every row in equipment.
-- Write your query below:


-- Q2: Show operational equipment in Machining or Fabrication with an hourly rate above 80 GBP.
-- Write your query below:


-- Q3: List equipment ordered by hourly_rate_gbp from highest to lowest, then by name.
-- Write your query below:


-- Q4: Return the 3 most recently serviced pieces of equipment.
-- Write your query below:


-- Q5: Find equipment where the hourly rate is BETWEEN 50 and 110, the plant_area is IN ('Dispatch Lane', 'Quality Lab', 'Press Hall'), or the name LIKE 'CNC%'.
-- Write your query below:
