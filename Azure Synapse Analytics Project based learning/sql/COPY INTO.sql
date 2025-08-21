-- Dedicated SQL POOL
----------------------
-- COPY INTO
----------------------
-- Create table
DROP TABLE dbo.revenue_tbl;
CREATE TABLE dbo.revenue_tbl(
    Dealer_ID VARCHAR(100),
    Model_ID VARCHAR(100),
    Branch_ID VARCHAR(100),
    Date_ID VARCHAR(100),
    Units_Sold INT,
    Revenue BIGINT
)
WITH(
    DISTRIBUTION = ROUND_ROBIN
);


SELECT * FROM dbo.revenue_tbl;


-- Load data
COPY INTO dbo.revenue_tbl(
    Dealer_ID 1,
    Model_ID 2,
    Branch_ID 3,
    Date_ID 4,
    Units_Sold 5,
    Revenue 6
)
FROM 'https://pranoyadlsgen2.dfs.core.windows.net/rawsyn/revenue_cetas/'
WITH(
    FILE_TYPE = 'PARQUET',
    CREDENTIAL = (IDENTITY= 'Managed Identity')
);
