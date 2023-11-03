--- Find the total sales each month
SELECT
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(total_amount) AS total_sales
FROM
    sales.orders    
GROUP BY    
    EXTRACT(MONTH FROM order_date)
ORDER BY
    EXTRACT(MONTH FROM order_date) ASC;

--- Find the total sales each year
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    SUM(total_amount) AS total_sales
FROM
    sales.orders
GROUP BY
    EXTRACT(YEAR FROM order_date)
ORDER BY
    EXTRACT(YEAR FROM order_date) ASC;

--- Get month name from month number
SELECT
    TO_CHAR(order_date, 'Month') AS month,
    SUM(total_amount) AS total_sales
FROM
    sales.orders
GROUP BY
    TO_CHAR(order_date, 'Month'),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    EXTRACT(MONTH FROM order_date) ASC;

--- Top 5 customers by total sales
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(o.total_amount) AS total_sales
FROM
    sales.orders o
INNER JOIN
    sales.customers c
ON
    o.customer_id = c.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY
    total_sales DESC
LIMIT 5;
