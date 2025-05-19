CREATE TABLE summer_transactions AS
SELECT *
FROM transactions
WHERE t_dat BETWEEN '2020-06-01' AND '2020-08-31';

CREATE TABLE summer_sales_enriched AS
SELECT
    t.*, 
    a.product_type_name,
    a.graphical_appearance_name,
    a.colour_group_name,
    a.perceived_colour_value_name,
    a.department_name,
    a.index_group_name
FROM summer_transactions t
JOIN articles a
    ON t.article_id = a.article_id;

CREATE TABLE article_avg_price AS
SELECT article_id, AVG(price) AS avg_price
FROM summer_sales_enriched
GROUP BY article_id;

CREATE TABLE summer_campaign_sales AS
SELECT 
    s.*,
    CASE 
        WHEN s.price < a.avg_price * 0.9 THEN TRUE
        ELSE FALSE
    END AS is_campaign
FROM summer_sales_enriched s
JOIN article_avg_price a
    ON s.article_id = a.article_id;

CREATE TABLE summer_campaign_full AS
SELECT
    s.*,
    c.age AS customer_age,
    c.postal_code
FROM summer_campaign_sales s
JOIN customers c
    ON s.customer_id = c.customer_id;

CREATE TABLE campaign_analysis_dataset AS
SELECT
    customer_id,
    article_id,
    price,
    is_campaign,
    customer_age,
    index_group_name,
    department_name,
    perceived_colour_value_name,
    t_dat
FROM summer_campaign_full;

COPY campaign_analysis_dataset TO '/Users/sinan/Downloads/campaign_data.csv' WITH CSV HEADER;


