-- ============================================================
-- PROJECT 02: Preventive Maintenance Scheduler — Schema
-- ============================================================

CREATE TABLE maintenance_tasks (
    task_id        SERIAL PRIMARY KEY,
    machine_id     INT NOT NULL REFERENCES machines(machine_id),
    task_name      VARCHAR(150) NOT NULL,
    frequency_days INT NOT NULL,
    last_done      DATE,
    next_due       DATE GENERATED ALWAYS AS (last_done + frequency_days * INTERVAL '1 day') STORED,
    assigned_to    VARCHAR(100),
    priority       VARCHAR(10) DEFAULT 'Medium' CHECK (priority IN ('Low','Medium','High','Critical'))
);

CREATE TABLE maintenance_completions (
    completion_id  SERIAL PRIMARY KEY,
    task_id        INT NOT NULL REFERENCES maintenance_tasks(task_id),
    completed_by   VARCHAR(100),
    completed_at   TIMESTAMP DEFAULT NOW(),
    notes          TEXT,
    hours_spent    DECIMAL(5,2)
);

CREATE INDEX idx_tasks_due ON maintenance_tasks(next_due);
CREATE INDEX idx_tasks_machine ON maintenance_tasks(machine_id);
