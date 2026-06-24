# Module 06 — PIVOT & UNPIVOT

## PIVOT: Rows to Columns

PostgreSQL uses `FILTER` or `CASE` for pivoting:

```sql
-- Pivot: units produced per machine per shift
SELECT machine_id,
       SUM(units_produced) FILTER (WHERE shift = 'Day')   AS day_shift,
       SUM(units_produced) FILTER (WHERE shift = 'Night') AS night_shift,
       SUM(units_produced) FILTER (WHERE shift = 'Weekend') AS weekend_shift
FROM production_orders
GROUP BY machine_id
ORDER BY machine_id;
```

## UNPIVOT: Columns to Rows

Use `UNION ALL` to unpivot:

```sql
SELECT machine_id, 'Day' AS shift, day_units AS units FROM pivot_table
UNION ALL
SELECT machine_id, 'Night', night_units FROM pivot_table
UNION ALL
SELECT machine_id, 'Weekend', weekend_units FROM pivot_table
ORDER BY machine_id, shift;
```
