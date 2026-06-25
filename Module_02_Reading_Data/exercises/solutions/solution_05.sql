-- ============================================================
-- Module 02 – Reading Data
-- Solution 5: Window Functions
-- ============================================================
-- Run the setup section from ../exercise_05.sql before these answers.

-- Q1
SELECT machine_id,
       event_id,
       start_time,
       ROW_NUMBER() OVER (PARTITION BY machine_id ORDER BY start_time) AS event_sequence
FROM downtime_events
ORDER BY machine_id, start_time;

-- Q2
WITH cause_totals AS (
    SELECT cause_category, SUM(downtime_minutes) AS total_downtime
    FROM downtime_events
    GROUP BY cause_category
)
SELECT cause_category,
       total_downtime,
       RANK() OVER (ORDER BY total_downtime DESC) AS cause_rank,
       DENSE_RANK() OVER (ORDER BY total_downtime DESC) AS cause_dense_rank
FROM cause_totals
ORDER BY total_downtime DESC, cause_category;

-- Q3
SELECT machine_id,
       event_id,
       start_time,
       downtime_minutes,
       LAG(downtime_minutes) OVER (PARTITION BY machine_id ORDER BY start_time) AS previous_downtime,
       LEAD(downtime_minutes) OVER (PARTITION BY machine_id ORDER BY start_time) AS next_downtime
FROM downtime_events
ORDER BY machine_id, start_time;

-- Q4
SELECT machine_id,
       event_id,
       cause_category,
       downtime_minutes,
       SUM(downtime_minutes) OVER (PARTITION BY machine_id) AS total_machine_downtime
FROM downtime_events
ORDER BY machine_id, start_time;

-- Q5
SELECT machine_id,
       event_id,
       start_time,
       downtime_minutes,
       SUM(downtime_minutes) OVER (
           PARTITION BY machine_id
           ORDER BY start_time
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS running_downtime
FROM downtime_events
ORDER BY machine_id, start_time;
