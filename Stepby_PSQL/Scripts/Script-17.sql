COPY (
    WITH base AS (
        SELECT 
            t.customer_id,
            t.article_id,
            t.t_dat,
            t.price,
            t.sales_channel_id,
            CASE WHEN random() < 0.5 THEN 0 ELSE 1 END AS campaign_flag,
            EXTRACT(YEAR FROM t.t_dat) AS year,
            EXTRACT(WEEK FROM t.t_dat) AS week_number,
            CASE 
                WHEN t.t_dat BETWEEN '2019-06-21' AND '2019-09-22' THEN '2019 Summer'
                WHEN t.t_dat BETWEEN '2020-06-21' AND '2020-09-22' THEN '2020 Summer'
            END AS period
        FROM transactions t
        WHERE t.t_dat BETWEEN '2019-06-21' AND '2020-09-22'
    ),
    first_purchase AS (
        SELECT customer_id, MIN(t_dat) AS first_purchase_date
        FROM transactions
        GROUP BY customer_id
    ),
    customer_stats AS (
        SELECT customer_id,
               COUNT(*) AS total_customer_transactions,
               SUM(price) AS total_customer_spend
        FROM base
        GROUP BY customer_id
    )
    SELECT 
        b.*,
        CASE WHEN fp.first_purchase_date < b.t_dat THEN 1 ELSE 0 END AS is_returning_customer,
        cs.total_customer_transactions,
        cs.total_customer_spend
    FROM base b
    JOIN first_purchase fp ON b.customer_id = fp.customer_id
    JOIN customer_stats cs ON b.customer_id = cs.customer_id
    ORDER BY b.t_dat
) TO '/Users/sinan/Downloads/summer_transactions.csv' WITH CSV HEADER;

