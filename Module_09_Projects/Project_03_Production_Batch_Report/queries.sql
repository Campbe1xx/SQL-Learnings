-- ============================================================
-- PROJECT 03: Production Batch Report Queries
-- ============================================================

-- QUERY 1: Total output per machine per shift
SELECT m.machine_name,
       po.shift,
       COUNT(po.order_id)       AS orders,
       SUM(po.units_produced)   AS total_units,
       ROUND(AVG(po.defect_rate), 2) AS avg_defect_rate
FROM production_orders po
JOIN machines m ON po.machine_id = m.machine_id
GROUP BY m.machine_name, po.shift
ORDER BY m.machine_name, po.shift;

-- QUERY 2: Running total of units produced over time
SELECT po.order_id,
       m.machine_name,
       po.start_time,
       po.units_produced,
       SUM(po.units_produced) OVER (ORDER BY po.start_time) AS running_total
FROM production_orders po
JOIN machines m ON po.machine_id = m.machine_id
ORDER BY po.start_time;

-- QUERY 3: Rank machines by total output
SELECT m.machine_name,
       SUM(po.units_produced) AS total_units,
       RANK() OVER (ORDER BY SUM(po.units_produced) DESC) AS output_rank
FROM production_orders po
JOIN machines m ON po.machine_id = m.machine_id
GROUP BY m.machine_name
ORDER BY output_rank;

-- QUERY 4: Monthly output pivot (Day vs Night vs Weekend)
SELECT TO_CHAR(start_time, 'YYYY-MM') AS month,
       SUM(units_produced) FILTER (WHERE shift = 'Day')     AS day_units,
       SUM(units_produced) FILTER (WHERE shift = 'Night')   AS night_units,
       SUM(units_produced) FILTER (WHERE shift = 'Weekend') AS weekend_units
FROM production_orders
GROUP BY TO_CHAR(start_time, 'YYYY-MM')
ORDER BY month;

-- QUERY 5: Compare each order's units to the previous order (LAG)
SELECT order_id, machine_id, start_time, units_produced,
       LAG(units_produced) OVER (PARTITION BY machine_id ORDER BY start_time) AS prev_order_units,
       units_produced - LAG(units_produced) OVER (PARTITION BY machine_id ORDER BY start_time) AS change
FROM production_orders
ORDER BY machine_id, start_time;
