-- ============================================================
-- Module 02 – Reading Data
-- Exercise 2: Aggregates, GROUP BY, and HAVING
-- ============================================================
-- SETUP: Run this section first to create and populate tables
-- ============================================================

DROP TABLE IF EXISTS production_runs;

CREATE TABLE production_runs (
    run_id SERIAL PRIMARY KEY,
    machine_id INT NOT NULL,
    product_code VARCHAR(20) NOT NULL,
    units_produced INT NOT NULL,
    defects INT NOT NULL,
    run_date DATE NOT NULL,
    shift VARCHAR(10) NOT NULL
);

INSERT INTO production_runs (machine_id, product_code, units_produced, defects, run_date, shift) VALUES
    (1, 'AX-100', 120, 2, '2025-04-01', 'Day'),
    (1, 'AX-100', 130, 1, '2025-04-02', 'Night'),
    (2, 'BX-200', 98, 5, '2025-04-01', 'Day'),
    (2, 'BX-200', 105, 4, '2025-04-03', 'Swing'),
    (3, 'CZ-310', 145, 3, '2025-04-01', 'Day'),
    (3, 'CZ-310', 142, 6, '2025-04-02', 'Night'),
    (4, 'DX-410', 88, 0, '2025-04-02', 'Day'),
    (4, 'DX-410', 91, 1, '2025-04-04', 'Swing'),
    (5, 'EZ-510', 160, 7, '2025-04-03', 'Day'),
    (5, 'EZ-510', 158, 5, '2025-04-04', 'Night'),
    (1, 'AX-100', 125, 2, '2025-04-05', 'Day'),
    (2, 'BX-200', 112, 3, '2025-04-05', 'Night');

-- ============================================================
-- EXERCISES
-- ============================================================

-- Q1: Count the total number of production runs.
-- Write your query below:


-- Q2: Calculate total units_produced for each shift.
-- Write your query below:


-- Q3: Show the average number of defects per machine.
-- Write your query below:


-- Q4: For each product_code, show the minimum and maximum units_produced.
-- Write your query below:


-- Q5: Return only machines whose average defects are greater than 3 using HAVING.
-- Write your query below:
