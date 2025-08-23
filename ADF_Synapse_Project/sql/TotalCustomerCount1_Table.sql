------------------------
-- CustomerProduct Table
-------------------------
DROP TABLE gold.totalcustomercount1;
CREATE TABLE gold.totalcustomercount1(
    location VARCHAR(100),
    total_customer_count BIGINT
)
WITH(
    DISTRIBUTION = ROUND_ROBIN
);

--load data using COPY INTO
COPY INTO gold.totalcustomercount1(
    location 1,
    total_customer_count 2
)
FROM 'https://pranoyadlsgen2.dfs.core.windows.net/retail-gold/TotalCustomerCountByLocation'
WITH(
    FILE_TYPE = 'PARQUET',
    CREDENTIAL = (IDENTITY= 'Managed Identity')
); 

-- Read Data
SELECT * FROM gold.totalcustomercount1;