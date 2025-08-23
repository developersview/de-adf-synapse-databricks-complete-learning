------------------------
-- TotalSales Table
-------------------------
DROP TABLE gold.TotalSalesByCategory;
CREATE TABLE gold.TotalSalesByCategory(
    category VARCHAR(100),
    total_sales FLOAT
)
WITH(
    DISTRIBUTION = ROUND_ROBIN
);

--load data using COPY INTO
COPY INTO gold.TotalSalesByCategory(
    category 1,
    total_sales 2
)
FROM 'https://pranoyadlsgen2.dfs.core.windows.net/retail-gold/TotalSalesByCategory'
WITH(
    FILE_TYPE = 'PARQUET',
    CREDENTIAL = (IDENTITY= 'Managed Identity')
); 

-- Read Data
SELECT * FROM gold.TotalSalesByCategory;