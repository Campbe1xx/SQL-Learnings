# Module 06: Advanced SQL

Welcome to **Module 06: Advanced SQL**.

## Learning Objectives
- Build reusable logic with views
- Automate workflows with procedures and triggers
- Model hierarchy with recursive CTEs

## Introduction
Advanced SQL helps you package logic and solve complex patterns cleanly inside the database.

## 1) Views
Views are saved queries that simplify repeated analysis.

```sql
CREATE VIEW machine_downtime_summary AS
SELECT
  machine_id,
  COUNT(*) AS downtime_events,
  SUM(duration_minutes) AS total_minutes
FROM downtime_events
GROUP BY machine_id;
```

Then query it like a table:

```sql
SELECT *
FROM machine_downtime_summary
ORDER BY total_minutes DESC;
```

## 2) Stored Procedures / Functions (PL/pgSQL)
Use procedural logic for repeatable operations.

```sql
CREATE OR REPLACE FUNCTION mark_machine_maintenance(p_machine_id INTEGER)
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
  UPDATE machines
  SET status = 'MAINTENANCE'
  WHERE machine_id = p_machine_id;
END;
$$;
```

## 3) Triggers
Triggers run automatically on table events.

```sql
CREATE TABLE machine_status_audit (
  audit_id BIGSERIAL PRIMARY KEY,
  machine_id INTEGER,
  old_status TEXT,
  new_status TEXT,
  changed_at TIMESTAMP DEFAULT now()
);
```

(Trigger function and trigger can log status changes for auditability.)

## 4) Recursive CTEs
Useful for hierarchies like bill-of-materials or org charts.

```sql
WITH RECURSIVE bom AS (
  SELECT parent_part_id, child_part_id, 1 AS level
  FROM part_structure
  WHERE parent_part_id = 100

  UNION ALL

  SELECT ps.parent_part_id, ps.child_part_id, b.level + 1
  FROM part_structure ps
  JOIN bom b ON ps.parent_part_id = b.child_part_id
)
SELECT * FROM bom;
```

## Best Practices
- Keep views focused and documented
- Prefer set-based SQL over row-by-row loops
- Use triggers for audit/integrity, not heavy business workflows
- Test recursive queries with cycle-safe designs

## Common Mistakes
- Hiding expensive logic in deeply nested views
- Overusing triggers causing hard-to-trace side effects
- Recursive CTEs without termination safeguards

## Knowledge Check
1. When should you use a view instead of duplicating query text?
2. What makes triggers powerful but risky?
3. What real manufacturing problem can recursive CTEs solve?

## Try It Yourself
- Create a view for weekly production by line
- Write a function to close stale work orders
- Build a recursive query for multi-level assembly parts

## Lesson Links
- [Open Module Exercise Page](../modules/module-06.html)

## Next Step
Continue to [Module 07: Performance](../Module_07_Performance/README.md).
