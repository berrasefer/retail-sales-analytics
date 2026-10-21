# Retail Sales Analytics Dashboard 

A data analytics project where I explored real retail transaction data using SQL, SQLite, and Google Looker Studio.

**[🔗 View My Interactive Dashboard](https://datastudio.google.com/reporting/d8ad6914-7dcc-47c8-be29-7be1f01b710a)**

## About the Project

I started this project because I wanted to get more comfortable working with real datasets and understand how raw transaction data can be turned into useful information.

I chose the UCI Online Retail dataset, which contains 541,909 transaction records from a UK-based online retailer between December 2010 and December 2011.

Instead of only calculating numbers, I wanted to build something interactive where I could explore sales performance, compare countries, and understand which products contribute the most to the business.

Some of the questions I wanted to answer were:

- Which countries generate the most revenue?
- How do sales change throughout the year?
- Which products are sold most frequently?
- Are the best-selling products also the ones generating the most revenue?
- How many orders and unique customers are represented in the data?

## Tools I Used

**SQL & SQLite**

I used SQL to explore the retail data and work with transactions, sales quantities, and revenue-related information.

**DB Browser for SQLite**

I used DB Browser to work with the database and run SQL queries.

**Google Looker Studio**

I created a three-page interactive dashboard to visualize the results and make the information easier to understand.

I also worked with calculated fields to display metrics such as Average Order Value and to prepare dates for monthly revenue analysis.

## Preparing the Data

The original dataset contains 541,909 rows, while the prepared dataset used in my dashboard contains 530,104 records.

I worked with invoice numbers, customer IDs, product descriptions, quantities, unit prices, transaction dates, and countries.

One thing I had to pay attention to was the difference between transaction records and orders. Since one order can contain multiple products, counting every row as a separate order would give incorrect results.

For the dashboard, I counted distinct invoice numbers to calculate the total number of orders.

I also calculated Average Order Value by dividing total revenue by the number of distinct orders.

The exact results depend on the preparation and filtering rules used in the dataset.

## Exploring the Dashboard

I divided my dashboard into three pages.

### 1. Sales Overview

This page gives a general picture of the retailer's performance.

It shows the total number of sales records, the number of units sold, and total revenue.

I also included a country comparison chart and a world map to explore where the revenue comes from.

One of the clearest findings was how strongly the United Kingdom dominated the retailer's revenue.

### 2. Geographic & Sales Trends

For the second page, I focused on comparing countries and looking at sales over time.

I created visualizations showing units sold by country, each country's share of revenue, and monthly revenue trends.

An interesting detail was the apparent drop in revenue in December 2011. However, the dataset only includes transactions through December 9, so this doesn't represent a complete month.

This reminded me how important it is to understand the dataset before interpreting a chart.

### 3. Customer & Product Insights

The final page focuses on customer activity, orders, and product performance.

I included three main KPIs:

- **Total Orders:** 19,960
- **Unique Customers:** 4,339
- **Average Order Value:** approximately £534.40

I also compared the top 10 products by quantity sold with the top 10 products by revenue.

For the revenue chart, I excluded `DOTCOM POSTAGE`, since it represents postage charges rather than a physical product.

## Main Results

After preparing the data, my dashboard showed:

- **530,104** sales records
- **5,588,376** units sold
- **£10,666,684.54** in total revenue
- **19,960** distinct orders
- **4,339** distinct customers
- **£534.40** average order value

The monetary values assume that the original GBP prices were retained without currency conversion.

## What I Learned

This project gave me more practical experience with SQL, data preparation, KPI calculations, and interactive dashboards.

I found it especially interesting to compare sales volume with revenue. A product can sell many units without necessarily generating the highest revenue, so looking at both metrics gives a better understanding of product performance.

I also learned that creating a good dashboard isn't just about choosing charts. It's important to check how the data is calculated, make sure the results are understandable, and explain any limitations.

There are still areas I would like to explore further, such as customer segmentation and purchasing patterns.

## Dataset and Dashboard

**Dataset:** UCI Machine Learning Repository — Online Retail

**[Explore the Live Dashboard](https://datastudio.google.com/reporting/d8ad6914-7dcc-47c8-be29-7be1f01b710a)**

---

*This project is part of my Data Science portfolio and reflects my ongoing learning in data analytics and business intelligence.*
