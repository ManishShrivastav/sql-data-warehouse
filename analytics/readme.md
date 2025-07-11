# 📊 Analytics & Reporting Layer — Product & Customer Insights

This module extends the existing **Data Warehouse project** by introducing two analytical views in the **`gold` layer**, designed to provide a business-friendly summary of key metrics and behaviors.

These reports enable fast insights for stakeholders and serve as a foundation for BI dashboards, performance tracking, and segmentation analysis.

---

## 🗂️ Overview of Reports

### 1. `gold.report_products` — Product Performance Report

#### 🎯 Purpose
Provides a detailed summary of product-level performance across sales metrics, customer engagement, and lifecycle duration.

#### 📌 Key Features
- **Core fields**: `product_name`, `category`, `subcategory`, `cost`
- **Performance Segmentation**:
  - `High-Performer`: total sales > 50,000
  - `Mid-Range`: total sales between 10,000 and 50,000
  - `Low-Performer`: total sales < 10,000

#### 📈 Metrics Calculated
| Metric                  | Description                                           |
|------------------------|-------------------------------------------------------|
| `total_orders`         | Distinct order count per product                      |
| `total_sales`          | Sum of sales amount                                   |
| `total_quantity`       | Total units sold                                      |
| `total_customers`      | Count of unique customers                             |
| `lifespan`             | Months active in sales (first to last order)          |
| `last_sale_date`       | Most recent order date                                |
| `recency_in_months`    | Months since last sale                                |
| `avg_order_value`      | Average revenue per order (`total_sales / orders`)    |
| `avg_monthly_revenue`  | Monthly revenue (`total_sales / lifespan`)            |
| `avg_selling_price`    | Avg revenue per unit sold                             |

📄 **View defined in:** [`report_products.sql`](./report_products.sql)

---

### 2. `gold.report_customers` — Customer Behavior Report

#### 🎯 Purpose
Summarizes customer transactions, lifetime value, and demographic segmentation to enable targeted marketing and customer lifecycle analysis.

#### 📌 Key Features
- **Core fields**: `customer_name`, `age`, `customer_number`
- **Segment Classification**:
  - `VIP`: total sales > 5,000 & lifespan ≥ 12 months
  - `Regular`: total sales ≤ 5,000 & lifespan ≥ 12 months
  - `New`: all others
- **Age Grouping**:
  - Under 20
  - 20–29
  - 30–39
  - 40–49
  - 50 and above

#### 📈 Metrics Calculated
| Metric                   | Description                                               |
|-------------------------|-----------------------------------------------------------|
| `total_orders`          | Distinct order count per customer                         |
| `total_sales`           | Sum of customer purchases                                 |
| `total_quantity`        | Total units purchased                                     |
| `total_products`        | Distinct products bought                                  |
| `lifespan`              | Months between first and last order                       |
| `last_order_date`       | Most recent purchase date                                 |
| `recency`               | Months since last purchase                                |
| `avg_order_value`       | Average purchase per order (`total_sales / orders`)       |
| `avg_monthly_spending`  | Average spend per month (`total_sales / lifespan`)        |

📄 **View defined in:** [`report_customers.sql`](./report_customers.sql)

---

## 🛠️ Implementation Notes

Both views follow a consistent pattern:
1. **Base Query**: Join fact and dimension tables to gather relevant transactional and entity data.
2. **Aggregation**: Group by key (product or customer) to summarize metrics.
3. **Final Output**: Add calculated KPIs and segment classifications.

---

## 🧱 Dependencies

These views depend on the following existing tables in the `gold` schema:

- `gold.fact_sales`
- `gold.dim_products`
- `gold.dim_customers`

Ensure these base tables are populated before running the views.

---

## 🚀 How to Use

1. Place the `.sql` files in your repository (e.g., in `analytics/` folder).
2. Execute each script in your SQL environment:
   ```sql
   CREATE VIEW gold.report_products AS ...
   CREATE VIEW gold.report_customers AS ...
