-- ============================================================
-- Module 05 – Transactions
-- Solution 1: ACID, COMMIT, ROLLBACK, SAVEPOINT, and Isolation
-- ============================================================
-- Run the setup section from ../exercise_01.sql before these answers.

-- Q1
BEGIN;

UPDATE inventory
SET stock_qty = stock_qty - 5
WHERE part_name = 'Bearing Set B-210';

UPDATE inventory
SET stock_qty = stock_qty + 5
WHERE part_name = 'Servo Drive SD-55';

COMMIT;

-- Q2
BEGIN;

UPDATE inventory
SET stock_qty = stock_qty - 1000
WHERE part_name = 'Servo Drive SD-55';

-- The CHECK constraint will raise an error, leaving the transaction aborted.
ROLLBACK;

-- Q3
BEGIN;

UPDATE inventory
SET stock_qty = stock_qty - 2
WHERE part_name = 'Safety Interlock SI-2';

SAVEPOINT before_second_adjustment;

UPDATE inventory
SET stock_qty = stock_qty - 50
WHERE part_name = 'Bearing Set B-210';

ROLLBACK TO SAVEPOINT before_second_adjustment;

UPDATE inventory
SET stock_qty = stock_qty + 2
WHERE part_name = 'Servo Drive SD-55';

COMMIT;

-- Q4
-- Session A
-- BEGIN;
-- SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- UPDATE inventory
-- SET stock_qty = stock_qty - 10
-- WHERE part_name = 'Bearing Set B-210';
-- -- Session A does not commit yet.
--
-- Session B
-- BEGIN;
-- SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
-- SELECT stock_qty
-- FROM inventory
-- WHERE part_name = 'Bearing Set B-210';
-- -- Session B still sees the last committed value, not Session A's uncommitted update.
-- COMMIT;
--
-- Session A
-- ROLLBACK;
-- READ COMMITTED prevents Session B from performing a dirty read.

-- C1
BEGIN;

UPDATE inventory
SET stock_qty = stock_qty - 3
WHERE part_name = 'Bearing Set B-210';

INSERT INTO inventory_audit (part_id, action_type, quantity_changed, notes)
SELECT part_id,
       'DEBIT',
       -3,
       'Issued to urgent spindle repair job.'
FROM inventory
WHERE part_name = 'Bearing Set B-210';

COMMIT;
