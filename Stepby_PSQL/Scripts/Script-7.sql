CREATE OR REPLACE VIEW data_quality_check AS
SELECT
    'customers' AS table_name,
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (WHERE customer_id IS NULL) AS missing_ids,
    COUNT(*) FILTER (WHERE age IS NULL) AS missing_age,
    COUNT(*) FILTER (WHERE club_member_status IS NULL) AS missing_club_status
FROM
    customers
UNION ALL
SELECT
    'articles' AS table_name,
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (WHERE article_id IS NULL) AS missing_ids,
    COUNT(*) FILTER (WHERE product_code IS NULL) AS missing_product_code,
    COUNT(*) FILTER (WHERE prod_name IS NULL) AS missing_product_name
FROM
    articles
UNION ALL
SELECT
    'transactions' AS table_name,
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (WHERE customer_id IS NULL) AS missing_customer_id,
    COUNT(*) FILTER (WHERE article_id IS NULL) AS missing_article_id,
    COUNT(*) FILTER (WHERE t_dat IS NULL) AS missing_date
FROM
    transactions;