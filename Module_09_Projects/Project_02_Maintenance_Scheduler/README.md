# Project 02 — Preventive Maintenance Scheduler

## Objective
Build a system to schedule and track preventive maintenance tasks, flag overdue machines, and log completed work.

## Skills Practiced
- Schema design with foreign keys
- Date arithmetic and INTERVAL
- Stored procedures and triggers
- CTEs and conditional logic (CASE)

## Steps
1. Run `schema.sql`
2. Run `sample_data.sql`
3. Work through `queries.sql`

## Extension Challenges
- Write a stored procedure that auto-schedules the next maintenance 90 days after completion
- Add a trigger that sets machine status to 'Maintenance' when a task is opened
