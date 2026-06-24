# Module 06 — Advanced SQL: Views

## What is a View?
A view is a saved SQL query that acts like a virtual table. It doesn't store data itself — it runs the underlying query each time you access it.

```sql
-- Create a production summary view
CREATE VIEW v_production_summary AS
SELECT m.machine_name,
       m.location,
       COUNT(po.order_id)        AS total_orders,
       SUM(po.units_produced)    AS total_units,
       ROUND(AVG(po.units_produced), 2) AS avg_units
FROM machines m
LEFT JOIN production_orders po ON m.machine_id = po.machine_id
GROUP BY m.machine_name, m.location;

-- Use it like a table
SELECT * FROM v_production_summary
ORDER BY total_units DESC;

-- Drop a view
DROP VIEW v_production_summary;
```

## Materialized Views
Stores the result physically — must be refreshed manually. Useful for slow, expensive queries.

```sql
CREATE MATERIALIZED VIEW mv_monthly_output AS
SELECT TO_CHAR(start_time, 'YYYY-MM') AS month,
       machine_id,
       SUM(units_produced) AS total_units
FROM production_orders
GROUP BY TO_CHAR(start_time, 'YYYY-MM'), machine_id;

-- Refresh when needed
REFRESH MATERIALIZED VIEW mv_monthly_output;
```
