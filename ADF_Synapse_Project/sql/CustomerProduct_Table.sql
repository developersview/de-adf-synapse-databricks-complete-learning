------------------------
-- CustomerProduct Table
-------------------------
DROP TABLE gold.customerproduct;
CREATE TABLE gold.customerproduct(
    customer_id VARCHAR(100),
    email VARCHAR(100),
    customer_segment VARCHAR(200),
    full_name VARCHAR(100),
    product_id VARCHAR(100),
    product_name VARCHAR(100),
    category VARCHAR(100),
    brand VARCHAR(100)
)
WITH(
    DISTRIBUTION = ROUND_ROBIN
);

--load data using COPY INTO
COPY INTO gold.customerproduct(
    customer_id 1,
    email 2,
    customer_segment 3,
    full_name 4,
    product_id 5,
    product_name 6,
    category 7,
    brand 8
)
FROM 'https://pranoyadlsgen2.dfs.core.windows.net/retail-gold/CustomerProduct'
WITH(
    FILE_TYPE = 'PARQUET',
    CREDENTIAL = (IDENTITY= 'Managed Identity')
); 

-- Read Data
SELECT * FROM gold.customerproduct;