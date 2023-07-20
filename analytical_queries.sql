analytical queries : 

-- Request 1 : 

-- Get the total number of orders made by customers and the total price:

SELECT
    c.customer_first_name AS First_name,
    c.customer_last_name AS Last_name,
    COUNT(o.orders_id) AS Number_of_orders,
    SUM(oq.orders_quantity_quantity * p.product_price) AS Total_price
FROM
    orders o
INNER JOIN customer c ON c.customer_id = o.orders_customer_id
INNER JOIN orders_quantity oq ON oq.orders_quantity_orders_id = o.orders_id
INNER JOIN product p ON p.product_id = oq.orders_quantity_product_id
GROUP BY
    c.customer_id, c.customer_first_name, c.customer_last_name;
	
-- Request 2 : 
-- Get the total number of orders made by a each customer:

SELECT
    COUNT(o.orders_id) AS TOTAL_ORDERS,
    cu.customer_id,
    cu.customer_first_name AS first_name,
    cu.customer_last_name AS last_name,
    ad.address_street AS street,
    cu.customer_email AS email,
    ci.city_name AS city,
    co.country_name AS country
FROM
    orders o
INNER JOIN customer cu ON cu.customer_id = o.orders_customer_id
INNER JOIN address ad ON ad.address_id = cu.customer_address_id
INNER JOIN city ci ON ci.city_id = ad.address_city_id
INNER JOIN country co ON co.country_id = ci.city_country_id
GROUP BY
    cu.customer_id,
    cu.customer_first_name,
    cu.customer_last_name,
    ad.address_street,
    cu.customer_email,
    ci.city_name,
    co.country_name
ORDER BY cu.customer_id ASC;

-- Request 3 : 

SELECT
    c.customer_id,
    c.customer_first_name,
    c.customer_last_name,
    COUNT(o.orders_id) AS total_orders,
    SUM(q.orders_quantity_quantity) AS total_quantity_ordered
FROM
    customer c
INNER JOIN orders o ON c.customer_id = o.orders_customer_id
INNER JOIN orders_quantity q ON o.orders_id = q.orders_quantity_orders_id
GROUP BY
    c.customer_id,
    c.customer_first_name,
    c.customer_last_name
HAVING
    COUNT(o.orders_id) >= 5 -- Include customers with at least 5 orders
ORDER BY
    c.customer_id;

-- Request 4 (same as 3 with an avg)

SELECT
    c.customer_id,
    c.customer_first_name,
    c.customer_last_name,
    COUNT(o.orders_id) AS total_orders,
    SUM(q.orders_quantity_quantity) AS total_quantity_ordered,
    AVG(p.product_price) AS average_product_price
FROM
    customer c
INNER JOIN orders o ON c.customer_id = o.orders_customer_id
INNER JOIN orders_quantity q ON o.orders_id = q.orders_quantity_orders_id
INNER JOIN product p ON q.orders_quantity_product_id = p.product_id
GROUP BY
    c.customer_id,
    c.customer_first_name,
    c.customer_last_name
HAVING
    COUNT(o.orders_id) >= 5 -- Include customers with at least 5 orders
ORDER BY
    c.customer_id;
	
-- Request 5 : 

SELECT * 
FROM orders o
INNER JOIN customer c ON c.customer_id = o.orders_customer_id
WHERE c.customer_id = 1;

-- Request 6 : 
-- Sales Analysis by Category

SELECT
    c.category_name,
    SUM(oq.orders_quantity_quantity) AS total_quantity_sold,
    SUM(p.product_price * oq.orders_quantity_quantity) AS total_sales_amount
FROM
    category c
INNER JOIN product p ON c.category_id = p.product_category_id
INNER JOIN orders_quantity oq ON p.product_id = oq.orders_quantity_product_id
GROUP BY
    c.category_name;
	
-- Request 7 : 
-- Customer Order History:

SELECT
    CONCAT(c.customer_first_name, ' ', c.customer_last_name) AS customer_name,
    c.customer_email,
    COUNT(o.orders_id) AS total_orders_placed
FROM
    customer c
INNER JOIN orders o ON c.customer_id = o.orders_customer_id
GROUP BY
    c.customer_id,
    c.customer_first_name,
    c.customer_last_name,
    c.customer_email;

-- Request 8 : 
-- Supplier Performance Evaluation:

SELECT
    s.supplier_name,
    COUNT(p.product_id) AS total_products_supplied,
    AVG(p.product_price) AS average_product_price
FROM
    supplier s
INNER JOIN product p ON s.supplier_id = p.product_supplier_id
GROUP BY
    s.supplier_id,
    s.supplier_name;

-- Request 9 : 
-- Sales Analysis by Category, Customer, and Year:

SELECT
    c.category_name,
    CONCAT(cust.customer_first_name, ' ', cust.customer_last_name) AS customer_name,
    YEAR(o.orders_date) AS order_year,
    COUNT(o.orders_id) AS total_orders_placed,
    SUM(oq.orders_quantity_quantity) AS total_quantity_sold,
    SUM(p.product_price * oq.orders_quantity_quantity) AS total_sales_amount
FROM
    category c
INNER JOIN product p ON c.category_id = p.product_category_id
INNER JOIN orders_quantity oq ON p.product_id = oq.orders_quantity_product_id
INNER JOIN orders o ON oq.orders_quantity_orders_id = o.orders_id
INNER JOIN customer cust ON o.orders_customer_id = cust.customer_id
GROUP BY
    c.category_name,
    cust.customer_first_name,
    cust.customer_last_name,
    YEAR(o.orders_date)
ORDER BY order_year, c.category_name;

-- Postgresql : No year function 

SELECT
    c.category_name,
    CONCAT(cust.customer_first_name, ' ', cust.customer_last_name) AS customer_name,
    COUNT(o.orders_id) AS total_orders_placed,
    SUM(oq.orders_quantity_quantity) AS total_quantity_sold,
    SUM(p.product_price * oq.orders_quantity_quantity) AS total_sales_amount
FROM
    category c
INNER JOIN product p ON c.category_id = p.product_category_id
INNER JOIN orders_quantity oq ON p.product_id = oq.orders_quantity_product_id
INNER JOIN orders o ON oq.orders_quantity_orders_id = o.orders_id
INNER JOIN customer cust ON o.orders_customer_id = cust.customer_id
GROUP BY
    c.category_name,
    cust.customer_first_name,
    cust.customer_last_name
ORDER BY c.category_name;

-- Request 10

-- SQL SERVER

SELECT 
	TOP 100 orders_id
FROM 
	orders
ORDER BY NEWID();

-- MYSQL / MARIADB 

SELECT orders_id
FROM orders
ORDER BY RAND()
LIMIT 100;

-- Postgresql

SELECT orders_id
    FROM orders
    ORDER BY RANDOM()
    LIMIT 100;







