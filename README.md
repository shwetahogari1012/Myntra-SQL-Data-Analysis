# 🛍️ Myntra SQL Data Analysis Project

## 📌 Overview
This project focuses on analyzing Myntra e-commerce product data using SQL and relational database concepts.

The objective of the project is to transform raw product-level Myntra data into a normalized relational database and perform business-oriented analytical queries to generate meaningful insights related to products, brands, pricing, discounts, ratings, and sellers.

The project demonstrates:
- Database design & normalization
- SQL joins and relationships
- Data transformation techniques
- Business-driven analytical SQL queries

---

## 🗄️ Database Schema Design

The database is designed using normalized relational tables to reduce redundancy and improve query performance.

### 📋 Tables Included

#### 1️⃣ Brands Table
Stores unique brand names.
- `brand_id`
- `brand_name`

#### 2️⃣ Categories Table
Stores category information.
- `category_id`
- `category`
- `sub_category`
- `gender`

#### 3️⃣ Sellers Table
Stores seller details.
- `seller_id`
- `seller_name`

#### 4️⃣ Products Table
Main fact table containing product details.
- `product_id`
- `brand_id`
- `category_id`
- `seller_id`
- `description`
- `original_price`
- `discount_price`
- `discount_offer`
- `size_option`

#### 5️⃣ Ratings Table
Stores ratings and review data.
- `rating_id`
- `product_id`
- `rating`
- `review_count`

---

## 📊 SQL Analysis Performed

The following analytical business queries were implemented:

1. Total number of products
2. Product count by gender
3. Top 5 brands with highest products
4. Average discounted price by category
5. Products with discounts above 60%
6. Top 5 most expensive products
7. Category-wise revenue analysis
8. Average rating by brand
9. Top-rated products
10. Seller-wise product count

---

## 📸 Project Preview

### 🗂️ Database Schema

![ER Diagram](ER_Diagram.png)

---

### 💻 SQL Query Outputs

![SQL Output](SQL_Output.png)

---

## 🛠️ Tools & Technologies Used

- MySQL
- SQL (DDL & DML)
- Relational Database Design
- JOINs & Relationships
- Aggregate Functions
- GROUP BY & ORDER BY
- Analytical SQL Queries

---

## 💡 Key Insights

- Identified top-performing brands and sellers
- Analyzed discount and pricing trends
- Evaluated gender-based product distribution
- Compared ratings across brands and products

---

## 📂 Project Files

- `myntra.sql` → SQL scripts and analytical queries
- `dataset.csv` → Raw Myntra dataset
- `ER_Diagram.png` → Database schema diagram
- `SQL_Output.png` → Query result screenshots

---

## ▶️ How to Use

1. Create a MySQL database
2. Import the raw Myntra dataset
3. Execute table creation scripts
4. Run insert queries
5. Execute analysis queries

---

## 👩‍💻 Author

**Shweta Hogari**# Myntra-SQL-Data-Analysis
SQL-based Myntra E-commerce Data Analysis using Relational Database Design and Analytical Queries
