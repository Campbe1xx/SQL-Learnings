-- ============================================================
-- MODULE 06 - EXERCISE 01: Views & Materialized Views
-- ============================================================

-- QUESTION 1:
-- Create a view called 'v_machine_status' that shows:
-- machine_name, location, status, and last_maintenance
-- for all machines.
-- Your query here:


-- QUESTION 2:
-- Create a view called 'v_downtime_summary' that shows:
-- machine_name, total incidents, total downtime hours,
-- and average downtime hours per incident.
-- Your query here:


-- QUESTION 3:
-- Query your v_downtime_summary view to show only
-- machines with more than 5 total downtime hours.
-- Your query here:


-- QUESTION 4:
-- Create a materialized view called 'mv_monthly_production'
-- showing total units produced per machine per month (YYYY-MM).
-- Your query here:


-- QUESTION 5 (CHALLENGE):
-- Create a view called 'v_quality_dashboard' that shows:
-- machine_name, order_id, units_produced, defect_rate,
-- and a column 'quality_status' using CASE:
--   defect_rate >= 5  = 'FAIL'
--   defect_rate >= 2  = 'WARNING'
--   else              = 'PASS'
-- Your query here:


-- ============================================================
-- ANSWERS
-- ============================================================

-- Q1:
-- CREATE VIEW v_machine_status AS
-- SELECT machine_name, location, status, last_maintenance
-- FROM machines;

-- Q2:
-- CREATE VIEW v_downtime_summary AS
-- SELECT m.machine_name,
--        COUNT(dl.log_id)                 AS total_incidents,
--        SUM(dl.downtime_hours)           AS total_hours,
--        ROUND(AVG(dl.downtime_hours), 2) AS avg_hours
-- FROM machines m
-- LEFT JOIN downtime_logs dl ON m.machine_id = dl.machine_id
-- GROUP BY m.machine_name;

-- Q3:
-- SELECT * FROM v_downtime_summary
-- WHERE total_hours > 5
-- ORDER BY total_hours DESC;

-- Q4:
-- CREATE MATERIALIZED VIEW mv_monthly_production AS
-- SELECT m.machine_name,
--        TO_CHAR(po.start_time, 'YYYY-MM') AS month,
--        SUM(po.units_produced) AS total_units
-- FROM production_orders po
-- JOIN machines m ON po.machine_id = m.machine_id
-- GROUP BY m.machine_name, TO_CHAR(po.start_time, 'YYYY-MM');

-- Q5:
-- CREATE VIEW v_quality_dashboard AS
-- SELECT m.machine_name,
--        po.order_id,
--        po.units_produced,
--        po.defect_rate,
--        CASE
--            WHEN po.defect_rate >= 5 THEN 'FAIL'
--            WHEN po.defect_rate >= 2 THEN 'WARNING'
--            ELSE 'PASS'
--        END AS quality_status
-- FROM production_orders po
-- JOIN machines m ON po.machine_id = m.machine_id;
