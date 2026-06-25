-- ============================================================
-- Root Exercises – Window Functions
-- Solution 1: Ranking and Running Totals
-- ============================================================
-- Run the setup section from ../exercise_01.sql before these answers.

SELECT team_name, production_day, ROW_NUMBER() OVER (PARTITION BY team_name ORDER BY production_day) AS row_num FROM production_scores;
SELECT production_day, team_name, units_completed, RANK() OVER (PARTITION BY production_day ORDER BY units_completed DESC) AS team_rank FROM production_scores;
SELECT team_name, production_day, units_completed, LAG(units_completed) OVER (PARTITION BY team_name ORDER BY production_day) AS previous_units FROM production_scores;
SELECT team_name, production_day, units_completed, SUM(units_completed) OVER (PARTITION BY team_name) AS team_total_units FROM production_scores;
SELECT team_name, production_day, units_completed, SUM(units_completed) OVER (PARTITION BY team_name ORDER BY production_day ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_units FROM production_scores;
