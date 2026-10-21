-- Retail Sales Analytics | SQLite analysis
-- Source: UCI Online Retail, imported as table online_retail
-- UnitPrice in the raw semicolon-separated CSV uses a comma decimal separator.
-- All financial metrics use original GBP prices, provided no currency conversion was applied.
-- Consistent inclusion rules: positive quantity, positive unit price, non-cancelled invoice.
-- Note: Missing CustomerID is excluded from the unique-customer count.

-- 1. Raw data overview
SELECT COUNT(*) AS raw_records
FROM online_retail;

-- 2. Data-quality overview (raw data)
SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN Quantity <= 0 THEN 1 ELSE 0 END) AS nonpositive_quantity_rows,
    SUM(CASE WHEN CAST(REPLACE(UnitPrice, ',', '.') AS REAL) <= 0 THEN 1 ELSE 0 END) AS nonpositive_price_rows,
    SUM(CASE WHEN InvoiceNo LIKE 'C%' THEN 1 ELSE 0 END) AS cancellation_rows,
    SUM(CASE WHEN CustomerID IS NULL OR TRIM(CAST(CustomerID AS TEXT)) = '' THEN 1 ELSE 0 END) AS missing_customer_rows
FROM online_retail;

-- 3. Preview qualifying sales records (not a saved or exported cleaned dataset)
SELECT
    InvoiceNo, StockCode, Description, Quantity, InvoiceDate,
    CAST(REPLACE(UnitPrice, ',', '.') AS REAL) AS UnitPrice,
    CustomerID, Country,
    ROUND(Quantity * CAST(REPLACE(UnitPrice, ',', '.') AS REAL), 2) AS Revenue
FROM online_retail
WHERE Quantity > 0
  AND InvoiceNo NOT LIKE 'C%'
  AND CAST(REPLACE(UnitPrice, ',', '.') AS REAL) > 0
LIMIT 10;

-- 4. Cleaned record count, units sold, and revenue
SELECT
    COUNT(*) AS sales_records,
    SUM(Quantity) AS units_sold,
    ROUND(SUM(Quantity * CAST(REPLACE(UnitPrice, ',', '.') AS REAL)), 2) AS total_revenue
FROM online_retail
WHERE Quantity > 0
  AND InvoiceNo NOT LIKE 'C%'
  AND CAST(REPLACE(UnitPrice, ',', '.') AS REAL) > 0;

-- 5. Total distinct orders
SELECT COUNT(DISTINCT InvoiceNo) AS total_orders
FROM online_retail
WHERE Quantity > 0
  AND InvoiceNo NOT LIKE 'C%'
  AND CAST(REPLACE(UnitPrice, ',', '.') AS REAL) > 0;

-- 6. Total distinct known customers (excludes blank / null CustomerID)
SELECT COUNT(DISTINCT NULLIF(TRIM(CAST(CustomerID AS TEXT)), '')) AS known_customers
FROM online_retail
WHERE Quantity > 0
  AND InvoiceNo NOT LIKE 'C%'
  AND CAST(REPLACE(UnitPrice, ',', '.') AS REAL) > 0;

-- 7. Average order value (GBP)
SELECT ROUND(
    SUM(Quantity * CAST(REPLACE(UnitPrice, ',', '.') AS REAL))
    / NULLIF(COUNT(DISTINCT InvoiceNo), 0), 2
) AS average_order_value
FROM online_retail
WHERE Quantity > 0
  AND InvoiceNo NOT LIKE 'C%'
  AND CAST(REPLACE(UnitPrice, ',', '.') AS REAL) > 0;

-- 8. Top countries by number of qualifying line records
SELECT Country, COUNT(*) AS sales_records
FROM online_retail
WHERE Quantity > 0
  AND InvoiceNo NOT LIKE 'C%'
  AND CAST(REPLACE(UnitPrice, ',', '.') AS REAL) > 0
GROUP BY Country
ORDER BY sales_records DESC
LIMIT 10;

-- 9. Top countries by total revenue
SELECT Country,
       ROUND(SUM(Quantity * CAST(REPLACE(UnitPrice, ',', '.') AS REAL)), 2) AS total_revenue
FROM online_retail
WHERE Quantity > 0
  AND InvoiceNo NOT LIKE 'C%'
  AND CAST(REPLACE(UnitPrice, ',', '.') AS REAL) > 0
GROUP BY Country
ORDER BY total_revenue DESC
LIMIT 10;

-- 10. Top products by quantity
SELECT Description AS product, SUM(Quantity) AS units_sold
FROM online_retail
WHERE Quantity > 0
  AND InvoiceNo NOT LIKE 'C%'
  AND CAST(REPLACE(UnitPrice, ',', '.') AS REAL) > 0
  AND Description IS NOT NULL AND TRIM(Description) <> ''
GROUP BY Description
ORDER BY units_sold DESC
LIMIT 10;

-- 11. Top descriptions by revenue, matching dashboard exclusion of DOTCOM POSTAGE
-- Other non-product descriptions (e.g. POSTAGE and Manual) may remain.
SELECT Description AS item,
       ROUND(SUM(Quantity * CAST(REPLACE(UnitPrice, ',', '.') AS REAL)), 2) AS total_revenue
FROM online_retail
WHERE Quantity > 0
  AND InvoiceNo NOT LIKE 'C%'
  AND CAST(REPLACE(UnitPrice, ',', '.') AS REAL) > 0
  AND Description IS NOT NULL AND TRIM(Description) <> ''
  AND Description <> 'DOTCOM POSTAGE'
GROUP BY Description
ORDER BY total_revenue DESC
LIMIT 10;

-- 12. Monthly sales revenue: InvoiceDate is DD.MM.YYYY HH:MM as imported from CSV
SELECT
    SUBSTR(InvoiceDate, 7, 4) || '-' || SUBSTR(InvoiceDate, 4, 2) AS year_month,
    ROUND(SUM(Quantity * CAST(REPLACE(UnitPrice, ',', '.') AS REAL)), 2) AS monthly_revenue
FROM online_retail
WHERE Quantity > 0
  AND InvoiceNo NOT LIKE 'C%'
  AND CAST(REPLACE(UnitPrice, ',', '.') AS REAL) > 0
GROUP BY year_month
ORDER BY year_month;
