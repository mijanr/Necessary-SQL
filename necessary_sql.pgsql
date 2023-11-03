-- Create a schema called Sales if it does not already exist.
CREATE SCHEMA IF NOT EXISTS Sales;

-- Create the customers table.
CREATE TABLE IF NOT EXISTS Sales.customers
(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

-- Create the orders table.
CREATE TABLE IF NOT EXISTS Sales.orders
(
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Sales.customers(customer_id),
    order_date DATE,
    total_amount NUMERIC(10, 2)
);
