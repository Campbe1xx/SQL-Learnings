# Module 04 — Building Structures (DDL)

## CREATE TABLE

```sql
CREATE TABLE maintenance_logs (
    log_id        SERIAL PRIMARY KEY,
    machine_id    INT NOT NULL REFERENCES machines(machine_id),
    technician    VARCHAR(100) NOT NULL,
    log_date      TIMESTAMP DEFAULT NOW(),
    work_done     TEXT,
    hours_spent   DECIMAL(5,2),
    cost          DECIMAL(10,2)
);
```

## ALTER TABLE

```sql
-- Add a column
ALTER TABLE machines ADD COLUMN asset_tag VARCHAR(50);

-- Drop a column
ALTER TABLE machines DROP COLUMN asset_tag;

-- Rename a column
ALTER TABLE machines RENAME COLUMN status TO operational_status;

-- Change data type
ALTER TABLE machines ALTER COLUMN location TYPE VARCHAR(200);
```

## DROP & TRUNCATE

```sql
-- Remove the table entirely
DROP TABLE maintenance_logs;

-- Remove all rows but keep the table structure
TRUNCATE TABLE downtime_logs;
```

## Constraints

```sql
CREATE TABLE quality_checks (
    check_id     SERIAL PRIMARY KEY,
    order_id     INT NOT NULL,
    defects      INT DEFAULT 0 CHECK (defects >= 0),
    pass_fail    BOOLEAN NOT NULL,
    checked_at   TIMESTAMP DEFAULT NOW(),
    UNIQUE (order_id)
);
```

## Indexes

```sql
-- Speed up lookups by machine_id
CREATE INDEX idx_downtime_machine ON downtime_logs(machine_id);

-- Composite index
CREATE INDEX idx_prod_machine_time ON production_orders(machine_id, start_time);

-- Unique index
CREATE UNIQUE INDEX idx_unique_asset ON machines(asset_tag);
```
