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