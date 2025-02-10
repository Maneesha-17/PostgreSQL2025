CREATE TABLE sales (
    sale_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    region VARCHAR(100),
    sale_date DATE,
    sale_amount DECIMAL(10, 2),
    units_sold INT
);

-- Insert sample data into 'sales' table
INSERT INTO sales (product_name, region, sale_date, sale_amount, units_sold) VALUES
('Laptop', 'North', '2023-01-15', 1200.00, 3),
('Laptop', 'South', '2023-01-16', 1150.00, 2),
('Smartphone', 'North', '2023-01-17', 600.00, 10),
('Smartphone', 'East', '2023-01-18', 620.00, 8);

SELECT product_name,
    SUM(sale_amount) AS total_sales,
    AVG(sale_amount) AS average_sale_amount,
    SUM(units_sold) AS total_units_sold
FROM sales
GROUP BY product_name;


SELECT region,
    SUM(sale_amount) AS total_sales
FROM sales
GROUP BY region
HAVING SUM(sale_amount) > 1000
ORDER BY total_sales desc;


SELECT region,
    MAX(sale_amount) AS highest_sale
FROM sales
GROUP BY region;