------------------------
-- TotalSales Table
-------------------------
DROP TABLE gold.TotalSalesPerQuarter;
CREATE TABLE gold.TotalSalesPerQuarter(
    quarter_name VARCHAR(2),
    total_sales INT
)
WITH(
    DISTRIBUTION = ROUND_ROBIN
);

--load data using COPY INTO
COPY INTO gold.TotalSalesPerQuarter(
    quarter_name 1,
    total_sales 2
)
FROM 'https://pranoyadlsgen2.dfs.core.windows.net/retail-gold/TotalSalesPerQuarter'
WITH(
    FILE_TYPE = 'PARQUET',
    CREDENTIAL = (IDENTITY= 'Managed Identity')
); 

-- Read Data
SELECT * FROM gold.TotalSalesPerQuarter;