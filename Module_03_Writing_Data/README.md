# Module 03: Writing Data

Welcome to **Module 03: Writing Data**.

## Learning Objectives
- Insert records with `INSERT`
- Modify records with `UPDATE`
- Remove records with `DELETE`
- Understand safe write patterns

## Introduction
Reading data is only half the job. Engineers also need to **capture events**, **correct records**, and **remove invalid data** safely.

## 1) INSERT: Add New Rows
`INSERT` creates new records in a table.

```sql
INSERT INTO machines (machine_id, machine_name, status)
VALUES (101, 'Press-01', 'ACTIVE');
```

Insert multiple rows at once:

```sql
INSERT INTO machines (machine_id, machine_name, status)
VALUES
  (102, 'Press-02', 'ACTIVE'),
  (103, 'Cutter-01', 'MAINTENANCE');
```

### Why `INSERT` matters
Use `INSERT` whenever new operational data arrives:
- new machine onboarding
- new work order creation
- new downtime event logging

## 2) UPDATE: Modify Existing Rows

```sql
UPDATE machines
SET status = 'INACTIVE'
WHERE machine_id = 103;
```

Always include a precise `WHERE` clause.

## 3) DELETE: Remove Rows

```sql
DELETE FROM downtime_events
WHERE event_id = 9001;
```

Without `WHERE`, all rows are removed.

## 4) INSERT ... SELECT (Bulk Copy/Transform)

```sql
INSERT INTO downtime_archive (event_id, machine_id, event_time, duration_minutes)
SELECT event_id, machine_id, event_time, duration_minutes
FROM downtime_events
WHERE event_time < DATE '2025-01-01';
```

Useful for archiving and ETL flows.

## 5) Returning Inserted/Updated Data
PostgreSQL supports `RETURNING`:

```sql
INSERT INTO work_orders (work_order_id, product_code, planned_units)
VALUES (5001, 'PUMP-X', 1200)
RETURNING work_order_id, planned_units;
```

Great for APIs and audit logs.

## Best Practices for Writes
- Use transactions around related write operations
- Validate data types and constraints
- Prefer soft deletes when auditability is required
- Log who changed what and when

## Common Mistakes
- Missing `WHERE` in `UPDATE`/`DELETE`
- Not checking row counts after write statements
- Inserting columns in wrong order when column list is omitted

## Knowledge Check
1. Why should you always include a `WHERE` with `UPDATE` and `DELETE`?
2. When is `INSERT ... SELECT` better than many single-row inserts?
3. What does `RETURNING` help you do?

## Try It Yourself
- Insert a new machine and return its values
- Update all machines in one line to set a new review timestamp
- Delete test records inserted during development

## Lesson Links
- [Open Module Exercise Page](../modules/module-03.html)

## Next Step
Continue to [Module 04: Building Structures](../Module_04_Building_Structures/README.md).
