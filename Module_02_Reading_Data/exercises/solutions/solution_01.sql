-- ============================================================
-- Module 02 – Reading Data
-- Solution 1: SELECT, WHERE, ORDER BY, and LIMIT
-- ============================================================
-- Run the setup section from ../exercise_01.sql before these answers.

-- Q1
SELECT *
FROM equipment;

-- Q2
SELECT equipment_id, name, category, plant_area, hourly_rate_gbp
FROM equipment
WHERE is_operational = TRUE
  AND category IN ('Machining', 'Fabrication')
  AND hourly_rate_gbp > 80
ORDER BY hourly_rate_gbp DESC;

-- Q3
SELECT name, hourly_rate_gbp
FROM equipment
ORDER BY hourly_rate_gbp DESC, name;

-- Q4
SELECT equipment_id, name, last_service_date
FROM equipment
ORDER BY last_service_date DESC
LIMIT 3;

-- Q5
SELECT equipment_id, name, plant_area, hourly_rate_gbp
FROM equipment
WHERE (hourly_rate_gbp BETWEEN 50 AND 110 AND plant_area IN ('Dispatch Lane', 'Quality Lab', 'Press Hall'))
   OR name LIKE 'CNC%'
ORDER BY hourly_rate_gbp DESC, name;
