-- ============================================================
-- Module 01 – Foundations
-- Solution 1: Manufacturing Machines Basics
-- ============================================================
-- Run the setup section from ../exercise_01.sql before these answers.

-- Q1
SELECT *
FROM machines;

-- Q2
SELECT machine_id, machine_name, machine_type, location, installed_date
FROM machines
WHERE is_active = TRUE
ORDER BY installed_date;

-- Q3
SELECT location, COUNT(*) AS machine_count
FROM machines
GROUP BY location
ORDER BY machine_count DESC, location;

-- Q4
SELECT DISTINCT machine_type
FROM machines
ORDER BY machine_type;

-- C1
SELECT location, COUNT(*) AS machine_count
FROM machines
GROUP BY location
ORDER BY machine_count DESC, location
LIMIT 1;
