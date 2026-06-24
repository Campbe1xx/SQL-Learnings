# Module 02 — Lesson 05: Window Functions

## What are Window Functions?

Window functions perform calculations across a set of rows **related to the current row**, without collapsing them into a single result like GROUP BY does. They are among the most powerful SQL tools.

### Syntax
```sql
function_name() OVER (
    PARTITION BY column    -- divide into groups (optional)
    ORDER BY column        -- order within each group
    ROWS/RANGE ...         -- frame specification (optional)
)
```

---

## ROW_NUMBER()

Assigns a unique sequential number to each row within a partition.

```sql
-- Rank production orders per machine by units produced
SELECT machine_id,
       order_id,
       units_produced,
       ROW_NUMBER() OVER (PARTITION BY machine_id ORDER BY units_produced DESC) AS rank_per_machine
FROM production_orders;
```

---

## RANK() and DENSE_RANK()

```sql
-- RANK: gaps in ranking if ties exist (1,1,3)
-- DENSE_RANK: no gaps (1,1,2)
SELECT machine_id,
       SUM(downtime_hours) AS total_downtime,
       RANK() OVER (ORDER BY SUM(downtime_hours) DESC) AS downtime_rank,
       DENSE_RANK() OVER (ORDER BY SUM(downtime_hours) DESC) AS dense_rank
FROM downtime_logs
GROUP BY machine_id;
```

---

## SUM() / AVG() OVER — Running Totals

```sql
-- Running total of units produced over time
SELECT order_id,
       start_time,
       units_produced,
       SUM(units_produced) OVER (ORDER BY start_time) AS running_total
FROM production_orders;

-- Running total per machine
SELECT machine_id,
       start_time,
       units_produced,
       SUM(units_produced) OVER (PARTITION BY machine_id ORDER BY start_time) AS machine_running_total
FROM production_orders;
```

---

## LAG() and LEAD() — Compare to Previous/Next Row

```sql
-- Compare each day's production to the previous day
SELECT order_date,
       daily_units,
       LAG(daily_units, 1) OVER (ORDER BY order_date) AS previous_day,
       daily_units - LAG(daily_units, 1) OVER (ORDER BY order_date) AS daily_change
FROM daily_production;

-- Show next scheduled maintenance date
SELECT machine_id,
       maintenance_date,
       LEAD(maintenance_date, 1) OVER (PARTITION BY machine_id ORDER BY maintenance_date) AS next_maintenance
FROM maintenance_schedule;
```

---

## NTILE() — Divide into Buckets

```sql
-- Divide machines into 4 performance quartiles
SELECT machine_name,
       total_units,
       NTILE(4) OVER (ORDER BY total_units DESC) AS performance_quartile
FROM (
    SELECT m.machine_name, SUM(po.units_produced) AS total_units
    FROM machines m
    JOIN production_orders po ON m.machine_id = po.machine_id
    GROUP BY m.machine_name
) t;
```

---

## FIRST_VALUE() / LAST_VALUE()

```sql
-- Show best and worst production run for each machine
SELECT machine_id,
       order_id,
       units_produced,
       FIRST_VALUE(units_produced) OVER (PARTITION BY machine_id ORDER BY units_produced DESC) AS best_run,
       FIRST_VALUE(units_produced) OVER (PARTITION BY machine_id ORDER BY units_produced ASC) AS worst_run
FROM production_orders;
```

---

## ✅ Next Step
Move to the [exercises folder](./exercises/) and complete Exercises 01–05.
