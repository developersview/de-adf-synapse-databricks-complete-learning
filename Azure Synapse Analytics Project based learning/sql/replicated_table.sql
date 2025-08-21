----------------
-- CREATE SCHEMA
----------------
CREATE SCHEMA gold;

-------------------
-- replicated table
--------------------
CREATE TABLE gold.dim_product(
    dim_key_product INT,
    product_id INT,
    product_name VARCHAR(1000)
)
WITH(
    DISTRIBUTION = REPLICATE
);

INSERT INTO gold.dim_product VALUES (1, 101, 'HP Victus PC');

SELECT * FROM gold.dim_product;