# Module 07 — Performance: Execution Plans

## EXPLAIN

`EXPLAIN` shows how PostgreSQL plans to execute a query — without running it.

```sql
EXPLAIN
SELECT * FROM production_orders
WHERE machine_id = 3;
```

## EXPLAIN ANALYZE

Actually runs the query and shows real timing.

```sql
EXPLAIN ANALYZE
SELECT m.machine_name, SUM(po.units_produced)
FROM production_orders po
JOIN machines m ON po.machine_id = m.machine_id
GROUP BY m.machine_name;
```

## What to Look For

| Term | Meaning |
|---|---|
| `Seq Scan` | Full table scan — slow on large tables |
| `Index Scan` | Uses an index — fast |
| `Hash Join` | Joining via hash — common for large sets |
| `Nested Loop` | Row-by-row join — fast for small sets |
| `cost=X..Y` | Estimated cost (X=startup, Y=total) |
| `rows=N` | Estimated row count |
| `actual time` | Real execution time (ANALYZE only) |

## Common Performance Tips

```sql
-- BAD: function on indexed column disables index
SELECT * FROM production_orders
WHERE EXTRACT(YEAR FROM start_time) = 2024;

-- GOOD: range query uses index
SELECT * FROM production_orders
WHERE start_time BETWEEN '2024-01-01' AND '2024-12-31';

-- BAD: SELECT * fetches unnecessary data
SELECT * FROM production_orders WHERE machine_id = 1;

-- GOOD: only fetch what you need
SELECT order_id, units_produced, start_time
FROM production_orders WHERE machine_id = 1;
```
