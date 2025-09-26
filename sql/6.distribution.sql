--6.distribution.sql
--Distribution functions for customer segmentation
-- NTILE(4), CUME_DIST()

---- NTILE(4): 4 equal  Quartiles  of customers 
SELECT
    customer_id,
    SUM(amount) AS total_revenue,
    NTILE(4) OVER (ORDER BY SUM(amount) DESC) AS revenue_quartile
FROM transactions
GROUP BY customer_id
ORDER BY total_revenue DESC;
--customer with higher quartile will be in class 1 and the lowest will be quartile 4
-- I divide it into 4 equal parts  or quartiles
-- CUME_DIST: Cumulative distribution
SELECT
    customer_id,
    SUM(amount) AS total_revenue,
    CUME_DIST() OVER (ORDER BY SUM(amount) DESC) AS cum_distribution
FROM transactions
GROUP BY customer_id
ORDER BY total_revenue DESC;

--cummulative distribution   helps to calculate relative position of a row in a sorted dataset
-- and the one who will get 1 is lowest ranking in terms of revenue
