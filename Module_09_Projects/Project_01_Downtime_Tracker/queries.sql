-- ============================================================
-- PROJECT 01: Guided Queries
-- ============================================================

-- QUERY 1: List all downtime incidents with machine name and operator name
SELECT dl.log_id,
       m.machine_name,
       o.first_name || ' ' || o.last_name AS operator,
       dl.log_date,
       dl.downtime_hours,
       dl.reason,
       dl.resolved
FROM downtime_logs dl
JOIN machines m  ON dl.machine_id  = m.machine_id
JOIN operators o ON dl.operator_id = o.operator_id
ORDER BY dl.log_date DESC;

-- QUERY 2: Total and average downtime per machine
SELECT m.machine_name,
       COUNT(dl.log_id)                  AS incidents,
       SUM(dl.downtime_hours)            AS total_hours,
       ROUND(AVG(dl.downtime_hours), 2)  AS avg_hours
FROM machines m
LEFT JOIN downtime_logs dl ON m.machine_id = dl.machine_id
GROUP BY m.machine_name
ORDER BY total_hours DESC NULLS LAST;

-- QUERY 3: Machines with unresolved downtime
SELECT m.machine_name, dl.log_date, dl.downtime_hours, dl.reason
FROM downtime_logs dl
JOIN machines m ON dl.machine_id = m.machine_id
WHERE dl.resolved = FALSE
ORDER BY dl.log_date;

-- QUERY 4: Monthly downtime trend using CTE
WITH monthly AS (
    SELECT TO_CHAR(log_date, 'YYYY-MM') AS month,
           machine_id,
           SUM(downtime_hours) AS monthly_hours
    FROM downtime_logs
    GROUP BY TO_CHAR(log_date, 'YYYY-MM'), machine_id
)
SELECT m.machine_name, mo.month, mo.monthly_hours,
       SUM(mo.monthly_hours) OVER (PARTITION BY mo.machine_id ORDER BY mo.month) AS cumulative_hours
FROM monthly mo
JOIN machines m ON mo.machine_id = m.machine_id
ORDER BY mo.machine_id, mo.month;

-- QUERY 5: Rank machines by total downtime
SELECT m.machine_name,
       SUM(dl.downtime_hours) AS total_downtime,
       RANK() OVER (ORDER BY SUM(dl.downtime_hours) DESC) AS downtime_rank
FROM machines m
LEFT JOIN downtime_logs dl ON m.machine_id = dl.machine_id
GROUP BY m.machine_name
ORDER BY downtime_rank;

-- CHALLENGE: Calculate MTBF (Mean Time Between Failures) per machine
WITH failures AS (
    SELECT machine_id,
           log_date,
           LAG(log_date) OVER (PARTITION BY machine_id ORDER BY log_date) AS prev_failure
    FROM downtime_logs
)
SELECT m.machine_name,
       ROUND(AVG(EXTRACT(EPOCH FROM (f.log_date - f.prev_failure))/3600), 1) AS avg_hours_between_failures
FROM failures f
JOIN machines m ON f.machine_id = m.machine_id
WHERE f.prev_failure IS NOT NULL
GROUP BY m.machine_name
ORDER BY avg_hours_between_failures;
