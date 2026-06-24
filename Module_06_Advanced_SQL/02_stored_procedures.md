# Module 06 — Stored Procedures & Functions

## Stored Procedure (PostgreSQL)

```sql
CREATE OR REPLACE PROCEDURE log_downtime(
    p_machine_id INT,
    p_hours      DECIMAL,
    p_reason     TEXT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO downtime_logs (machine_id, downtime_hours, reason, log_date)
    VALUES (p_machine_id, p_hours, p_reason, NOW());

    UPDATE machines
    SET last_maintenance = NOW()
    WHERE machine_id = p_machine_id;
END;
$$;

-- Call it
CALL log_downtime(3, 2.5, 'Motor overheating');
```

## User-Defined Function

```sql
-- Function that returns OEE (Overall Equipment Effectiveness)
CREATE OR REPLACE FUNCTION calculate_oee(
    p_machine_id INT,
    p_start      TIMESTAMP,
    p_end        TIMESTAMP
) RETURNS DECIMAL
LANGUAGE plpgsql
AS $$
DECLARE
    v_planned_hours  DECIMAL;
    v_downtime_hours DECIMAL;
    v_availability   DECIMAL;
BEGIN
    v_planned_hours  := EXTRACT(EPOCH FROM (p_end - p_start)) / 3600;
    SELECT COALESCE(SUM(downtime_hours), 0)
    INTO v_downtime_hours
    FROM downtime_logs
    WHERE machine_id = p_machine_id
      AND log_date BETWEEN p_start AND p_end;

    v_availability := (v_planned_hours - v_downtime_hours) / NULLIF(v_planned_hours, 0);
    RETURN ROUND(v_availability * 100, 2);
END;
$$;

-- Use it
SELECT machine_name,
       calculate_oee(machine_id, '2024-01-01', '2024-01-31') AS oee_pct
FROM machines;
```
