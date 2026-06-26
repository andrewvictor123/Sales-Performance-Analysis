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





SELECT 
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM superstore_dataset;

SELECT 
    YEAR(Order_Date) AS Order_Year,
    ROUND(SUM(Sales), 2) AS Yearly_Sales
FROM superstore_dataset
GROUP BY YEAR(Order_Date)
ORDER BY Order_Year;

SELECT TOP 5 
    Category, 
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore_dataset
GROUP BY Category
ORDER BY Total_Profit DESC;

SELECT TOP 5
    Country,
    ROUND(SUM(Sales), 2) AS Total_Sales
FROM superstore_dataset
GROUP BY Country
ORDER BY Total_Sales DESC

SELECT 
    ROUND(Discount, 2) AS Discount, 
    ROUND(AVG(Profit), 2) AS Average_Profit
FROM superstore_dataset
GROUP BY Discount
ORDER BY Discount;





SELECT 
    [Row_ID],
    [Order_ID],
    TRY_CAST([Order_Date] AS DATE) AS [Order_Date], 
    TRY_CAST([Ship_Date] AS DATE) AS [Ship_Date],
    [Ship_Mode],
    [Customer_ID],
    [Customer_Name],
    [Segment],
    [City],
    [State],
    [Country],
    [Postal_Code],
    [Market],
    [Region],
    [Product_ID],
    [Category],
    [Sub_Category],
    [Product_Name],
    [Sales],
    [Quantity],
    [Discount],
    [Profit],
    [Shipping_Cost],
    [Order_Priority]
FROM superstore_dataset;