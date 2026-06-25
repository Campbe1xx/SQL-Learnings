-- ============================================================
-- Root Exercises – Window Functions
-- Exercise 1: Ranking and Running Totals
-- ============================================================
-- SETUP: Run this section first to create and populate tables
-- ============================================================

DROP TABLE IF EXISTS production_scores;

CREATE TABLE production_scores (
    score_id SERIAL PRIMARY KEY,
    team_name VARCHAR(50) NOT NULL,
    production_day DATE NOT NULL,
    units_completed INT NOT NULL,
    scrap_units INT NOT NULL
);

INSERT INTO production_scores (team_name, production_day, units_completed, scrap_units) VALUES
    ('Team Alpha', '2025-04-01', 120, 4),
    ('Team Alpha', '2025-04-02', 132, 3),
    ('Team Beta', '2025-04-01', 118, 5),
    ('Team Beta', '2025-04-02', 140, 2),
    ('Team Gamma', '2025-04-01', 110, 6),
    ('Team Gamma', '2025-04-02', 125, 4);

-- ============================================================
-- EXERCISES
-- ============================================================

-- Q1: Use ROW_NUMBER to number each row within a team by production_day.
-- Write your query below:


-- Q2: Rank teams by units_completed on each production_day.
-- Write your query below:


-- Q3: Show the previous day's units_completed for each team using LAG.
-- Write your query below:


-- Q4: Show total units_completed per team on every row using SUM OVER (PARTITION BY team_name).
-- Write your query below:


-- Q5: Calculate a running total of units_completed for each team.
-- Write your query below:
