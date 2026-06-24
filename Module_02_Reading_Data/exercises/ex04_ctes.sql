-- ============================================================
-- MODULE 02 - EXERCISE 04: Subqueries & CTEs
-- ============================================================

-- QUESTION 1:
-- Using a subquery, find all machines whose total units produced
-- is above the overall average.


-- QUESTION 2:
-- Using a CTE, calculate total downtime per machine,
-- then join to machines to show the machine name.


-- QUESTION 3:
-- Using multiple CTEs, produce a combined report showing
-- each machine's total units produced and total downtime hours side by side.


-- QUESTION 4 (CHALLENGE):
-- Using a CTE and CASE, categorise each machine as:
-- 'High Output' (>1000 units), 'Medium Output' (500-1000), 'Low Output' (<500).


-- ============================================================
-- ANSWERS
-- ============================================================

-- Q1:
-- SELECT machine_id, SUM(units_produced) AS total
-- FROM production_orders
-- GROUP BY machine_id
-- HAVING SUM(units_produced) > (
--     SELECT AVG(t.total) FROM
--         (SELECT SUM(units_produced) AS total FROM production_orders GROUP BY machine_id) t
-- );

-- Q2:
-- WITH dt AS (
--     SELECT machine_id, SUM(downtime_hours) AS total_downtime
--     FROM downtime_logs GROUP BY machine_id
-- )
-- SELECT m.machine_name, dt.total_downtime
-- FROM dt JOIN machines m ON dt.machine_id = m.machine_id
-- ORDER BY dt.total_downtime DESC;

-- Q3:
-- WITH prod AS (
--     SELECT machine_id, SUM(units_produced) AS total_units
--     FROM production_orders GROUP BY machine_id
-- ), dt AS (
--     SELECT machine_id, SUM(downtime_hours) AS total_downtime
--     FROM downtime_logs GROUP BY machine_id
-- )
-- SELECT m.machine_name,
--        COALESCE(prod.total_units,0) AS units,
--        COALESCE(dt.total_downtime,0) AS downtime
-- FROM machines m
-- LEFT JOIN prod ON m.machine_id = prod.machine_id
-- LEFT JOIN dt ON m.machine_id = dt.machine_id;

-- Q4:
-- WITH totals AS (
--     SELECT machine_id, SUM(units_produced) AS total_units
--     FROM production_orders GROUP BY machine_id
-- )
-- SELECT m.machine_name, t.total_units,
--     CASE WHEN t.total_units > 1000 THEN 'High Output'
--          WHEN t.total_units >= 500 THEN 'Medium Output'
--          ELSE 'Low Output' END AS category
-- FROM totals t JOIN machines m ON t.machine_id = m.machine_id;
