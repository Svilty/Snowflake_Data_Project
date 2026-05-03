# Tasty Bytes: Food Truck Menu Analytics Project

## 📌 Project Overview
This project focuses on analyzing menu data for the "Tasty Bytes" food truck network using **Snowflake SQL** and **Power BI**. The goal was to perform data validation, calculate key financial metrics (profitability), and identify top-performing menu items to support data-driven business decisions.

## 🛠️ Tech Stack
* **Database Management:** Snowflake (SQL)
* **Data Visualization:** Power BI Desktop
* **Environment:** Snowflake Web UI (Snowsight)

## 📑 Analytical Workflow

### 1. Database Setup & Data Ingestion
* Configured administrative roles and created a dedicated environment (`TRAINING_DA.LESSON20`).
* Automated data loading from **AWS S3** cloud storage into Snowflake tables using the `COPY INTO` command.

### 2. Exploratory Data Analysis (SQL)
Using the `script.sql` file, I performed the following operations:
* **Data Validation:** Counted total records and unique brands to ensure data integrity.
* **Filtering:** Segmented data by brand (e.g., 'Freezing Point') and category ('Dessert') to analyze specific niche performances.
* **Financial Calculation:** Created a calculated field `profit_usd` using the formula:  
    $$profit\_usd = sale\_price\_usd - cost\_of\_goods\_usd$$
* **Performance Ranking:** Applied `ORDER BY` and `LIMIT` clauses to identify the Top 5 most expensive items and Top 3 most profitable products.

### 3. Visual Analysis (Power BI)
* Integrated the processed CSV data into Power BI.
* Built a dashboard to visualize item distribution by category and pricing trends.
* Created interactive slicers for brand-specific analysis.

## 📁 Repository Structure
* `lesson_20_final.sql` — Full SQL script with all analytical queries (Tasks 1-5).
* `TastyBytes_Final.pbix` — Interactive Power BI dashboard.
* `final_menu_data.csv` — The dataset exported from Snowflake used for reporting.
* `dashboard_preview.png` — Visual preview of the analytical dashboard.

---
**Author:** Student Support Assistant / Data Analyst in training
**Date:** May 2026
