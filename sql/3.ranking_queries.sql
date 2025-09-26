--3.ranking_queries.sql
-- Purpose: Ranking functions to find top N customers by revenue
-- Functions: ROW_NUMBER(), RANK(), DENSE_RANK(), PERCENT_RANK()

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

--ROW_NUMBER:TOP N CUSTOMER 
SELECT
    customer_id,
    SUM(amount) AS total_revenue,
    ROW_NUMBER() OVER (ORDER BY SUM(amount) DESC) AS row_num
FROM transactions
GROUP BY customer_id;

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

--PERCENT_RANK: normal ranking 
SELECT
    customer_id,
    total_revenue,
    dense_rank
FROM (
    SELECT
        customer_id,
        SUM(amount) AS total_revenue,
        DENSE_RANK() OVER (ORDER BY SUM(amount) DESC) AS dense_rank
    FROM transactions
    GROUP BY customer_id
) AS ranked_customers
WHERE dense_rank <= 5
ORDER BY dense_rank;




