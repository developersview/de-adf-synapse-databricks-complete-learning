------------------------
-- TotalSales Table
-------------------------
DROP TABLE gold.totalsales;
CREATE TABLE gold.totalsales(
    salesperson_role VARCHAR(100),
    total_salesperson BIGINT,
    total_sales FLOAT
)
WITH(
    DISTRIBUTION = ROUND_ROBIN
);

--load data using COPY INTO
COPY INTO gold.totalsales(
    salesperson_role 1,
    total_salesperson 2,
    total_sales 3
)
FROM 'https://pranoyadlsgen2.dfs.core.windows.net/retail-gold/TotalSales'
WITH(
    FILE_TYPE = 'PARQUET',
    CREDENTIAL = (IDENTITY= 'Managed Identity')
); 

-- Read Data
SELECT * FROM gold.totalsales;