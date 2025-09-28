--5.navigation_queries.sql
--Navigation functions for growth calculations
--LAG(), LEAD()

-- Monthly sales with previous month (LAG) and next month (LEAD)

--1.LEAD()
SELECT
    DATE_TRUNC('month', sale_date) AS month,
    SUM(amount) AS total_sales,
    LEAD(SUM(amount)) OVER (ORDER BY DATE_TRUNC('month', sale_date)) AS next_month_sales,
    ROUND(
        (LEAD(SUM(amount)) OVER (ORDER BY DATE_TRUNC('month', sale_date)) - SUM(amount)) 
        / NULLIF(SUM(amount), 0) * 100, 2
    ) AS growth_next_month_percent
FROM transactions
GROUP BY DATE_TRUNC('month', sale_date)
ORDER BY month;

--2.LAG()
SELECT
    DATE_TRUNC('month', sale_date) AS month,
    SUM(amount) AS total_sales,
    LAG(SUM(amount)) OVER (ORDER BY DATE_TRUNC('month', sale_date)) AS prev_month_sales,
    ROUND(
        (SUM(amount) - LAG(SUM(amount)) OVER (ORDER BY DATE_TRUNC('month', sale_date))) 
        / NULLIF(LAG(SUM(amount)) OVER (ORDER BY DATE_TRUNC('month', sale_date)), 0) * 100, 2
    ) AS monthly_growth_percent
FROM transactions
GROUP BY DATE_TRUNC('month', sale_date)
ORDER BY month;



--LAG: gives the previous month’s value(past)
--LEAD: gives the next month’s value(future)



