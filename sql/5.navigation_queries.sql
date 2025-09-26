--5.navigation_queries.sql
--Navigation functions for growth calculations
--LAG(), LEAD()

-- Monthly sales with previous month (LAG) and next month (LEAD)


SELECT
    month,
    total_sales,
    LAG(total_sales, 1) OVER (ORDER BY month) AS prev_month_sales,
    LEAD(total_sales, 1) OVER (ORDER BY month) AS next_month_sales,
    ROUND(
        (total_sales - LAG(total_sales, 1) OVER (ORDER BY month)) 
        / NULLIF(LAG(total_sales, 1) OVER (ORDER BY month), 0) * 100, 2
    ) AS monthly_growth_percent
FROM (
    SELECT
        DATE_TRUNC('month', sale_date) AS month,
        SUM(amount) AS total_sales
    FROM transactions
    GROUP BY DATE_TRUNC('month', sale_date)
) AS monthly
ORDER BY month;

