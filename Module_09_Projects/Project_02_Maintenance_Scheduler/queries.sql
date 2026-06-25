-- ============================================================
-- PROJECT 02: Queries
-- ============================================================

-- QUERY 1: All overdue maintenance tasks (past due date)
SELECT m.machine_name,
       mt.task_name,
       mt.priority,
       mt.next_due,
       CURRENT_DATE - mt.next_due AS days_overdue
FROM maintenance_tasks mt
JOIN machines m ON mt.machine_id = m.machine_id
WHERE mt.next_due < CURRENT_DATE
ORDER BY days_overdue DESC;

-- QUERY 2: Tasks due in the next 14 days
SELECT m.machine_name, mt.task_name, mt.next_due, mt.priority, mt.assigned_to
FROM maintenance_tasks mt
JOIN machines m ON mt.machine_id = m.machine_id
WHERE mt.next_due BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL '14 days'
ORDER BY mt.next_due;

-- QUERY 3: Maintenance status dashboard
SELECT m.machine_name,
       mt.task_name,
       mt.priority,
       mt.next_due,
       CASE
           WHEN mt.next_due < CURRENT_DATE THEN 'OVERDUE'
           WHEN mt.next_due <= CURRENT_DATE + INTERVAL '7 days' THEN 'DUE SOON'
           ELSE 'OK'
       END AS status
FROM maintenance_tasks mt
JOIN machines m ON mt.machine_id = m.machine_id
ORDER BY mt.next_due;

-- QUERY 4: Average hours spent per task type
SELECT mt.task_name,
       COUNT(mc.completion_id) AS times_completed,
       ROUND(AVG(mc.hours_spent), 2) AS avg_hours
FROM maintenance_tasks mt
JOIN maintenance_completions mc ON mt.task_id = mc.task_id
GROUP BY mt.task_name
ORDER BY avg_hours DESC;
