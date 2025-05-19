SELECT 'customers' AS table_name, COUNT(*) AS record_count FROM customers
UNION ALL
SELECT 'articles' AS table_name, COUNT(*) AS record_count FROM articles
UNION ALL
SELECT 'transactions' AS table_name, COUNT(*) AS record_count FROM transactions;

SELECT * FROM customers LIMIT 10;


SELECT * FROM articles LIMIT 10;


SELECT * FROM transactions LIMIT 10;


SELECT 
    MIN(t_dat) AS earliest_transaction,
    MAX(t_dat) AS latest_transaction,
    MAX(t_dat) - MIN(t_dat) AS date_range_days
FROM transactions;


SELECT 
    t_dat, customer_id, article_id, price, sales_channel_id, 
    COUNT(*) AS duplicate_count
FROM 
    transactions
GROUP BY 
    t_dat, customer_id, article_id, price, sales_channel_id
HAVING 
    COUNT(*) > 1
LIMIT 20;


SELECT 
    COUNT(*) AS invalid_customer_count
FROM 
    transactions t
LEFT JOIN 
    customers c ON t.customer_id = c.customer_id
WHERE 
    c.customer_id IS NULL;


SELECT 
    COUNT(*) AS invalid_article_count
FROM 
    transactions t
LEFT JOIN 
    articles a ON t.article_id = a.article_id
WHERE 
    a.article_id IS NULL;


ALTER TABLE transactions ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id);
ALTER TABLE transactions ADD CONSTRAINT fk_article FOREIGN KEY (article_id) REFERENCES articles(article_id);


SELECT 
    t.customer_id,
    COUNT(*) AS purchase_count,
    SUM(t.price) AS total_spent,
    AVG(t.price) AS avg_purchase_value,
    MIN(t.t_dat) AS first_purchase,
    MAX(t.t_dat) AS last_purchase
FROM 
    transactions t
GROUP BY 
    t.customer_id
ORDER BY 
    purchase_count DESC
LIMIT 20;


SELECT 
    t.article_id,
    a.prod_name,
    a.product_group_name,
    COUNT(*) AS times_sold,
    SUM(t.price) AS total_revenue
FROM 
    transactions t
JOIN 
    articles a ON t.article_id = a.article_id
GROUP BY 
    t.article_id, a.prod_name, a.product_group_name
ORDER BY 
    times_sold DESC
LIMIT 20;


SELECT 
    t.customer_id,
    MAX(t.t_dat) AS last_purchase_date,
    COUNT(*) AS frequency,
    SUM(t.price) AS monetary
FROM 
    transactions t
GROUP BY 
    t.customer_id;


SELECT 
    t.customer_id,
    t.article_id,
    a.product_group_name,
    a.product_type_name,
    a.colour_group_name
FROM 
    transactions t
JOIN 
    articles a ON t.article_id = a.article_id;


SELECT 
    c.customer_id,
    c.age,
    c.club_member_status,
    c.fashion_news_frequency,
    COUNT(t.customer_id) AS total_purchases,
    COUNT(DISTINCT t.article_id) AS unique_items_purchased,
    SUM(t.price) AS total_spent,
    COUNT(DISTINCT DATE_TRUNC('month', t.t_dat)) AS active_months
FROM 
    customers c
LEFT JOIN 
    transactions t ON c.customer_id = t.customer_id
GROUP BY 
    c.customer_id, c.age, c.club_member_status, c.fashion_news_frequency;


SELECT 
    DATE_TRUNC('month', t_dat) AS month,
    COUNT(*) AS transaction_count,
    COUNT(DISTINCT customer_id) AS unique_customers,
    SUM(price) AS monthly_revenue,
    SUM(price) / COUNT(DISTINCT customer_id) AS revenue_per_customer
FROM 
    transactions
GROUP BY 
    month
ORDER BY 
    month;


SELECT 
    a.product_group_name,
    COUNT(*) AS sales_count,
    COUNT(DISTINCT t.customer_id) AS customer_count,
    SUM(t.price) AS total_revenue
FROM 
    transactions t
JOIN 
    articles a ON t.article_id = a.article_id
GROUP BY 
    a.product_group_name
ORDER BY 
    sales_count DESC;