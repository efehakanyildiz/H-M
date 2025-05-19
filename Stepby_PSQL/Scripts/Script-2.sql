CREATE TABLE articles (
    article_id INT PRIMARY KEY,
    product_code INT,
    prod_name VARCHAR(1024),
    product_type_no SMALLINT,
    product_type_name VARCHAR(1024),
    product_group_name VARCHAR(1024),
    graphical_appearance_name VARCHAR(1024),
    colour_group_name VARCHAR(1024),
    perceived_colour_value_name VARCHAR(1024),
    perceived_colour_master_name VARCHAR(1024),
    department_name VARCHAR(1024),
    index_name VARCHAR(1024),
    index_group_name VARCHAR(1024),
    section_name VARCHAR(1024),
    garment_group_name VARCHAR(1024),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  
);

