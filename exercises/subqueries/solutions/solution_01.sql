-- ============================================================
-- Root Exercises – Subqueries
-- Solution 1: Nested Query Practice
-- ============================================================
-- Run the setup section from ../exercise_01.sql before these answers.

SELECT * FROM orders WHERE order_total > (SELECT AVG(order_total) FROM orders);
SELECT c.customer_name FROM customers AS c WHERE EXISTS (SELECT 1 FROM orders AS o WHERE o.customer_id = c.customer_id);
SELECT customer_name FROM customers WHERE customer_id = (SELECT customer_id FROM orders GROUP BY customer_id ORDER BY SUM(order_total) DESC LIMIT 1);
SELECT * FROM orders WHERE customer_id IN (SELECT customer_id FROM customers WHERE industry = 'Manufacturing');
SELECT o.* FROM orders AS o WHERE order_date = (SELECT MAX(o2.order_date) FROM orders AS o2 WHERE o2.customer_id = o.customer_id) ORDER BY o.customer_id;
