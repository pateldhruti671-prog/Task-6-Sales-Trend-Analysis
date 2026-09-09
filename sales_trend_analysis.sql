-- =====================================================
-- Task 6: Sales Trend Analysis Using Aggregations
-- Dataset: online_sales_dataset
-- Database: online_sales
-- =====================================================

USE online_sales;


-- 1. Check the imported data
SELECT
    InvoiceNo,
    Quantity,
    InvoiceDate,
    UnitPrice,
    Discount
FROM online_sales_dataset
LIMIT 10;


-- 2. Monthly Revenue and Order Volume
SELECT
    DATE_FORMAT(
        STR_TO_DATE(InvoiceDate, '%Y-%m-%d %H:%i:%s'),
        '%Y-%m'
    ) AS month,

    ROUND(SUM(Quantity * UnitPrice), 2) AS monthly_revenue,

    COUNT(DISTINCT InvoiceNo) AS order_volume

FROM online_sales_dataset

GROUP BY
    DATE_FORMAT(
        STR_TO_DATE(InvoiceDate, '%Y-%m-%d %H:%i:%s'),
        '%Y-%m'
    )

ORDER BY
    month;


-- 3. Top 3 Months by Sales
SELECT
    DATE_FORMAT(
        STR_TO_DATE(InvoiceDate, '%Y-%m-%d %H:%i:%s'),
        '%Y-%m'
    ) AS month,

    ROUND(SUM(Quantity * UnitPrice), 2) AS monthly_revenue

FROM online_sales_dataset

GROUP BY
    DATE_FORMAT(
        STR_TO_DATE(InvoiceDate, '%Y-%m-%d %H:%i:%s'),
        '%Y-%m'
    )

ORDER BY
    monthly_revenue DESC

LIMIT 3;