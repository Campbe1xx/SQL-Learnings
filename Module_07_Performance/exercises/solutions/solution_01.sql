-- ============================================================
-- Module 07 – Performance
-- Solution 1: EXPLAIN, Indexes, and Query Rewrites
-- ============================================================
-- Run the setup section from ../exercise_01.sql before these answers.

-- Q1
EXPLAIN
SELECT *
FROM sensor_readings
WHERE machine_id = 2;

-- Before adding indexes, expect a Seq Scan because the planner has no better path.

-- Q2
EXPLAIN ANALYZE
SELECT *
FROM sensor_readings
WHERE machine_id = 2
  AND reading_timestamp >= '2025-04-02 00:00:00'
  AND reading_timestamp < '2025-04-03 00:00:00';

-- Q3
CREATE INDEX idx_sensor_readings_machine_time
    ON sensor_readings (machine_id, reading_timestamp);

EXPLAIN ANALYZE
SELECT *
FROM sensor_readings
WHERE machine_id = 2
  AND reading_timestamp >= '2025-04-02 00:00:00'
  AND reading_timestamp < '2025-04-03 00:00:00';

-- Q4
WITH machine_averages AS (
    SELECT machine_id, AVG(reading_value) AS avg_reading_value
    FROM sensor_readings
    GROUP BY machine_id
)
SELECT sr.*
FROM sensor_readings AS sr
JOIN machine_averages AS ma
    ON ma.machine_id = sr.machine_id
WHERE sr.reading_value > ma.avg_reading_value;

-- Q5
CREATE INDEX idx_sensor_readings_anomalies
    ON sensor_readings (machine_id, reading_timestamp)
    WHERE is_anomaly = TRUE;

EXPLAIN ANALYZE
SELECT *
FROM sensor_readings
WHERE is_anomaly = TRUE
  AND machine_id = 1
ORDER BY reading_timestamp DESC;

-- C1
CREATE INDEX idx_sensor_readings_sensor_code
    ON sensor_readings (sensor_code);

EXPLAIN
SELECT *
FROM sensor_readings
WHERE sensor_code LIKE '%TMP%';

EXPLAIN
SELECT *
FROM sensor_readings
WHERE sensor_code LIKE 'TMP%';

-- A leading wildcard forces PostgreSQL to inspect far more values because the
-- search term can match anywhere in the string. A prefix search can align with
-- the left-to-right ordering of a B-tree index, making index usage much more likely.
