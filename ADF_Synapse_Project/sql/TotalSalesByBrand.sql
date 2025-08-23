------------------------
-- TotalSales Table
-------------------------
DROP TABLE gold.TotalSalesByBrand;
CREATE TABLE gold.TotalSalesByBrand(
    brand VARCHAR(100),
    total_sales FLOAT
)
WITH(
    DISTRIBUTION = ROUND_ROBIN
);

--load data using COPY INTO
COPY INTO gold.TotalSalesByBrand(
    brand 1,
    total_sales 2
)
FROM 'https://pranoyadlsgen2.dfs.core.windows.net/retail-gold/TotalSalesByBrand'
WITH(
    FILE_TYPE = 'PARQUET',
    CREDENTIAL = (IDENTITY= 'Managed Identity')
); 

-- Read Data
SELECT * FROM gold.TotalSalesByBrand;