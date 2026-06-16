# 🚗 Mint Classics Analysis (MySQL)

A comprehensive inventory and payment analysis project for a scale-model classic car company using MySQL Workbench. This project demonstrates SQL proficiency, data quality validation, business analysis, and the ability to generate actionable insights from relational databases.

---

## 📁 Project Structure

```text
mintclassics_project/
│
├── 01_data_validation.sql      # Data quality validation queries
├── 02_inventory_analysis.sql   # Inventory, stock deficit, and warehouse analysis
├── README.md
└── mintclassicsDB.sql          # Complete database used for the analysis
```

---

## 🗄️ Database Overview

* **Database Name:** `mintclassics`
* **Database Engine:** MySQL 8.0
* **Main Tables:**

  * `products`
  * `productlines`
  * `warehouses`
  * `orders`
  * `orderdetails`
  * `payments`
  * `customers`
  * `employees`
  * `offices`

### Relational Model

The database follows a normalized relational design (Third Normal Form - 3NF), with `orderdetails` serving as the central fact table connecting products, orders, and customers.

This structure enables efficient reporting and analysis of sales performance, inventory levels, customer activity, and warehouse operations.

---

## ✅ Data Quality Validation

Before performing the analysis, several data quality checks were conducted to ensure data integrity and reliability.

### Validation Checks

* Detection of NULL values in critical tables (`products`, `payments`)
* Identification of inconsistent order dates:

  * Shipped before ordered
  * Delayed deliveries
* Products with zero inventory or invalid pricing
* Payments with zero or negative amounts

### Results

No significant data quality issues were found. The dataset was considered reliable and suitable for analytical processing.

---

## 📦 Inventory Analysis & Business Insights

### Critical Stock Deficits

The analysis identified **11 products** where cumulative sales exceeded the current inventory on hand, indicating potential stock shortages.

| Warehouse | Products in Deficit | Severity |
| --------- | ------------------- | -------- |
| North     | 4                   | High     |
| West      | 3                   | Medium   |
| South     | 3                   | Medium   |
| East      | 1                   | Low      |

### Key Findings

* The **North Warehouse** shows the highest concentration of inventory shortages and requires immediate replenishment.
* The most critical product is **1960 BSA Gold Star DBD34**, with an inventory deficit of **1,000 units**.
* Product demand is relatively consistent across the catalog, averaging between **900 and 1,050 units sold**.

### Business Conclusion

The primary issue is not demand volatility but insufficient inventory replenishment. Implementing a proactive restocking strategy would significantly reduce stock-out risks and improve order fulfillment performance.

---

## 🛠️ Technologies Used

* MySQL 8.0
* MySQL Workbench 8.0.47
* SQL (Data Validation, Aggregation, Joins, Grouping, and Business Analysis)

---

## 🚀 Getting Started

### Prerequisites

* MySQL Server 8.0+
* MySQL Workbench

### Setup Instructions

1. Clone this repository:

```bash
git clone <repository-url>
```

2. Open MySQL Workbench.

3. Import the database file:

```text
Server → Data Import → Import from Self-Contained File
```

4. Select `mintclassicsDB.sql` and execute the import.

5. Run the SQL scripts in the following order:

```text
01_data_validation.sql
02_inventory_analysis.sql
```

---

## 📊 Skills Demonstrated

* SQL Query Development
* Data Validation and Quality Assessment
* Inventory Analytics
* Business Intelligence
* Relational Database Analysis
* Data-Driven Decision Making
* MySQL Performance and Reporting

---

## 📄 Project Objective

The goal of this project is to transform raw transactional data into meaningful business insights by identifying inventory risks, validating data integrity, and supporting operational decision-making through SQL-based analysis.

## 👤 Autor
Lina David
