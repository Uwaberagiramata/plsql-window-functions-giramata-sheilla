--4.aggregate_queries.sql
--running totals and trends
--SUM(), AVG(), MIN(), MAX() with ROWS vs RANGE

--calculating total of sales per month
SELECT
    DATE_TRUNC('month', sale_date) AS month,
    SUM(amount) AS monthly_sales,
    SUM(SUM(amount)) OVER (ORDER BY DATE_TRUNC('month', sale_date)) AS running_total
FROM transactions
GROUP BY DATE_TRUNC('month', sale_date)
ORDER BY month;
 -- it will help  for calculating  total  of sales  per month  for every month .
-- and it will group by month.

--3-month moving average of sales

SELECT
    DATE_TRUNC('month', sale_date) AS month,
    SUM(amount) AS monthly_sales,
    SUM(SUM(amount)) OVER (
        ORDER BY DATE_TRUNC('month', sale_date)
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total,
    AVG(SUM(amount)) OVER (
        ORDER BY DATE_TRUNC('month', sale_date)
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg_3m
FROM transactions
GROUP BY DATE_TRUNC('month', sale_date)
ORDER BY month;

--it will help  to calculate running total from the first month to the current month
--UNBOUNDED PRECEDING  will make sure it starts from the first month.
--it will   help  to Calculates a 3-month moving average  

-- Using MIN/MAX with RANGE
SELECT
    DATE_TRUNC('month', sale_date) AS month,
    SUM(amount) AS monthly_sales,
    MIN(SUM(amount)) OVER (ORDER BY DATE_TRUNC('month', sale_date) RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS min_sales,
    MAX(SUM(amount)) OVER (ORDER BY DATE_TRUNC('month', sale_date) RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS max_sales
FROM transactions
GROUP BY DATE_TRUNC('month', sale_date)
ORDER BY month;

--it will help to calculate  minimum sales of the month.
--and also calculate maximum sales of the month.
