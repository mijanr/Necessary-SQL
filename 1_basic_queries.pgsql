-- SELECT and FROM commands
SELECT
    *
FROM
    sales.customers;

-- WHERE, IN
SELECT
    *
FROM
    sales.customers
WHERE
    customer_id IN (10, 20, 30);

-- BETWEEN, AND
SELECT
    *
FROM
    sales.customers
WHERE
    customer_id BETWEEN 10 AND 30;

-- AND, LIKE
SELECT
    *
FROM
    sales.customers
WHERE
    customer_id BETWEEN 10 AND 30
    AND first_name LIKE 'A%';

-- ORDER BY to sort the result set
SELECT
    *   
FROM
    sales.customers
WHERE
    customer_id BETWEEN 10 AND 30
    AND first_name LIKE 'A%'
ORDER BY
    first_name DESC,
    last_name ASC;

-- LIMIT to limit the number of rows returned
SELECT
    *
FROM
    sales.customers
LIMIT 10;

-- GROUP BY to group the result set
SELECT
    customer_id,
    SUM(total_amount) AS total
FROM
    sales.orders
GROUP BY
    customer_id
ORDER BY
    total DESC;

-- HAVING to filter the result set
SELECT
    customer_id,
    SUM(total_amount) AS total
FROM
    sales.orders
GROUP BY
    customer_id
HAVING
    SUM(total_amount) > 5000
ORDER BY
    total DESC;
