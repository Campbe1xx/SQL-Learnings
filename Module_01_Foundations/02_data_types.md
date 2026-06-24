# Module 01 — Data Types Reference Sheet

Use this as a quick reference while writing SQL throughout the course.

## Choosing the Right Data Type

| Scenario | Recommended Type |
|---|---|
| Machine ID, counter | `INT` or `SERIAL` |
| Temperature reading (e.g. 98.6) | `DECIMAL(5,2)` |
| Machine name, location | `VARCHAR(100)` |
| Long notes or descriptions | `TEXT` |
| Date of maintenance | `DATE` |
| Exact timestamp of alarm | `TIMESTAMP` |
| Is machine active? | `BOOLEAN` |
| Duration of downtime | `INTERVAL` |
| Batch pass/fail | `BOOLEAN` |
| Part number (e.g. 'PN-00142') | `VARCHAR(20)` |

## Type Casting

Convert between types using `CAST()` or the `::` shorthand (PostgreSQL):

```sql
-- Convert text to integer
SELECT CAST('42' AS INTEGER);

-- PostgreSQL shorthand
SELECT '42'::INTEGER;

-- Convert to date
SELECT '2024-01-15'::DATE;

-- Convert integer to decimal
SELECT 5::DECIMAL(10,2);
```

## NULL Values

- `NULL` means **no value / unknown** — it is NOT zero, NOT empty string
- Any arithmetic with NULL returns NULL: `5 + NULL = NULL`
- Use `IS NULL` or `IS NOT NULL` to check for NULLs (never use `= NULL`)

```sql
-- Wrong
SELECT * FROM machines WHERE status = NULL;

-- Correct
SELECT * FROM machines WHERE status IS NULL;
```
