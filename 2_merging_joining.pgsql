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


