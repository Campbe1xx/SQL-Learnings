# Module 06 — Triggers

## What is a Trigger?
A trigger automatically executes a function when a specific event (INSERT, UPDATE, DELETE) occurs on a table.

```sql
-- Step 1: Create the trigger function
CREATE OR REPLACE FUNCTION update_machine_last_maintenance()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE machines
    SET last_maintenance = NOW()
    WHERE machine_id = NEW.machine_id;
    RETURN NEW;
END;
$$;

-- Step 2: Attach it to the table
CREATE TRIGGER trg_maintenance_update
AFTER INSERT ON maintenance_logs
FOR EACH ROW
EXECUTE FUNCTION update_machine_last_maintenance();
```

Now every time a row is inserted into `maintenance_logs`, the machine's `last_maintenance` timestamp is automatically updated.

## Audit Trigger Example

```sql
-- Track all status changes on machines
CREATE TABLE machine_audit (
    audit_id   SERIAL PRIMARY KEY,
    machine_id INT,
    old_status VARCHAR(50),
    new_status VARCHAR(50),
    changed_at TIMESTAMP DEFAULT NOW()
);

CREATE OR REPLACE FUNCTION audit_machine_status()
RETURNS TRIGGER LANGUAGE plpgsql AS $$
BEGIN
    IF OLD.status <> NEW.status THEN
        INSERT INTO machine_audit (machine_id, old_status, new_status)
        VALUES (OLD.machine_id, OLD.status, NEW.status);
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_audit_status
AFTER UPDATE ON machines
FOR EACH ROW
EXECUTE FUNCTION audit_machine_status();
```
