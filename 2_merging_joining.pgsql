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


-- Stack using UNION
--- stack ids (2, 4, 6) and (8, 16, 32)
--- UNION removes duplicates
--- UNION sorts the result set by first_column
SELECT 
    customer_id,
    first_name,
    last_name
FROM
    sales.customers
WHERE
    customer_id IN (2 , 4, 6)
UNION
SELECT 
    customer_id,
    first_name,
    last_name
FROM
    sales.customers
WHERE
    customer_id IN (8 , 16, 32)
ORDER BY
    customer_id;


-- Stack using UNION ALL
--- stack ids (2, 4, 6) and (8, 16, 32)
--- UNION ALL does not remove duplicates
--- UNION ALL does not sort the result set
SELECT 
    customer_id,
    first_name,
    last_name
FROM
    sales.customers
WHERE
    customer_id IN (2 , 4, 6)
UNION ALL
SELECT 
    customer_id,
    first_name,
    last_name
FROM
    sales.customers
WHERE
    customer_id IN (8 , 16, 32)
ORDER BY
    customer_id;
