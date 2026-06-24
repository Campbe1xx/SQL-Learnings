# Module 02 — Lesson 03: JOINs

## Why JOINs?

Data is split across multiple tables to avoid repetition. JOINs combine rows from two or more tables based on a related column.

---

## Sample Tables Used in This Lesson

```
machines                    production_orders
----------                  ------------------
machine_id (PK)             order_id (PK)
machine_name                machine_id (FK) --> machines.machine_id
location                    operator_id (FK)
status                      start_time
                            units_produced

operators
----------
operator_id (PK)
first_name
last_name
shift
```

---

## INNER JOIN

Returns only rows where there is a match in BOTH tables.

```sql
-- Get production orders with machine names
SELECT po.order_id,
       m.machine_name,
       po.units_produced,
       po.start_time
FROM production_orders po
INNER JOIN machines m ON po.machine_id = m.machine_id;
```

---

## LEFT JOIN (LEFT OUTER JOIN)

Returns ALL rows from the left table, and matched rows from the right. Unmatched right rows return NULL.

```sql
-- All machines, even those with no production orders
SELECT m.machine_name,
       m.status,
       po.order_id,
       po.units_produced
FROM machines m
LEFT JOIN production_orders po ON m.machine_id = po.machine_id;

-- Find machines with NO production orders at all
SELECT m.machine_name
FROM machines m
LEFT JOIN production_orders po ON m.machine_id = po.machine_id
WHERE po.order_id IS NULL;
```

---

## RIGHT JOIN (RIGHT OUTER JOIN)

Returns ALL rows from the right table, matched rows from the left.

```sql
-- All operators, even those not assigned to any order
SELECT o.first_name, o.last_name, po.order_id
FROM production_orders po
RIGHT JOIN operators o ON po.operator_id = o.operator_id;
```

> 💡 RIGHT JOINs can always be rewritten as LEFT JOINs by swapping table order. LEFT JOIN is more commonly used.

---

## FULL OUTER JOIN

Returns ALL rows from both tables. NULLs appear where there is no match.

```sql
SELECT m.machine_name, po.order_id
FROM machines m
FULL OUTER JOIN production_orders po ON m.machine_id = po.machine_id;
```

---

## SELF JOIN

A table joined to itself. Useful for hierarchical data.

```sql
-- Find operators on the same shift
SELECT a.first_name AS operator1,
       b.first_name AS operator2,
       a.shift
FROM operators a
INNER JOIN operators b ON a.shift = b.shift AND a.operator_id < b.operator_id;
```

---

## CROSS JOIN

Returns every combination of rows from both tables (Cartesian product).

```sql
-- Every possible machine-operator pairing
SELECT m.machine_name, o.first_name
FROM machines m
CROSS JOIN operators o;
```

---

## Multi-Table JOIN

```sql
-- Full production report: order + machine + operator
SELECT po.order_id,
       m.machine_name,
       o.first_name || ' ' || o.last_name AS operator_name,
       po.units_produced,
       po.start_time
FROM production_orders po
INNER JOIN machines m ON po.machine_id = m.machine_id
INNER JOIN operators o ON po.operator_id = o.operator_id
ORDER BY po.start_time DESC;
```

---

## JOIN Summary

| JOIN Type | Returns |
|---|---|
| `INNER JOIN` | Only matching rows in both tables |
| `LEFT JOIN` | All left rows + matching right rows |
| `RIGHT JOIN` | All right rows + matching left rows |
| `FULL OUTER JOIN` | All rows from both tables |
| `SELF JOIN` | Rows from same table matched to itself |
| `CROSS JOIN` | Every combination (use carefully!) |

---

## ✅ Next Step
Proceed to [Lesson 04 — Subqueries & CTEs](./04_subqueries_ctes.md)
