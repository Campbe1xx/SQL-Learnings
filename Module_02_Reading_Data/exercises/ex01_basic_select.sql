-- ============================================================
-- MODULE 02 - EXERCISE 01: Basic SELECT, WHERE, ORDER BY
-- ============================================================
-- Setup: Run the schema and sample data scripts from
-- Module_09_Projects/Project_01_Downtime_Tracker/
-- before attempting these exercises.
-- ============================================================

-- QUESTION 1:
-- List the name and location of all machines.
-- Your query here:


-- QUESTION 2:
-- List all machines that are currently 'Active'.
-- Your query here:


-- QUESTION 3:
-- List all machines installed before 2019, showing name and install date.
-- Order by install date oldest first.
-- Your query here:


-- QUESTION 4:
-- List all machines located in 'Workshop 1' OR 'Line 2'.
-- Your query here:


-- QUESTION 5:
-- Find all machines whose name contains the word 'Robot'.
-- Your query here:


-- QUESTION 6:
-- List all machines that have never had their last_maintenance recorded (NULL).
-- Your query here:


-- QUESTION 7:
-- List the top 5 most recently installed machines.
-- Your query here:


-- QUESTION 8 (CHALLENGE):
-- List all machines showing their name, location, and a column called
-- 'maintenance_status' that shows 'Maintained' if last_maintenance is not null,
-- or 'Never Maintained' if it is null.
-- Your query here:


-- ============================================================
-- ANSWERS (attempt all questions before checking!)
-- ============================================================

-- Q1:
-- SELECT machine_name, location FROM machines;

-- Q2:
-- SELECT * FROM machines WHERE status = 'Active';

-- Q3:
-- SELECT machine_name, install_date FROM machines
-- WHERE install_date < '2019-01-01'
-- ORDER BY install_date ASC;

-- Q4:
-- SELECT * FROM machines
-- WHERE location IN ('Workshop 1', 'Line 2');

-- Q5:
-- SELECT * FROM machines WHERE machine_name LIKE '%Robot%';

-- Q6:
-- SELECT * FROM machines WHERE last_maintenance IS NULL;

-- Q7:
-- SELECT machine_name, install_date FROM machines
-- ORDER BY install_date DESC LIMIT 5;

-- Q8:
-- SELECT machine_name, location,
--        COALESCE(last_maintenance::TEXT, 'Never Maintained') AS maintenance_status
-- FROM machines;
