-- Dedicated SQL POOL
--------------------
-- create credential
--------------------
CREATE DATABASE SCOPED CREDENTIAL pranoycreds
WITH IDENTITY = 'Managed Identity';

------------------------
-- External Data Source
------------------------
DROP EXTERNAL DATA SOURCE raw_ext_src;
CREATE EXTERNAL DATA SOURCE raw_ext_src
WITH(
    LOCATION = 'https://pranoyadlsgen2.dfs.core.windows.net/rawsyn',
    CREDENTIAL = pranoycreds    
);

DROP EXTERNAL DATA SOURCE raw_ext_src2;
CREATE EXTERNAL DATA SOURCE raw_ext_src2
WITH(
    LOCATION = 'abfss://rawsyn@pranoyadlsgen2.dfs.core.windows.net',
    CREDENTIAL = pranoycreds    
);

---------------------------------------
-- Create external file format parquet
---------------------------------------
CREATE EXTERNAL FILE FORMAT parquet_format2
WITH (
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);
