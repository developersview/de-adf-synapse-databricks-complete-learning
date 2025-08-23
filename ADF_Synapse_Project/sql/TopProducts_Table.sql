------------------------
-- CustomerProduct Table
-------------------------
DROP TABLE gold.topproducts;
CREATE TABLE gold.topproducts(
    product_id VARCHAR(100),
    product_name VARCHAR(100),
    category VARCHAR(100),
    total_sales FLOAT,
    rank INT
)
WITH(
    DISTRIBUTION = ROUND_ROBIN
);

--load data using COPY INTO
COPY INTO gold.topproducts(
    product_id 1,
    product_name 2,
    category 3,
    total_sales 4,
    rank 5
)
FROM 'https://pranoyadlsgen2.dfs.core.windows.net/retail-gold/Top5Products'
WITH(
    FILE_TYPE = 'PARQUET',
    CREDENTIAL = (IDENTITY= 'Managed Identity')
); 

-- Read Data
SELECT * FROM gold.topproducts;