-- ============================================================
-- MODULE 06 - EXERCISE 04: Recursive CTEs
-- ============================================================
-- Requires: Module_09_Projects/Project_05_BOM_Tree/schema.sql
--           and sample_data.sql to be loaded first.
-- ============================================================

-- QUESTION 1:
-- Write a recursive CTE that lists all parts in the BOM
-- with their level in the hierarchy (0 = top level).
-- Show: level, part_name, parent_id.
-- Your query here:


-- QUESTION 2:
-- Extend your recursive CTE to show the full path
-- from the top-level assembly down to each part.
-- e.g. 'CNC Machine Assembly > Spindle Unit > Motor'
-- Your query here:


-- QUESTION 3:
-- Using a recursive CTE, find all parts that belong
-- to the 'Spindle Unit' subtree (all descendants).
-- Your query here:


-- QUESTION 4 (CHALLENGE):
-- Calculate the total material cost of the entire
-- CNC Machine Assembly by summing quantity * unit_cost
-- across all parts in the BOM tree.
-- Your query here:


-- ============================================================
-- ANSWERS
-- ============================================================

-- Q1:
-- WITH RECURSIVE bom_tree AS (
--     SELECT part_id, part_name, parent_id, 0 AS level
--     FROM bom WHERE parent_id IS NULL
--     UNION ALL
--     SELECT b.part_id, b.part_name, b.parent_id, bt.level + 1
--     FROM bom b JOIN bom_tree bt ON b.parent_id = bt.part_id
-- )
-- SELECT level, part_name, parent_id FROM bom_tree ORDER BY level, part_name;

-- Q2:
-- WITH RECURSIVE bom_tree AS (
--     SELECT part_id, part_name, parent_id, 0 AS level, part_name::TEXT AS path
--     FROM bom WHERE parent_id IS NULL
--     UNION ALL
--     SELECT b.part_id, b.part_name, b.parent_id, bt.level + 1, bt.path || ' > ' || b.part_name
--     FROM bom b JOIN bom_tree bt ON b.parent_id = bt.part_id
-- )
-- SELECT level, REPEAT('  ', level) || part_name AS indented_name, path
-- FROM bom_tree ORDER BY path;

-- Q3:
-- WITH RECURSIVE spindle_tree AS (
--     SELECT part_id, part_name FROM bom WHERE part_name = 'Spindle Unit'
--     UNION ALL
--     SELECT b.part_id, b.part_name
--     FROM bom b JOIN spindle_tree st ON b.parent_id = st.part_id
-- )
-- SELECT * FROM spindle_tree;

-- Q4:
-- WITH RECURSIVE bom_tree AS (
--     SELECT part_id, part_name, parent_id, quantity, unit_cost
--     FROM bom WHERE parent_id IS NULL
--     UNION ALL
--     SELECT b.part_id, b.part_name, b.parent_id, b.quantity, b.unit_cost
--     FROM bom b JOIN bom_tree bt ON b.parent_id = bt.part_id
-- )
-- SELECT SUM(quantity * unit_cost) AS total_material_cost FROM bom_tree;
