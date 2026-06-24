# Exercise 01 — Identify Your Database Entities

## Objective
Before writing any SQL, think like a database designer. Identify the key **entities** (tables) and their **attributes** (columns) in a typical manufacturing facility.

---

## Task 1 — List the Entities

For each of the following areas in your facility, list what data you would want to track:

| Area | Entity (Table Name) | Key Attributes (Columns) |
|---|---|---|
| Equipment | `machines` | machine_id, name, location, status, install_date |
| Personnel | *(your answer)* | *(your answer)* |
| Maintenance | *(your answer)* | *(your answer)* |
| Production | *(your answer)* | *(your answer)* |
| Quality | *(your answer)* | *(your answer)* |
| Inventory | *(your answer)* | *(your answer)* |

---

## Task 2 — Identify Relationships

Draw or describe how these tables relate to each other. For example:
- One machine can have **many** maintenance logs → one-to-many
- One production order uses **one** machine → many-to-one

Describe at least **4 relationships** between your tables.

---

## Task 3 — Choose Data Types

For the `machines` table below, fill in the appropriate data type for each column:

| Column | Your Data Type Choice | Reasoning |
|---|---|---|
| machine_id | | |
| machine_name | | |
| location | | |
| status | | |
| install_date | | |
| hourly_rate_cost | | |
| is_critical | | |
| last_maintenance | | |

---

## ✅ Model Answer (expand after attempting)

<details>
<summary>Click to reveal</summary>

```
Personnel: operator_id (SERIAL), first_name (VARCHAR), last_name (VARCHAR), role (VARCHAR), shift (VARCHAR)
Maintenance: log_id (SERIAL), machine_id (INT FK), technician_id (INT FK), log_date (TIMESTAMP), work_done (TEXT), hours_spent (DECIMAL)
Production: order_id (SERIAL), machine_id (INT FK), operator_id (INT FK), start_time (TIMESTAMP), end_time (TIMESTAMP), units_produced (INT)
Quality: inspection_id (SERIAL), order_id (INT FK), inspector_id (INT FK), defects_found (INT), pass_fail (BOOLEAN)
Inventory: item_id (SERIAL), item_name (VARCHAR), quantity (INT), reorder_level (INT), unit_cost (DECIMAL)

Data Types for machines:
- machine_id: SERIAL (auto-increment integer)
- machine_name: VARCHAR(100)
- location: VARCHAR(100)
- status: VARCHAR(20)
- install_date: DATE
- hourly_rate_cost: DECIMAL(10,2)
- is_critical: BOOLEAN
- last_maintenance: TIMESTAMP
```
</details>

---

**When complete → move to [Module 02](../../Module_02_Reading_Data/01_select_where_order.md)**
