-- ============================================================
-- Module 09 – Projects
-- Solution 1: Downtime and OEE Capstone
-- ============================================================
-- Run the setup section from ../exercise_01.sql before these answers.

-- Q1
WITH monthly_downtime AS (
    SELECT machine_id,
           date_trunc('month', start_time)::DATE AS month_start,
           SUM(downtime_minutes) AS total_downtime_minutes
    FROM downtime_events
    GROUP BY machine_id, date_trunc('month', start_time)::DATE
)
SELECT machine_id,
       month_start,
       total_downtime_minutes,
       SUM(total_downtime_minutes) OVER (
           PARTITION BY machine_id
           ORDER BY month_start
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS running_downtime_minutes
FROM monthly_downtime
ORDER BY machine_id, month_start;

-- Q2
WITH monthly_downtime AS (
    SELECT machine_id,
           date_trunc('month', start_time)::DATE AS month_start,
           SUM(downtime_minutes) AS total_downtime_minutes
    FROM downtime_events
    GROUP BY machine_id, date_trunc('month', start_time)::DATE
),
current_month AS (
    SELECT machine_id, total_downtime_minutes
    FROM monthly_downtime
    WHERE month_start = DATE '2025-04-01'
)
SELECT m.machine_name,
       cm.total_downtime_minutes AS current_month_downtime
FROM current_month AS cm
JOIN machines AS m
    ON m.machine_id = cm.machine_id
WHERE cm.total_downtime_minutes > (
    SELECT AVG(md.total_downtime_minutes::NUMERIC)
    FROM monthly_downtime AS md
    WHERE md.machine_id = cm.machine_id
);

-- Q3
WITH cause_totals AS (
    SELECT cause_category,
           SUM(downtime_minutes) AS total_downtime
    FROM downtime_events
    GROUP BY cause_category
)
SELECT cause_category,
       total_downtime,
       ROUND(total_downtime * 100.0 / SUM(total_downtime) OVER (), 2) AS pct_of_total
FROM cause_totals
ORDER BY total_downtime DESC, cause_category
LIMIT 3;

-- Q4
CREATE VIEW machine_oee_summary AS
SELECT m.machine_id,
       m.machine_name,
       ROUND(AVG(pr.runtime_minutes::NUMERIC / NULLIF(pr.planned_minutes, 0)), 4) AS availability_ratio,
       ROUND(AVG((pr.ideal_cycle_seconds * pr.units_produced) / NULLIF(pr.runtime_minutes * 60.0, 0)), 4) AS performance_ratio,
       ROUND(AVG(pr.good_units::NUMERIC / NULLIF(pr.units_produced, 0)), 4) AS quality_ratio,
       ROUND(
           AVG(pr.runtime_minutes::NUMERIC / NULLIF(pr.planned_minutes, 0))
           * AVG((pr.ideal_cycle_seconds * pr.units_produced) / NULLIF(pr.runtime_minutes * 60.0, 0))
           * AVG(pr.good_units::NUMERIC / NULLIF(pr.units_produced, 0))
           * 100,
           2
       ) AS oee_pct
FROM machines AS m
JOIN production_runs AS pr
    ON pr.machine_id = m.machine_id
GROUP BY m.machine_id, m.machine_name;

-- Q5
BEGIN;

INSERT INTO downtime_events (machine_id, start_time, end_time, downtime_minutes, cause_category)
VALUES (2, '2025-04-20 09:00', '2025-04-20 09:25', 25, 'Mechanical');

UPDATE machines
SET status = 'Down',
    is_active = FALSE
WHERE machine_id = 2;

COMMIT;

-- C1
WITH RECURSIVE dependency_chain AS (
    SELECT md.depends_on_machine_id AS root_machine_id,
           parent.machine_name AS root_machine_name,
           md.machine_id AS dependent_machine_id,
           child.machine_name AS dependent_machine_name,
           1 AS depth,
           parent.machine_name || ' -> ' || child.machine_name AS dependency_path
    FROM machine_dependencies AS md
    JOIN machines AS parent
        ON parent.machine_id = md.depends_on_machine_id
    JOIN machines AS child
        ON child.machine_id = md.machine_id

    UNION ALL

    SELECT dc.root_machine_id,
           dc.root_machine_name,
           md.machine_id,
           child.machine_name,
           dc.depth + 1,
           dc.dependency_path || ' -> ' || child.machine_name
    FROM dependency_chain AS dc
    JOIN machine_dependencies AS md
        ON md.depends_on_machine_id = dc.dependent_machine_id
    JOIN machines AS child
        ON child.machine_id = md.machine_id
)
SELECT *
FROM dependency_chain
ORDER BY root_machine_id, depth, dependent_machine_id;
