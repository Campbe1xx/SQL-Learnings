# Module 02 — Lesson 02: Aggregates & GROUP BY

## Aggregate Functions

Aggregate functions perform a calculation on a set of rows and return a single value.

| Function | Description | Example |
|---|---|---|
| `COUNT()` | Count rows | `COUNT(*)` |
| `SUM()` | Total of values | `SUM(units_produced)` |
| `AVG()` | Average value | `AVG(downtime_hours)` |
| `MIN()` | Smallest value | `MIN(temperature)` |
| `MAX()` | Largest value | `MAX(defect_count)` |
| `ROUND()` | Round a number | `ROUND(AVG(temp), 2)` |

### Examples
```sql
-- Total units produced across all orders
SELECT SUM(units_produced) AS total_units
FROM production_orders;

-- Average downtime per incident
SELECT ROUND(AVG(downtime_hours), 2) AS avg_downtime
FROM downtime_logs;

-- Count of all active machines
SELECT COUNT(*) AS active_machines
FROM machines
WHERE status = 'Active';

-- Most and least units produced in a single order
SELECT MAX(units_produced) AS best_run,
       MIN(units_produced) AS worst_run
FROM production_orders;
```

---

## GROUP BY

`GROUP BY` groups rows sharing a value so aggregates apply per group.

```sql
-- Total units produced per machine
SELECT machine_id, SUM(units_produced) AS total_units
FROM production_orders
GROUP BY machine_id
ORDER BY total_units DESC;

-- Average downtime hours per machine
SELECT machine_id, ROUND(AVG(downtime_hours), 2) AS avg_downtime
FROM downtime_logs
GROUP BY machine_id;

-- Count of production orders per shift
SELECT shift, COUNT(*) AS orders_count
FROM production_orders
GROUP BY shift;
```

> ⚠️ Every column in SELECT that is NOT an aggregate must appear in GROUP BY.

---

## HAVING — filter grouped results

`HAVING` filters groups AFTER aggregation (WHERE filters rows BEFORE aggregation).

```sql
-- Machines with more than 10 hours total downtime
SELECT machine_id, SUM(downtime_hours) AS total_downtime
FROM downtime_logs
GROUP BY machine_id
HAVING SUM(downtime_hours) > 10
ORDER BY total_downtime DESC;

-- Shifts where average defect rate exceeds 2%
SELECT shift, ROUND(AVG(defect_rate), 2) AS avg_defects
FROM production_orders
GROUP BY shift
HAVING AVG(defect_rate) > 2.0;
```

### WHERE vs HAVING
```sql
-- WHERE filters BEFORE grouping
SELECT machine_id, COUNT(*) AS incidents
FROM downtime_logs
WHERE downtime_hours > 1          -- only rows where downtime > 1hr
GROUP BY machine_id
HAVING COUNT(*) > 3;              -- only machines with more than 3 such incidents
```

---

## Useful Date Functions

```sql
-- Extract year, month from a timestamp
SELECT EXTRACT(YEAR FROM start_time) AS year,
       EXTRACT(MONTH FROM start_time) AS month,
       SUM(units_produced) AS monthly_output
FROM production_orders
GROUP BY EXTRACT(YEAR FROM start_time), EXTRACT(MONTH FROM start_time)
ORDER BY year, month;

-- Orders in the last 30 days
SELECT * FROM production_orders
WHERE start_time >= NOW() - INTERVAL '30 days';
```

---

## ✅ Next Step
Proceed to [Lesson 03 — JOINs](./03_joins.md)
