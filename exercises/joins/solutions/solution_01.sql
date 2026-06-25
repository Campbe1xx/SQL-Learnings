-- ============================================================
-- Root Exercises – Joins
-- Solution 1: Customers and Orders
-- ============================================================
-- Run the setup section from ../exercise_01.sql before these answers.

SELECT c.customer_name, o.order_id, o.order_total FROM customers AS c INNER JOIN orders AS o ON o.customer_id = c.customer_id;
SELECT c.customer_name, o.order_id, o.status FROM customers AS c LEFT JOIN orders AS o ON o.customer_id = c.customer_id ORDER BY c.customer_name, o.order_id;
SELECT c.customer_name FROM customers AS c LEFT JOIN orders AS o ON o.customer_id = c.customer_id WHERE o.order_id IS NULL;
SELECT c.customer_name, COUNT(o.order_id) AS order_count FROM customers AS c LEFT JOIN orders AS o ON o.customer_id = c.customer_id GROUP BY c.customer_name ORDER BY order_count DESC, c.customer_name;
SELECT c.customer_name, o.order_id, o.order_total FROM customers AS c JOIN orders AS o ON o.customer_id = c.customer_id WHERE o.status = 'Shipped';
