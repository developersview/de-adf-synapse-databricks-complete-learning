-- Serverless SQL POOL
----------------------------------------------------
-- When folder is not available and not using CETAS
----------------------------------------------------
CREATE EXTERNAL TABLE revenue2(
    Dealer_ID VARCHAR(100),
    Model_ID VARCHAR(100),
    Branch_ID VARCHAR(100),
    Date_ID VARCHAR(100),
    Units_Sold INT,
    Revenue BIGINT
)
WITH(
    LOCATION = 'revenue2',
    DATA_SOURCE = raw_ext_src,
    FILE_FORMAT = csv_format
);

SELECT * FROM revenue2;
