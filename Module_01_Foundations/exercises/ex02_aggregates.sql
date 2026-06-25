-- ============================================================
-- MODULE 01 - EXERCISE 02: Aggregates & GROUP BY
-- ============================================================

-- QUESTION 1:
-- How many machines are there in total?


-- QUESTION 2:
-- How many machines are in each status category (Active/Inactive)?


-- QUESTION 3:
-- What is the total number of units produced across all production orders?


-- QUESTION 4:
-- What is the average, minimum, and maximum units produced per production order?


-- QUESTION 5:
-- Show total units produced per machine_id, ordered from highest to lowest.


-- QUESTION 6:
-- Show only machines that have produced more than 1000 total units.


-- QUESTION 7:
-- Show total downtime hours per machine, only for machines with more than 5 hours total.


-- QUESTION 8 (CHALLENGE):
-- Show the total units produced per month (YYYY-MM format), ordered chronologically.


-- ============================================================
-- ANSWERS
-- ============================================================

-- Q1: SELECT COUNT(*) FROM machines;
-- Q2: SELECT status, COUNT(*) FROM machines GROUP BY status;
-- Q3: SELECT SUM(units_produced) FROM production_orders;
-- Q4: SELECT AVG(units_produced), MIN(units_produced), MAX(units_produced) FROM production_orders;
-- Q5: SELECT machine_id, SUM(units_produced) AS total FROM production_orders GROUP BY machine_id ORDER BY total DESC;
-- Q6: SELECT machine_id, SUM(units_produced) AS total FROM production_orders GROUP BY machine_id HAVING SUM(units_produced) > 1000;
-- Q7: SELECT machine_id, SUM(downtime_hours) AS total FROM downtime_logs GROUP BY machine_id HAVING SUM(downtime_hours) > 5;
-- Q8: SELECT TO_CHAR(start_time, 'YYYY-MM') AS month, SUM(units_produced) AS total
--     FROM production_orders GROUP BY TO_CHAR(start_time, 'YYYY-MM') ORDER BY month;
