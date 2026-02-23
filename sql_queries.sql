CREATE DATABASE online_retail_db;
USE Online_retail_db;
 CREATE TABLE online_retail (InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID INT,
    Country VARCHAR(50)
);
SELECT * FROM online_retail
LIMIT 50;
SET SQL_SAFE_UPDATES =0;
 DELETE FROM online_retail
WHERE InvoiceNo LIKE 'C%';
 DELETE FROM online_retail
WHERE Quantity <= 0 OR UnitPrice <= 0;
 SELECT *
FROM online_retail
WHERE Country = 'United Kingdom'
ORDER BY CustomerID DESC;

SELECT 
SUM(Quantity * UnitPrice ) AS total_revenue 
from online_retail;

SELECT 
AVG(Quantity * UnitPrice )AS avg_order_value
FROM online_retail;


SELECT 
Country,
SUM(Quantity * UnitPrice) AS revenue 
FROM online_retail
GROUP BY Country 
ORDER BY revenue DESC;


SELECT 
country, 
SUM(Quantity * UnitPrice) AS revenue 
FROM online_retail
GROUP BY country 
HAVING REVENUE >1000000;

SELECT 
CUSTOMERID,
SUM(Quantity* UnitPrice) AS total_revenue
FROM 
online_retail
WHERE 
CustomerID IS NOT NULL 
GROUP BY 
CustomerID;

SELECT CustomerID, total_spent
FROM (
    SELECT 
        CustomerID,
        SUM(Quantity * UnitPrice) AS total_spent
    FROM online_retail
    WHERE CustomerID IS NOT NULL
    GROUP BY CustomerID
) t
WHERE total_spent > (
    SELECT 
        AVG(Quantity * UnitPrice)
    FROM online_retail
);

SELECT 
    COALESCE(CustomerID, 0) AS customer_id,
    COUNT(*) AS total_orders
FROM online_retail
GROUP BY customer_id;

SELECT 
    SUM(Quantity * UnitPrice) / COUNT(DISTINCT CustomerID) AS avg_revenue_per_user
FROM 
    online_retail
WHERE 
    CustomerID IS NOT NULL;
    
    CREATE INDEX idx_customer_id
ON online_retail(CustomerID);
