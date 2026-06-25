# Module 07: Performance

Welcome to **Module 07: Performance**.

## Learning Objectives
- Read execution plans with `EXPLAIN`
- Improve queries with indexing strategy
- Optimize heavy analytical workloads

## Introduction
Fast SQL comes from good schema design, efficient queries, and correct indexing. Performance tuning is about evidence, not guesswork.

## 1) EXPLAIN and EXPLAIN ANALYZE

```sql
EXPLAIN ANALYZE
SELECT machine_id, SUM(duration_minutes)
FROM downtime_events
WHERE event_time >= now() - INTERVAL '30 days'
GROUP BY machine_id;
```

Read plans for:
- sequential scans vs index scans
- join strategy (nested loop, hash join, merge join)
- estimated vs actual rows
- time spent per step

## 2) Indexing Strategy
Create indexes for common filters/joins.

```sql
CREATE INDEX idx_downtime_event_time
ON downtime_events (event_time);
```

Composite index example:

```sql
CREATE INDEX idx_downtime_machine_time
ON downtime_events (machine_id, event_time);
```

## 3) Query Rewrites
Performance can often improve by rewriting logic:
- Replace correlated subqueries when possible
- Filter early
- Avoid selecting unused columns
- Aggregate on reduced datasets

## 4) Pagination and Large Result Sets
Use controlled result sizes:

```sql
SELECT *
FROM work_orders
ORDER BY created_at DESC
LIMIT 100;
```

For large apps, keyset pagination can outperform offset pagination.

## 5) Maintenance and Statistics
PostgreSQL planner quality depends on fresh statistics and healthy tables:
- `VACUUM` / autovacuum
- `ANALYZE`
- index bloat monitoring

## Common Performance Pitfalls
- Missing indexes on frequent joins
- Function calls on indexed columns in filters
- `SELECT *` in large analytical queries
- Ignoring table growth trends

## Knowledge Check
1. Why compare estimated rows and actual rows in `EXPLAIN ANALYZE`?
2. When is a composite index better than two single-column indexes?
3. Why can query rewrites outperform adding more indexes?

## Try It Yourself
- Run `EXPLAIN ANALYZE` before and after adding an index
- Rewrite one slow query and compare execution time
- Identify one query using unnecessary columns

## Lesson Links
- [Open Module Exercise Page](../modules/module-07.html)

## Next Step
Continue to [Module 08: Security](../Module_08_Security/README.md).
