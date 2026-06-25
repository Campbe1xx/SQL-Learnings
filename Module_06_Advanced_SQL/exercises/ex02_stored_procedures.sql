-- ============================================================
-- MODULE 06 - EXERCISE 02: Stored Procedures & Functions
-- ============================================================

-- QUESTION 1:
-- Write a stored procedure called 'record_production'
-- that accepts: machine_id, operator_id, units_produced, shift
-- and inserts a new production_orders row with start_time = NOW().
-- Your query here:


-- QUESTION 2:
-- Write a stored procedure called 'mark_machine_inactive'
-- that accepts a machine_id and sets its status to 'Inactive'.
-- Your query here:


-- QUESTION 3:
-- Write a scalar function called 'get_total_downtime'
-- that accepts a machine_id and returns the total downtime hours
-- for that machine as a DECIMAL.
-- Your query here:


-- QUESTION 4 (CHALLENGE):
-- Write a function called 'get_machine_health'
-- that accepts a machine_id and returns:
--   'Critical'  if total downtime > 20 hrs
--   'At Risk'   if total downtime > 10 hrs
--   'Healthy'   otherwise
-- Your query here:


-- ============================================================
-- ANSWERS
-- ============================================================

-- Q1:
-- CREATE OR REPLACE PROCEDURE record_production(
--     p_machine_id  INT,
--     p_operator_id INT,
--     p_units       INT,
--     p_shift       VARCHAR
-- )
-- LANGUAGE plpgsql AS $$
-- BEGIN
--     INSERT INTO production_orders (machine_id, operator_id, units_produced, shift, start_time)
--     VALUES (p_machine_id, p_operator_id, p_units, p_shift, NOW());
-- END;
-- $$;
-- -- Call: CALL record_production(1, 2, 300, 'Day');

-- Q2:
-- CREATE OR REPLACE PROCEDURE mark_machine_inactive(p_machine_id INT)
-- LANGUAGE plpgsql AS $$
-- BEGIN
--     UPDATE machines SET status = 'Inactive' WHERE machine_id = p_machine_id;
-- END;
-- $$;
-- -- Call: CALL mark_machine_inactive(3);

-- Q3:
-- CREATE OR REPLACE FUNCTION get_total_downtime(p_machine_id INT)
-- RETURNS DECIMAL LANGUAGE plpgsql AS $$
-- DECLARE v_total DECIMAL;
-- BEGIN
--     SELECT COALESCE(SUM(downtime_hours), 0)
--     INTO v_total
--     FROM downtime_logs WHERE machine_id = p_machine_id;
--     RETURN v_total;
-- END;
-- $$;
-- -- Use: SELECT machine_name, get_total_downtime(machine_id) FROM machines;

-- Q4:
-- CREATE OR REPLACE FUNCTION get_machine_health(p_machine_id INT)
-- RETURNS VARCHAR LANGUAGE plpgsql AS $$
-- DECLARE v_total DECIMAL;
-- BEGIN
--     SELECT COALESCE(SUM(downtime_hours), 0) INTO v_total
--     FROM downtime_logs WHERE machine_id = p_machine_id;
--     IF v_total > 20 THEN RETURN 'Critical';
--     ELSIF v_total > 10 THEN RETURN 'At Risk';
--     ELSE RETURN 'Healthy';
--     END IF;
-- END;
-- $$;
-- -- Use: SELECT machine_name, get_machine_health(machine_id) AS health FROM machines;
