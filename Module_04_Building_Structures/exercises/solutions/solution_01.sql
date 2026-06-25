-- ============================================================
-- Module 04 – Building Structures
-- Solution 1: CREATE, ALTER, DROP, and Indexes
-- ============================================================
-- Run the setup section from ../exercise_01.sql before these answers.

-- Q1
CREATE TABLE sensors (
    sensor_id SERIAL PRIMARY KEY,
    machine_id INT NOT NULL REFERENCES machines (machine_id),
    sensor_type VARCHAR(50) NOT NULL,
    unit VARCHAR(20) NOT NULL,
    min_value NUMERIC(10,2) NOT NULL,
    max_value NUMERIC(10,2) NOT NULL,
    installed_date DATE NOT NULL,
    CHECK (min_value >= 0),
    CHECK (max_value >= 0)
);

-- Q2
ALTER TABLE sensors
ADD COLUMN calibration_date DATE;

-- Q3
ALTER TABLE sensors
ADD CONSTRAINT sensors_min_lt_max_chk CHECK (min_value < max_value);

-- Q4
CREATE INDEX idx_sensors_machine_id
    ON sensors (machine_id);

-- Q5
DROP INDEX IF EXISTS idx_sensors_machine_id;

CREATE INDEX idx_sensors_machine_type
    ON sensors (machine_id, sensor_type);

-- C1
ALTER TABLE sensors
RENAME TO machine_sensors;

ALTER TABLE machine_sensors
RENAME COLUMN sensor_type TO sensor_category;
