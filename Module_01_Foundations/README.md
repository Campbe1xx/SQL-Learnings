# Module 01: Foundations

Welcome to **Module 01: Foundations**.

## Learning Objectives
- Understand relational database fundamentals
- Identify core SQL concepts and terminology
- Prepare your environment for hands-on querying

## Why SQL and Relational Databases Matter
Structured Query Language (SQL) is the standard way to work with relational databases. A relational database stores data in **tables** (rows and columns), and relationships between tables are defined through keys.

In a manufacturing setting, SQL helps answer questions like:
- Which machine had the most downtime this week?
- Which supplier has the highest defect rate?
- Which shift produced the highest output per hour?

## Core Concepts You Must Know

### 1) Tables, Rows, and Columns
- **Table**: A collection of related data (e.g., `machines`, `work_orders`)
- **Row**: One record (e.g., one machine)
- **Column**: One attribute (e.g., `machine_id`, `machine_name`)

### 2) Primary Keys and Foreign Keys
- **Primary Key (PK)**: Uniquely identifies each row in a table
- **Foreign Key (FK)**: Connects one table to another by referencing a PK

Example relationship:
- `machines.machine_id` (PK)
- `downtime_events.machine_id` (FK)

This lets you connect downtime events back to the machine that caused them.

### 3) Data Types
Common SQL types you’ll use:
- `INTEGER` → whole numbers
- `NUMERIC` / `DECIMAL` → precise decimals (good for cost, measurements)
- `TEXT` / `VARCHAR` → strings
- `DATE` / `TIMESTAMP` → dates and date-times
- `BOOLEAN` → true/false

Choose data types carefully to improve accuracy and performance.

## SQL Command Categories
You’ll see SQL split into categories:
- **DQL** (Data Query Language): `SELECT`
- **DML** (Data Manipulation Language): `INSERT`, `UPDATE`, `DELETE`
- **DDL** (Data Definition Language): `CREATE`, `ALTER`, `DROP`
- **DCL/TCL**: privileges and transaction control (`GRANT`, `COMMIT`, `ROLLBACK`)

You’ll learn each category in later modules.

## PostgreSQL Setup Checklist
Before continuing:
1. Install PostgreSQL
2. Create or access a test database
3. Open a SQL client (psql, DBeaver, pgAdmin, etc.)
4. Confirm you can run:

```sql
SELECT version();
```

## Sample Foundation Query
Even in fundamentals, you can run a simple query:

```sql
SELECT 'SQL is ready for manufacturing analytics' AS message;
```

## Common Beginner Mistakes
- Mixing up **single quotes** (text) vs **double quotes** (identifiers)
- Forgetting semicolons in certain tools
- Not understanding nulls (`NULL`) vs empty strings (`''`)
- Skipping schema design and jumping straight to complex queries

## Knowledge Check
1. What is the difference between a primary key and a foreign key?
2. Why might `NUMERIC` be better than `INTEGER` for production yield percentages?
3. Which SQL category does `SELECT` belong to?

## Try It Yourself
- Create a table named `production_lines` with columns:
  - `line_id` (integer primary key)
  - `line_name` (text)
  - `is_active` (boolean)
- Insert two example rows.

## Lesson Links
- [Open Module Exercise Page](../modules/module-01.html)
- [Practice: Basics](../practice/basics.html)

## Next Step
Continue to [Module 02: Reading Data](../Module_02_Reading_Data/README.md).
