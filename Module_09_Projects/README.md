# Module 09: Projects

Welcome to **Module 09: Projects**.

## Learning Objectives
- Build an end-to-end SQL solution
- Combine querying, modeling, performance, and security
- Deliver a production-style capstone

## Capstone Overview
In this final module, you will design and implement a mini manufacturing analytics system using everything from Modules 01–08.

## Suggested Project Scope
Build a solution that includes:
1. **Schema** for machines, work orders, production events, downtime events, and quality checks
2. **Data loading** scripts (`INSERT` + optional bulk patterns)
3. **Analytics queries** for KPI tracking
4. **Performance tuning** for at least one heavy report
5. **Security model** with role separation and optional RLS

## Required Deliverables

### 1) Data Model
- ER-style table design with keys/constraints
- At least 5 related tables

### 2) Core Query Set
Include queries for:
- Overall Equipment Effectiveness-style proxies (availability/performance/quality indicators)
- Top downtime causes
- Defect rate by product line
- On-time completion for work orders

### 3) Advanced SQL Component
At least one of:
- View layer for dashboards
- Stored function/procedure
- Trigger-based audit table
- Recursive CTE for multi-level part hierarchy

### 4) Performance Evidence
- Before/after comparison using `EXPLAIN ANALYZE`
- At least one index decision explained

### 5) Security Controls
- Separate roles for read-only analyst and ETL writer
- Demonstrate least privilege
- Optional RLS policy by plant/site

## Suggested Project Workflow
1. Define requirements and KPIs
2. Create schema with constraints
3. Load representative seed data
4. Build core analytical queries
5. Add advanced SQL features
6. Optimize one slow query
7. Add security roles/policies
8. Document assumptions and tradeoffs

## Evaluation Rubric (Self-Check)
- Correctness: queries return expected results
- Clarity: SQL is readable and modular
- Robustness: constraints and transactions protect integrity
- Performance: evidence-based tuning
- Security: least privilege and safe query practices

## Knowledge Check
1. Which module skill area was most critical to your project success, and why?
2. What tradeoff did you make between normalization and query simplicity?
3. What would you improve for a production rollout?

## Next Step
Publish your capstone artifacts and link them from your repo home page for portfolio visibility.

## Lesson Links
- [Open Module Exercise Page](../modules/module-09.html)

## Next Step
Return to the [Course Home](../index.html).
