# Module 05: Transactions

Welcome to **Module 05: Transactions**.

## Learning Objectives
- Understand ACID properties
- Use `BEGIN`, `COMMIT`, and `ROLLBACK`
- Isolate changes with savepoints
- Reason about transaction isolation

## Introduction
A transaction groups multiple statements into one logical unit of work. This ensures data stays consistent even during failures.

## ACID in Practice
- **Atomicity**: all-or-nothing changes
- **Consistency**: data remains valid after transaction
- **Isolation**: concurrent transactions don’t corrupt each other
- **Durability**: committed data persists

## 1) Basic Transaction Flow

```sql
BEGIN;

UPDATE inventory
SET quantity_on_hand = quantity_on_hand - 10
WHERE part_id = 2001;

INSERT INTO inventory_movements (part_id, movement_type, qty)
VALUES (2001, 'CONSUME', 10);

COMMIT;
```

If anything fails, use `ROLLBACK`.

## 2) ROLLBACK

```sql
BEGIN;

UPDATE machines
SET status = 'ACTIVE'
WHERE machine_id = 999; -- wrong ID

ROLLBACK;
```

No changes are persisted.

## 3) SAVEPOINT

```sql
BEGIN;

INSERT INTO work_orders (work_order_id, product_code, planned_units)
VALUES (7001, 'VALVE-Z', 400);

SAVEPOINT after_order;

UPDATE work_orders
SET planned_units = -10
WHERE work_order_id = 7001;

ROLLBACK TO SAVEPOINT after_order;

COMMIT;
```

Savepoints let you undo part of a transaction.

## 4) Isolation Levels (Conceptual)
Common anomalies:
- dirty reads
- non-repeatable reads
- phantom reads

PostgreSQL defaults are safe for many workloads, but high-concurrency systems may require deliberate isolation tuning.

## Best Practices
- Keep transactions short
- Lock only what you need
- Handle retries for serialization failures
- Always log failure paths

## Common Mistakes
- Long-running transactions holding locks
- Mixing user interaction pauses inside open transactions
- Forgetting explicit rollback in error-handling paths

## Knowledge Check
1. Why should inventory update + movement log be one transaction?
2. What problem do savepoints solve?
3. Why can long transactions hurt system throughput?

## Try It Yourself
- Wrap a two-table update in a transaction
- Add a savepoint before a risky statement
- Simulate an error and verify rollback behavior

## Lesson Links
- [Open Module Exercise Page](../modules/module-05.html)

## Next Step
Continue to [Module 06: Advanced SQL](../Module_06_Advanced_SQL/README.md).
