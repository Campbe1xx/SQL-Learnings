-- ============================================================
-- Module 06 – Advanced SQL
-- Solution 2: Stored Procedures and Functions
-- ============================================================
-- Run the setup section from ../exercise_02.sql before these answers.

-- Q1
CREATE OR REPLACE FUNCTION calculate_oee(
    availability NUMERIC,
    performance NUMERIC,
    quality NUMERIC
)
RETURNS NUMERIC
LANGUAGE SQL
AS $$
    SELECT ROUND(availability * performance * quality * 100, 2);
$$;

-- Example usage:
-- SELECT calculate_oee(0.92, 0.95, 0.98);

-- Q2
CREATE OR REPLACE PROCEDURE create_work_order(
    IN p_machine_id INT,
    IN p_issue_summary VARCHAR,
    INOUT p_new_work_order_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO work_orders (machine_id, issue_summary)
    VALUES (p_machine_id, p_issue_summary)
    RETURNING work_order_id INTO p_new_work_order_id;
END;
$$;

-- Example usage:
-- CALL create_work_order(1, 'Replace spindle coolant hose', NULL);

-- Q3
CREATE OR REPLACE FUNCTION top_n_machines_by_downtime(top_n INT)
RETURNS TABLE (
    machine_id INT,
    machine_name VARCHAR,
    total_downtime_minutes BIGINT
)
LANGUAGE SQL
AS $$
    SELECT m.machine_id,
           m.machine_name,
           SUM(de.downtime_minutes) AS total_downtime_minutes
    FROM machines AS m
    JOIN downtime_events AS de
        ON de.machine_id = m.machine_id
    GROUP BY m.machine_id, m.machine_name
    ORDER BY total_downtime_minutes DESC, m.machine_name
    LIMIT top_n;
$$;

-- C1
CREATE OR REPLACE FUNCTION validate_machine_exists(p_machine_id INT)
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM machines
        WHERE machine_id = p_machine_id
    ) THEN
        RAISE EXCEPTION 'Machine ID % does not exist.', p_machine_id;
    END IF;
END;
$$;
