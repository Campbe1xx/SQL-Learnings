-- ============================================================
-- Module 05 – Transactions
-- Exercise 1: ACID, COMMIT, ROLLBACK, SAVEPOINT, and Isolation
-- ============================================================
-- SETUP: Run this section first to create and populate tables
-- ============================================================

DROP TABLE IF EXISTS inventory_audit;
DROP TABLE IF EXISTS inventory;

CREATE TABLE inventory (
    part_id SERIAL PRIMARY KEY,
    part_name VARCHAR(100) NOT NULL,
    stock_qty INT NOT NULL CHECK (stock_qty >= 0),
    warehouse_location VARCHAR(50) NOT NULL
);

CREATE TABLE inventory_audit (
    audit_id SERIAL PRIMARY KEY,
    part_id INT NOT NULL REFERENCES inventory (part_id),
    action_type VARCHAR(20) NOT NULL,
    quantity_changed INT NOT NULL,
    action_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    notes TEXT
);

INSERT INTO inventory (part_name, stock_qty, warehouse_location) VALUES
    ('Bearing Set B-210', 40, 'Stores A'),
    ('Servo Drive SD-55', 12, 'Stores B'),
    ('Safety Interlock SI-2', 18, 'Stores A');

-- ============================================================
-- EXERCISES
-- ============================================================

-- Q1: Write a transaction that transfers 5 units from 'Bearing Set B-210' to 'Servo Drive SD-55' using BEGIN and COMMIT.
-- Write your transaction below:


-- Q2: Write a transaction that intentionally hits an error and uses ROLLBACK.
-- Hint: the inventory table prevents stock_qty from dropping below zero.
-- Write your transaction below:


-- Q3: Use SAVEPOINT to partially roll back within a transaction.
-- Write your transaction below:


-- Q4: Demonstrate why READ COMMITTED prevents dirty reads.
-- Explain via comments and write the two concurrent sessions as separate labeled blocks.
-- Write your answer below:


-- ============================================================
-- CHALLENGE
-- ============================================================

-- C1: Write a transaction that debits stock and inserts an audit log row atomically.
-- Write your transaction below:
