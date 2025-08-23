------------------------
-- TotalSales Table
-------------------------
DROP TABLE gold.TotalSalesPerMonth;
CREATE TABLE gold.TotalSalesPerMonth(
    month INT,
    total_sales INT
)
WITH(
    DISTRIBUTION = ROUND_ROBIN
);

--load data using COPY INTO
COPY INTO gold.TotalSalesPerMonth(
    month 1,
    total_sales 2
)
FROM 'https://pranoyadlsgen2.dfs.core.windows.net/retail-gold/TotalSalesPerMonth'
WITH(
    FILE_TYPE = 'PARQUET',
    CREDENTIAL = (IDENTITY= 'Managed Identity')
); 

-- Read Data
SELECT * FROM gold.TotalSalesPerMonth;