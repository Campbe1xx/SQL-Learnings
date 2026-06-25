-- ============================================================
-- Module 02 – Reading Data
-- Exercise 5: Window Functions
-- ============================================================
-- SETUP: Run this section first to create and populate tables
-- ============================================================

DROP TABLE IF EXISTS downtime_events;

CREATE TABLE downtime_events (
    event_id SERIAL PRIMARY KEY,
    machine_id INT NOT NULL,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    downtime_minutes INT NOT NULL,
    cause_category VARCHAR(50) NOT NULL
);

INSERT INTO downtime_events (machine_id, start_time, end_time, downtime_minutes, cause_category) VALUES
    (1, '2025-04-01 06:10', '2025-04-01 06:40', 30, 'Mechanical'),
    (1, '2025-04-03 14:00', '2025-04-03 14:20', 20, 'Electrical'),
    (1, '2025-04-07 09:15', '2025-04-07 10:00', 45, 'Mechanical'),
    (2, '2025-04-01 07:00', '2025-04-01 07:50', 50, 'Setup'),
    (2, '2025-04-05 18:30', '2025-04-05 19:10', 40, 'Mechanical'),
    (2, '2025-04-08 11:20', '2025-04-08 11:35', 15, 'Material Shortage'),
    (3, '2025-04-02 12:00', '2025-04-02 12:25', 25, 'Electrical'),
    (3, '2025-04-04 16:10', '2025-04-04 16:55', 45, 'Electrical'),
    (3, '2025-04-10 08:00', '2025-04-10 08:30', 30, 'Setup');

-- ============================================================
-- EXERCISES
-- ============================================================

-- Q1: Use ROW_NUMBER to number downtime events for each machine by start_time.
-- Write your query below:


-- Q2: Use RANK and DENSE_RANK to rank cause categories by total downtime.
-- Write your query below:


-- Q3: Use LAG or LEAD to compare each event to the previous or next event for the same machine.
-- Write your query below:


-- Q4: Use SUM OVER (PARTITION BY machine_id) to show total downtime per machine on every row.
-- Write your query below:


-- Q5: Calculate a running total of downtime_minutes for each machine ordered by start_time.
-- Write your query below:
