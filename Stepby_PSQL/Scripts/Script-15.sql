WITH weekly_summary AS (
    SELECT 
        EXTRACT(WEEK FROM t.t_dat) AS week_number,
        EXTRACT(YEAR FROM t.t_dat) AS year,
        COUNT(*) AS transaction_count,
        SUM(t.price) AS weekly_revenue
    FROM transactions t
    WHERE (t.t_dat BETWEEN '2019-06-21' AND '2019-09-22')
       OR (t.t_dat BETWEEN '2020-06-21' AND '2020-09-22')
    GROUP BY year, week_number
)
SELECT
    ws1.year,
    ws1.week_number,
    ws1.transaction_count,
    ws1.weekly_revenue,
    ROUND(
      (ws1.transaction_count::NUMERIC - ws2.transaction_count) / NULLIF(ws2.transaction_count, 0) * 100, 2
    ) AS transaction_growth_pct,
    ROUND(
      (ws1.weekly_revenue - ws2.weekly_revenue) / NULLIF(ws2.weekly_revenue, 0) * 100, 2
    ) AS revenue_growth_pct
FROM weekly_summary ws1
LEFT JOIN weekly_summary ws2
    ON ws1.week_number = ws2.week_number AND ws1.year = ws2.year + 1
ORDER BY ws1.year, ws1.week_number;