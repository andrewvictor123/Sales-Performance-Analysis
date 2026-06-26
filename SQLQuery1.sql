create database reporting_project_01
use reporting_project_01

SELECT * FROM superstore_dataset

SELECT COUNT(*) AS total_rows,
       SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS null_profits
FROM superstore_dataset;

UPDATE superstore_dataset
SET Profit = 0
WHERE Profit IS NULL;

ALTER TABLE superstore_dataset ADD Order_Date_Fixed DATE;

UPDATE superstore_dataset
SET Order_Date_Fixed = TRY_CAST(Order_Date AS DATE);

UPDATE superstore_dataset
SET Order_Date_Fixed = CONVERT(DATE, Order_Date, 103);

SELECT TOP 10 Order_Date, Order_Date_Fixed 
FROM superstore_dataset;

ALTER TABLE superstore_dataset
DROP COLUMN Order_Date;

EXEC sp_rename 'superstore_dataset.Order_Date_Fixed', 'Order_Date', 'COLUMN';