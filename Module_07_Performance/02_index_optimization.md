# Module 07 — Index Optimisation

## Types of Indexes

```sql
-- Single column
CREATE INDEX idx_orders_machine ON production_orders(machine_id);

-- Composite (multi-column) - order matters!
CREATE INDEX idx_orders_machine_time ON production_orders(machine_id, start_time);

-- Unique
CREATE UNIQUE INDEX idx_parts_code ON spare_parts(part_code);

-- Partial index - only index active machines
CREATE INDEX idx_active_machines ON machines(machine_id)
WHERE status = 'Active';
```

## When to Index

✅ Index columns used in: `WHERE`, `JOIN ON`, `ORDER BY`, `GROUP BY`

❌ Don't index: small tables, columns with very few unique values, columns rarely queried

## Check Existing Indexes

```sql
SELECT indexname, indexdef
FROM pg_indexes
WHERE tablename = 'production_orders';
```
