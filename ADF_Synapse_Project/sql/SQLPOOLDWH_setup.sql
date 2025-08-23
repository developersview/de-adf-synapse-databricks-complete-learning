CREATE MASTER KEY ENCRYPTION BY PASSWORD= 'Password@123';

--------------------
-- create credential
--------------------
CREATE DATABASE SCOPED CREDENTIAL pranoycredential
WITH IDENTITY = 'Managed Identity';

------------------------
-- External Data Source
------------------------
DROP EXTERNAL DATA SOURCE retail_gold_src;
CREATE EXTERNAL DATA SOURCE retail_gold_src
WITH(
    LOCATION = 'abfss://retail-gold@pranoyadlsgen2.dfs.core.windows.net',
    CREDENTIAL = pranoycredential
       
);

---------------------------------------
-- Create external file format parquet
---------------------------------------
CREATE EXTERNAL FILE FORMAT parquet_format
WITH (
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);
