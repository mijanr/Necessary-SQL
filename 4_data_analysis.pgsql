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
