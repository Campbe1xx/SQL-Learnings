-- ============================================================
-- PROJECT 04: Quality & Defect Log — Schema
-- ============================================================
-- Requires machines and production_orders from Project 01.

CREATE TABLE quality_inspections (
    inspection_id  SERIAL PRIMARY KEY,
    order_id       INT NOT NULL REFERENCES production_orders(order_id),
    inspector_name VARCHAR(100),
    inspected_at   TIMESTAMP DEFAULT NOW(),
    units_checked  INT NOT NULL,
    defects_found  INT DEFAULT 0 CHECK (defects_found >= 0),
    pass_fail      BOOLEAN GENERATED ALWAYS AS (defects_found::DECIMAL / NULLIF(units_checked,0) < 0.05) STORED,
    notes          TEXT
);

CREATE INDEX idx_quality_order ON quality_inspections(order_id);
