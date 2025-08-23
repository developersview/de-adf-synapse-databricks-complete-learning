------------------------
-- CustomerProduct Table
-------------------------
DROP TABLE gold.productcount;
CREATE TABLE gold.productcount(
    customer_segment VARCHAR(100),
    total_product_count BIGINT,
    rank INT
)
WITH(
    DISTRIBUTION = ROUND_ROBIN
);

--load data using COPY INTO
COPY INTO gold.productcount(
    customer_segment 1,
    total_product_count 2,
    rank 3
)
FROM 'https://pranoyadlsgen2.dfs.core.windows.net/retail-gold/ProductCountByCustomerSegment'
WITH(
    FILE_TYPE = 'PARQUET',
    CREDENTIAL = (IDENTITY= 'Managed Identity')
); 

-- Read Data
SELECT * FROM gold.productcount;