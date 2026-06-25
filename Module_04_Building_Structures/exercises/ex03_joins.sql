-- ============================================================
-- MODULE 04 - EXERCISE 03: JOINs
-- ============================================================

-- QUESTION 1:
-- List all production orders showing the machine name instead of machine_id.


-- QUESTION 2:
-- List all production orders showing the operator's full name (first + last)
-- and the machine name.


-- QUESTION 3:
-- List all machines, including those with no production orders.
-- Show order_id as NULL if no orders exist.


-- QUESTION 4:
-- Find all machines that have NEVER had a production order.


-- QUESTION 5:
-- List all downtime logs with the machine name and location.


-- QUESTION 6 (CHALLENGE):
-- For each operator, show their full name, total number of production orders
-- they have run, and total units produced. Include operators with zero orders.


-- ============================================================
-- ANSWERS
-- ============================================================

-- Q1:
-- SELECT po.order_id, m.machine_name, po.units_produced, po.start_time
-- FROM production_orders po
-- JOIN machines m ON po.machine_id = m.machine_id;

-- Q2:
-- SELECT po.order_id, m.machine_name,
--        o.first_name || ' ' || o.last_name AS operator_name,
--        po.units_produced
-- FROM production_orders po
-- JOIN machines m ON po.machine_id = m.machine_id
-- JOIN operators o ON po.operator_id = o.operator_id;

-- Q3:
-- SELECT m.machine_name, po.order_id
-- FROM machines m
-- LEFT JOIN production_orders po ON m.machine_id = po.machine_id;

-- Q4:
-- SELECT m.machine_name
-- FROM machines m
-- LEFT JOIN production_orders po ON m.machine_id = po.machine_id
-- WHERE po.order_id IS NULL;

-- Q5:
-- SELECT dl.log_id, m.machine_name, m.location, dl.downtime_hours, dl.reason
-- FROM downtime_logs dl
-- JOIN machines m ON dl.machine_id = m.machine_id;

-- Q6:
-- SELECT o.first_name || ' ' || o.last_name AS operator_name,
--        COUNT(po.order_id) AS total_orders,
--        COALESCE(SUM(po.units_produced), 0) AS total_units
-- FROM operators o
-- LEFT JOIN production_orders po ON o.operator_id = po.operator_id
-- GROUP BY o.operator_id, o.first_name, o.last_name
-- ORDER BY total_units DESC;
