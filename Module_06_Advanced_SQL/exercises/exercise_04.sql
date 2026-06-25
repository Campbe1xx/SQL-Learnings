-- ============================================================
-- Module 06 – Advanced SQL
-- Exercise 4: Recursive CTEs
-- ============================================================
-- SETUP: Run this section first to create and populate tables
-- ============================================================

DROP TABLE IF EXISTS bom_components;

CREATE TABLE bom_components (
    component_id INT PRIMARY KEY,
    parent_component_id INT REFERENCES bom_components (component_id),
    component_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    level INT NOT NULL
);

INSERT INTO bom_components (component_id, parent_component_id, component_name, quantity, level) VALUES
    (1, NULL, 'Packaging Line Assembly', 1, 0),
    (2, 1, 'Conveyor Frame', 1, 1),
    (3, 1, 'Drive System', 1, 1),
    (4, 2, 'Support Leg', 4, 2),
    (5, 2, 'Roller Set', 6, 2),
    (6, 3, 'Motor', 1, 2),
    (7, 3, 'Gearbox', 1, 2),
    (8, 5, 'Bearing Insert', 12, 3),
    (9, 7, 'Seal Kit', 2, 3);

-- ============================================================
-- EXERCISES
-- ============================================================

-- Q1: Write a recursive CTE to display the full BOM tree starting from the top-level assembly.
-- Write your query below:


-- Q2: Calculate total quantity needed at each level.
-- Write your query below:


-- Q3: Find all leaf nodes (components with no children).
-- Write your query below:
