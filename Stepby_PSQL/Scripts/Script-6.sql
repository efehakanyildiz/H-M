CREATE OR REPLACE VIEW customer_transaction_stats AS
SELECT
    customer_id,
    COUNT(*) AS transaction_count,
    MIN(t_dat) AS first_purchase_date,
    MAX(t_dat) AS last_purchase_date,
    SUM(price) AS total_spent,
    AVG(price) AS avg_transaction_value,
    COUNT(DISTINCT article_id) AS unique_articles_purchased
FROM
    transactions
GROUP BY
    customer_id;

CREATE OR REPLACE VIEW product_category_stats AS
SELECT
    a.product_group_name,
    COUNT(*) AS sales_count,
    COUNT(DISTINCT t.customer_id) AS unique_customers,
    SUM(t.price) AS total_revenue,
    AVG(t.price) AS avg_price
FROM
    transactions t
JOIN
    articles a ON t.article_id = a.article_id
GROUP BY
    a.product_group_name
ORDER BY
    sales_count DESC;