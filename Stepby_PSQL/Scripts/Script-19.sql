
CREATE TABLE last_4month_transactions AS
SELECT *
FROM transactions
WHERE t_dat >= (SELECT DATE(MAX(t_dat) - INTERVAL '4 month') FROM transactions);


CREATE TABLE last_4month_sales_enriched AS
SELECT
    t.*, 
    a.product_type_name,
    a.graphical_appearance_name,
    a.colour_group_name,
    a.perceived_colour_value_name,
    a.department_name,
    a.index_group_name
FROM last_4month_transactions t
JOIN articles a
    ON t.article_id = a.article_id;


CREATE TABLE last_4month_full_data AS
SELECT
    s.*,
    c.age AS customer_age,
    c.postal_code
FROM last_4month_sales_enriched s
JOIN customers c
    ON s.customer_id = c.customer_id;


CREATE TABLE last_4month_analysis_dataset AS
SELECT
    customer_id,
    article_id,
    price,
    customer_age,
    index_group_name,
    department_name,
    perceived_colour_value_name,
    t_dat
FROM last_4month_full_data;

COPY last_4month_analysis_dataset TO '/Users/sinan/Downloads/last_4month_hm_data.csv' WITH CSV HEADER;