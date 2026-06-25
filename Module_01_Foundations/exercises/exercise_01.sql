-- ============================================================
-- Module 01 – Foundations
-- Exercise 1: Manufacturing Machines Basics
-- ============================================================
-- SETUP: Run this section first to create and populate tables
-- ============================================================

DROP TABLE IF EXISTS machines;

CREATE TABLE machines (
    machine_id SERIAL PRIMARY KEY,
    machine_name VARCHAR(100) NOT NULL,
    machine_type VARCHAR(50) NOT NULL,
    location VARCHAR(50) NOT NULL,
    installed_date DATE NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE
);

INSERT INTO machines (machine_name, machine_type, location, installed_date, is_active) VALUES
    ('CNC Mill Alpha', 'CNC', 'Plant 1 - Machining', '2018-03-12', TRUE),
    ('Laser Cutter L2', 'Laser Cutter', 'Plant 1 - Fabrication', '2019-07-25', TRUE),
    ('Press Brake PB-10', 'Press Brake', 'Plant 2 - Forming', '2017-11-03', TRUE),
    ('Robotic Arm R7', 'Robot', 'Plant 2 - Assembly', '2021-05-18', TRUE),
    ('Heat Treat Oven H1', 'Furnace', 'Plant 3 - Heat Treatment', '2016-09-09', FALSE),
    ('Packaging Cell P4', 'Packaging', 'Plant 3 - Dispatch', '2022-01-14', TRUE),
    ('Surface Grinder SG-2', 'Grinder', 'Plant 1 - Machining', '2015-06-30', FALSE),
    ('Inspection Scanner IS-5', 'Inspection', 'Plant 2 - Quality', '2023-04-06', TRUE),
    ('Welding Station W9', 'Welder', 'Plant 1 - Fabrication', '2020-10-22', TRUE),
    ('Conveyor Line C3', 'Conveyor', 'Plant 3 - Assembly', '2018-12-01', TRUE);

-- ============================================================
-- EXERCISES
-- ============================================================

-- Q1: List all machines.
-- Write your query below:


-- Q2: List only active machines, ordered by installed_date.
-- Write your query below:


-- Q3: Count how many machines are in each location.
-- Write your query below:


-- Q4: What are the different machine types?
-- Write your query below:


-- ============================================================
-- CHALLENGE
-- ============================================================

-- C1: Which location has the most machines?
-- Write your query below:
