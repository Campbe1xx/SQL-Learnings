# 📘 SQL for Engineers — Manufacturing Edition

> A complete, self-paced SQL course built for Electrical & Computer Engineers working in manufacturing and industrial environments.

---

## 🎯 Course Goal

By the end of this course you will be fully capable of:
- Designing and building relational databases
- Writing queries from basic to advanced
- Optimising query performance
- Securing and administering a database
- Applying SQL to real manufacturing problems (downtime, maintenance, production, quality, BOM)

---

## 🚀 Quick Start

### 👉 **[📚 Go to Exercises Hub](./EXERCISES.md)** ← Start here for all practice exercises!

Or explore specific areas:
- **[Root Practice Packs](./EXERCISES.md#-root-practice-packs-start-here--no-prerequisites)** — 5 standalone topics for beginners
- **[Module Exercises](./EXERCISES.md#-module-exercises-follow-the-course-path)** — 15 exercises across 9 modules
- **[Learning Paths](./EXERCISES.md#-suggested-learning-paths)** — 3 curated paths (Beginner, Fast Track, Topic-Focused)

---

## 🗂️ Course Structure

| Module | Topic | Difficulty | Exercises |
|--------|-------|------------|-----------|
| [Module 01](./Module_01_Foundations/) | Foundations & Core Concepts | 🟢 Beginner | [2 exercises](./EXERCISES.md#module-01--foundations-) |
| [Module 02](./Module_02_Reading_Data/) | Reading Data (DQL) | 🟢 Beginner → 🟡 Intermediate | [5 exercises](./EXERCISES.md#module-02--reading-data-) |
| [Module 03](./Module_03_Writing_Data/) | Writing & Modifying Data (DML) | 🟢 Beginner | [1 exercise](./EXERCISES.md#module-03--writing-data-) |
| [Module 04](./Module_04_Building_Structures/) | Building Structures (DDL) | 🟡 Intermediate | [1 exercise](./EXERCISES.md#module-04--building-structures-) |
| [Module 05](./Module_05_Transactions/) | Transactions & Data Integrity | 🟡 Intermediate | [1 exercise](./EXERCISES.md#module-05--transactions-) |
| [Module 06](./Module_06_Advanced_SQL/) | Advanced SQL | 🔴 Advanced | [4 exercises](./EXERCISES.md#module-06--advanced-sql-) |
| [Module 07](./Module_07_Performance/) | Performance & Optimisation | 🔴 Advanced | [1 exercise](./EXERCISES.md#module-07--performance-) |
| [Module 08](./Module_08_Security/) | Security & Permissions | 🟡 Intermediate | [1 exercise](./EXERCISES.md#module-08--security-) |
| [Module 09](./Module_09_Projects/) | Real-World Manufacturing Projects | 🔴 Advanced | [1 exercise (capstone)](./EXERCISES.md#module-09--projects-) |

**📊 Total:** 20 exercises + 5 root packs = **100+ questions across all difficulty levels**

---

## 🛠️ Recommended Tools

| Tool | Purpose | Link |
|------|---------|-------|
| **PostgreSQL** | Primary database engine (free) | https://www.postgresql.org |
| **pgAdmin 4** | GUI for PostgreSQL | https://www.pgadmin.org |
| **DBeaver** | Universal SQL GUI | https://dbeaver.io |
| **DB Fiddle** | Browser-based SQL practice | https://www.db-fiddle.com |
| **SQLiteOnline** | Zero-install quick practice | https://sqliteonline.com |

---

## 📋 Progress Checklist

```
ROOT PRACTICE PACKS
 [ ] Basics – Beginner SELECT Practice
 [ ] Aggregations – GROUP BY & HAVING
 [ ] Joins – INNER, LEFT, relationships
 [ ] Subqueries – Nested queries & EXISTS
 [ ] Window Functions – Ranking & running totals

MODULE 1 — FOUNDATIONS
 [ ] Understand what a relational database is
 [ ] Know the 5 SQL sub-languages (DQL/DML/DDL/DCL/TCL)
 [ ] Understand data types and constraints
 [ ] Complete Exercise 1
 [ ] Complete Exercise 2

MODULE 2 — READING DATA
 [ ] SELECT / WHERE / ORDER BY / LIMIT
 [ ] Aggregates + GROUP BY + HAVING
 [ ] All JOIN types (INNER, LEFT, RIGHT, FULL, SELF, CROSS)
 [ ] Subqueries (correlated + non-correlated)
 [ ] CTEs (WITH clause)
 [ ] Window Functions (ROW_NUMBER, RANK, LAG, LEAD, PARTITION BY)
 [ ] Complete Exercises 1–5

MODULE 3 — WRITING DATA
 [ ] INSERT / UPDATE / DELETE safely
 [ ] Bulk operations
 [ ] Complete Exercise 1

MODULE 4 — BUILDING STRUCTURES
 [ ] CREATE / ALTER / DROP tables
 [ ] Constraints and indexes
 [ ] Complete Exercise 1

MODULE 5 — TRANSACTIONS
 [ ] ACID properties
 [ ] BEGIN / COMMIT / ROLLBACK / SAVEPOINT
 [ ] Isolation levels
 [ ] Complete Exercise 1

MODULE 6 — ADVANCED SQL
 [ ] Views and Materialized Views
 [ ] Stored Procedures and Functions
 [ ] Triggers
 [ ] Recursive CTEs
 [ ] PIVOT / UNPIVOT
 [ ] Complete Exercises 1–4

MODULE 7 — PERFORMANCE
 [ ] Read execution plans (EXPLAIN / EXPLAIN ANALYZE)
 [ ] Index optimisation strategies
 [ ] Query rewrites for performance
 [ ] Complete Exercise 1

MODULE 8 — SECURITY
 [ ] Users, Roles, and Permissions
 [ ] GRANT / REVOKE
 [ ] SQL Injection prevention
 [ ] Row-Level Security (RLS)
 [ ] Complete Exercise 1

MODULE 9 — PROJECTS
 [ ] Equipment Downtime Tracker
 [ ] OEE (Overall Equipment Effectiveness) metrics
 [ ] Machine dependency trees
 [ ] Complete Capstone Exercise 1
```

---

## 📖 Recommended Reading

- **"Learning SQL" by Alan Beaulieu** — Best structured book for engineers
- **Mode Analytics SQL Tutorial** — https://mode.com/sql-tutorial
- **PostgreSQL Documentation** — https://www.postgresql.org/docs
- **Use The Index, Luke** (indexing guide) — https://use-the-index-luke.com

---

## 💡 How to Use This Course

1. **Start with the [Exercises Hub](./EXERCISES.md)** — Choose your learning path
2. **Pick a beginner exercise** — Try [exercises/basics/](./exercises/basics/) if brand new
3. **Work through modules in order** — Each builds on the last
4. **Read the lesson `.md` file first** (if available)
5. **Open the `.sql` exercise file** in your SQL tool and run it line by line
6. **Attempt the challenge questions** before looking at answers
7. **Review the solutions** and understand the approach
8. **Complete all 5 projects in Module 09** to consolidate everything

---

## 📚 Repository Contents

```
.
├── README.md                           ← You are here
├── EXERCISES.md                        ← 🎓 Exercise hub (all 20 exercises)
├── EXERCISES_MANIFEST.md               ← Detailed exercise descriptions
├── exercises/                          ← Root practice packs (5 topics)
│   ├── basics/
│   ├── aggregations/
│   ├── joins/
│   ├── subqueries/
│   └── window-functions/
├── Module_01_Foundations/              ← 9 course modules
├── Module_02_Reading_Data/
├── Module_03_Writing_Data/
├── Module_04_Building_Structures/
├── Module_05_Transactions/
├── Module_06_Advanced_SQL/
├── Module_07_Performance/
├── Module_08_Security/
└── Module_09_Projects/
```

---

## 🎓 What You'll Learn

### Data Retrieval (Modules 1–2)
- `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- `SUM()`, `COUNT()`, `AVG()`, `MIN()`, `MAX()`
- `GROUP BY`, `HAVING`
- `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `SELF JOIN`
- Subqueries & correlated subqueries
- Common Table Expressions (CTEs)
- Window functions: `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `LAG()`, `LEAD()`

### Data Modification (Module 3)
- `INSERT` (single & bulk)
- `UPDATE` (conditional)
- `DELETE` (safe practices)

### Database Design (Modules 4–5)
- `CREATE TABLE` with constraints
- `ALTER TABLE`
- Primary keys, foreign keys, unique constraints, check constraints
- Indexes & performance optimization
- Transactions: `BEGIN`, `COMMIT`, `ROLLBACK`, `SAVEPOINT`
- ACID properties & isolation levels

### Advanced Patterns (Modules 6–9)
- `CREATE VIEW` & materialized views
- Stored procedures & functions (`PL/pgSQL`)
- Triggers (BEFORE/AFTER INSERT/UPDATE/DELETE)
- Recursive CTEs for hierarchical data
- EXPLAIN & query optimization
- Security: roles, permissions, RLS, SQL injection prevention
- Real-world manufacturing projects

---

## 🏭 Manufacturing Theme

All exercises use a **consistent manufacturing domain**:
- **Machines** — CNC mills, laser cutters, robots, hydraulic presses
- **Production Runs** — units produced, defects, quality tracking
- **Downtime Events** — mechanical/electrical issues, root cause analysis
- **Spare Parts** — inventory, reorder levels, supplier management
- **Technicians** — work orders, skill areas, assignments
- **Sensors** — telemetry, anomaly detection
- **BOM Components** — bill of materials, hierarchical structures

This makes exercises **relevant to real manufacturing operations** while teaching core SQL concepts.

---

## ✅ Exercise Statistics

- **20 exercise files** across 9 modules + 5 root packs
- **20 solution files** with complete worked answers
- **100+ SQL questions** (beginner → advanced)
- **15+ challenge questions** for deeper learning
- **0 prerequisites** for root packs
- **100% PostgreSQL compatible**

---

## 🤝 Contributing

Found an issue or have a suggestion? Open an issue or submit a pull request!

---

*Built for: Electrical & Computer Engineers in Manufacturing | SQL Dialect: PostgreSQL (with SQL Server notes where relevant)*

**Happy learning! 🚀**
