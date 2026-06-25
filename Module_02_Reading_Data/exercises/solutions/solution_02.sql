-- ============================================================
-- Module 02 – Reading Data
-- Solution 2: Aggregates, GROUP BY, and HAVING
-- ============================================================
-- Run the setup section from ../exercise_02.sql before these answers.

-- Q1
SELECT COUNT(*) AS total_runs
FROM production_runs;

-- Q2
SELECT shift, SUM(units_produced) AS total_units
FROM production_runs
GROUP BY shift
ORDER BY total_units DESC;

-- Q3
SELECT machine_id, AVG(defects::NUMERIC) AS avg_defects
FROM production_runs
GROUP BY machine_id
ORDER BY machine_id;

-- Q4
SELECT product_code,
       MIN(units_produced) AS min_units,
       MAX(units_produced) AS max_units
FROM production_runs
GROUP BY product_code
ORDER BY product_code;

-- Q5
SELECT machine_id, AVG(defects::NUMERIC) AS avg_defects
FROM production_runs
GROUP BY machine_id
HAVING AVG(defects::NUMERIC) > 3
ORDER BY avg_defects DESC;
