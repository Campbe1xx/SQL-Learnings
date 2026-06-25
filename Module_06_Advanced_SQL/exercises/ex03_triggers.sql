-- ============================================================
-- MODULE 06 - EXERCISE 03: Triggers
-- ============================================================

-- QUESTION 1:
-- Create a trigger that automatically updates the
-- machines.last_maintenance column to NOW() whenever
-- a new row is inserted into maintenance_completions.
-- Your query here:


-- QUESTION 2:
-- Create an audit table called 'operator_audit' that stores:
-- audit_id, operator_id, old_shift, new_shift, changed_at.
-- Then create a trigger on the operators table that
-- logs any shift changes into this audit table.
-- Your query here:


-- QUESTION 3 (CHALLENGE):
-- Create a trigger that prevents inserting a downtime_log
-- row with downtime_hours > 24 (raise an error instead).
-- Your query here:


-- ============================================================
-- ANSWERS
-- ============================================================

-- Q1:
-- CREATE OR REPLACE FUNCTION sync_last_maintenance()
-- RETURNS TRIGGER LANGUAGE plpgsql AS $$
-- BEGIN
--     UPDATE machines SET last_maintenance = NOW()
--     WHERE machine_id = (
--         SELECT mt.machine_id FROM maintenance_tasks mt
--         WHERE mt.task_id = NEW.task_id
--     );
--     RETURN NEW;
-- END;
-- $$;
-- CREATE TRIGGER trg_sync_maintenance
-- AFTER INSERT ON maintenance_completions
-- FOR EACH ROW EXECUTE FUNCTION sync_last_maintenance();

-- Q2:
-- CREATE TABLE operator_audit (
--     audit_id   SERIAL PRIMARY KEY,
--     operator_id INT,
--     old_shift   VARCHAR(20),
--     new_shift   VARCHAR(20),
--     changed_at  TIMESTAMP DEFAULT NOW()
-- );
-- CREATE OR REPLACE FUNCTION log_shift_change()
-- RETURNS TRIGGER LANGUAGE plpgsql AS $$
-- BEGIN
--     IF OLD.shift <> NEW.shift THEN
--         INSERT INTO operator_audit (operator_id, old_shift, new_shift)
--         VALUES (OLD.operator_id, OLD.shift, NEW.shift);
--     END IF;
--     RETURN NEW;
-- END;
-- $$;
-- CREATE TRIGGER trg_shift_audit
-- AFTER UPDATE ON operators
-- FOR EACH ROW EXECUTE FUNCTION log_shift_change();

-- Q3:
-- CREATE OR REPLACE FUNCTION check_downtime_hours()
-- RETURNS TRIGGER LANGUAGE plpgsql AS $$
-- BEGIN
--     IF NEW.downtime_hours > 24 THEN
--         RAISE EXCEPTION 'downtime_hours cannot exceed 24. Value provided: %', NEW.downtime_hours;
--     END IF;
--     RETURN NEW;
-- END;
-- $$;
-- CREATE TRIGGER trg_check_downtime
-- BEFORE INSERT ON downtime_logs
-- FOR EACH ROW EXECUTE FUNCTION check_downtime_hours();
