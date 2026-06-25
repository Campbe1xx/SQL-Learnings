# Module 04: Building Structures

Welcome to **Module 04: Building Structures**.

## Learning Objectives
- Create schema objects with `CREATE`
- Evolve schema with `ALTER`
- Remove objects with `DROP`
- Apply indexes and constraints

## Introduction
Schema design determines data quality and query performance. Good structures prevent bad data before it enters the system.

## 1) CREATE TABLE

```sql
CREATE TABLE machines (
  machine_id      INTEGER PRIMARY KEY,
  machine_name    TEXT NOT NULL,
  commissioned_on DATE,
  status          TEXT NOT NULL CHECK (status IN ('ACTIVE', 'INACTIVE', 'MAINTENANCE'))
);
```

This creates strong rules at the database layer.

## 2) Constraints
Key constraint types:
- `PRIMARY KEY`
- `FOREIGN KEY`
- `NOT NULL`
- `UNIQUE`
- `CHECK`

Example foreign key:

```sql
CREATE TABLE downtime_events (
  event_id          BIGINT PRIMARY KEY,
  machine_id        INTEGER NOT NULL REFERENCES machines(machine_id),
  event_time        TIMESTAMP NOT NULL,
  duration_minutes  INTEGER NOT NULL CHECK (duration_minutes >= 0)
);
```

## 3) ALTER TABLE
Use `ALTER` to evolve schemas over time.

```sql
ALTER TABLE machines
ADD COLUMN maintenance_interval_days INTEGER;
```

## 4) CREATE INDEX
Indexes speed up reads on commonly filtered/joined columns.

```sql
CREATE INDEX idx_downtime_machine_time
ON downtime_events (machine_id, event_time);
```

Tradeoff: indexes increase storage and can slow writes.

## 5) DROP Objects Safely

```sql
DROP TABLE IF EXISTS old_machine_logs;
```

In production, dropping should be deliberate and reviewed.

## Design Best Practices
- Normalize first, denormalize only when justified
- Name constraints and indexes clearly
- Enforce business rules with constraints, not just application code
- Version-control schema changes

## Common Mistakes
- Overusing nullable columns
- Missing foreign keys between related tables
- Adding indexes on every column without workload evidence

## Knowledge Check
1. Why use `CHECK` constraints if the application already validates input?
2. What columns are usually good index candidates?
3. What risk comes with too many indexes?

## Try It Yourself
- Add a `suppliers` table with PK and unique supplier code
- Link `work_orders` to `suppliers` via a foreign key
- Add an index for a frequent reporting filter

## Lesson Links
- [Open Module Exercise Page](../modules/module-04.html)

## Next Step
Continue to [Module 05: Transactions](../Module_05_Transactions/README.md).
