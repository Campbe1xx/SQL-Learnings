-- ============================================================
-- PROJECT 02: Sample Data
-- ============================================================

INSERT INTO maintenance_tasks (machine_id, task_name, frequency_days, last_done, assigned_to, priority) VALUES
  (1, 'Lubricate spindle bearings',    30,  '2024-01-10', 'J. Carter',  'High'),
  (1, 'Inspect cutting tools',         14,  '2024-01-20', 'J. Carter',  'Medium'),
  (2, 'Calibrate sensors',             60,  '2024-01-05', 'M. Lopez',   'High'),
  (2, 'Clean robot arm joints',        30,  '2024-02-01', 'M. Lopez',   'Medium'),
  (3, 'Replace conveyor belt',         180, '2023-11-01', 'D. Nguyen',  'Critical'),
  (4, 'Clean laser lens',              7,   '2024-03-01', 'S. Mills',   'High'),
  (5, 'Inspect hydraulic seals',       90,  '2023-12-01', 'T. Briggs',  'Critical'),
  (6, 'Replace drill bits',            21,  '2024-01-28', 'J. Carter',  'Medium');

INSERT INTO maintenance_completions (task_id, completed_by, completed_at, notes, hours_spent) VALUES
  (1, 'J. Carter', '2024-01-10 09:00', 'Bearings in good condition',         1.5),
  (2, 'J. Carter', '2024-01-20 11:00', 'Replaced 2 worn tools',              0.5),
  (3, 'M. Lopez',  '2024-01-05 22:00', 'Sensors realigned to spec',          2.0),
  (6, 'T. Briggs', '2024-01-28 08:00', 'All bits replaced, stock updated',   1.0);
