-- LEFT JOIN
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    o.total_amount
FROM
    sales.customers c
LEFT JOIN
    sales.orders o ON c.customer_id = o.customer_id
ORDER BY
    c.customer_id;


-- Find the total amount of all orders for each customer. 
-- Show top 5 rows.
SELECT
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_amount
FROM
    sales.customers c
LEFT JOIN
    sales.orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id
ORDER BY
    total_amount DESC
LIMIT 5;


-- INNER JOIN
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    o.total_amount
FROM
    sales.customers c
INNER JOIN
    sales.orders o ON c.customer_id = o.customer_id
ORDER BY
    c.customer_id;


