CREATE OR REPLACE VIEW basic_statistics AS
SELECT
    'customers' AS table_name,
    COUNT(*) AS row_count,
    COUNT(DISTINCT customer_id) AS unique_customers,
    MIN(age) AS min_age,
    MAX(age) AS max_age,
    AVG(age) AS avg_age,
    COUNT(DISTINCT club_member_status) AS unique_club_statuses
FROM
    customers
UNION ALL
SELECT
    'articles' AS table_name,
    COUNT(*) AS row_count,
    COUNT(DISTINCT article_id) AS unique_articles,
    NULL::NUMERIC AS min_age,
    NULL::NUMERIC AS max_age,
    NULL::NUMERIC AS avg_age,
    COUNT(DISTINCT product_group_name) AS unique_product_groups
FROM
    articles
UNION ALL
SELECT
    'transactions' AS table_name,
    COUNT(*) AS row_count,
    COUNT(DISTINCT customer_id) AS unique_customers,
    MIN(price) AS min_price,
    MAX(price) AS max_price,
    AVG(price) AS avg_price,
    COUNT(DISTINCT sales_channel_id) AS unique_sales_channels
FROM
    transactions;