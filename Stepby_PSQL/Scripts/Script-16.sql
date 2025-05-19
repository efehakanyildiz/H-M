WITH customer_weekly AS (
    SELECT
        EXTRACT(WEEK FROM t.t_dat) AS week_number,
        EXTRACT(YEAR FROM t.t_dat) AS year,
        t.customer_id,
        COUNT(*) AS transactions_per_customer
    FROM transactions t
    WHERE (t.t_dat BETWEEN '2019-06-21' AND '2019-09-22')
       OR (t.t_dat BETWEEN '2020-06-21' AND '2020-09-22')
    GROUP BY year, week_number, t.customer_id
)
SELECT
    year,
    week_number,
    ROUND(AVG(transactions_per_customer), 2) AS avg_transactions_per_customer
FROM customer_weekly
GROUP BY year, week_number
ORDER BY year, week_number;
