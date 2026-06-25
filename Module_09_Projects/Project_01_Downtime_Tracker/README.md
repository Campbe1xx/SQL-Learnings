# Project 01 — Equipment Downtime Tracker

## Objective
Build a database to track machine downtime incidents, calculate total and average downtime per machine, and identify your worst offenders.

## Skills Practiced
- CREATE TABLE, constraints, foreign keys
- INSERT, UPDATE, DELETE
- Aggregates, GROUP BY, HAVING
- JOINs, CTEs, Window Functions

## Steps
1. Run `schema.sql` to create the tables
2. Run `sample_data.sql` to load test data
3. Work through `queries.sql` — attempt each before reading the answer

## Extension Challenges
- Calculate MTBF (Mean Time Between Failures) per machine
- Add a trigger that flags a machine as 'Critical' when downtime exceeds 20hrs/month
- Build a monthly downtime trend report using window functions
