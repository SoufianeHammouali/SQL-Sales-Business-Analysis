-- Projet : Analyse des performances commerciales avec SQL
-- SGBD : SQLite

DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT,
    age INTEGER,
    city TEXT,
    segment TEXT
);

INSERT INTO customers VALUES
(1, 'Youssef', 34, 'Casablanca', 'Premium'),
(2, 'Sara', 28, 'Rabat', 'Consumer'),
(3, 'Amine', 41, 'Marrakech', 'Premium'),
(4, 'Imane', 32, 'Casablanca', 'Corporate'),
(5, 'Mehdi', 26, 'Rabat', 'Consumer'),
(6, 'Salma', 38, 'Fes', 'Premium'),
(7, 'Omar', 45, 'Tangier', 'Corporate'),
(8, 'Nadia', 30, 'Agadir', 'Premium'),
(9, 'Karim', 23, 'Meknes', 'Consumer'),
(10, 'Lina', 36, 'Oujda', 'Corporate');

CREATE TABLE sales (
    order_id INTEGER PRIMARY KEY,
    order_date TEXT,
    customer_id INTEGER,
    category TEXT,
    product TEXT,
    quantity INTEGER,
    net_revenue REAL,
    profit REAL,
    sales_channel TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO sales VALUES
(101, '2025-01-10', 1, 'Electronics', 'Laptop', 1, 7500, 1800, 'Online'),
(102, '2025-01-18', 2, 'Electronics', 'Smartphone', 2, 9000, 2200, 'Store'),
(103, '2025-02-05', 3, 'Furniture', 'Sofa', 1, 6500, 1700, 'Online'),
(104, '2025-02-17', 1, 'Electronics', 'Tablet', 2, 6000, 1400, 'Marketplace'),
(105, '2025-03-03', 4, 'Home Appliances', 'Refrigerator', 1, 8000, 2100, 'Store'),
(106, '2025-03-21', 5, 'Office Supplies', 'Office Chair', 3, 4500, 900, 'Online'),
(107, '2025-04-08', 6, 'Home Appliances', 'Air Conditioner', 2, 10000, 2800, 'Online'),
(108, '2025-04-19', 7, 'Furniture', 'Desk', 2, 5500, 1300, 'Marketplace'),
(109, '2025-05-07', 8, 'Electronics', 'Smartphone', 1, 5000, 1300, 'Online'),
(110, '2025-05-22', 3, 'Furniture', 'Sofa', 2, 12000, 3200, 'Store'),
(111, '2025-06-04', 9, 'Office Supplies', 'Printer', 1, 3500, 700, 'Marketplace'),
(112, '2025-06-16', 10, 'Electronics', 'Laptop', 1, 8000, 2000, 'Online'),
(113, '2025-07-02', 6, 'Home Appliances', 'Washing Machine', 1, 7000, 1800, 'Store'),
(114, '2025-07-20', 2, 'Electronics', 'Tablet', 1, 3200, 750, 'Online'),
(115, '2025-08-09', 4, 'Furniture', 'Desk', 3, 9000, 2300, 'Store'),
(116, '2025-08-25', 1, 'Electronics', 'Smartphone', 2, 10500, 3000, 'Online'),
(117, '2025-09-11', 7, 'Home Appliances', 'Refrigerator', 1, 8500, 2200, 'Marketplace'),
(118, '2025-09-27', 8, 'Furniture', 'Sofa', 1, 6200, 1500, 'Online'),
(119, '2025-10-14', 3, 'Electronics', 'Laptop', 2, 15000, 4000, 'Online'),
(120, '2025-11-06', 6, 'Home Appliances', 'Air Conditioner', 1, 5500, 1500, 'Store');
