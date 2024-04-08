# Necessary-SQL
This repository contains common SQL features used in data analysis tasks. The queries are written in PostgreSQL.

## Creating Schema
We will name the schema as `Sales` in the following examples.
```sql
CREATE SCHEMA IF NOT EXISTS Sales;
```
A schema is a way to organize database objects (tables, views, functions, etc.) into separate namespaces within a database. 

## Creating Table
There will be two tables called `customers` and `orders` in the `Sales` schema.

`customers` table:
```sql
CREATE TABLE IF NOT EXISTS sales.customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);
```
`orders` table:
```sql
CREATE TABLE IF NOT EXISTS sales.orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES sales.customers(customer_id),
    order_date DATE,
    total_amount NUMERIC(10, 2)
);
```

## Inserting Data
Inserting data into `customers` table:
```sql
INSERT INTO 
    Sales.customers (first_name, last_name, email)
VALUES 
    ('John', 'Smith', 'john.smith@gmail.com'),
    ('Jane', 'Doe', 'jane.doe@gmail.com'),
    ...
```
Inserting data into `orders` table:
```sql  
INSERT INTO 
    Sales.orders (customer_id, order_date, total_amount)
VALUES 
    (1, '2020-01-01', 100.00),
    (1, '2020-01-02', 200.00),
    ...
```

## Queries Explored

**1. Query Foundations**

    - The SELECT & FROM commands
    - Selection using WHERE / IN / AND / BETWEEN
    - ORDER BY
    - TOP / LIMIT
    - Aggregation with GROUP BY + SUM / COUNT
    - HAVING

**2. Merging & Joining**

    - Merging data using LEFT & INNER
    - Stacking data using UNION and UNION ALL
    - Executing multiple queries using TEMP TABLES and CTE

**3. Manipulation**

    - WINDOW functions + OVER / PARTITION BY
    - Adding LEAD / LAG
    - Rounding numerical data
    - Selecting random samples of data
    - Manipulating dates
    - Manipulating text

This list is taken from [Andre Jones](https://www.linkedin.com/in/andrew-jones-dsi/) LinkedIn profile.

## SQL JOINS
The following diagram shows the different SQL JOINs:
![SQL JOINS](images/PostgreSQL-Joins.png)

## Requirements
`requirements.yml` file contains the necessary packages to run the Jupyter Notebook. To install the packages, run the following command:
```bash
conda env create -f requirements.yml
```
`requirements.yml` is generated using the following command:
```bash
conda env export --no-builds | grep -v "prefix" > requirements.yml
```


