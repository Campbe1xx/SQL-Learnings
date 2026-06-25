-- ============================================================
-- Module 07 – Performance
-- Exercise 1: EXPLAIN, Indexes, and Query Rewrites
-- ============================================================
-- SETUP: Run this section first to create and populate tables
-- ============================================================

DROP TABLE IF EXISTS sensor_readings;
DROP TABLE IF EXISTS machines;

CREATE TABLE machines (
    machine_id SERIAL PRIMARY KEY,
    machine_name VARCHAR(100) NOT NULL
);

CREATE TABLE sensor_readings (
    sensor_id INT NOT NULL,
    machine_id INT NOT NULL REFERENCES machines (machine_id),
    sensor_code VARCHAR(20) NOT NULL,
    reading_value NUMERIC(8,2) NOT NULL,
    reading_timestamp TIMESTAMP NOT NULL,
    is_anomaly BOOLEAN NOT NULL DEFAULT FALSE
);

INSERT INTO machines (machine_name) VALUES
    ('CNC Mill Alpha'),
    ('Laser Cutter L2'),
    ('Robot Arm R7'),
    ('Hydraulic Press H5');

INSERT INTO sensor_readings (sensor_id, machine_id, sensor_code, reading_value, reading_timestamp, is_anomaly)
SELECT ((gs - 1) % 8) + 1,
       ((gs - 1) % 4) + 1,
       CASE ((gs - 1) % 4) + 1
           WHEN 1 THEN 'TMP-ALPHA'
           WHEN 2 THEN 'TMP-LASER'
           WHEN 3 THEN 'VIB-ROBOT'
           ELSE 'PRS-PRESS'
       END,
       ROUND((45 + ((gs * 7) % 30) + (((gs - 1) % 4) * 3) + CASE WHEN gs % 17 = 0 THEN 25 ELSE 0 END)::NUMERIC, 2),
       TIMESTAMP '2025-04-01 06:00:00' + ((gs - 1) * INTERVAL '1 hour'),
       (gs % 17 = 0)
FROM generate_series(1, 80) AS gs;

-- ============================================================
-- EXERCISES
-- ============================================================

-- Q1: Run EXPLAIN on a basic SELECT that filters by machine_id.
-- In comments, note whether PostgreSQL chooses a Seq Scan or Index Scan.
-- Write your SQL below:


-- Q2: Run EXPLAIN ANALYZE on a filtered query by machine_id and reading_timestamp.
-- Observe the Seq Scan before adding an index.
-- Write your SQL below:


-- Q3: CREATE an index to support that filter, then re-run EXPLAIN ANALYZE.
-- Observe whether the planner can now use an Index Scan or Bitmap Index Scan.
-- Write your SQL below:


-- Q4: Rewrite this slow correlated subquery as a JOIN:
--     SELECT sr.*
--     FROM sensor_readings sr
--     WHERE reading_value > (
--         SELECT AVG(sr2.reading_value)
--         FROM sensor_readings sr2
--         WHERE sr2.machine_id = sr.machine_id
--     );
-- Write the JOIN/CTE version below:


-- Q5: CREATE a partial index for anomalous readings only, then show a query that benefits from it.
-- Write your SQL below:


-- ============================================================
-- CHALLENGE
-- ============================================================

-- C1: Compare EXPLAIN plans for sensor_code LIKE '%TMP%' and sensor_code LIKE 'TMP%'.
-- Explain in comments why the leading wildcard pattern usually cannot use a normal B-tree index efficiently.
-- Write your SQL and comments below:
