DROP VIEW gold.total_sales_per_store;
CREATE VIEW gold.v_total_sales_per_store
AS
SELECT
    store_name,
    store_type,
    location,
    ROUND(SUM(total_amount), 2) AS total_sales
FROM
    gold.stores store
        JOIN
    gold.sales sale ON store.store_sk = sale.store_sk
GROUP BY store_name, store_type, location;


SELECT * FROM gold.v_total_sales_per_store;