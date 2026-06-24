# Module 02 — Lesson 04: Subqueries & CTEs

## Subqueries

A subquery is a query nested inside another query.

### Subquery in WHERE
```sql
-- Find machines that have had downtime above average
SELECT machine_name
FROM machines
WHERE machine_id IN (
    SELECT machine_id
    FROM downtime_logs
    GROUP BY machine_id
    HAVING SUM(downtime_hours) > (
        SELECT AVG(total_dt)
        FROM (
            SELECT SUM(downtime_hours) AS total_dt
            FROM downtime_logs
            GROUP BY machine_id
        ) subq
    )
);
```

### Subquery in SELECT (scalar subquery)
```sql
-- Show each machine with total downtime hours
SELECT machine_name,
       (SELECT SUM(downtime_hours)
        FROM downtime_logs dl
        WHERE dl.machine_id = m.machine_id) AS total_downtime
FROM machines m;
```

### Subquery in FROM (derived table)
```sql
SELECT machine_id, total_units
FROM (
    SELECT machine_id, SUM(units_produced) AS total_units
    FROM production_orders
    GROUP BY machine_id
) AS machine_totals
WHERE total_units > 500;
```

---

## Common Table Expressions (CTEs)

A CTE uses the `WITH` keyword to define a named temporary result set. It is cleaner and more readable than nested subqueries.

### Basic CTE Syntax
```sql
WITH cte_name AS (
    SELECT ...  -- your query here
)
SELECT * FROM cte_name;
```

### Example: Machine Downtime Summary
```sql
WITH downtime_summary AS (
    SELECT machine_id,
           COUNT(*) AS incidents,
           SUM(downtime_hours) AS total_hours,
           ROUND(AVG(downtime_hours), 2) AS avg_hours
    FROM downtime_logs
    GROUP BY machine_id
)
SELECT m.machine_name,
       ds.incidents,
       ds.total_hours,
       ds.avg_hours
FROM downtime_summary ds
INNER JOIN machines m ON ds.machine_id = m.machine_id
ORDER BY ds.total_hours DESC;
```

### Multiple CTEs
```sql
WITH
production_totals AS (
    SELECT machine_id, SUM(units_produced) AS total_units
    FROM production_orders
    GROUP BY machine_id
),
downtime_totals AS (
    SELECT machine_id, SUM(downtime_hours) AS total_downtime
    FROM downtime_logs
    GROUP BY machine_id
)
SELECT m.machine_name,
       COALESCE(pt.total_units, 0) AS units,
       COALESCE(dt.total_downtime, 0) AS downtime_hrs
FROM machines m
LEFT JOIN production_totals pt ON m.machine_id = pt.machine_id
LEFT JOIN downtime_totals dt ON m.machine_id = dt.machine_id;
```

---

## CASE Expression (Conditional Logic)

```sql
-- Categorise machines by downtime severity
SELECT machine_name,
       total_downtime,
       CASE
           WHEN total_downtime >= 20 THEN 'Critical'
           WHEN total_downtime >= 10 THEN 'High'
           WHEN total_downtime >= 5  THEN 'Medium'
           ELSE 'Low'
       END AS severity
FROM (
    SELECT m.machine_name, COALESCE(SUM(dl.downtime_hours), 0) AS total_downtime
    FROM machines m
    LEFT JOIN downtime_logs dl ON m.machine_id = dl.machine_id
    GROUP BY m.machine_name
) summary
ORDER BY total_downtime DESC;
```

---

## ✅ Next Step
Proceed to [Lesson 05 — Window Functions](./05_window_functions.md)
