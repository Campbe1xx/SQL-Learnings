-- ============================================================
-- Module 02 – Reading Data
-- Exercise 4: Subqueries and CTEs
-- ============================================================
-- SETUP: Run this section first to create and populate tables
-- ============================================================

DROP TABLE IF EXISTS production_runs;
DROP TABLE IF EXISTS equipment;

CREATE TABLE equipment (
    equipment_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    plant_area VARCHAR(50) NOT NULL,
    hourly_rate_gbp NUMERIC(10,2) NOT NULL,
    is_operational BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE production_runs (
    run_id SERIAL PRIMARY KEY,
    machine_id INT NOT NULL REFERENCES equipment (equipment_id),
    product_code VARCHAR(20) NOT NULL,
    units_produced INT NOT NULL,
    defects INT NOT NULL,
    run_date DATE NOT NULL
);

INSERT INTO equipment (name, category, plant_area, hourly_rate_gbp, is_operational) VALUES
    ('CNC Mill Alpha', 'Machining', 'Machining Bay A', 95.00, TRUE),
    ('Laser Cutter L2', 'Fabrication', 'Fabrication Cell 1', 120.00, TRUE),
    ('Robot Arm R7', 'Assembly', 'Assembly Line 2', 85.75, TRUE),
    ('Hydraulic Press H5', 'Forming', 'Press Hall', 110.00, TRUE),
    ('Paint Booth P9', 'Finishing', 'Finishing Zone', 58.00, FALSE);

INSERT INTO production_runs (machine_id, product_code, units_produced, defects, run_date) VALUES
    (1, 'AX-100', 120, 2, '2025-04-01'),
    (1, 'AX-100', 132, 1, '2025-04-02'),
    (1, 'AX-200', 128, 4, '2025-04-03'),
    (2, 'BX-200', 98, 5, '2025-04-01'),
    (2, 'BX-200', 104, 3, '2025-04-03'),
    (3, 'CX-300', 90, 1, '2025-04-02'),
    (3, 'CX-300', 95, 0, '2025-04-04'),
    (4, 'DX-400', 150, 6, '2025-04-02'),
    (4, 'DX-400', 155, 7, '2025-04-04');

-- ============================================================
-- EXERCISES
-- ============================================================

-- Q1: Use a non-correlated subquery to find production runs with units_produced above the overall average.
-- Write your query below:


-- Q2: Use a correlated subquery to find runs where defects are above the average defects for that same machine.
-- Write your query below:


-- Q3: Use EXISTS to list equipment that has at least one production run.
-- Write your query below:


-- Q4: Use a CTE to calculate total units produced per machine and join it back to equipment.
-- Write your query below:


-- Q5: Use nested CTEs to compare each machine's total units to the average total units for its category.
-- Write your query below:
