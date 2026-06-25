-- ============================================================
-- Root Exercises – Basics
-- Solution 1: Beginner SELECT Practice
-- ============================================================
-- Run the setup section from ../exercise_01.sql before these answers.

SELECT * FROM products;
SELECT product_name, unit_price FROM products;
SELECT * FROM products WHERE in_stock = TRUE;
SELECT product_name, unit_price FROM products ORDER BY unit_price DESC;
SELECT * FROM products ORDER BY product_id LIMIT 3;
