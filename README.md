# Retail Sales Analytics | Interactive Dashboard

### Retail Data Analysis & Business Intelligence Portfolio Project

An end-to-end retail analytics portfolio project focused on exploring transactional sales data, analyzing business performance, and presenting insights through an interactive Google Looker Studio dashboard.



---

## 1. Project Overview

The objective of this project is to transform raw retail transaction data into meaningful business insights through data preparation, SQL-based exploration, KPI calculations, and interactive visualizations.

The analysis focuses on answering questions such as:

- Which countries generate the most revenue?
- How does sales performance change over time?
- Which products have the highest sales volumes?
- Which products contribute the most revenue?
- How many unique customers and orders are represented?
- What is the average revenue per order?

The resulting dashboard provides a structured overview of sales, customers, geographic performance, and product-level insights.

## 2. Dataset

**Source:** UCI Machine Learning Repository — Online Retail Dataset

**Dataset period:** December 2010 – December 2011

The original dataset contains approximately 541,909 transaction records from a UK-based online retail business.

### Key Data Fields

| Column | Description |
|---|---|
| InvoiceNo | Transaction invoice identifier |
| StockCode | Product identifier |
| Description | Product description |
| Quantity | Number of units recorded |
| InvoiceDate | Transaction date and time |
| UnitPrice | Price per unit |
| CustomerID | Customer identifier |
| Country | Customer country |
| Revenue | Transaction-line revenue, calculated from quantity and unit price |

The dashboard uses a prepared dataset containing **530,104 records**.

*Data preparation affects the final number of records. The exact cleaning and exclusion rules should be documented alongside the source code.*

## 3. Tools & Technologies

| Technology | Purpose |
|---|---|
| SQL | Data exploration, filtering, grouping, and aggregations |
| SQLite / DB Browser for SQLite | Working with the retail database |
| Google Looker Studio | Interactive data visualization and dashboard development |
| Calculated Fields | Creating revenue, date, and business KPI metrics |

Python can also be included as a project technology once the corresponding Python scripts or notebooks are available in this repository.

## 4. Key Performance Indicators

The dashboard currently reports the following metrics:

| KPI | Value |
|---|---:|
| Sales Records | 530,104 |
| Total Units Sold | 5,588,376 |
| Total Revenue | £10,666,684.54 |
| Total Orders | 19,960 |
| Total Customers | 4,339 |
| Average Order Value (AOV) | £534.40 |

### KPI Definitions

**Total Revenue**

The sum of the calculated revenue field across included transaction records.

**Total Orders**

The number of distinct invoice identifiers.

**Total Customers**

The number of distinct customer identifiers.

**Average Order Value (AOV)**

Average revenue generated per distinct invoice:

`SUM(Revenue) / COUNT_DISTINCT(InvoiceNo)`

**Total Units Sold**

The sum of recorded quantities.

*The monetary figures assume that the original GBP-denominated unit prices were preserved without currency conversion. KPI results depend on the data cleaning rules and filters applied.*

## 5. Interactive Dashboard

The dashboard consists of three interconnected analytical pages.

### Page 1 — Sales Overview

Provides a high-level overview of business performance.

**Visualizations:**
- Total sales records
- Total units sold
- Total revenue
- Revenue by country
- Geographic revenue distribution map

**Business purpose:** Identify leading markets and understand the distribution of sales activity.

### Page 2 — Geographic & Sales Trends

Explores geographic sales performance and revenue trends over time.

**Visualizations:**
- Total units sold by country
- Revenue share by country
- Monthly revenue trend

**Business purpose:** Compare international markets and observe changes in monthly revenue.

**Important:** December 2011 contains partial-month data, through December 9. The apparent revenue decline at the end of the series should therefore not be interpreted as a full-month performance decline.

### Page 3 — Customer & Product Insights

Focuses on transaction activity, customer metrics, and product performance.

**Visualizations:**
- Total orders
- Total customers
- Average order value
- Top 10 best-selling products by quantity
- Top 10 products by revenue, excluding `DOTCOM POSTAGE`

**Business purpose:** Compare high-volume products with high-revenue products while examining key customer and order metrics.

## 6. Key Findings

### Geographic Revenue Concentration

The United Kingdom represents the largest share of revenue in the dashboard.

This indicates that the analyzed retailer's revenue is heavily concentrated in its domestic market.

### Differences Between Revenue and Unit Sales

Product performance varies depending on the metric used.

A product with a high sales quantity does not necessarily generate the highest revenue. Comparing these rankings provides a more complete understanding of product performance.

### Monthly Revenue Patterns

Revenue varies over the reporting period, with stronger monthly performance appearing toward the later months of 2011.

The final month should be treated separately because it contains incomplete data.

### Customer and Transaction Activity

The prepared dataset contains 19,960 distinct invoices and 4,339 distinct customer identifiers, providing a basis for examining transaction volume and average order value.

## 7. Data Considerations & Limitations

The following factors should be considered when interpreting the results:

- The analysis is based on historical retail transaction data rather than live sales.
- The dataset contains transaction-line records, so record count should not be confused with order count.
- Customer counts depend on the availability and treatment of customer identifiers.
- Invoice-level metrics depend on how cancelled transactions, returns, and other nonstandard records were handled during data preparation.
- Some descriptions represent fees or other non-product entries. `DOTCOM POSTAGE` is excluded from the product revenue ranking visualization.
- December 2011 is an incomplete reporting month.
- Financial metrics assume that the dataset's original GBP currency was retained.

These considerations are relevant when comparing KPI results or interpreting business trends.

## 8. Project Skills Demonstrated

This project demonstrates practical experience with:

- Relational data exploration
- SQL aggregations
- Data preparation
- Business KPI development
- Interactive dashboard design
- Geographic and time-series analysis
- Product performance analysis
- Data interpretation and communication

## 9. Dashboard Access

**[Open the Retail Sales Analytics Dashboard](https://datastudio.google.com/reporting/d8ad6914-7dcc-47c8-be29-7be1f01b710a)**

The dashboard is designed to allow readers to explore the retail analysis through interactive charts and filters.

## 10. Future Improvements

Potential next steps include:

- Publishing reproducible SQL queries
- Adding Python data-cleaning notebooks
- Documenting detailed data quality checks
- Expanding customer segmentation and retention analysis
- Exploring revenue trends by product category
- Adding further business recommendations supported by quantitative analysis

---

**Project Type:** Data Analytics / Business Intelligence Portfolio Project

**Data Source:** UCI Online Retail Dataset

**Dashboard:** Google Looker Studio
