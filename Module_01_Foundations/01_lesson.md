# Module 01 — Foundations & Core Concepts

## What is SQL?

SQL (Structured Query Language) is the standard language for interacting with **relational databases**. It allows you to store, retrieve, modify, and manage data in a structured way.

As an engineer in manufacturing, you'll use SQL to query things like:
- Machine downtime logs
- Production batch records
- Sensor readings and alarms
- Maintenance schedules
- Quality inspection results

---

## What is a Relational Database?

A relational database stores data in **tables** (like spreadsheets), where:
- Each **table** represents one type of entity (e.g., Machines, Operators)
- Each **row** is one record (e.g., one machine)
- Each **column** is one attribute (e.g., machine_name, location)
- Tables are **linked together** using keys

### Manufacturing Analogy
Think of a database like a set of structured log books in your facility:
- One book for machines
- One book for work orders
- One book for operators
- They all reference each other using IDs

---

## The 5 SQL Sub-Languages

| Sub-Language | Full Name | Purpose | Examples |
|---|---|---|---|
| **DQL** | Data Query Language | Read/retrieve data | `SELECT` |
| **DML** | Data Manipulation Language | Insert, update, delete data | `INSERT`, `UPDATE`, `DELETE` |
| **DDL** | Data Definition Language | Create/modify database structures | `CREATE`, `ALTER`, `DROP` |
| **DCL** | Data Control Language | Manage permissions | `GRANT`, `REVOKE` |
| **TCL** | Transaction Control Language | Manage transactions | `BEGIN`, `COMMIT`, `ROLLBACK` |

---

## Common Relational Database Systems (RDBMS)

| System | Common Use | Notes |
|---|---|---|
| **PostgreSQL** | Industry, analytics, engineering | Free, powerful, recommended for this course |
| **SQL Server** | Enterprise, Microsoft environments | Common in manufacturing/ERP systems |
| **MySQL** | Web applications | Free, widely used |
| **SQLite** | Embedded, lightweight | Great for learning, no server needed |
| **Oracle** | Large enterprise | Common in older industrial systems |

> 💡 This course uses **PostgreSQL syntax**. SQL Server differences are noted where relevant.

---

## Key Concepts: Tables, Rows, Columns

```
Table: machines

| machine_id | machine_name     | location    | status    | install_date |
|------------|-----------------|-------------|-----------|---------------|
| 1          | CNC Mill A       | Workshop 1  | Active    | 2018-03-15    |
| 2          | Assembly Robot B | Line 2      | Active    | 2020-07-22    |
| 3          | Conveyor C       | Line 1      | Inactive  | 2015-11-01    |
```

- **machine_id** = Primary Key (unique identifier for each row)
- Each row = one machine record
- Each column = one piece of information about that machine

---

## Primary Keys & Foreign Keys

### Primary Key
- Uniquely identifies each row in a table
- Cannot be NULL
- Example: `machine_id` in the `machines` table

### Foreign Key
- Links one table to another
- References the primary key of another table
- Example: `machine_id` in the `maintenance_logs` table references `machine_id` in `machines`

```
machines                    maintenance_logs
-----------                 -----------------
machine_id (PK) <---------- machine_id (FK)
machine_name                log_date
location                    work_performed
status                      technician
```

---

## SQL Data Types

### Numeric
| Type | Description | Example |
|---|---|---|
| `INT` / `INTEGER` | Whole numbers | 42, 1500 |
| `BIGINT` | Large whole numbers | 9999999 |
| `DECIMAL(p,s)` | Exact decimal | 98.75 |
| `FLOAT` / `REAL` | Approximate decimal | 3.14159 |

### Text
| Type | Description | Example |
|---|---|---|
| `VARCHAR(n)` | Variable length text, max n chars | 'CNC Mill A' |
| `CHAR(n)` | Fixed length text | 'AB' |
| `TEXT` | Unlimited length text | Long descriptions |

### Date & Time
| Type | Description | Example |
|---|---|---|
| `DATE` | Date only | '2024-03-15' |
| `TIME` | Time only | '08:30:00' |
| `TIMESTAMP` | Date and time | '2024-03-15 08:30:00' |
| `INTERVAL` | Duration | '2 hours' |

### Other
| Type | Description | Example |
|---|---|---|
| `BOOLEAN` | True/False | TRUE, FALSE |
| `SERIAL` | Auto-incrementing integer (PostgreSQL) | 1, 2, 3... |
| `UUID` | Universally unique identifier | 'a1b2c3...' |

---

## SQL Syntax Rules

1. SQL is **not case-sensitive** for keywords — but convention is UPPERCASE keywords
2. Statements end with a **semicolon** `;`
3. **String values** use single quotes: `'Active'`
4. **Comments** use `--` for single line or `/* */` for multi-line

```sql
-- This is a single line comment

/* This is a
   multi-line comment */

SELECT machine_name   -- selecting the name column
FROM machines;        -- from the machines table
```

---

## Summary

- SQL is the language for relational databases
- Data is stored in tables with rows and columns
- Tables link together using primary and foreign keys
- There are 5 sub-languages: DQL, DML, DDL, DCL, TCL
- Data types define what kind of data each column holds

---

## ✅ Next Step
Head to the [exercises folder](./exercises/ex01_identify_entities.md) and complete Exercise 1.
