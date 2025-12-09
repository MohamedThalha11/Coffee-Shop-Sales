# Coffee Shop Sales Analysis – MySQL & Power BI

## Problem Statement
A multi‑location coffee shop wants to understand its sales performance across stores, products, and time in order to increase revenue and improve operational efficiency. Currently, management receives only raw Excel reports and cannot quickly see which products, stores, or time periods drive the most sales or where there are opportunities to optimize.

## Objective
- Clean and structure raw transactional data in a relational database.  
- Build an interactive Power BI dashboard that tracks key KPIs such as Total Sales, Total Orders, and Total Quantity Sold.  
- Identify patterns by store location, product category, day of week, and hour of day to support data‑driven decisions.

## My Role
- Designed the end‑to‑end analytics workflow from data ingestion to dashboard.  
- Performed data cleaning and transformation in MySQL (data types, calculated columns, aggregations).  
- Modeled the data in Power BI and created visuals, measures, and page‑level interactions.  
- Documented business logic, assumptions, and insights for non‑technical stakeholders.

## Tools Used
- **MySQL** – data cleaning, transformations, and KPI aggregations.  
- **Power BI** – data modeling, DAX measures, and interactive visuals.  
- **Excel** – source file exploration and initial understanding of fields.

## Dataset Summary
- Transaction‑level dataset for a coffee shop chain for the year 2023.  
- Each row represents one line of sale with:
  - Transaction details: `transaction_id`, `transaction_date`, `transaction_time`, `transaction_qty`.  
  - Store information: `store_id`, `store_location`.  
  - Product information: `product_id`, `product_category`, `product_type`, `product_detail`.  
  - Financials: `unit_price`, from which revenue is derived.  
- After cleaning, date and time fields are stored in proper `DATE` and `TIME` formats and prices in `DECIMAL`.

## Key Insights & Business Impact
- Identified best‑performing stores and product categories contributing the highest share of revenue.  
- Highlighted peak sales days and hours, showing when customer traffic is strongest and when staff and inventory need to be optimized.  
- Revealed differences between weekday and weekend performance, supporting targeted promotions and staffing strategies.  
- Detected above‑average and below‑average sales days in a month, useful for investigating campaigns, holidays, or operational issues.

## Metrics, DAX Measures, and Analytical Logic
Core metrics used in the dashboard:

- **Total Sales** = sum of `unit_price * transaction_qty`.  
- **Total Orders** = count of `transaction_id`.  
- **Total Quantity Sold** = sum of `transaction_qty`.  
- **Average Daily Sales** = average of daily Total Sales for a selected month.  
- **Month‑on‑Month (MoM) % Change** for Sales, Orders, and Quantity:  
  - \((CurrentMonthValue − PreviousMonthValue) / PreviousMonthValue\) expressed as a percentage.  
- **Weekday vs Weekend Sales**:  
  - Transactions are tagged as “Weekday” or “Weekend” using the day of week, then aggregated by Total Sales.  
- **Sales Status (Above/Below Average)**:  
  - For a given month, each day’s sales are compared to the overall monthly average and classified as Above Average, Below Average, or Equal to Average.  
- **Sales by Time**:  
  - Hourly aggregation of sales to build a heatmap of sales by Day of Week and Hour of Day.

In Power BI, these metrics are implemented as measures and used across cards, bar charts, donut charts, and heatmaps to drive consistent logic across all visuals.

## What Decisions Can Be Made from the Findings
- **Staffing & Scheduling**: Adjust staff levels during peak hours and days to reduce wait times and improve customer experience.  
- **Product Strategy**: Focus marketing and upselling on top‑performing products and categories; evaluate and redesign or discontinue consistently under‑performing items.  
- **Store Operations**: Benchmark low‑performing stores against high‑performing ones to replicate successful practices.  
- **Promotions & Pricing**: Plan promotions for low‑traffic periods (slow days/hours) and evaluate their impact using MoM metrics.  
- **Inventory Management**: Align purchasing and inventory levels with demand patterns by store, product, and time.

## Business Problems Addressed
- Limited visibility into overall sales performance by store, product, and time period.
- No easy way to track how monthly sales, orders, and quantity are changing over time.
- Difficulty identifying peak and off‑peak hours for better staffing and inventory planning.
- Lack of clear insights into which products and categories drive the most revenue.
- Manual, time‑consuming reporting from Excel with no single interactive view for managers.

## Learning Outcomes
- Applied SQL window functions and aggregations to build business KPIs.
- Designed an end‑to‑end pipeline from Excel → MySQL → Power BI dashboard.
- Created intuitive visuals such as calendar heatmaps, weekday/weekend splits, and time‑of‑day analysis.
- Practiced documenting assumptions, metrics, and decisions for business stakeholders.

## Contact

If you’d like to discuss this project or potential opportunities, feel free to reach out:

- LinkedIn: www.linkedin.com/in/mohamed-thalha-8b6a18267
- Email: mohamedthalha110@gmail.com
