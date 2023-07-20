-- Request 1 
-- Update the customer's email address:

UPDATE customer
SET customer_email = 'newemail@example.com'
WHERE customer_id = 123;

-- Request 2
-- Increase the product price by a certain percentage:

UPDATE product
SET product_price = product_price * 1.1
WHERE product_category_id = 10;

-- Request 3
-- Assign a new shipper to an order:

UPDATE orders
SET orders_shipper_id = 4
WHERE orders_id = 987;

-- Request 4 

-- IMPOSSIBLE FOR MARIADB 

-- Error Code: 1235. This version of MariaDB doesn't yet support 'LIMIT & IN/ALL/ANY/SOME subquery'
 
UPDATE orders
SET
    orders_customer_id = FLOOR(RAND() * 30) + 1,
    orders_date = DATEADD(DAY, -FLOOR(RAND() * 365), GETDATE())
WHERE orders_id IN (
    SELECT TOP 100 orders_id
    FROM orders
    ORDER BY NEWID()
);

-- Postgresql 

UPDATE orders
SET
    orders_customer_id = FLOOR(RANDOM() * 30) + 1,
    orders_date = CURRENT_DATE - (FLOOR(RANDOM() * 365) || ' days')::interval
WHERE orders_id IN (
    SELECT orders_id
    FROM orders
    ORDER BY RANDOM()
    LIMIT 100
);

-- Request 5 

UPDATE orders
SET
    orders_customer_id = FLOOR(RAND() * 30) + 1,
    orders_date = DATEADD(DAY, -FLOOR(RAND() * 365), GETDATE())
WHERE orders_id IN (
    SELECT TOP 1000 orders_id
    FROM orders
    ORDER BY NEWID()
);

-- Postgresql 

UPDATE orders
SET
    orders_customer_id = FLOOR(RANDOM() * 30) + 1,
    orders_date = CURRENT_DATE - (FLOOR(RANDOM() * 365) || ' days')::interval
WHERE orders_id IN (
    SELECT orders_id
    FROM orders
    ORDER BY RANDOM()
    LIMIT 1000
);

-- Request 6

UPDATE orders
SET
    orders_customer_id = FLOOR(RAND() * 30) + 1,
    orders_date = DATEADD(DAY, -FLOOR(RAND() * 365), GETDATE())
WHERE orders_id IN (
    SELECT TOP 10000 orders_id
    FROM orders
    ORDER BY NEWID()
);

-- Postgresql 

UPDATE orders
SET
    orders_customer_id = FLOOR(RANDOM() * 30) + 1,
    orders_date = CURRENT_DATE - (FLOOR(RANDOM() * 365) || ' days')::interval
WHERE orders_id IN (
    SELECT orders_id
    FROM orders
    ORDER BY RANDOM()
    LIMIT 10000
);

-- Request 7

UPDATE orders
SET
    orders_customer_id = FLOOR(RAND() * 30) + 1,
    orders_date = DATEADD(DAY, -FLOOR(RAND() * 365), GETDATE())
WHERE orders_id IN (
    SELECT TOP 100000 orders_id
    FROM orders
    ORDER BY NEWID()
);

-- Postgresql 

UPDATE orders
SET
    orders_customer_id = FLOOR(RANDOM() * 30) + 1,
    orders_date = CURRENT_DATE - (FLOOR(RANDOM() * 365) || ' days')::interval
WHERE orders_id IN (
    SELECT orders_id
    FROM orders
    ORDER BY RANDOM()
    LIMIT 100000
);

-- Request 8

UPDATE orders
SET
    orders_customer_id = FLOOR(RAND() * 30) + 1,
    orders_date = DATEADD(DAY, -FLOOR(RAND() * 365), GETDATE())
WHERE orders_id IN (
    SELECT TOP 1000000 orders_id
    FROM orders
    ORDER BY NEWID()
);

-- Postgresql 

UPDATE orders
SET
    orders_customer_id = FLOOR(RANDOM() * 30) + 1,
    orders_date = CURRENT_DATE - (FLOOR(RANDOM() * 365) || ' days')::interval
WHERE orders_id IN (
    SELECT orders_id
    FROM orders
    ORDER BY RANDOM()
    LIMIT 1000000
);

-- Request 9 : 

-- 5000 times this query in a row, all launched at the same time

INSERT INTO orders_quantity (orders_quantity_quantity, orders_quantity_orders_id, orders_quantity_product_id) VALUES (1, 53071, 27);