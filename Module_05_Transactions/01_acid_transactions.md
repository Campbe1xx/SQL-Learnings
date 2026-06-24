# Module 05 — Transactions & Data Integrity

## ACID Properties

| Property | Meaning | Manufacturing Example |
|---|---|---|
| **Atomicity** | All steps succeed or all are rolled back | Booking a part AND updating stock must both succeed |
| **Consistency** | DB moves from one valid state to another | Stock count never goes negative |
| **Isolation** | Concurrent transactions don't interfere | Two operators can't book the last part simultaneously |
| **Durability** | Committed data survives crashes | Completed work order is permanently saved |

## Basic Transaction

```sql
BEGIN;

  UPDATE spare_parts
  SET quantity = quantity - 5
  WHERE part_id = 12;

  INSERT INTO work_orders (machine_id, part_id, quantity_used)
  VALUES (3, 12, 5);

COMMIT;
```

## ROLLBACK on Error

```sql
BEGIN;

  UPDATE spare_parts SET quantity = quantity - 5 WHERE part_id = 12;

  -- If something goes wrong:
  ROLLBACK;

COMMIT;
```

## SAVEPOINT

```sql
BEGIN;
  INSERT INTO maintenance_logs (machine_id, technician, work_done) VALUES (1, 'J.Smith', 'Oil change');
  SAVEPOINT after_log;

  UPDATE machines SET last_maintenance = NOW() WHERE machine_id = 1;
  -- Undo just the update, keep the log insert
  ROLLBACK TO after_log;

COMMIT;
```

## Isolation Levels

| Level | Dirty Read | Non-Repeatable Read | Phantom Read |
|---|---|---|---|
| Read Uncommitted | ✅ Possible | ✅ Possible | ✅ Possible |
| Read Committed | ❌ Prevented | ✅ Possible | ✅ Possible |
| Repeatable Read | ❌ Prevented | ❌ Prevented | ✅ Possible |
| Serializable | ❌ Prevented | ❌ Prevented | ❌ Prevented |

```sql
-- Set isolation level
BEGIN ISOLATION LEVEL REPEATABLE READ;
  SELECT * FROM spare_parts WHERE quantity < 10;
COMMIT;
```
