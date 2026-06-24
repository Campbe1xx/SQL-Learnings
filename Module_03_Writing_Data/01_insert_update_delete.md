# Module 03 — Writing & Modifying Data (DML)

## INSERT

Add new rows to a table.

```sql
-- Single row insert
INSERT INTO machines (machine_name, location, status, install_date)
VALUES ('Laser Cutter D', 'Workshop 2', 'Active', '2024-01-10');

-- Multiple rows
INSERT INTO machines (machine_name, location, status, install_date)
VALUES
  ('Press E', 'Line 3', 'Active', '2023-06-01'),
  ('Welder F', 'Line 1', 'Inactive', '2021-03-15');
```

## UPDATE

```sql
-- Always use WHERE or you update every row!
UPDATE machines
SET status = 'Inactive'
WHERE machine_id = 3;

-- Update multiple columns
UPDATE machines
SET status = 'Active', last_maintenance = NOW()
WHERE machine_name = 'Conveyor C';
```

## DELETE

```sql
-- Delete a specific row
DELETE FROM downtime_logs
WHERE log_id = 42;

-- Delete all logs older than 1 year
DELETE FROM downtime_logs
WHERE log_date < NOW() - INTERVAL '1 year';
```

> ⚠️ Always run a SELECT with the same WHERE clause first to verify what will be affected before running UPDATE or DELETE.
