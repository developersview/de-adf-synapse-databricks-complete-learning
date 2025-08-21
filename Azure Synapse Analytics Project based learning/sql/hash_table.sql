----------------
-- HASH TABLE
-----------------
CREATE TABLE gold.fact_business(
    dim_key_product INT,
    revenue INT,
    cost INT
)
WITH(
    DISTRIBUTION = HASH(dim_key_product)
);