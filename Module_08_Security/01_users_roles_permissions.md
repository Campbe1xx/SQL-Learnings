# Module 08 — Security & Permissions

## Create Users & Roles

```sql
-- Create a read-only role
CREATE ROLE readonly_role;
GRANT CONNECT ON DATABASE manufacturing_db TO readonly_role;
GRANT USAGE ON SCHEMA public TO readonly_role;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO readonly_role;

-- Create a user and assign the role
CREATE USER shift_supervisor WITH PASSWORD 'SecurePass123!';
GRANT readonly_role TO shift_supervisor;

-- Create a write role for operators
CREATE ROLE operator_role;
GRANT SELECT, INSERT, UPDATE ON production_orders TO operator_role;
GRANT SELECT ON machines, operators TO operator_role;

CREATE USER op_john WITH PASSWORD 'Pass456!';
GRANT operator_role TO op_john;
```

## REVOKE Permissions

```sql
-- Remove write access from a role
REVOKE INSERT, UPDATE ON production_orders FROM operator_role;

-- Remove a role from a user
REVOKE operator_role FROM op_john;
```

## SQL Injection Prevention

SQL Injection is when malicious input alters your query logic. Always use parameterised queries from your application layer.

```sql
-- VULNERABLE (never do this in application code):
-- query = "SELECT * FROM users WHERE name = '" + user_input + "'"
-- Input: ' OR '1'='1  --> returns all rows!

-- SAFE: use parameterised queries (example in Python psycopg2)
-- cursor.execute("SELECT * FROM users WHERE name = %s", (user_input,))
```

## Row-Level Security (RLS)

```sql
-- Enable RLS on a table
ALTER TABLE production_orders ENABLE ROW LEVEL SECURITY;

-- Policy: operators can only see their own orders
CREATE POLICY own_orders ON production_orders
    FOR SELECT
    USING (operator_id = current_setting('app.current_operator_id')::INT);
```
