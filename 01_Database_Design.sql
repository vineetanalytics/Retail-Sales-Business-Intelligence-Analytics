CREATE DATABASE retail_analytics;

show DATABASES;

USE retail_analytics;

SELECT DATABASE();

CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    city VARCHAR(50),
    state VARCHAR(50),
    registration_date DATE
);

CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10, 2),
    cost_price DECIMAL(10, 2)
);

DESC products;

CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),
    payment_mode VARCHAR(30),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

DESC orders;

SHOW CREATE TABLE orders;

CREATE TABLE IF NOT EXISTS order_details (
    details_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    discount DECIMAL(5, 2),

    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);

DESC order_details;

SHOW CREATE TABLE order_details;

CREATE TABLE IF NOT EXISTS shipping (
    shipping_id INT PRIMARY KEY,
    order_id INT,
    shipping_date DATE,
    delivery_date DATE,
    shipping_cost DECIMAL(10, 2),

    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),
    
    UNIQUE (order_id)
);

DESC shipping;

SHOW TABLES;

SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'retail_analytics'
AND REFERENCED_TABLE_NAME IS NOT NULL;

SHOW CREATE TABLE shipping;

ALTER TABLE shipping
ADD UNIQUE KEY uq_order_id (order_id);

SHOW INDEX FROM shipping;

ALTER TABLE shipping
DROP INDEX uq_order_id;

SHOW INDEX FROM shipping;

