-- ============================================================
-- MODULE 05 - EXERCISE 01: Transactions
-- ============================================================

-- Q1: Write a transaction that:
--     a) Reduces spare_parts quantity by 3 for part_id = 5
--     b) Inserts a work_order record for that part usage
--     Both must succeed together or both must fail.


-- Q2: Write a transaction with a SAVEPOINT.
--     Insert a maintenance log, set a savepoint, then
--     attempt to update a machine's last_maintenance.
--     Roll back only the update.


-- ============================================================
-- ANSWERS
-- ============================================================
-- Q1:
-- BEGIN;
--   UPDATE spare_parts SET quantity = quantity - 3 WHERE part_id = 5;
--   INSERT INTO work_orders (machine_id, part_id, quantity_used) VALUES (1, 5, 3);
-- COMMIT;

-- Q2:
-- BEGIN;
--   INSERT INTO maintenance_logs (machine_id, technician, work_done)
--   VALUES (2, 'A.Jones', 'Belt replacement');
--   SAVEPOINT after_insert;
--   UPDATE machines SET last_maintenance = NOW() WHERE machine_id = 2;
--   ROLLBACK TO after_insert;
-- COMMIT;
