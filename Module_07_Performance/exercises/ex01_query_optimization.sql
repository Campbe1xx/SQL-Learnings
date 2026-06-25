-- ============================================================
-- MODULE 07 - EXERCISE 01: Query Optimisation
-- ============================================================

-- QUESTION 1:
-- Run EXPLAIN on the following query and describe what
-- type of scan is used. Then add an index to improve it.
--
-- SELECT * FROM production_orders WHERE machine_id = 2;
-- Your EXPLAIN query here:


-- Your CREATE INDEX here:


-- QUESTION 2:
-- The query below uses a function on an indexed column
-- which prevents index use. Rewrite it to be SARGable
-- (index-friendly).
--
-- SLOW: SELECT * FROM production_orders
--       WHERE EXTRACT(YEAR FROM start_time) = 2024;
-- Your rewritten query here:


-- QUESTION 3:
-- Rewrite this query to avoid SELECT * and only
-- return the columns actually needed for a shift report.
--
-- SLOW: SELECT * FROM production_orders WHERE shift = 'Day';
-- Your rewritten query here:


-- QUESTION 4:
-- Run EXPLAIN ANALYZE on a JOIN query between
-- production_orders and machines, and note:
--   a) The join strategy used (Hash Join / Nested Loop)
--   b) The actual vs estimated row counts
-- Your query here:


-- QUESTION 5 (CHALLENGE):
-- The following query is slow on a large dataset.
-- Identify TWO reasons why and rewrite it to be faster.
--
-- SELECT * FROM downtime_logs
-- WHERE UPPER(reason) LIKE '%MOTOR%'
-- ORDER BY log_date DESC;
-- Your improved query here:


-- ============================================================
-- ANSWERS
-- ============================================================

-- Q1:
-- EXPLAIN SELECT * FROM production_orders WHERE machine_id = 2;
-- (Will show Seq Scan if no index exists)
-- CREATE INDEX idx_prod_machine_id ON production_orders(machine_id);
-- (Re-run EXPLAIN - should now show Index Scan)

-- Q2:
-- SELECT * FROM production_orders
-- WHERE start_time BETWEEN '2024-01-01' AND '2024-12-31 23:59:59';

-- Q3:
-- SELECT order_id, machine_id, operator_id, units_produced, start_time
-- FROM production_orders WHERE shift = 'Day';

-- Q4:
-- EXPLAIN ANALYZE
-- SELECT m.machine_name, po.units_produced, po.start_time
-- FROM production_orders po
-- JOIN machines m ON po.machine_id = m.machine_id;

-- Q5:
-- Reasons: 1) UPPER() on reason disables any index on that column
--          2) SELECT * fetches all columns unnecessarily
-- Improved:
-- CREATE INDEX idx_downtime_reason ON downtime_logs(reason);
-- SELECT log_id, machine_id, log_date, downtime_hours, reason
-- FROM downtime_logs
-- WHERE reason ILIKE '%motor%'
-- ORDER BY log_date DESC;
