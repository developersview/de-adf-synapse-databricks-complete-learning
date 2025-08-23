------------------------
-- CustomerProduct Table
-------------------------
DROP TABLE gold.totalcustomercount2;
CREATE TABLE gold.totalcustomercount2(
    customer_segment VARCHAR(100),
    total_customer_count BIGINT
)
WITH(
    DISTRIBUTION = ROUND_ROBIN
);

--load data using COPY INTO
COPY INTO gold.totalcustomercount2(
    customer_segment 1,
    total_customer_count 2
)
FROM 'https://pranoyadlsgen2.dfs.core.windows.net/retail-gold/TotalCustomerCountBySegment'
WITH(
    FILE_TYPE = 'PARQUET',
    CREDENTIAL = (IDENTITY= 'Managed Identity')
); 

-- Read Data
SELECT * FROM gold.totalcustomercount2;