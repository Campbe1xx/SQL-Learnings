-- ============================================================
-- MODULE 03 - EXERCISE 01: INSERT, UPDATE, DELETE
-- ============================================================

-- Q1: Insert a new machine called 'Drill Press G' in 'Workshop 3', status 'Active'


-- Q2: Insert two new operators: 'John Smith' on Day shift, 'Sara Lee' on Night shift


-- Q3: Update the machine you just inserted - change its status to 'Inactive'


-- Q4: A production order with order_id = 5 had its units_produced recorded incorrectly.
--     Update it to 350 units.


-- Q5: Delete all downtime logs where downtime_hours = 0 (erroneous records)


-- ============================================================
-- ANSWERS
-- ============================================================
-- Q1: INSERT INTO machines (machine_name, location, status, install_date)
--     VALUES ('Drill Press G', 'Workshop 3', 'Active', CURRENT_DATE);
-- Q2: INSERT INTO operators (first_name, last_name, shift) VALUES
--     ('John', 'Smith', 'Day'), ('Sara', 'Lee', 'Night');
-- Q3: UPDATE machines SET status = 'Inactive' WHERE machine_name = 'Drill Press G';
-- Q4: UPDATE production_orders SET units_produced = 350 WHERE order_id = 5;
-- Q5: DELETE FROM downtime_logs WHERE downtime_hours = 0;
