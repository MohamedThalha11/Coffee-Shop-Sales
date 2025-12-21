# Coffee Shop Sales Analysis – MySQL & Power BI

## Problem Statement
A multi-location coffee shop chain needs to understand its sales performance beyond static Excel reports, which do not clearly answer questions about top-performing stores/products, peak hours, and month-over-month trends.

## Objective
- Clean and structure raw transactional data in MySQL.
- Build an interactive Power BI dashboard that tracks core KPIs for fast decision-making.
- Identify sales patterns by store location, product category, and time (hour/day/month).
- Support operational improvements in staffing, inventory, and promotions.

## My Role
- Designed the end-to-end analytics workflow from data ingestion to dashboard delivery.
- Performed data cleaning and transformations in MySQL (data types, formats, calculations).
- Modeled the data in Power BI and created measures (DAX) and interactive visuals.
- Documented business logic, assumptions, and insights for non-technical stakeholders.

## Tools Used
- **MySQL**: Data cleaning, transformations, aggregations.
- **Power BI**: Data modeling, DAX measures, dashboard creation.
- **Excel**: Initial exploration and understanding of fields/data quality.

## Dataset Summary
Transaction-level dataset for a coffee shop chain (2023). Each row represents one line of sale.

Included fields:
- Transaction details: transaction_id, transaction_date, transaction_time, transaction_qty
- Store details: store_id, store_location
- Product details: product_id, product_category, product_type, product_detail
- Financials: unit_price (used to derive revenue)

Data preparation:
- Converted date/time fields into proper DATE and TIME formats.
- Stored prices as DECIMAL to maintain financial accuracy.

## Key KPIs
- Total Sales
- Total Orders
- Total Quantity Sold
- Average Daily Sales
- Month-on-Month (MoM) % Change

## Metrics and Business Logic
- Total Sales = unit_price × transaction_qty
- Total Orders = COUNT(transaction_id)
- Total Quantity Sold = SUM(transaction_qty)
- Average Daily Sales = Average of daily total sales (for selected month)
- MoM % Change = (Current Month − Previous Month) / Previous Month
- Weekday/Weekend classification using day of week
- Hourly aggregation used to identify peak demand periods

## Analysis Performed
- Sales performance by store location
- Revenue contribution by product category
- Monthly sales trends and MoM change
- Weekday vs weekend sales comparison
- Hourly and daily sales patterns
- Identification of above-average and below-average sales days

## Key Insights
- A small number of stores and product categories drive a large portion of total revenue.
- Clear peak hours and peak days exist across locations.
- Weekend vs weekday sales patterns differ significantly.
- Monthly trends highlight seasonality and demand shifts.

## Business Impact
- Optimizes staffing during peak hours.
- Improves inventory planning by store and product.
- Supports targeted promotions during low-traffic periods.
- Replaces manual Excel reporting with a single interactive dashboard.

## Deliverables
- Power BI interactive dashboard
- MySQL queries for data cleaning and aggregation
- Documented KPIs, assumptions, and insights

## Contact
Mohamed Thalha  
Email: mohamedthal110@gmail.com  
LinkedIn: https://www.linkedin.com/in/mohamed-thalha-8b6a18267
