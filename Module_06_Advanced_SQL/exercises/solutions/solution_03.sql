-- ============================================================
-- Module 06 – Advanced SQL
-- Solution 3: Triggers
-- ============================================================
-- Run the setup section from ../exercise_03.sql before these answers.

-- Q1
CREATE OR REPLACE FUNCTION parts_stock_set_created_at()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    NEW.created_at := COALESCE(NEW.created_at, CURRENT_TIMESTAMP);
    NEW.updated_at := COALESCE(NEW.updated_at, CURRENT_TIMESTAMP);
    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_parts_stock_set_created_at
BEFORE INSERT ON parts_stock
FOR EACH ROW
EXECUTE FUNCTION parts_stock_set_created_at();

-- Q2
CREATE OR REPLACE FUNCTION parts_stock_log_update()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO stock_audit_log (part_id, old_stock_qty, new_stock_qty, action_note)
    VALUES (OLD.part_id, OLD.stock_qty, NEW.stock_qty, 'Stock quantity updated');
    RETURN NULL;
END;
$$;

CREATE TRIGGER trg_parts_stock_audit_update
AFTER UPDATE ON parts_stock
FOR EACH ROW
EXECUTE FUNCTION parts_stock_log_update();

-- Q3
CREATE OR REPLACE FUNCTION parts_stock_prevent_delete()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF OLD.stock_qty > 0 THEN
        RAISE EXCEPTION 'Cannot delete part % while stock_qty is greater than zero.', OLD.part_name;
    END IF;

    RETURN OLD;
END;
$$;

CREATE TRIGGER trg_parts_stock_prevent_delete
BEFORE DELETE ON parts_stock
FOR EACH ROW
EXECUTE FUNCTION parts_stock_prevent_delete();
