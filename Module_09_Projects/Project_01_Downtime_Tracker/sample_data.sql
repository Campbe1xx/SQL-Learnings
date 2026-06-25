-- ============================================================
-- PROJECT 01: Sample Data
-- ============================================================

INSERT INTO machines (machine_name, location, status, install_date, last_maintenance) VALUES
  ('CNC Mill A',        'Workshop 1', 'Active',      '2018-03-15', '2024-01-10 08:00:00'),
  ('Assembly Robot B',  'Line 2',     'Active',      '2020-07-22', '2024-02-14 09:00:00'),
  ('Conveyor C',        'Line 1',     'Inactive',    '2015-11-01', '2023-11-05 14:00:00'),
  ('Laser Cutter D',    'Workshop 2', 'Active',      '2021-05-30', '2024-03-01 07:30:00'),
  ('Hydraulic Press E', 'Line 3',     'Maintenance', '2017-08-19', NULL),
  ('Drill Station F',   'Workshop 1', 'Active',      '2019-02-11', '2024-01-28 10:00:00');

INSERT INTO operators (first_name, last_name, shift) VALUES
  ('James', 'Carter',  'Day'),
  ('Maria', 'Lopez',   'Night'),
  ('David', 'Nguyen',  'Day'),
  ('Sarah', 'Mills',   'Weekend'),
  ('Tom',   'Briggs',  'Night');

INSERT INTO downtime_logs (machine_id, operator_id, log_date, downtime_hours, reason, resolved) VALUES
  (1, 1, '2024-01-05 10:00:00', 2.5,  'Spindle bearing failure',       TRUE),
  (1, 3, '2024-01-18 14:00:00', 4.0,  'Tool change delay',             TRUE),
  (2, 2, '2024-01-09 22:00:00', 1.0,  'Sensor misalignment',           TRUE),
  (2, 2, '2024-02-20 23:00:00', 6.5,  'Motor overheating',             FALSE),
  (3, 1, '2024-01-12 08:00:00', 8.0,  'Belt snapped',                  TRUE),
  (3, 4, '2024-02-01 09:00:00', 3.5,  'Roller jam',                    TRUE),
  (4, 3, '2024-01-22 07:00:00', 0.5,  'Lens cleaning required',        TRUE),
  (5, 5, '2024-02-10 20:00:00', 12.0, 'Hydraulic seal leak',           FALSE),
  (5, 5, '2024-03-01 21:00:00', 9.0,  'Pressure regulator replaced',   TRUE),
  (6, 1, '2024-01-30 08:30:00', 1.5,  'Bit replacement',               TRUE);

INSERT INTO production_orders (machine_id, operator_id, start_time, end_time, units_produced, shift, defect_rate) VALUES
  (1, 1, '2024-01-02 08:00', '2024-01-02 16:00', 320, 'Day',     1.2),
  (1, 3, '2024-01-03 08:00', '2024-01-03 16:00', 295, 'Day',     2.1),
  (2, 2, '2024-01-04 20:00', '2024-01-05 04:00', 410, 'Night',   0.5),
  (2, 2, '2024-01-11 20:00', '2024-01-12 04:00', 388, 'Night',   0.8),
  (4, 3, '2024-01-15 08:00', '2024-01-15 16:00', 510, 'Day',     0.3),
  (4, 1, '2024-02-05 08:00', '2024-02-05 16:00', 490, 'Day',     1.0),
  (6, 1, '2024-01-08 08:00', '2024-01-08 16:00', 215, 'Day',     3.5),
  (6, 4, '2024-01-20 09:00', '2024-01-20 17:00', 230, 'Weekend', 2.8),
  (1, 1, '2024-02-12 08:00', '2024-02-12 16:00', 340, 'Day',     1.5),
  (3, 4, '2024-02-18 09:00', '2024-02-18 17:00', 175, 'Weekend', 4.2);
