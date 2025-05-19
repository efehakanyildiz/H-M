CREATE TABLE customers (
    customer_id VARCHAR(1024) PRIMARY KEY,
    age SMALLINT,
    postal_code VARCHAR(1024),
    fn SMALLINT, 
    active SMALLINT,
    club_member_status VARCHAR(1024),
    fashion_news_frequency VARCHAR(1024),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
