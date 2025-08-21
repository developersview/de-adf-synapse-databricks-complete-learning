-- Serverless SQL POOL
-------------
-- Views
--------------
CREATE SCHEMA apex_view;

CREATE VIEW apex_view.revenue_view
AS
SELECT
    *
FROM
    OPENROWSET(
        BULK 'revenue_cetas',
        DATA_SOURCE = 'raw_ext_src',
        FORMAT = 'PARQUET'
    ) AS [result];

SELECT * FROM apex_view.revenue_view;