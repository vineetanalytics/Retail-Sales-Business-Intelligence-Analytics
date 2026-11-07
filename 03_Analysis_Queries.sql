USE retail_analytics;

-- 1. Total Revenue
SELECT 
SUM(od.quantity * p.price) AS total_revenue
FROM order_details od
JOIN products p
ON od.product_id = p.product_id;

-- 2. Top 10 Selling Products
SELECT
p.product_name,
SUM(od.quantity) AS total_quantity
FROM order_details od
JOIN products p
ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 10;

-- 3. Category Wise Sales
SELECT
p.category,
sum(od.quantity * p.price) AS total_sales
FROM order_details od
JOIN products p
ON od.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sales DESC;

-- 4. City Wise Revenue
SELECT
c.city,
SUM(od.quantity * p.price) AS revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_details od
ON o.order_id = od.order_id
JOIN products p
ON od.product_id = p.product_id
GROUP BY c.city
ORDER BY revenue DESC;

-- 5. Monthly Sales Trend
SELECT
MONTH(o.order_date) AS month,
SUM(od.quantity * p.price) as sales
FROM orders o
JOIN order_details od
ON o.order_id = od.order_id
JOIN products p
ON od.product_id = p.product_id
GROUP BY MONTH(o.order_date)
ORDER BY month;
