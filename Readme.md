
---
# 🛒 SQL Grocery Analysis Project

This repository contains a SQL script designed for analyzing grocery sales data. The project aims to extract meaningful business insights by performing data cleaning and analytical queries on a dataset, typically imported from a CSV file such as `zepto_v2.csv`.

---

## 📄 Dataset Details (`zepto_v2.csv`)

The analysis expects a dataset with the following columns, which directly map to the `zepto` table schema:

| Column Name | Description |
|---|---|
| `Category` | Product category (e.g., 'Fruits & Vegetables', 'Cooking Essentials'). |
| `name` | Name of the product. |
| `mrp` | Maximum Retail Price (assumed to be in paise; requires conversion to rupees). |
| `discountPercent` | Discount percentage applied to the product. |
| `availableQuantity` | Number of units currently in stock. |
| `discountedSellingPrice`| Selling price after discount (assumed to be in paise; requires conversion to rupees). |
| `weightInGms` | Weight of the product in grams. |
| `outOfStock` | Boolean indicating if the product is out of stock. |
| `quantity` | Quantity sold or units per order. |

---

## 🗄 Database Schema

The SQL script creates a table named `products` with the following structure:

```sql
CREATE TABLE products (
    sku_id SERIAL PRIMARY KEY,
    category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp NUMERIC(8,2),
    discountPercent NUMERIC(5,2),
    availableQuantity INTEGER,
    discountedSellingPrice NUMERIC(8,2),
    weightInGms INTEGER,
    outOfStock VARCHAR(5),
    quantity INTEGER
);
```

---

## 🔍 SQL Queries Overview

### Data Exploration

* **Total record count:** Checks the total number of rows.
* **Sample data:** Displays the initial 10 records.
* **Null values check:** Identifies rows with `NULL` values in critical columns such as `name`, `category`, `mrp`, `discountPercent`, `discountedSellingPrice`, `weightInGms`, `availableQuantity`, `outOfStock`, and `quantity`.
* **Unique categories:** Lists all distinct product categories, ordered alphabetically.
* **Stock availability breakdown:** Counts products that are in stock versus out of stock.
* **Repeated item names:** Finds product names appearing more than once, ordered by frequency.

### Data Cleaning

* **Products with price = 0:** Selects records where `mrp` or `discountedSellingPrice` are zero or negative.
* **Delete records with zero mrp:** Removes invalid entries where `mrp` is zero.
* **Convert prices from paise to rupees:** Adjusts `mrp` and `discountedSellingPrice` by dividing by 100.

### Data Analysis

* **Q1. Find the top 10 best-value products based on the discount percentage:** Retrieves products offering the highest discounts.
* **Q2. What are the Products with High MRP but Out of Stock:** Identifies expensive products (MRP > ₹300) that are currently unavailable.
* **Q3. Calculate Estimated Revenue for each category:** Calculates potential revenue per category based on `discountedSellingPrice` and `availableQuantity`.
* **Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%:** Lists high-value items (MRP > ₹500) with minimal discounts (less than 10%).
* **Q5. Identify the top 5 categories offering the highest average discount percentage:** Ranks product categories by their average discount percentage.
* **Q6. Find the price per gram for products above 100g and sort by best value:** Determines cost-effectiveness based on price per unit weight for products weighing 100g or more.
* **Q7. Group the products into categories like Low, Medium, Bulk:** Categorizes products based on their `weightInGms`:
    * `Low` (< 1000g)
    * `Medium` (< 5000g)
    * `Bulk` (>= 5000g)
* **Q8. What is the Total Inventory Weight Per Category:** Calculates the total weight of available stock within each product category.
* **Q9. What is the average discounted selling price per category?:** Calculates the average selling price of products within each category.
* **Q10. How many products have an available quantity of 1?:** Counts products that have only one unit currently available in stock.

---

## ⚙️ How to Run the Project

### 1. Clone the Repository

Clone this repository to your local machine using Git:

```bash
git clone [https://github.com/devloperYash/Sql-Project.git](https://github.com/devloperYash/Sql-Project.git)
cd Sql-Project
```

### 2. Set Up the Database

Ensure you have a SQL database system set up (e.g., PostgreSQL, MySQL). Create the `products` table by executing the SQL schema provided in your `SQL` file.

### 3. Import the Data

Import the `zepto_v2.csv` file into the `products` table. The method for importing data will depend on your database system:


---

## 📊 Insights You Can Gain

* Popular categories and products.
* Inventory management insights.
* Price and discount patterns.
* Revenue potential per category.
* Product weight and packaging insights.
