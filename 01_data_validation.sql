-- FILE: 01_data_validation.sql
-- DESCRIPTION: Performs data quality validation checks
-- ==============================================================

USE mintclassics;

-- 1. Check for NULL values in key tables
SELECT 'products' AS table_name,
    SUM(CASE WHEN productName IS NULL THEN 1 ELSE 0 END) AS null_product_name,
    SUM(CASE WHEN quantityInStock IS NULL THEN 1 ELSE 0 END) AS null_stock,
    SUM(CASE WHEN warehouseCode IS NULL THEN 1 ELSE 0 END) AS null_warehouse
FROM products;

SELECT 'payments' AS table_name,
    SUM(CASE WHEN customerNumber IS NULL THEN 1 ELSE 0 END) AS null_customer,
    SUM(CASE WHEN amount IS NULL THEN 1 ELSE 0 END) AS null_amount,
    SUM(CASE WHEN paymentDate IS NULL THEN 1 ELSE 0 END) AS null_payment_date
FROM payments;

-- 2. Orders shipped late or with inconsistent dates
SELECT orderNumber, orderDate, requiredDate, shippedDate
FROM orders
WHERE shippedDate > requiredDate
   OR shippedDate < orderDate
   OR requiredDate < orderDate;

-- 3. Products with zero inventory or invalid pricing
SELECT productName, quantityInStock, buyPrice, MSRP
FROM products
WHERE quantityInStock = 0
   OR buyPrice = 0
   OR MSRP = 0;

-- 4. Payments with zero or negative amounts
SELECT *
FROM payments
WHERE amount <= 0;