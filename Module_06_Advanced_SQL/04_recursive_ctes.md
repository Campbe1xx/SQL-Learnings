# Module 06 — Recursive CTEs

## Use Case: Bill of Materials (BOM) Tree

A recursive CTE calls itself to traverse hierarchical data — perfect for BOMs, org charts, or equipment hierarchies.

```sql
-- BOM table: each part may have a parent part
CREATE TABLE bom (
    part_id     INT PRIMARY KEY,
    part_name   VARCHAR(100),
    parent_id   INT REFERENCES bom(part_id),
    quantity    INT
);

-- Recursive CTE to traverse the full BOM tree
WITH RECURSIVE bom_tree AS (
    -- Anchor: start at top-level parts (no parent)
    SELECT part_id, part_name, parent_id, quantity, 0 AS level,
           part_name::TEXT AS path
    FROM bom
    WHERE parent_id IS NULL

    UNION ALL

    -- Recursive: join children to their parents
    SELECT b.part_id, b.part_name, b.parent_id, b.quantity,
           bt.level + 1,
           bt.path || ' > ' || b.part_name
    FROM bom b
    INNER JOIN bom_tree bt ON b.parent_id = bt.part_id
)
SELECT level,
       REPEAT('  ', level) || part_name AS indented_name,
       quantity,
       path
FROM bom_tree
ORDER BY path;
```
