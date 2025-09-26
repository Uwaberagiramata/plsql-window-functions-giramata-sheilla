--3.ranking_queries.sql
-- Ranking functions to find top N customers by revenue
-- ROW_NUMBER(), RANK(), DENSE_RANK(), PERCENT_RANK()

-- Total revenue per customer

WITH customer_revenue AS (
    SELECT
        customer_id,
        SUM(amount) AS total_revenue
    FROM transactions
    GROUP BY customer_id
)
SELECT *
FROM customer_revenue
ORDER BY total_revenue DESC;

--The WITH customer_revenue AS part creates a temporary result set that adds up revenue for each customer. 
--The main SELECT then uses that temporary table to assign row numbers.

--ROW_NUMBER:TOP N CUSTOMER 
SELECT
    customer_id,
    SUM(amount) AS total_revenue,
    ROW_NUMBER() OVER (ORDER BY SUM(amount) DESC) AS row_num
FROM transactions
GROUP BY customer_id;

--ROW_NUMBER() OVER (ORDER BY SUM(amount) DESC) gives a rank based on total revenue, starting with the highest.
--it  checks that every customer appears only one time.

--RANK(): RANKINGS WITH GAPS

SELECT
    customer_id,
    total_revenue,
    sales_rank
FROM (
    SELECT
        customer_id,
        SUM(amount) AS total_revenue,
        RANK() OVER (ORDER BY SUM(amount) DESC) AS sales_rank
    FROM transactions
    GROUP BY customer_id
) AS customer_revenue
WHERE sales_rank <= 5
ORDER BY sales_rank;

--RANKS CUSTOMERS based on revenue  with gaps .
--when  there's a duplicates it will skip the next number .


--DENSE_RANK(): Rankings without gaps
SELECT
    customer_id,
    total_revenue,
    dense_sales_rank
FROM (
    SELECT
        customer_id,
        SUM(amount) AS total_revenue,
        DENSE_RANK() OVER (ORDER BY SUM(amount) DESC) AS dense_sales_rank
    FROM transactions
    GROUP BY customer_id
) AS ranked_customers
WHERE dense_sales_rank <= 5
ORDER BY dense_sales_rank;

--ranking without gaps.
--  DENSE_RANK() unlike  rank when  there's a duplicate it doesn't skip the next number 

--PERCENT_RANK: normal ranking 
SELECT
    customer_id,
    SUM(amount) AS total_revenue,
    PERCENT_RANK() OVER (ORDER BY SUM(amount) DESC) AS percentile_rank
FROM transactions
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 5;

--helps in ranking customer from the highest to the lowest based on their revenue  and it will select only 5 customers
--it will also show the percintile rank of a very customer  and it will be between 0 and 1








