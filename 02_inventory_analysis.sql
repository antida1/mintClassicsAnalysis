-- FILE: 02_inventory_analysis.sql
-- DESCRIPTION: Performs a detailed inventory and warehouse analysis
-- ==============================================================================

/* Inventory by warehouse */
SELECT
    w.warehouseName,
    w.warehousePctCap,
    SUM(p.quantityInStock) AS total_stock
FROM warehouses w
JOIN products p
    ON w.warehouseCode = p.warehouseCode
GROUP BY w.warehouseName, w.warehousePctCap
ORDER BY total_stock DESC;


/* Low-stock products */
SELECT
    p.productName,
    p.quantityInStock,
    w.warehouseName
FROM products p
JOIN warehouses w
    ON p.warehouseCode = w.warehouseCode
WHERE p.quantityInStock < 1000
ORDER BY p.quantityInStock ASC;


/* Current stock versus total units sold */
SELECT
    p.productName,
    p.quantityInStock AS current_stock,
    SUM(od.quantityOrdered) AS total_sold,
    p.quantityInStock - SUM(od.quantityOrdered) AS inventory_difference
FROM products p
JOIN orderdetails od
    ON p.productCode = od.productCode
GROUP BY p.productName, p.quantityInStock
ORDER BY inventory_difference ASC;


/* Products with negative inventory balance (critical stock shortage) */
SELECT
    p.productName,
    w.warehouseName,
    p.quantityInStock AS current_stock,
    SUM(od.quantityOrdered) AS total_sold,
    p.quantityInStock - SUM(od.quantityOrdered) AS inventory_difference
FROM products p
JOIN orderdetails od
    ON p.productCode = od.productCode
JOIN warehouses w
    ON p.warehouseCode = w.warehouseCode
GROUP BY p.productName, w.warehouseName, p.quantityInStock
HAVING inventory_difference < 0
ORDER BY inventory_difference ASC;


/* Number of products in deficit by warehouse and total deficit */
SELECT
    warehouseName,
    COUNT(*) AS products_in_deficit,
    SUM(inventory_difference) AS total_deficit
FROM (
    SELECT
        w.warehouseName,
        p.productName,
        p.quantityInStock - SUM(od.quantityOrdered) AS inventory_difference
    FROM products p
    JOIN orderdetails od
        ON p.productCode = od.productCode
    JOIN warehouses w
        ON p.warehouseCode = w.warehouseCode
    GROUP BY w.warehouseName, p.productName, p.quantityInStock
    HAVING inventory_difference < 0
) AS deficit
GROUP BY warehouseName
ORDER BY total_deficit ASC;