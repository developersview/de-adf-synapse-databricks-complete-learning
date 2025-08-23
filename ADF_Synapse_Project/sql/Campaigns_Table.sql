------------------
-- Create Schema
-------------------
CREATE SCHEMA gold;
------------------
-- Campaigns Table
-------------------
DROP TABLE gold.campaigns;
CREATE TABLE gold.campaigns(
    campaign_sk INT,
    campaign_id VARCHAR(100),
    campaign_name VARCHAR(100),
    start_date_sk INT,
    end_date_sk INT,
    campaign_budget INT
)
WITH(
    DISTRIBUTION = ROUND_ROBIN
);

--load data using COPY INTO
COPY INTO gold.campaigns(
    campaign_sk 1,
    campaign_id 2,
    campaign_name 3,
    start_date_sk 4 ,
    end_date_sk 5,
    campaign_budget 6    
)
FROM 'https://pranoyadlsgen2.dfs.core.windows.net/retail-gold/Campaigns'
WITH(
    FILE_TYPE = 'PARQUET',
    CREDENTIAL = (IDENTITY= 'Managed Identity')
); 

-- Read Data
SELECT * FROM gold.campaigns;