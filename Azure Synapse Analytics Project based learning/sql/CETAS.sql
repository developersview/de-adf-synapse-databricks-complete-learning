-- Serverless SQL Pool
-----------
-- CETAS
-----------
--- table 1
DROP EXTERNAL TABLE revenue_cetas;
CREATE EXTERNAL TABLE revenue_cetas
WITH(
    LOCATION = 'revenue_cetas',
    DATA_SOURCE = raw_ext_src,
    FILE_FORMAT = parquet_format2
)
AS
SELECT
    Dealer_ID,
    Model_ID,
    Branch_ID,
    Date_ID,
    Units_Sold,
    Revenue
FROM
    dbo.revenue_tbl;

--- read the data
SELECT
    *
FROM
    OPENROWSET(
        BULK 'revenue_cetas',
        DATA_SOURCE = 'raw_ext_src',
        FORMAT = 'PARQUET'
    ) AS [result];

SELECT * FROM revenue_cetas;

-------------------------------------------------------------------------------
-- table 2
CREATE EXTERNAL TABLE revenue_cetas_enriched
WITH(
    LOCATION = 'revenue',
    DATA_SOURCE = enriched_ext_src,
    FILE_FORMAT = parquet_format
)
AS
SELECT TOP 10
    Dealer_ID,
    Model_ID,
    Branch_ID,
    Date_ID,
    Units_Sold,
    Revenue
FROM
    dbo.revenue_tbl
ORDER BY Revenue;

--- read the data
SELECT
    *
FROM
    OPENROWSET(
        BULK 'revenue',
        DATA_SOURCE = 'enriched_ext_src',
        FORMAT = 'PARQUET'
    ) AS [result];