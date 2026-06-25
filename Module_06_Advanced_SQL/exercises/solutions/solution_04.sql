-- ============================================================
-- Module 06 – Advanced SQL
-- Solution 4: Recursive CTEs
-- ============================================================
-- Run the setup section from ../exercise_04.sql before these answers.

-- Q1
WITH RECURSIVE bom_tree AS (
    SELECT component_id,
           parent_component_id,
           component_name,
           quantity,
           level,
           component_name::TEXT AS path
    FROM bom_components
    WHERE parent_component_id IS NULL

    UNION ALL

    SELECT child.component_id,
           child.parent_component_id,
           child.component_name,
           child.quantity,
           child.level,
           bom_tree.path || ' > ' || child.component_name
    FROM bom_components AS child
    JOIN bom_tree
        ON child.parent_component_id = bom_tree.component_id
)
SELECT *
FROM bom_tree
ORDER BY path;

-- Q2
WITH RECURSIVE bom_tree AS (
    SELECT component_id,
           parent_component_id,
           component_name,
           quantity,
           level
    FROM bom_components
    WHERE parent_component_id IS NULL

    UNION ALL

    SELECT child.component_id,
           child.parent_component_id,
           child.component_name,
           child.quantity,
           child.level
    FROM bom_components AS child
    JOIN bom_tree
        ON child.parent_component_id = bom_tree.component_id
)
SELECT level, SUM(quantity) AS total_quantity
FROM bom_tree
GROUP BY level
ORDER BY level;

-- Q3
SELECT bc.component_id, bc.component_name, bc.level
FROM bom_components AS bc
LEFT JOIN bom_components AS child
    ON child.parent_component_id = bc.component_id
WHERE child.component_id IS NULL
ORDER BY bc.level, bc.component_name;
