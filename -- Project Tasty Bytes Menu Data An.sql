-- Project: Tasty Bytes Menu Data Analysis
-- Lesson: 20
-- Tools: Snowflake SQL
-- ======================================================

-- 1. ENVIRONMENT SETUP
-- Setting up the administrative context and selecting the workspace
USE ROLE ACCOUNTADMIN;
CREATE DATABASE IF NOT EXISTS TRAINING_DA;
CREATE SCHEMA IF NOT EXISTS TRAINING_DA.LESSON20;
USE SCHEMA TRAINING_DA.LESSON20;

-- 2. DATA LOADING (Step 4 from Lecture)
-- Loading raw data from AWS S3 bucket into the Menu table
COPY INTO menu
FROM @blob_stage/raw_pos/menu/;

--3.
--Task 1
    - — Basic Validations -- How many rows?
SELECT
    COUNT(*)
FROM
    MENU;
    --How many unique menu items exist?
SELECT
    COUNT(DISTINCT menu_item_name)
FROM
    menu;
--How many unique truck_brand_name values are in the table?
SELECT
    COUNT(DISTINCT truck_brand_name)
FROM
    menu;
-- 4.
    -Task 2 — Filtering with
WHERE
    -- Return all menu items sold by the brand ‘Freezing Point’.
SELECT
    *
FROM
    menu
WHERE
    truck_brand_name = 'Freezing Point';
    --Show all menu items where the sale price is greater than $10.
SELECT
    *
FROM
    menu
WHERE
    sale_price_usd > 10;
-- Show items where cost_of_goods_usd > 3.
SELECT
    *
FROM
    menu
WHERE
    cost_of_goods_usd > 3;
    --Return only items that belong to item_category = 'Dessert'.
SELECT
    *
FROM
    menu
WHERE
    item_category = 'Desert';

-- 5. 
-- Task 3
    -- Calculated Columns -- For each item, calculate profit_usd = sale_price_usd - cost_of_goods_usd
    -- (Return columns: menu_item_name,
    -- sale_price_usd,
    -- cost_of_goods_usd,
    -- profit_usd)
SELECT
    menu_item_name,
    sale_price_usd,
    cost_of_goods_usd,
    (sale_price_usd - cost_of_goods_usd) AS profit_usd
FROM
    menu;
-- Return only the items where profit_usd > 2.
SELECT
    menu_item_name,
    sale_price_usd,
    cost_of_goods_usd,
    (sale_price_usd - cost_of_goods_usd) AS profit_usd
FROM
    menu
WHERE(sale_price_usd - cost_of_goods_usd) > 2;

-- 6. 
Task 4
    - — Sorting(
        ORDER BY
    ) --Show all menu items ordered by sale_price_usd DESC.
SELECT
    menu_item_name,
    sale_price_usd,
    cost_of_goods_usd,
    (sale_price_usd - cost_of_goods_usd) AS profit_usd
FROM
    menu
ORDER BY
    sale_price_usd DESC;
    -- Show all items ordered by profit_usd ASC.
SELECT
    menu_item_name,
    sale_price_usd,
    cost_of_goods_usd,
    (sale_price_usd - cost_of_goods_usd) AS profit_usd
FROM
    menu
ORDER BY
    sale_price_usd ASC;

-- 7.
     --Task 5
    - — TOP &
LIMIT
    --Show the top 5 most expensive menu items.
SELECT
    *
FROM
    menu
ORDER BY
    sale_price_usd DESC
LIMIT
    5;
-- Show the top 3 items with the highest profit.
SELECT
    menu_item_name,
    sale_price_usd,
    cost_of_goods_usd,
    (sale_price_usd - cost_of_goods_usd) AS profit_usd
FROM
    menu
ORDER BY
    profit_usd DESC
LIMIT
    3;
 SELECT
    *,(sale_price_usd - cost_of_goods_usd) AS profit_usd
FROM
    menu;

