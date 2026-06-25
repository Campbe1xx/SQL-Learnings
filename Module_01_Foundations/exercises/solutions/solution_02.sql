-- ============================================================
-- Module 01 – Foundations
-- Solution 2: Data Types and Constraints Reference
-- ============================================================
-- Run the setup section from ../exercise_02.sql before these answers.

-- Q1
SELECT component_name, data_type_example
FROM components
ORDER BY component_name;

-- Q2
SELECT component_name, data_type_example, constraint_type
FROM components
WHERE constraint_type = 'NOT NULL'
ORDER BY component_name;

-- Q3
SELECT data_type_example, COUNT(*) AS usage_count
FROM components
GROUP BY data_type_example
ORDER BY usage_count DESC, data_type_example;

-- C1
-- Use NUMERIC when exact precision matters, such as calibrated dimensions,
-- billing rates, or quality limits that must not suffer binary rounding.
-- Use FLOAT for high-volume approximate sensor telemetry where tiny rounding
-- differences are acceptable and performance/storage efficiency matter more.
