# Module 02 — Lesson 01: SELECT, WHERE, ORDER BY

## The SELECT Statement

The `SELECT` statement is the most used command in SQL. It retrieves data from one or more tables.

### Basic Syntax
```sql
SELECT column1, column2
FROM table_name;
```

### Select All Columns
```sql
SELECT * FROM machines;
```
> ⚠️ Avoid `SELECT *` in production — always name your columns explicitly.

### Select Specific Columns
```sql
SELECT machine_name, location, status
FROM machines;
```

### Column Aliases
```sql
SELECT machine_name AS name, install_date AS installed
FROM machines;
```

---

## The WHERE Clause

Filter rows based on conditions.

```sql
SELECT machine_name, status
FROM machines
WHERE status = 'Active';
```

### Comparison Operators
| Operator | Meaning | Example |
|---|---|---|
| `=` | Equal | `status = 'Active'` |
| `<>` or `!=` | Not equal | `status <> 'Inactive'` |
| `>` | Greater than | `units_produced > 100` |
| `<` | Less than | `defect_count < 5` |
| `>=` | Greater or equal | `hours_run >= 8` |
| `<=` | Less or equal | `temperature <= 75` |

### Logical Operators
```sql
-- AND: both conditions must be true
SELECT * FROM machines
WHERE status = 'Active' AND location = 'Workshop 1';

-- OR: either condition must be true
SELECT * FROM machines
WHERE location = 'Line 1' OR location = 'Line 2';

-- NOT: negate a condition
SELECT * FROM machines
WHERE NOT status = 'Inactive';
```

### IN — match a list of values
```sql
SELECT * FROM machines
WHERE location IN ('Workshop 1', 'Line 1', 'Line 2');
```

### BETWEEN — range filter
```sql
SELECT * FROM production_orders
WHERE start_time BETWEEN '2024-01-01' AND '2024-03-31';
```

### LIKE — pattern matching
```sql
-- Starts with 'CNC'
SELECT * FROM machines WHERE machine_name LIKE 'CNC%';

-- Contains 'Robot'
SELECT * FROM machines WHERE machine_name LIKE '%Robot%';

-- Single character wildcard
SELECT * FROM machines WHERE machine_name LIKE 'Line _';
```

### NULL Handling
```sql
-- Find machines with no recorded maintenance
SELECT * FROM machines WHERE last_maintenance IS NULL;

-- Find machines that have been maintained
SELECT * FROM machines WHERE last_maintenance IS NOT NULL;

-- COALESCE: return first non-null value
SELECT machine_name, COALESCE(last_maintenance::TEXT, 'Never maintained') AS maintenance_status
FROM machines;
```

---

## ORDER BY

Sort results ascending (ASC) or descending (DESC).

```sql
-- Sort by install date, oldest first
SELECT machine_name, install_date
FROM machines
ORDER BY install_date ASC;

-- Sort by most recently installed
SELECT machine_name, install_date
FROM machines
ORDER BY install_date DESC;

-- Sort by multiple columns
SELECT machine_name, location, status
FROM machines
ORDER BY location ASC, machine_name ASC;
```

---

## LIMIT & OFFSET

```sql
-- Get the 10 most recent production orders
SELECT * FROM production_orders
ORDER BY start_time DESC
LIMIT 10;

-- Skip first 10, get next 10 (pagination)
SELECT * FROM production_orders
ORDER BY start_time DESC
LIMIT 10 OFFSET 10;
```

> 📝 **SQL Server equivalent:** Use `TOP 10` instead of `LIMIT`, and `OFFSET x ROWS FETCH NEXT y ROWS ONLY` for pagination.

---

## DISTINCT — remove duplicates

```sql
-- List all unique locations
SELECT DISTINCT location FROM machines;

-- List all unique status values
SELECT DISTINCT status FROM machines;
```

---

## ✅ Next Step
Proceed to [Lesson 02 — Aggregates & GROUP BY](./02_aggregates_groupby.md)
