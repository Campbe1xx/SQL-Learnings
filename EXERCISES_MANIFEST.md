# PostgreSQL Exercise & Solution Manifest

**Last Updated:** 2026-06-25

## Overview
This document catalogs all exercise and solution packs across the PostgreSQL learning course. Each exercise includes setup, numbered questions, and optional challenges, with complete worked solutions.

---

## Module Exercises

### Module 01 – Foundations
- **exercise_01.sql** – Manufacturing Machines Basics
  - Q1: List all machines
  - Q2: List only active machines, ordered by installed_date
  - Q3: Count how many machines are in each location
  - Q4: What are the different machine types?
  - C1: Which location has the most machines?

- **exercise_02.sql** – Data Types and Constraints Reference
  - Q1: List all components and their data types
  - Q2: Show all components with a NOT NULL constraint
  - Q3: Which data type is used most often?
  - C1: Explain when to use NUMERIC vs FLOAT for sensor readings

### Module 02 – Reading Data
- **exercise_01.sql** – SELECT, WHERE, ORDER BY, and LIMIT
- **exercise_02.sql** – Aggregates, GROUP BY, and HAVING
- **exercise_03.sql** – JOIN Patterns
- **exercise_04.sql** – Subqueries and CTEs
- **exercise_05.sql** – Window Functions

### Module 03 – Writing Data
- **exercise_01.sql** – INSERT, UPDATE, DELETE, and Bulk Operations

### Module 04 – Building Structures
- **exercise_01.sql** – CREATE, ALTER, DROP, and Indexes

### Module 05 – Transactions
- **exercise_01.sql** – ACID, COMMIT, ROLLBACK, SAVEPOINT, and Isolation
  - Q1: Transaction that transfers units between stock
  - Q2: Transaction with intentional ROLLBACK on error
  - Q3: SAVEPOINT and partial rollback example
  - Q4: READ COMMITTED isolation level demonstration
  - C1: Atomic debit + audit log transaction

### Module 06 – Advanced SQL
- **exercise_01.sql** – Views and Materialized Views
- **exercise_02.sql** – Stored Procedures and Functions
- **exercise_03.sql** – Triggers (BEFORE INSERT, AFTER UPDATE, BEFORE DELETE)
- **exercise_04.sql** – Recursive CTEs (BOM tree traversal)

### Module 07 – Performance
- **exercise_01.sql** – EXPLAIN, Indexes, and Query Rewrites
  - Q1: EXPLAIN on basic SELECT
  - Q2: EXPLAIN ANALYZE on filtered query
  - Q3: Index creation and re-analysis
  - Q4: Correlated subquery rewrite as JOIN
  - Q5: Partial indexes for anomalies
  - C1: Leading wildcards vs prefix search

### Module 08 – Security
- **exercise_01.sql** – Roles, Permissions, Injection Prevention, and RLS
  - Q1: CREATE ROLE with SELECT grants
  - Q2: CREATE USER and grant role
  - Q3: REVOKE INSERT on table
  - Q4: SQL injection vulnerability vs parameterized queries
  - Q5: Row Level Security policy
  - C1: Audit roles and privileges

### Module 09 – Projects (Capstone)
- **exercise_01.sql** – Downtime and OEE Capstone
  - Q1: Monthly downtime per machine with window functions
  - Q2: Find machines exceeding 3-month downtime average
  - Q3: Top 3 downtime causes with percentage
  - Q4: CREATE VIEW for OEE metrics
  - Q5: Atomic transaction for downtime event + status update
  - C1: Recursive CTE for machine dependency tree & cascade risks

---

## Root Practice Packs

### Basics
- **exercises/basics/exercise_01.sql** – Beginner SELECT Practice
  - Q1: List all products
  - Q2: Show product_name and unit_price only
  - Q3: Return products where in_stock is TRUE
  - Q4: Order products by unit_price (highest first)
  - Q5: Return the first 3 rows only

### Aggregations
- **exercises/aggregations/exercise_01.sql** – Aggregate Queries
  - Q1: Count total sales rows
  - Q2: Sum sale_value by sales_region
  - Q3: Calculate average quantity per product_name
  - Q4: Show minimum and maximum sale_value
  - Q5: Return only regions with total sale_value > 500

### Joins
- **exercises/joins/exercise_01.sql** – Customers and Orders
  - Q1: INNER JOIN customers to orders
  - Q2: LEFT JOIN customers to orders
  - Q3: Show customers without orders
  - Q4: Count orders per customer
  - Q5: Show only shipped orders with customer name

### Subqueries
- **exercises/subqueries/exercise_01.sql** – Nested Query Practice
  - Q1: Find orders above average order_total
  - Q2: List customers with at least one order using EXISTS
  - Q3: Find customer with highest total order value
  - Q4: Show orders by Manufacturing industry customers
  - Q5: Correlated subquery for each customer's latest order

### Window Functions
- **exercises/window-functions/exercise_01.sql** – Ranking and Running Totals
  - Q1: Use ROW_NUMBER within teams by day
  - Q2: Rank teams by units_completed per day
  - Q3: Show previous day's units_completed using LAG
  - Q4: Show total units_completed per team on every row
  - Q5: Calculate running total of units_completed per team

---

## Theme & Domain

All exercises use a **consistent manufacturing/engineering theme** with realistic tables and scenarios:
- **Machines** – CNC mills, laser cutters, robots, hydraulic presses, etc.
- **Production Runs** – units produced, defects, cycle times
- **Downtime Events** – mechanical, electrical, setup issues with timestamps
- **Spare Parts** – inventory management with reorder levels
- **Technicians** – work order assignments and expertise areas
- **Sensors** – telemetry, anomaly detection
- **BOM Components** – bill of materials with hierarchical relationships

---

## File Structure

```
Module_XX_Name/
├── exercises/
│   ├── exercise_01.sql
│   ├── exercise_02.sql
│   └── ...
└── solutions/
    ├── solution_01.sql
    ├── solution_02.sql
    └── ...

exercises/
├── basics/
│   ├── exercise_01.sql
│   └── solutions/
│       └── solution_01.sql
├── aggregations/
│   ├── exercise_01.sql
│   └── solutions/
│       └── solution_01.sql
├── joins/
├── subqueries/
└── window-functions/
```

---

## How to Use

1. **For learners:** Navigate to any exercise file and complete the questions using the provided setup section.
2. **For instructors:** Reference the solutions directory for answer keys and explanations.
3. **For practice:** Start with `exercises/basics/` and progress through root packs, then explore specific modules.
4. **For review:** Each exercise includes comments explaining the setup and question intent.

---

## PostgreSQL Features Covered

- ✅ Basic queries: SELECT, WHERE, ORDER BY, LIMIT
- ✅ Aggregation: SUM, COUNT, AVG, MIN, MAX, GROUP BY, HAVING
- ✅ JOINs: INNER, LEFT, RIGHT, SELF, and unmatched records
- ✅ Subqueries: non-correlated, correlated, EXISTS, IN
- ✅ CTEs: Common Table Expressions, nested CTEs
- ✅ Window Functions: ROW_NUMBER, RANK, DENSE_RANK, LAG, LEAD, SUM OVER, running totals
- ✅ DML: INSERT, UPDATE, DELETE, bulk operations
- ✅ DDL: CREATE TABLE, ALTER TABLE, DROP, indexes, constraints
- ✅ Transactions: BEGIN, COMMIT, ROLLBACK, SAVEPOINT, isolation levels
- ✅ Views: regular and materialized views
- ✅ Procedures & Functions: PL/pgSQL stored procedures and functions
- ✅ Triggers: BEFORE INSERT, AFTER UPDATE, BEFORE DELETE
- ✅ Recursive CTEs: hierarchical queries and tree traversal
- ✅ Performance: EXPLAIN, EXPLAIN ANALYZE, index strategies
- ✅ Security: roles, permissions, RLS policies, SQL injection prevention
- ✅ Advanced patterns: OEE calculations, capstone projects

---

## Statistics

- **Total Exercise Files:** 20
- **Total Solution Files:** 20
- **Total Questions:** 100+
- **Total Challenge Questions:** 15+
- **Module Coverage:** 9/9 modules (100%)
- **Root Practice Packs:** 5/5 topics (100%)

---

*All exercises are PostgreSQL-compatible and ready for production learning environments.*
