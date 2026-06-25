-- ============================================================
-- PROJECT 01: Equipment Downtime Tracker
-- Schema
-- ============================================================

CREATE TABLE machines (
    machine_id    SERIAL PRIMARY KEY,
    machine_name  VARCHAR(100) NOT NULL,
    location      VARCHAR(100),
    status        VARCHAR(20) DEFAULT 'Active' CHECK (status IN ('Active','Inactive','Maintenance')),
    install_date  DATE,
    last_maintenance TIMESTAMP
);

CREATE TABLE operators (
    operator_id   SERIAL PRIMARY KEY,
    first_name    VARCHAR(50) NOT NULL,
    last_name     VARCHAR(50) NOT NULL,
    shift         VARCHAR(20) CHECK (shift IN ('Day','Night','Weekend'))
);

CREATE TABLE downtime_logs (
    log_id         SERIAL PRIMARY KEY,
    machine_id     INT NOT NULL REFERENCES machines(machine_id),
    operator_id    INT REFERENCES operators(operator_id),
    log_date       TIMESTAMP DEFAULT NOW(),
    downtime_hours DECIMAL(5,2) CHECK (downtime_hours >= 0),
    reason         TEXT,
    resolved       BOOLEAN DEFAULT FALSE
);

CREATE TABLE production_orders (
    order_id        SERIAL PRIMARY KEY,
    machine_id      INT NOT NULL REFERENCES machines(machine_id),
    operator_id     INT REFERENCES operators(operator_id),
    start_time      TIMESTAMP,
    end_time        TIMESTAMP,
    units_produced  INT CHECK (units_produced >= 0),
    shift           VARCHAR(20),
    defect_rate     DECIMAL(5,2) DEFAULT 0
);

CREATE INDEX idx_downtime_machine ON downtime_logs(machine_id);
CREATE INDEX idx_downtime_date    ON downtime_logs(log_date);
CREATE INDEX idx_orders_machine   ON production_orders(machine_id);
CREATE INDEX idx_orders_time      ON production_orders(start_time);
