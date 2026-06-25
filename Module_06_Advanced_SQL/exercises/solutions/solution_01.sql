-- ============================================================
-- Module 06 – Advanced SQL
-- Solution 1: Views and Materialized Views
-- ============================================================
-- Run the setup section from ../exercise_01.sql before these answers.

-- Q1
CREATE VIEW active_equipment_summary AS
SELECT equipment_id, name, category, plant_area
FROM equipment
WHERE is_operational = TRUE;

-- Q2
CREATE VIEW daily_defect_rate_per_machine AS
SELECT run_date,
       machine_id,
       SUM(units_produced) AS total_units,
       SUM(defects) AS total_defects,
       ROUND(SUM(defects)::NUMERIC * 100 / NULLIF(SUM(units_produced), 0), 2) AS defect_rate_pct
FROM production_runs
GROUP BY run_date, machine_id;

-- Q3
CREATE MATERIALIZED VIEW monthly_production_totals AS
SELECT machine_id,
       date_trunc('month', run_date)::DATE AS production_month,
       SUM(units_produced) AS monthly_units
FROM production_runs
GROUP BY machine_id, date_trunc('month', run_date)::DATE;

-- Q4
REFRESH MATERIALIZED VIEW monthly_production_totals;

-- Q5
DROP VIEW IF EXISTS active_equipment_summary;
