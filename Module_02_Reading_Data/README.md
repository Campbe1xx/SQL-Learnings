# Module 02: Reading Data

Welcome to **Module 02: Reading Data**.

## Learning Objectives
- Retrieve data with `SELECT`
- Filter and sort records
- Combine tables with `JOIN`
- Summarize data with aggregates
- Use subqueries and window functions

## Introduction
Reading data is the core of SQL. Most analysis work is built from a few powerful patterns:
1. Select needed columns
2. Filter to relevant rows
3. Join related tables
4. Aggregate and rank results

## 1) SELECT: Retrieve Data
Use `SELECT` to choose columns from a table.

```sql
SELECT machine_id, machine_name, status
FROM machines;
```

Use `*` carefully — explicit columns are usually clearer and faster.

## 2) WHERE: Filter Rows

```sql
SELECT machine_id, event_type, event_time
FROM downtime_events
WHERE event_type = 'UNPLANNED'
  AND event_time >= DATE '2026-01-01';
```

Common operators:
- `=`, `<>`, `<`, `>`, `<=`, `>=`
- `IN (...)`
- `BETWEEN ... AND ...`
- `LIKE` / `ILIKE`
- `IS NULL` / `IS NOT NULL`

## 3) ORDER BY and LIMIT

```sql
SELECT work_order_id, completed_units
FROM work_orders
ORDER BY completed_units DESC
LIMIT 10;
```

Use this for “top N” reports.

## 4) JOIN: Combine Related Tables

```sql
SELECT d.event_id, m.machine_name, d.duration_minutes
FROM downtime_events d
JOIN machines m ON m.machine_id = d.machine_id;
```

Join types:
- `INNER JOIN` → matching rows only
- `LEFT JOIN` → all left table rows + matches
- `RIGHT JOIN` / `FULL JOIN` for special use cases

## 5) Aggregation: GROUP BY and HAVING

```sql
SELECT machine_id, COUNT(*) AS downtime_events, SUM(duration_minutes) AS total_downtime
FROM downtime_events
GROUP BY machine_id
HAVING SUM(duration_minutes) > 120;
```

Use `HAVING` for aggregated filters.

## 6) Subqueries

```sql
SELECT machine_id, machine_name
FROM machines
WHERE machine_id IN (
  SELECT machine_id
  FROM downtime_events
  WHERE duration_minutes > 60
);
```

Great for filtering with dynamic sets.

## 7) Window Functions

```sql
SELECT
  machine_id,
  event_time,
  duration_minutes,
  SUM(duration_minutes) OVER (
    PARTITION BY machine_id
    ORDER BY event_time
  ) AS running_downtime
FROM downtime_events;
```

Window functions let you keep row-level detail and add analytics like rank, running totals, moving averages.

## Common Mistakes
- Missing join conditions (causes cartesian products)
- Filtering aggregates in `WHERE` instead of `HAVING`
- Overusing nested subqueries when a join/CTE is clearer

## Knowledge Check
1. When should you use `HAVING` instead of `WHERE`?
2. What is the difference between `INNER JOIN` and `LEFT JOIN`?
3. Why are window functions useful for trend analysis?

## Try It Yourself
- Find top 3 machines by total downtime
- Show each event plus a running downtime total by machine
- List machines with no downtime events (`LEFT JOIN` + null filter)

## Lesson Links
- [Open Module Exercise Page](../modules/module-02.html)
- [Practice: Aggregations](../practice/aggregations.html)
- [Practice: Joins](../practice/joins.html)
- [Practice: Subqueries](../practice/subqueries.html)
- [Practice: Window Functions](../practice/window-functions.html)

## Next Step
Continue to [Module 03: Writing Data](../Module_03_Writing_Data/README.md).
