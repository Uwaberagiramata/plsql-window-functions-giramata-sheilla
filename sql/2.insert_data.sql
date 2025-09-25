1.CUSTOMERS
--insert into customers

INSERT INTO customers (customer_id, name, region) VALUES
(1001, 'John Doe', 'Kigali'),
(1002, 'Alice Umutoni', 'Nyarugenge'),
(1003, 'Umutesi Dave', 'Huye'),
(1004, 'Umuoza Aline', 'Kigali'),
(1005, 'Mugabo Allan', 'Nyamagabe');

2.PRODUCTS

-- Insert Products
INSERT INTO products (product_id, name, category) VALUES 
 (2001, 'Coffee Beans', 'Beverages'),
 (2002, 'Black tea', 'Beverages'),
 (2003, 'Biscuits', 'Food'),
 (2004, 'cornflour', 'food'),
 (2005, 'Green Tea', 'Beverages');

3.TRANSACTIONS

--transactions
INSERT INTO transactions (transaction_id, customer_id, product_id, sale_date, amount)
VALUES 
(3001, 1001, 2001, TO_DATE('2025-01-19', 'YYYY-MM-DD'), 35000),
(3002, 1002, 2002, TO_DATE('2025-02-14', 'YYYY-MM-DD'), 20000),
(3003, 1003, 2003, TO_DATE('2025-03-05', 'YYYY-MM-DD'), 60000),
(3004, 1004, 2004, TO_DATE('2025-03-20', 'YYYY-MM-DD'), 15000),
(3005, 1005, 2005, TO_DATE('2025-04-01', 'YYYY-MM-DD'), 6000);
