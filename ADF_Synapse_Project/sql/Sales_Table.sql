------------------------
-- CustomerProduct Table
-------------------------
DROP TABLE gold.sales;
CREATE TABLE gold.sales(
    sales_sk INT,
    sales_id VARCHAR(100),
    customer_sk INT,
    product_sk INT,
    store_sk INT,
    salesperson_sk INT,
    campaign_sk INT,
    sales_date DATE,
    total_amount FLOAT
)
WITH(
    DISTRIBUTION = ROUND_ROBIN
);

--load data using COPY INTO
COPY INTO gold.sales(
    sales_sk 1,
    sales_id 2,
    customer_sk 3,
    product_sk 4,
    store_sk 5,
    salesperson_sk 6,
    campaign_sk 7,
    sales_date 8,
    total_amount 9
)
FROM 'https://pranoyadlsgen2.dfs.core.windows.net/retail-gold/Sales'
WITH(
    FILE_TYPE = 'PARQUET',
    CREDENTIAL = (IDENTITY= 'Managed Identity')
); 

-- Read Data
SELECT * FROM gold.sales;