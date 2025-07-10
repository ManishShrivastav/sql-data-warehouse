# **Naming Conventions for Data Warehouse Objects**

This document provides a detailed guide on naming conventions used for various objects in the data warehouse, such as schemas, tables, views, columns, and stored procedures. Adhering to these naming conventions ensures consistency, clarity, and standardization across the data warehouse environment.

## **Table of Contents**

1. [Overview of Naming Conventions](#overview-of-naming-conventions)
2. [Table Naming Conventions](#table-naming-conventions)
   - [Bronze Layer](#bronze-layer)
   - [Silver Layer](#silver-layer)
   - [Gold Layer](#gold-layer)
3. [Column Naming Conventions](#column-naming-conventions)
   - [Surrogate Key Naming](#surrogate-key-naming)
   - [Technical Columns](#technical-columns)
4. [Stored Procedure Naming Convention](#stored-procedure-naming-convention)

---

## **Overview of Naming Conventions**

- **Naming Format**: All object names must use `snake_case` (lowercase with underscores `_`).
- **Language**: English should be used for all names.
- **Avoid Reserved Words**: Do not use SQL reserved words to avoid conflicts.

---

## **Table Naming Conventions**

### **Bronze Layer**
- Tables should begin with the source system name, followed by the entity name, without renaming.
- **Naming Format**: `<source_system>_<entity>`  
  - Example: `crm_customer_info`

### **Silver Layer**
- Like the Bronze layer, tables must begin with the source system name and maintain the original entity name.
- **Naming Format**: `<source_system>_<entity>`  
  - Example: `erp_product_sales`

### **Gold Layer**
- Tables should be business-oriented and meaningful, starting with a category prefix.
- **Naming Format**: `<category>_<entity>`  
  - Example: `dim_customers`, `fact_sales`

#### **Category Descriptions**

| Prefix      | Meaning                           | Example(s)                               |
|-------------|-----------------------------------|------------------------------------------|
| `dim_`      | Dimension table                  | `dim_customer`, `dim_product`            |
| `fact_`     | Fact table                       | `fact_sales`                             |
| `report_`   | Report table                     | `report_customers`, `report_sales_monthly`|

---

## **Column Naming Conventions**

### **Surrogate Key Naming**
- Surrogate key columns in dimension tables must have the suffix `_key`.
- **Naming Format**: `<table_name>_key`  
  - Example: `customer_key`

### **Technical Columns**
- Technical columns should start with the prefix `dwh_`.
- **Naming Format**: `dwh_<column_name>`  
  - Example: `dwh_load_date`

---

## **Stored Procedure Naming Convention**

- Stored procedures used for loading data into specific layers must follow the format:
- **Naming Format**: `load_<layer>`  
  - Example: `load_bronze`, `load_silver`
