-- ============================================================
-- Module 06 – Advanced SQL
-- Exercise 3: Triggers
-- ============================================================
-- SETUP: Run this section first to create and populate tables
-- ============================================================

DROP TABLE IF EXISTS stock_audit_log;
DROP TABLE IF EXISTS parts_stock;
DROP FUNCTION IF EXISTS parts_stock_set_created_at();
DROP FUNCTION IF EXISTS parts_stock_log_update();
DROP FUNCTION IF EXISTS parts_stock_prevent_delete();

CREATE TABLE parts_stock (
    part_id SERIAL PRIMARY KEY,
    part_name VARCHAR(100) NOT NULL,
    stock_qty INT NOT NULL CHECK (stock_qty >= 0),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE stock_audit_log (
    audit_id SERIAL PRIMARY KEY,
    part_id INT NOT NULL,
    old_stock_qty INT,
    new_stock_qty INT,
    changed_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    action_note TEXT
);

INSERT INTO parts_stock (part_name, stock_qty, created_at, updated_at) VALUES
    ('Bearing Set B-210', 12, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Servo Drive SD-55', 4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Safety Interlock SI-2', 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ============================================================
-- EXERCISES
-- ============================================================

-- Q1: CREATE a BEFORE INSERT trigger that auto-sets a timestamp.
-- Write the trigger function and trigger below:


-- Q2: CREATE an AFTER UPDATE trigger that logs changes to stock_audit_log.
-- Write the trigger function and trigger below:


-- Q3: CREATE a trigger that prevents DELETE if stock_qty > 0.
-- Write the trigger function and trigger below:
