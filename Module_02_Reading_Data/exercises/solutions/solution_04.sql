-- ============================================================
-- Module 02 – Reading Data
-- Solution 4: Subqueries and CTEs
-- ============================================================
-- Run the setup section from ../exercise_04.sql before these answers.

-- Q1
SELECT run_id, machine_id, product_code, units_produced
FROM production_runs
WHERE units_produced > (
    SELECT AVG(units_produced)
    FROM production_runs
)
ORDER BY units_produced DESC;

-- Q2
SELECT pr.run_id, pr.machine_id, pr.defects, pr.run_date
FROM production_runs AS pr
WHERE pr.defects > (
    SELECT AVG(pr2.defects::NUMERIC)
    FROM production_runs AS pr2
    WHERE pr2.machine_id = pr.machine_id
)
ORDER BY pr.machine_id, pr.run_date;

-- Q3
SELECT e.equipment_id, e.name
FROM equipment AS e
WHERE EXISTS (
    SELECT 1
    FROM production_runs AS pr
    WHERE pr.machine_id = e.equipment_id
)
ORDER BY e.equipment_id;

-- Q4
WITH machine_totals AS (
    SELECT machine_id, SUM(units_produced) AS total_units
    FROM production_runs
    GROUP BY machine_id
)
SELECT e.name, e.category, mt.total_units
FROM machine_totals AS mt
JOIN equipment AS e
    ON e.equipment_id = mt.machine_id
ORDER BY mt.total_units DESC;

-- Q5
WITH machine_totals AS (
    SELECT machine_id, SUM(units_produced) AS total_units
    FROM production_runs
    GROUP BY machine_id
),
category_totals AS (
    SELECT e.category,
           mt.machine_id,
           mt.total_units,
           AVG(mt.total_units::NUMERIC) OVER (PARTITION BY e.category) AS avg_category_units
    FROM machine_totals AS mt
    JOIN equipment AS e
        ON e.equipment_id = mt.machine_id
)
SELECT category, machine_id, total_units, avg_category_units
FROM category_totals
ORDER BY category, total_units DESC;
