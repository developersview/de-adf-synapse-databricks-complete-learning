------------------------
-- TopSalesPerson Table
-------------------------
DROP TABLE gold.topsalesperson;
CREATE TABLE gold.topsalesperson(
    salesperson_id VARCHAR(100),
    salesperson_name VARCHAR(100),
    salesperson_role VARCHAR(100),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    total_amount FLOAT,
    rank INT
)
WITH(
    DISTRIBUTION = ROUND_ROBIN
);

--load data using COPY INTO
COPY INTO gold.topsalesperson(
    salesperson_id 1,
    salesperson_name 2,
    salesperson_role 3,
    first_name 4,
    last_name 5,
    total_amount 6,
    rank 7
)
FROM 'https://pranoyadlsgen2.dfs.core.windows.net/retail-gold/Top5SalesPerson'
WITH(
    FILE_TYPE = 'PARQUET',
    CREDENTIAL = (IDENTITY= 'Managed Identity')
); 

-- Read Data
SELECT * FROM gold.topsalesperson;