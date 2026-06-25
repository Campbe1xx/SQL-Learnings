-- ============================================================
-- PROJECT 04: Sample Data
-- ============================================================

INSERT INTO quality_inspections (order_id, inspector_name, units_checked, defects_found, notes) VALUES
  (1,  'R. Evans', 320, 4,  'Minor surface scratches'),
  (2,  'R. Evans', 295, 6,  'Dimensional tolerance exceeded'),
  (3,  'K. Shah',  410, 2,  'Within spec'),
  (4,  'K. Shah',  388, 3,  'Within spec'),
  (5,  'R. Evans', 510, 2,  'Excellent batch'),
  (6,  'K. Shah',  490, 5,  'Slight discolouration noted'),
  (7,  'R. Evans', 215, 8,  'High defect rate - operator fatigue suspected'),
  (8,  'K. Shah',  230, 6,  'Reviewed tooling'),
  (9,  'R. Evans', 340, 5,  'Acceptable'),
  (10, 'K. Shah',  175, 9,  'Belt vibration causing defects');
