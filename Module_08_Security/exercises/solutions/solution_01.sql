-- ============================================================
-- Module 08 – Security
-- Solution 1: Roles, Permissions, Injection Prevention, and RLS
-- ============================================================
-- Run the setup section from ../exercise_01.sql before these answers.

-- Q1
CREATE ROLE readonly_analyst NOLOGIN;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO readonly_analyst;

-- Q2
CREATE USER jane_analyst WITH PASSWORD 'training_only_password';
GRANT readonly_analyst TO jane_analyst;

-- Q3
REVOKE INSERT ON TABLE machines FROM readonly_analyst;

-- Q4
-- Vulnerable example (do not use):
-- query := 'SELECT * FROM work_orders WHERE issue_summary = ''' || user_input || '''';
-- The concatenated value can inject arbitrary SQL.
-- Safe parameterised example:
PREPARE find_work_orders (TEXT) AS
SELECT *
FROM work_orders
WHERE issue_summary = $1;

-- Example execution:
-- EXECUTE find_work_orders('Inspect spindle vibration');

-- Q5
ALTER TABLE work_orders ENABLE ROW LEVEL SECURITY;

CREATE POLICY technician_owns_work_orders
ON work_orders
FOR SELECT
USING (technician_id = current_setting('app.current_technician_id')::INT);

-- Example for a session:
-- SET app.current_technician_id = '1';
-- SELECT * FROM work_orders;

-- C1
SELECT grantee,
       table_schema,
       table_name,
       privilege_type
FROM information_schema.role_table_grants
WHERE table_name = 'production_runs'
ORDER BY grantee, privilege_type;
