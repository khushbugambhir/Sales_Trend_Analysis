CREATE DATABASE sales_analysis;
USE sales_analysis;

CREATE TABLE orders (
    order_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    product_id INT
);
SELECT * FROM orders LIMIT 5;

SELECT 
  YEAR(order_date) AS year,
  MONTH(order_date) AS month
FROM orders;

SELECT
  YEAR(order_date) AS year,
  MONTH(order_date) AS month,
  SUM(amount) AS monthly_revenue
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

SELECT
  YEAR(order_date) AS year,
  MONTH(order_date) AS month,
  COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

SELECT
  YEAR(order_date) AS year,
  MONTH(order_date) AS month,
  SUM(amount) AS monthly_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

SELECT
  YEAR(order_date) AS year,
  MONTH(order_date) AS month,
  SUM(amount) AS monthly_revenue
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY monthly_revenue DESC
LIMIT 3;


