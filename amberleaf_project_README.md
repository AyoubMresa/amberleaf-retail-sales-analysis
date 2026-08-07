# Amberleaf Retail Sales Analysis

An end-to-end retail analytics project using **Python, MySQL and Power BI**. I cleaned and explored the order data in Python, loaded the prepared dataset into MySQL, answered business questions with SQL, and built an interactive Power BI dashboard.

## Tools
- Python: Pandas, Matplotlib, SQLAlchemy
- MySQL
- Power BI

## Workflow
- Checked missing values, duplicates, data types and inconsistent values.
- Replaced invalid unit prices using the mean valid price for the same product.
- Imputed missing review ratings using the median rating for each product.
- Standardised category and product names and created revenue/date features.
- Loaded the cleaned dataset into MySQL.
- Used SQL for aggregation, CTEs, `CASE WHEN`, subqueries and window functions.
- Analysed revenue by category, high-value customers, top products, customer tiers and return rates by sales channel.
- Built a Power BI dashboard with revenue/order KPIs, monthly and regional comparisons, slicers and month-over-month revenue comparison.

## Files
- `exploratory_analysis+ data_cleaning.ipynb` — data cleaning and exploratory analysis
- `Customers_orders_insights.sql` — SQL business analysis
- `customers_orders_dashboard.pbix` — interactive Power BI dashboard
