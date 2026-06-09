-- Create DATABASE DecodeLabs;

/*
CREATE TABLE dataset (
    `OrderID` VARCHAR(20),
    `Date` DATE,
    `CustomerID` VARCHAR(20),
    `Product` VARCHAR(100),
    `Quantity` INT,
    `UnitPrice` DECIMAL(10,2),
    `ShippingAddress` VARCHAR(255),
    `PaymentMethod` VARCHAR(50),
    `OrderStatus` VARCHAR(50),
    `TrackingNumber` VARCHAR(30),
    `ItemsInCart` INT,
    `CouponCode` VARCHAR(20),
    `ReferralSource` VARCHAR(50),
    `TotalPrice` DECIMAL(10,2),
    `TotalPriceAfterCoupon` DECIMAL(10,2)
);
*/

UPDATE dataset
SET TotalPriceAfterCoupon = 
    CASE 
        WHEN CouponCode = 'SAVE10' THEN (Quantity * UnitPrice) * 0.90
        WHEN CouponCode = 'WINTER15' THEN (Quantity * UnitPrice) * 0.85
        ELSE (Quantity * UnitPrice)
    END;
    
    
-- SHOW DATASET
SELECT *
FROM dataset;

-- Display Specific Columns
SELECT OrderID,
       Product,
       Quantity,
       TotalPrice
FROM dataset;

-- Filter orders above PKR 1000
SELECT *
FROM dataset
WHERE TotalPrice > 1000;

-- Find All Laptop Orders
SELECT *
FROM dataset
WHERE Product = 'Laptop';

-- Show delivered orders only
SELECT *
FROM dataset
WHERE OrderStatus = 'Delivered';

-- Sort Revenue Highest to Lowest
SELECT Product,
       TotalPrice
FROM dataset
ORDER BY TotalPrice DESC;

-- Sort Orders by Date
SELECT *
FROM dataset
ORDER BY Date ASC;

-- Count Total Orders
SELECT COUNT(*) AS TotalOrders
FROM dataset;

-- Count Orders by Product
SELECT Product,
       COUNT(*) AS NumberOfOrders
FROM dataset
GROUP BY Product;

-- Total Revenue by Product
SELECT Product,
       SUM(TotalPriceAfterCoupon) AS Revenue
FROM dataset
GROUP BY Product
ORDER BY Revenue DESC;

-- Average Revenue per Product
SELECT Product,
       AVG(TotalPriceAfterCoupon) AS AverageRevenue
FROM dataset
GROUP BY Product
ORDER BY AverageRevenue DESC;

-- Revenue by Payment Method
SELECT PaymentMethod,
       SUM(TotalPriceAfterCoupon) AS Revenue
FROM dataset
GROUP BY PaymentMethod
ORDER BY Revenue DESC;

-- Count Orders by Payment Method
SELECT PaymentMethod,
       COUNT(*) AS Orders
FROM dataset
GROUP BY PaymentMethod;

-- Revenue by Refferal Source
SELECT ReferralSource,
       SUM(TotalPriceAfterCoupon) AS Revenue
FROM dataset
GROUP BY ReferralSource
ORDER BY Revenue DESC;

-- Orders by Referral Source
SELECT ReferralSource,
       COUNT(*) AS Orders
FROM dataset
GROUP BY ReferralSource
ORDER BY Orders DESC;

-- Revenue by Order Status
SELECT OrderStatus,
       SUM(TotalPriceAfterCoupon) AS Revenue
FROM dataset
GROUP BY OrderStatus;

-- Count Order by Status
SELECT OrderStatus,
       COUNT(*) AS Orders
FROM dataset
GROUP BY OrderStatus;

-- Top 5 highest value orders
SELECT OrderID,
       Product,
       TotalPriceAfterCoupon
FROM dataset
ORDER BY TotalPriceAfterCoupon DESC
LIMIT 5;

-- Average Order Value
SELECT AVG(TotalPriceAfterCoupon) AS AverageOrderValue
FROM dataset;

-- Total Business Revenue
SELECT SUM(TotalPriceAfterCoupon) AS TotalRevenue
FROM dataset;

