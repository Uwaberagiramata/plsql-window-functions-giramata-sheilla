CREATING TABLES
  
1.CUSTOMERS
  
-- Customers Table
CREATE TABLE customers (
    customer_id   int PRIMARY KEY,
    name          VARCHAR(100) NOT NULL,
    region        VARCHAR(50) NOT NULL
);


2.PRODUCTS

--products table
CREATE TABLE products (
    product_id    int PRIMARY KEY,
    name          VARCHAR(100) NOT NULL,
    category      VARCHAR(50) NOT NULL
);

3.TRANSACTIONS

--transactions table

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id    INT NOT NULL,
    product_id     INT NOT NULL,
    sale_date      DATE NOT NULL,
    amount         DECIMAL(12,2) NOT NULL,
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products(product_id)
);





