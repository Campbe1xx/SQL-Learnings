-- ============================================================
-- Module 02 – Reading Data
-- Solution 3: JOIN Patterns
-- ============================================================
-- Run the setup section from ../exercise_03.sql before these answers.

-- Q1
SELECT wo.work_order_code, wo.machine_name, t.technician_name, woa.assigned_on
FROM work_order_assignments AS woa
INNER JOIN work_orders AS wo
    ON wo.work_order_id = woa.work_order_id
INNER JOIN technicians AS t
    ON t.technician_id = woa.technician_id
ORDER BY wo.work_order_code, t.technician_name;

-- Q2
SELECT wo.work_order_code, wo.machine_name, t.technician_name
FROM work_orders AS wo
LEFT JOIN work_order_assignments AS woa
    ON wo.work_order_id = woa.work_order_id
LEFT JOIN technicians AS t
    ON t.technician_id = woa.technician_id
ORDER BY wo.work_order_code, t.technician_name;

-- Q3
SELECT t.technician_name, wo.work_order_code, wo.status
FROM work_orders AS wo
RIGHT JOIN work_order_assignments AS woa
    ON wo.work_order_id = woa.work_order_id
RIGHT JOIN technicians AS t
    ON t.technician_id = woa.technician_id
ORDER BY t.technician_name, wo.work_order_code;

-- Q4
SELECT child.technician_name AS technician,
       mentor.technician_name AS mentor
FROM technicians AS child
LEFT JOIN technicians AS mentor
    ON mentor.technician_id = child.mentor_id
ORDER BY child.technician_name;

-- Q5
SELECT wo.work_order_code, wo.machine_name, wo.status
FROM work_orders AS wo
LEFT JOIN work_order_assignments AS woa
    ON wo.work_order_id = woa.work_order_id
WHERE woa.work_order_id IS NULL
ORDER BY wo.work_order_code;
