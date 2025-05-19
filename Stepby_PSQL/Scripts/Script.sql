CREATE TABLE customers (
    customer_id VARCHAR(200) PRIMARY KEY,
    age SMALLINT,
    postal_code VARCHAR(200),
    fn SMALLINT, -- fashion news subscription flag
    active SMALLINT, -- customer activity status
    club_member_status VARCHAR(200),
    fashion_news_frequency VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
