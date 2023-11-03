--- WINDOW functions + OVER/PARTITION BY
SELECT
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_amount,
    RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS rank
FROM
    sales.customers c
LEFT JOIN
    sales.orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id
ORDER BY
    rank ASC;

--- Select 10 random rows
SELECT
    *
FROM
    sales.customers
ORDER BY
    RANDOM()
LIMIT 10;

--- Round numeric values
SELECT
    ROUND(123.456, 2) AS rounded_value;

--- Adding LEAD/LAG functions
SELECT
    c.first_name,
    c.last_name,
    o.order_date,
    LEAD(o.order_date,2) OVER (ORDER BY o.order_date) AS next_order_date,
    LAG(o.order_date) OVER (ORDER BY o.order_date) AS previous_order_date
FROM
    sales.customers c
LEFT JOIN
    sales.orders o ON c.customer_id = o.customer_id
ORDER BY
    c.customer_id ASC,
    o.order_date ASC;

--- Manipulaing dates
SELECT
    o.order_date,
    DATE_TRUNC('month', o.order_date) AS month,
    DATE_TRUNC('year', o.order_date) AS year,
    DATE_TRUNC('day', o.order_date) AS day,
    DATE_TRUNC('week', o.order_date) AS week
FROM
    sales.orders o
ORDER BY
    o.order_date ASC;

--- Manipulating text
SELECT
    c.first_name,
    c.last_name,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    UPPER(c.first_name) AS upper_first_name,
    LOWER(c.last_name) AS lower_last_name,
    LENGTH(c.first_name) AS first_name_length,
    SUBSTRING(c.first_name, 1, 3) AS first_name_substring,
    POSITION('a' IN c.first_name) AS first_name_position,
    TRIM(c.first_name) AS trimmed_first_name,
    REPLACE(c.first_name, 'a', 'b') AS replaced_first_name
FROM
    sales.customers c
ORDER BY
    c.customer_id ASC;
    
