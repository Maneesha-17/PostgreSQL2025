CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100)
);

INSERT INTO customers (customer_name, email) VALUES
('John Doe', 'john.doe@example.com'),
('Jane Smith', 'jane.smith@example.com'),
('Alice Johnson', 'alice.johnson@example.com');


CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders (customer_id, order_date, amount) VALUES
(1, '2023-01-15', 150.00),
(1, '2023-01-20', 200.00),
(2, '2023-01-25', 50.00),
(4, '2023-02-01', 400.00);  -- Note: customer_id 4 does not exist in customers table

SELECT customers.customer_name, orders.order_date, orders.amount
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id;

| customer_name | order_date | amount |
|---------------|------------|--------|
| John Doe      | 2023-01-15 | 150.00 |
| John Doe      | 2023-01-20 | 200.00 |
| Jane Smith    | 2023-01-25 | 50.00  |


SELECT customers.customer_name, orders.order_date, orders.amount
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id;

| customer_name  | order_date | amount |
|----------------|------------|--------|
| John Doe       | 2023-01-15 | 150.00 |
| John Doe       | 2023-01-20 | 200.00 |
| Jane Smith     | 2023-01-25 | 50.00  |
| Alice Johnson  | NULL       | NULL   |



SELECT customers.customer_name, orders.order_date, orders.amount
FROM customers
RIGHT JOIN orders ON customers.customer_id = orders.customer_id;

| customer_name | order_date | amount |
|---------------|------------|--------|
| John Doe      | 2023-01-15 | 150.00 |
| John Doe      | 2023-01-20 | 200.00 |
| Jane Smith    | 2023-01-25 | 50.00  |
| NULL          | 2023-02-01 | 400.00 |  -- Note: No matching customer


SELECT customers.customer_name, orders.order_date, orders.amount
FROM customers
FULL OUTER JOIN orders ON customers.customer_id = orders.customer_id;

| customer_name  | order_date | amount |
|----------------|------------|--------|
| John Doe       | 2023-01-15 | 150.00 |
| John Doe       | 2023-01-20 | 200.00 |
| Jane Smith     | 2023-01-25 | 50.00  |
| NULL           | 2023-02-01 | 400.00 |  -- No matching customer
| Alice Johnson  | NULL       | NULL   |  -- No orders



SELECT customers.customer_name, orders.order_date
FROM customers
CROSS JOIN orders;

| customer_name  | order_date |
|----------------|------------|
| John Doe       | 2023-01-15 |
| John Doe       | 2023-01-20 |
| John Doe       | 2023-01-25 |
| John Doe       | 2023-02-01 |
| Jane Smith     | 2023-01-15 |
| Jane Smith     | 2023-01-20 |
| Jane Smith     | 2023-01-25 |
| Jane Smith     | 2023-02-01 |
| Alice Johnson  | 2023-01-15 |
| Alice Johnson  | 2023-01-20 |
| Alice Johnson  | 2023-01-25 |
| Alice Johnson  | 2023-02-01 |
