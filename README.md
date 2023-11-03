## Necessary SQL
This repository contains common SQL queries for daily use.

### Creating Schema
We will name the schema as `Sales` in the following examples.
```sql
CREATE SCHEMA IF NOT EXISTS Sales;
```
A schema is a way to organize database objects (tables, views, functions, etc.) into separate namespaces within a database. 

### Creating Table
There will be two tables called `customers` and `orders` in the `Sales` schema.

`customers` table:
```sql
CREATE TABLE my_schema.customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);
```
`orders` table:
```sql
CREATE TABLE my_schema.orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES my_schema.customers(customer_id),
    order_date DATE,
    total_amount NUMERIC(10, 2)
);
```




