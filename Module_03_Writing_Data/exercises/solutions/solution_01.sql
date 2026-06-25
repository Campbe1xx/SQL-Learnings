-- ============================================================
-- Module 03 – Writing Data
-- Solution 1: INSERT, UPDATE, DELETE, and Bulk Operations
-- ============================================================
-- Run the setup section from ../exercise_01.sql before these answers.

-- Q1
INSERT INTO spare_parts (part_name, stock_qty, reorder_level, unit_cost, supplier)
VALUES
    ('Proximity Sensor PS-10', 15, 5, 12.75, 'NorthMill Supplies'),
    ('Pneumatic Valve PV-22', 9, 4, 36.20, 'FluidTech UK'),
    ('Cooling Fan CF-80', 11, 6, 21.90, 'Motion Works'),
    ('Encoder Disk ED-4', 7, 3, 54.50, 'Precision Motion Ltd'),
    ('Safety Interlock SI-2', 5, 2, 89.00, 'PlantSafe Components');

-- Q2
UPDATE spare_parts
SET stock_qty = 30,
    last_updated = CURRENT_TIMESTAMP
WHERE part_name = 'Bearing Set B-210';

-- Q3
DELETE FROM spare_parts
WHERE part_name = 'Obsolete Relay Mk1';

-- Q4
INSERT INTO spare_parts (part_name, stock_qty, reorder_level, unit_cost, supplier)
VALUES
    ('Drive Coupling DC-90', 6, 3, 74.25, 'NorthMill Supplies'),
    ('Linear Rail LR-12', 10, 5, 61.00, 'Precision Motion Ltd'),
    ('Emergency Stop Button ES-5', 14, 6, 17.40, 'PlantSafe Components');

-- Q5
UPDATE spare_parts
SET unit_cost = ROUND(unit_cost * 1.10, 2),
    last_updated = CURRENT_TIMESTAMP
WHERE supplier = 'NorthMill Supplies';

-- C1
UPDATE spare_parts
SET stock_qty = 4,
    last_updated = CASE
        WHEN 4 < reorder_level THEN CURRENT_TIMESTAMP
        ELSE last_updated
    END
WHERE part_name = 'Drive Coupling DC-90';
