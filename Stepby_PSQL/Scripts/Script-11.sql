WITH summer_transactions AS (
    SELECT 
        t.*,
        EXTRACT(YEAR FROM t.t_dat) AS year,
        CASE 
            WHEN t.t_dat BETWEEN '2019-06-21' AND '2019-09-22' THEN '2019 Summer'
            WHEN t.t_dat BETWEEN '2020-06-21' AND '2020-09-22' THEN '2020 Summer'
        END AS period
    FROM transactions t
    WHERE (t.t_dat BETWEEN '2019-06-21' AND '2019-09-22')
       OR (t.t_dat BETWEEN '2020-06-21' AND '2020-09-22')
)
SELECT 
    period,
    COUNT(*) AS transaction_count,
    COUNT(DISTINCT customer_id) AS unique_customers,
    SUM(price) AS total_revenue,
    ROUND(SUM(price) / COUNT(DISTINCT customer_id), 2) AS revenue_per_customer,
    ROUND(AVG(price), 2) AS avg_transaction_value
FROM summer_transactions
GROUP BY period
ORDER BY period;