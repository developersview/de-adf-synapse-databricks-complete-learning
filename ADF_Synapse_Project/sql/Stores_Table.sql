------------------------
-- CustomerProduct Table
-------------------------
DROP TABLE gold.stores;
CREATE TABLE gold.stores(
    store_sk INT,
    store_id VARCHAR(100),
    store_name VARCHAR(100),
    store_type VARCHAR(100),
    location VARCHAR(100),
    store_manager_sk INT
)
WITH(
    DISTRIBUTION = ROUND_ROBIN
);

--load data using COPY INTO
COPY INTO gold.stores(
    store_sk 1,
    store_id 2,
    store_name 3,
    store_type 4,
    location 5,
    store_manager_sk 6
)
FROM 'https://pranoyadlsgen2.dfs.core.windows.net/retail-gold/Stores'
WITH(
    FILE_TYPE = 'PARQUET',
    CREDENTIAL = (IDENTITY= 'Managed Identity')
); 

-- Read Data
SELECT * FROM gold.stores;