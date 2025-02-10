create table employees (
    id SERIAL primary key, --serial - like auto_increment(id - 1,2,3,4,5)
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    age INT,
    department VARCHAR(100)
);

insert into employees (first_name, last_name, age, department) values
('Alice', 'Smith', 29, 'HR'),
('Bob', 'Johnson', 35, 'Tech'),
('Charlie', 'Williams', 42, 'Finance'),
('David', 'Jones', 28, 'Tech'),
('Eva', 'Brown', 30, 'HR');

