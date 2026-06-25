-- ============================================================
-- Module 06 – Advanced SQL
-- Exercise 1: Views and Materialized Views
-- ============================================================
-- SETUP: Run this section first to create and populate tables
-- ============================================================

DROP MATERIALIZED VIEW IF EXISTS monthly_production_totals;
DROP VIEW IF EXISTS daily_defect_rate_per_machine;
DROP VIEW IF EXISTS active_equipment_summary;
DROP TABLE IF EXISTS production_runs;
DROP TABLE IF EXISTS equipment;

CREATE TABLE equipment (
    equipment_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    plant_area VARCHAR(50) NOT NULL,
    is_operational BOOLEAN NOT NULL
);

CREATE TABLE production_runs (
    run_id SERIAL PRIMARY KEY,
    machine_id INT NOT NULL REFERENCES equipment (equipment_id),
    units_produced INT NOT NULL,
    defects INT NOT NULL,
    run_date DATE NOT NULL
);

INSERT INTO equipment (name, category, plant_area, is_operational) VALUES
    ('CNC Mill Alpha', 'Machining', 'Machining Bay A', TRUE),
    ('Laser Cutter L2', 'Fabrication', 'Fabrication Cell 1', TRUE),
    ('Robot Arm R7', 'Assembly', 'Assembly Line 2', TRUE),
    ('Paint Booth P9', 'Finishing', 'Finishing Zone', FALSE);

INSERT INTO production_runs (machine_id, units_produced, defects, run_date) VALUES
    (1, 120, 2, '2025-03-30'),
    (1, 128, 3, '2025-04-01'),
    (2, 98, 5, '2025-04-01'),
    (2, 104, 2, '2025-04-02'),
    (3, 90, 1, '2025-04-01'),
    (3, 95, 0, '2025-04-02');

-- ============================================================
-- EXERCISES
-- ============================================================

-- Q1: CREATE VIEW active_equipment_summary for active equipment showing equipment_id, name, category, and plant_area.
-- Write your SQL below:


-- Q2: CREATE VIEW daily_defect_rate_per_machine showing run_date, machine_id, total_units, total_defects, and defect_rate_pct.
-- Write your SQL below:


-- Q3: CREATE MATERIALIZED VIEW monthly_production_totals showing total units per machine per month.
-- Write your SQL below:


-- Q4: REFRESH the materialized view.
-- Write your SQL below:


-- Q5: DROP the regular view active_equipment_summary.
-- Write your SQL below:
