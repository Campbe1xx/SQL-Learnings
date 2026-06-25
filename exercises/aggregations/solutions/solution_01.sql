-- ============================================================
-- Root Exercises – Aggregations
-- Solution 1: Aggregate Queries
-- ============================================================
-- Run the setup section from ../exercise_01.sql before these answers.

SELECT COUNT(*) AS total_sales_rows FROM sales;
SELECT sales_region, SUM(sale_value) AS total_sales_value FROM sales GROUP BY sales_region ORDER BY total_sales_value DESC;
SELECT product_name, AVG(quantity::NUMERIC) AS avg_quantity FROM sales GROUP BY product_name ORDER BY product_name;
SELECT MIN(sale_value) AS min_sale_value, MAX(sale_value) AS max_sale_value FROM sales;
SELECT sales_region, SUM(sale_value) AS total_sales_value FROM sales GROUP BY sales_region HAVING SUM(sale_value) > 500 ORDER BY total_sales_value DESC;
