SELECT 
    EXTRACT(WEEK FROM t.t_dat) AS week_number,
    EXTRACT(YEAR FROM t.t_dat) AS year,
    COUNT(*) AS transaction_count,
    SUM(t.price) AS weekly_revenue,
    COUNT(DISTINCT t.customer_id) AS unique_customers,
    ROUND(SUM(t.price) / COUNT(DISTINCT t.customer_id), 2) AS revenue_per_customer,
    -- Hareketli ortalama (3 haftalık)
    ROUND(AVG(COUNT(*)) OVER (
        PARTITION BY EXTRACT(YEAR FROM t.t_dat) 
        ORDER BY EXTRACT(WEEK FROM t.t_dat)
        ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
    ), 2) AS moving_avg_transactions
FROM transactions t
WHERE (t.t_dat BETWEEN '2019-06-21' AND '2019-09-22')
   OR (t.t_dat BETWEEN '2020-06-21' AND '2020-09-22')
GROUP BY week_number, year
ORDER BY year, week_number;