-- Dedicated SQL Pool
----------------
-- POLYBASE (CETAS)
-----------------
-- create external table
CREATE EXTERNAL TABLE revenue_tbl_ext_dedicated (
    Dealer_ID VARCHAR(100),
    Model_ID VARCHAR(100),
    Branch_ID VARCHAR(100),
    Date_ID VARCHAR(100),
    Units_Sold INT,
    Revenue BIGINT
)
WITH (
    LOCATION = 'revenue_cetas',
    DATA_SOURCE = raw_ext_src2,
    FILE_FORMAT = parquet_format2
);

SELECT * FROM revenue_tbl_ext_dedicated;

-- polybase (cetas)
DROP TABLE revenue_polytable;
CREATE TABLE revenue_polytable
WITH(
    DISTRIBUTION = ROUND_ROBIN
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
    dbo.revenue_tbl_ext_dedicated;