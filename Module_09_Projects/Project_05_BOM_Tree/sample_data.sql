-- ============================================================
-- PROJECT 05: Sample BOM Data
-- ============================================================

INSERT INTO bom (part_id, part_name, parent_id, quantity, unit_cost) VALUES
  (1,  'CNC Machine Assembly',  NULL, 1,    0.00),
  (2,  'Spindle Unit',          1,    1,    850.00),
  (3,  'Motor',                 2,    1,    420.00),
  (4,  'Bearing Set',           2,    4,    35.00),
  (5,  'Motor Shaft',           3,    1,    60.00),
  (6,  'Frame Assembly',        1,    1,    1200.00),
  (7,  'Base Plate',            6,    1,    450.00),
  (8,  'Side Panel (Left)',     6,    1,    180.00),
  (9,  'Side Panel (Right)',    6,    1,    180.00),
  (10, 'Control Panel',        1,    1,    650.00),
  (11, 'PLC Controller',        10,   1,    380.00),
  (12, 'HMI Touch Screen',      10,   1,    220.00),
  (13, 'Wiring Harness',        10,   1,    75.00),
  (14, 'Coolant System',        1,    1,    320.00),
  (15, 'Coolant Pump',          14,   1,    145.00),
  (16, 'Coolant Tank',          14,   1,    90.00),
  (17, 'Filter Unit',           14,   2,    28.00);
