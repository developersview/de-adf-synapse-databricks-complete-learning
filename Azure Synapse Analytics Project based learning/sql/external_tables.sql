-- Serverless SQL POOL
---------------------------
-- Create external table
---------------------------
DROP EXTERNAL TABLE revenue_tbl;
CREATE EXTERNAL TABLE revenue_tbl (
    Dealer_ID VARCHAR(100),
    Model_ID VARCHAR(100),
    Branch_ID VARCHAR(100),
    Date_ID VARCHAR(100),
    Units_Sold INT,
    Revenue BIGINT
)
WITH (
    LOCATION = 'revenue',
    DATA_SOURCE = raw_ext_src,
    FILE_FORMAT = csv_format
);

SELECT * FROM revenue_tbl;