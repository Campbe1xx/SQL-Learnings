-- ============================================================
-- PROJECT 04: Quality & Defect Log Queries
-- ============================================================

-- QUERY 1: All inspections with pass/fail and defect rate
SELECT qi.inspection_id,
       m.machine_name,
       o.first_name || ' ' || o.last_name AS operator,
       qi.units_checked,
       qi.defects_found,
       ROUND(100.0 * qi.defects_found / NULLIF(qi.units_checked, 0), 2) AS defect_pct,
       CASE WHEN qi.pass_fail THEN 'PASS' ELSE 'FAIL' END AS result
FROM quality_inspections qi
JOIN production_orders po ON qi.order_id = po.order_id
JOIN machines m           ON po.machine_id = m.machine_id
JOIN operators o          ON po.operator_id = o.operator_id
ORDER BY defect_pct DESC;

-- QUERY 2: Average defect rate per machine
SELECT m.machine_name,
       COUNT(qi.inspection_id) AS inspections,
       ROUND(AVG(100.0 * qi.defects_found / NULLIF(qi.units_checked,0)), 2) AS avg_defect_pct
FROM quality_inspections qi
JOIN production_orders po ON qi.order_id = po.order_id
JOIN machines m           ON po.machine_id = m.machine_id
GROUP BY m.machine_name
ORDER BY avg_defect_pct DESC;

-- QUERY 3: Batches that failed quality (defect rate >= 5%)
SELECT qi.inspection_id, m.machine_name, qi.defects_found, qi.units_checked, qi.notes
FROM quality_inspections qi
JOIN production_orders po ON qi.order_id = po.order_id
JOIN machines m           ON po.machine_id = m.machine_id
WHERE qi.pass_fail = FALSE
ORDER BY qi.inspected_at DESC;
