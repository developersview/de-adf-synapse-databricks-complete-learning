--------------------
-- create credential
--------------------
CREATE DATABASE SCOPED CREDENTIAL pranoycreds
WITH IDENTITY = 'Managed Identity';

------------------------
-- External Data Source
------------------------
CREATE EXTERNAL DATA SOURCE  raw_ext_src
WITH(
    LOCATION = 'abfss://rawsyn@pranoyadlsgen2.dfs.core.windows.net',
    CREDENTIAL = pranoycreds    
);

CREATE EXTERNAL DATA SOURCE enriched_ext_src
WITH(
    LOCATION = 'abfss://enrichedsyn@pranoyadlsgen2.dfs.core.windows.net',
    CREDENTIAL = pranoycreds
);

---------------------------------------
-- Read data from file using OPENROWSET
---------------------------------------
SELECT 
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'revenue',
        DATA_SOURCE = 'raw_ext_src',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        HEADER_ROW = TRUE
    ) AS [result];

---------------------------------------
-- Create external file format csv
---------------------------------------
DROP EXTERNAL FILE FORMAT csv_format;

CREATE EXTERNAL FILE FORMAT csv_format
WITH (
    FORMAT_TYPE = DELIMITEDTEXT,
    FORMAT_OPTIONS (
        FIELD_TERMINATOR = ',',
        FIRST_ROW = 2  -- Skip header row
    )
);


---------------------------------------
-- Create external file format parquet
---------------------------------------
CREATE EXTERNAL FILE FORMAT parquet_format
WITH(
    FORMAT_TYPE = PARQUET
);

CREATE EXTERNAL FILE FORMAT parquet_format2
WITH (
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);









