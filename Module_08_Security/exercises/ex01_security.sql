-- ============================================================
-- MODULE 08 - EXERCISE 01: Security & Permissions
-- ============================================================
-- Note: Run these as a superuser/admin in PostgreSQL.
-- ============================================================

-- QUESTION 1:
-- Create a read-only role called 'report_viewer'.
-- Grant it the ability to connect to your database
-- and SELECT on all tables in the public schema.
-- Your query here:


-- QUESTION 2:
-- Create a user called 'shift_lead' with a password,
-- and assign them the 'report_viewer' role.
-- Your query here:


-- QUESTION 3:
-- Create a role called 'data_entry' that can
-- SELECT and INSERT on production_orders and downtime_logs,
-- but has no other permissions.
-- Your query here:


-- QUESTION 4:
-- Revoke INSERT on downtime_logs from the 'data_entry' role.
-- Your query here:


-- QUESTION 5:
-- List all privileges on the production_orders table
-- to verify your grants worked correctly.
-- Your query here:


-- QUESTION 6 (CHALLENGE):
-- Enable Row Level Security on the production_orders table.
-- Create a policy so that operators can only SELECT
-- their own orders (where operator_id matches a session variable).
-- Your query here:


-- ============================================================
-- ANSWERS
-- ============================================================

-- Q1:
-- CREATE ROLE report_viewer;
-- GRANT CONNECT ON DATABASE your_database_name TO report_viewer;
-- GRANT USAGE ON SCHEMA public TO report_viewer;
-- GRANT SELECT ON ALL TABLES IN SCHEMA public TO report_viewer;

-- Q2:
-- CREATE USER shift_lead WITH PASSWORD 'SecurePass123!';
-- GRANT report_viewer TO shift_lead;

-- Q3:
-- CREATE ROLE data_entry;
-- GRANT SELECT, INSERT ON production_orders TO data_entry;
-- GRANT SELECT, INSERT ON downtime_logs TO data_entry;

-- Q4:
-- REVOKE INSERT ON downtime_logs FROM data_entry;

-- Q5:
-- SELECT grantee, privilege_type
-- FROM information_schema.role_table_grants
-- WHERE table_name = 'production_orders';

-- Q6:
-- ALTER TABLE production_orders ENABLE ROW LEVEL SECURITY;
-- CREATE POLICY operator_own_orders ON production_orders
--     FOR SELECT
--     USING (operator_id = current_setting('app.current_operator_id')::INT);
