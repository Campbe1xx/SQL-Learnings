-- ============================================================
-- PROJECT 05: BOM Tree Queries
-- ============================================================

-- QUERY 1: Full BOM tree with indentation
WITH RECURSIVE bom_tree AS (
    SELECT part_id, part_name, parent_id, quantity, unit_cost,
           0 AS level,
           part_name::TEXT AS path
    FROM bom
    WHERE parent_id IS NULL

    UNION ALL

    SELECT b.part_id, b.part_name, b.parent_id, b.quantity, b.unit_cost,
           bt.level + 1,
           bt.path || ' > ' || b.part_name
    FROM bom b
    JOIN bom_tree bt ON b.parent_id = bt.part_id
)
SELECT level,
       REPEAT('    ', level) || part_name AS indented_part,
       quantity,
       unit_cost,
       path
FROM bom_tree
ORDER BY path;

-- QUERY 2: Total direct cost per top-level assembly
WITH RECURSIVE bom_tree AS (
    SELECT part_id, part_name, parent_id, quantity, unit_cost
    FROM bom WHERE parent_id IS NULL
    UNION ALL
    SELECT b.part_id, b.part_name, b.parent_id, b.quantity, b.unit_cost
    FROM bom b
    JOIN bom_tree bt ON b.parent_id = bt.part_id
)
SELECT SUM(quantity * unit_cost) AS total_material_cost
FROM bom_tree;

-- QUERY 3: All leaf parts (no children)
SELECT b.part_id, b.part_name, b.unit_cost
FROM bom b
WHERE b.part_id NOT IN (SELECT DISTINCT parent_id FROM bom WHERE parent_id IS NOT NULL)
ORDER BY b.part_name;
