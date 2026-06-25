# Module 08: Security

Welcome to **Module 08: Security**.

## Learning Objectives
- Manage roles and permissions
- Enforce row-level security
- Apply SQL injection prevention practices

## Introduction
Database security protects sensitive operational and business data. Security should be enforced at multiple layers: SQL permissions, row-level controls, and safe query construction.

## 1) Roles and Privileges
Create least-privilege roles.

```sql
CREATE ROLE reporting_user LOGIN PASSWORD 'replace_me';
GRANT CONNECT ON DATABASE manufacturing TO reporting_user;
GRANT USAGE ON SCHEMA public TO reporting_user;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO reporting_user;
```

Avoid granting write access unless required.

## 2) Principle of Least Privilege
Each account should have only the minimum permissions needed.

Examples:
- dashboard service account: `SELECT` only
- ETL account: scoped `INSERT`/`UPDATE`
- admin account: tightly controlled and audited

## 3) Row-Level Security (RLS)
RLS restricts which rows a role can read/write.

```sql
ALTER TABLE work_orders ENABLE ROW LEVEL SECURITY;

CREATE POLICY plant_scope_policy
ON work_orders
USING (plant_id = current_setting('app.current_plant_id')::INTEGER);
```

This is powerful for multi-plant isolation.

## 4) SQL Injection Prevention
Never concatenate raw user input into SQL strings.

Use parameterized queries from application code.

Bad pattern (conceptual):
- dynamic SQL string concatenation with user text

Good pattern:
- prepared statements / bound parameters

## 5) Auditing and Monitoring
Track who did what and when:
- login activity
- schema changes
- privilege changes
- critical table writes

## Common Security Mistakes
- Using shared admin credentials
- Overbroad grants (`GRANT ALL` widely)
- Missing rotation policies for secrets
- Trusting input validation only in frontend

## Knowledge Check
1. Why is least privilege essential?
2. What does RLS protect against that table-level grants do not?
3. How do parameterized queries reduce injection risk?

## Try It Yourself
- Create read-only and read-write roles with separate privileges
- Enable RLS for one table and test policy behavior
- Review one application query path for injection risks

## Lesson Links
- [Open Module Exercise Page](../modules/module-08.html)

## Next Step
Continue to [Module 09: Projects](../Module_09_Projects/README.md).
