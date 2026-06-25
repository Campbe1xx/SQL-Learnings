-- ============================================================
-- MODULE 07 - EXERCISE 05: Window Functions
-- ============================================================

-- QUESTION 1:
-- Rank all production orders by units_produced (highest first).
-- Show order_id, machine_id, units_produced, and rank.


-- QUESTION 2:
-- For each machine, rank its production orders by units_produced.
-- (Use PARTITION BY so ranking restarts per machine.)


-- QUESTION 3:
-- Calculate a running total of units_produced ordered by start_time.


-- QUESTION 4:
-- For each production order, show the units produced in the PREVIOUS order
-- (by start_time) using LAG().


-- QUESTION 5 (CHALLENGE):
-- For each machine, show each production order and what percentage
-- of that machine's TOTAL output it represents.
-- (Hint: use SUM() OVER PARTITION BY)


-- ============================================================
-- ANSWERS
-- ============================================================

-- Q1:
-- SELECT order_id, machine_id, units_produced,
--        RANK() OVER (ORDER BY units_produced DESC) AS overall_rank
-- FROM production_orders;

-- Q2:
-- SELECT order_id, machine_id, units_produced,
--        RANK() OVER (PARTITION BY machine_id ORDER BY units_produced DESC) AS machine_rank
-- FROM production_orders;

-- Q3:
-- SELECT order_id, start_time, units_produced,
--        SUM(units_produced) OVER (ORDER BY start_time) AS running_total
-- FROM production_orders;

-- Q4:
-- SELECT order_id, start_time, units_produced,
--        LAG(units_produced, 1) OVER (ORDER BY start_time) AS previous_units
-- FROM production_orders;

-- Q5:
-- SELECT order_id, machine_id, units_produced,
--        SUM(units_produced) OVER (PARTITION BY machine_id) AS machine_total,
--        ROUND(100.0 * units_produced /
--              SUM(units_produced) OVER (PARTITION BY machine_id), 2) AS pct_of_machine_total
-- FROM production_orders;
