-- ============================================================
-- MODULE 04 - EXERCISE 01: Schema Design
-- ============================================================

-- Q1: Create a table called 'spare_parts' with:
--     part_id (auto increment PK), part_name (required),
--     quantity (integer, default 0, must be >= 0),
--     unit_cost (decimal), last_restocked (date)


-- Q2: Add a column 'supplier_name' VARCHAR(100) to spare_parts


-- Q3: Create an index on spare_parts(part_name)


-- Q4: Create a table 'work_orders' that references both machines and spare_parts


-- ============================================================
-- ANSWERS
-- ============================================================
-- Q1:
-- CREATE TABLE spare_parts (
--     part_id       SERIAL PRIMARY KEY,
--     part_name     VARCHAR(100) NOT NULL,
--     quantity      INT DEFAULT 0 CHECK (quantity >= 0),
--     unit_cost     DECIMAL(10,2),
--     last_restocked DATE
-- );
-- Q2: ALTER TABLE spare_parts ADD COLUMN supplier_name VARCHAR(100);
-- Q3: CREATE INDEX idx_parts_name ON spare_parts(part_name);
-- Q4:
-- CREATE TABLE work_orders (
--     work_order_id SERIAL PRIMARY KEY,
--     machine_id    INT NOT NULL REFERENCES machines(machine_id),
--     part_id       INT REFERENCES spare_parts(part_id),
--     issued_date   TIMESTAMP DEFAULT NOW(),
--     quantity_used INT CHECK (quantity_used > 0)
-- );
