-- ============================================================
-- PROJECT 05: Bill of Materials — Schema
-- ============================================================

CREATE TABLE bom (
    part_id     SERIAL PRIMARY KEY,
    part_name   VARCHAR(150) NOT NULL,
    parent_id   INT REFERENCES bom(part_id),
    quantity    INT DEFAULT 1,
    unit_cost   DECIMAL(10,2) DEFAULT 0
);
