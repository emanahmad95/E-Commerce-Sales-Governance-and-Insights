# E-Commerce Sales Governance & Insights

An end-to-end data analytics and data governance project focused on improving operational efficiency, auditing financial performance, and analyzing marketing performance in an e-commerce system.

The project is based on **1,200 transaction records** spanning from **January 1, 2023 to June 30, 2025**, covering the full pipeline from raw data processing to SQL-based storage and business dashboards.

---

## 📌 Project Overview

This project is structured into three main phases:

### 1. Data Governance & Engineering
- Cleaning and validating raw transactional data
- Handling missing values and inconsistencies
- Applying conditional rules for pricing and discount logic

### 2. Database Management (SQL)
- Designing relational schema for transactional data
- Storing and managing order-level records
- Running queries for performance tracking and reporting

### 3. Business Intelligence
- Building dashboards for performance monitoring
- Analyzing revenue trends, product demand, and marketing channels
- Identifying operational inefficiencies

---

## 🗂️ Repository Contents

- **Dataset for Data Analytics.xlsx** → Raw transactional dataset (1,200 records)
- **Cleaned Dataset.xlsx** → Processed dataset used for analysis and visualization
- **SQL Dataset.xlsx** → Structured dataset for database import
- **SQL Database.jpg** → Screenshot of MySQL Workbench setup
- **Dashboard.png** → Final dashboard visualization
- **Insights.png** → Summary of key findings

---

## 💾 SQL Database & Queries
![Project Dashboard](Task%203%20SQL%20Database/SQL%20Database.png)
The database is built using MySQL and stores order-level transaction data including product details, pricing, coupons, and order status.

### Database Setup

```sql
CREATE DATABASE DecodeLabs;
USE DecodeLabs;

UPDATE dataset
SET TotalPriceAfterCoupon = 
    CASE 
        WHEN CouponCode = 'SAVE10' THEN (Quantity * UnitPrice) * 0.90
        WHEN CouponCode = 'WINTER15' THEN (Quantity * UnitPrice) * 0.85
        ELSE (Quantity * UnitPrice)
    END;

SELECT ReferralSource,
       SUM(TotalPriceAfterCoupon) AS Revenue
FROM dataset
GROUP BY ReferralSource
ORDER BY Revenue DES

SELECT OrderStatus,
       COUNT(*) AS Orders
FROM dataset
GROUP BY OrderStatus;
```


## 📊 Business Intelligence Dashboard & Visual Insights

The dashboard converts operational data into clear visual sections that highlight growth patterns, performance gaps, and system inefficiencies.
![Project Dashboard](Task%202%20Data%20DAnalysis%20And%20Visualization/Database.png)
---

### Key Dashboard Views

**Product Performance Comparison**  
Product categories are compared based on total revenue contribution. Office-related products lead overall sales, while standalone consumer tech products show relatively lower demand.

**Time-Series Revenue Trend**  
Tracks order volume and revenue movement across time. The dataset shows stable monthly activity between 30–50 orders, with records ending smoothly on June 30, 2025.

**Referral Source & Conversion Analysis**  
Marketing channels are evaluated based on customer acquisition and conversion performance. Instagram emerges as the strongest acquisition channel, followed by email campaigns.

**Order Status & Operational Leakage**  
Breaks down order outcomes such as completed, cancelled, and returned orders. This highlights inefficiencies in fulfillment and delivery processes.

---

## 📈 Strategic Insights

### 1. Product Performance Breakdown
Revenue ranking of key product categories:

- **Chair**: $185,379.09 (178 orders)
- **Printer**: $183,589.53 (181 orders)
- **Laptop**: $181,126.26 (173 orders)
- **Phone**: $143,605.73 (lowest performing category)
- **Desks**: Lower-mid performance range

---

### 2. Marketing Performance (ROI View)

- **Instagram**: $258,428.60 (highest converting channel)
- **Email Marketing**: $246,668.27 (strong secondary channel)
- **Direct Referral Links**: Lowest conversion performance at $212,932.97

---

### 3. Payment Method Distribution

- Online Payment Gateways: $247,790.01
- Credit Cards: $246,282.80
- Cash Transactions: $244,603.50

Cash usage remains significant alongside digital payment methods, reflecting mixed consumer preferences.

---

### 4. Operational Efficiency Issue

- Cancelled Orders: 250 ($258,498.91)
- Returned Orders: 247 ($229,713.47)
- **Total Operational Leakage: 41.4%**

A significant portion of orders do not reach completion, pointing to issues in fulfillment, delivery, or product expectation gaps.

---

## 🚀 Recommendations

- Improve logistics and delivery workflows to reduce cancellations and returns  
- Increase marketing focus on high-performing channels like Instagram  
- Bundle lower-performing products with high-demand items to increase sales balance  
- Improve checkout flow to reduce drop-offs during payment  
- Maintain and optimize cash-on-delivery alongside digital payment systems
