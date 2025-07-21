# 🏦 MyBank SQL Project – Data Analysis in Banking Dataset

This project involves **data analysis** on a comprehensive **banking dataset** using SQL. It includes the creation of a database schema, importing CSV data into structured tables, and running analytical queries to extract insights.

---

## 📌 Project Highlights

* ✅ Created `mybank` database from scratch
* ✅ Uploaded banking dataset (CSV files) into MySQL tables
* ✅ Performed various **data analysis tasks** using SQL
* ✅ Included complex SQL queries for business insights and data exploration

---

## 🧱 Database Schema Overview

The project contains the following tables:

| Table          | Description                       |
| -------------- | --------------------------------- |
| `Customers`    | Customer personal details         |
| `Accounts`     | Bank accounts linked to customers |
| `Transactions` | All banking transactions          |
| `Loans`        | Information on customer loans     |
| `CreditCards`  | Credit card details per customer  |
| `Branches`     | Bank branch information           |
| `ATMs`         | ATM location and service status   |

Each table was populated using CSV files uploaded into MySQL.

---

## 🔍 Key SQL Queries Performed

### ✅ Basic Data Exploration

* Total number of customers and accounts
* Loan and credit limit aggregates
* Active/inactive account filters

### 📊 Customer Insights

* Customers with multiple accounts
* Top 10 highest loan holders
* Average age of customers

### 💼 Business Intelligence

* Over-limit credit card detection
* Loan status with interest filtering
* Account aging and transaction recency

### 🛠️ Utilities & Maintenance

* Cloning tables
* Extracting first/last names from full name
* Showing odd-numbered records

---

## 📁 How to Use

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/mybank-sql.git
   cd mybank-sql
   ```

2. Open MySQL Workbench, phpMyAdmin, or any SQL client.

3. Run the SQL script to create schema and import data:

   ```sql
   SOURCE path_to_script.sql;
   ```

4. Begin querying!

---

## 💡 Requirements

* MySQL 5.7+ or compatible
* CSV files loaded via `LOAD DATA INFILE` or import tool
* Any SQL IDE (Workbench, DBeaver, DataGrip, etc.)

---

## 📜 License

This project is open-source under the [MIT License](LICENSE).

---

## 🙌 Contributions

Contributions are welcome! Feel free to:

* Suggest or add new queries
* Improve schema design
* Add data visualization support

---

Would you like me to export this as a `README.md` file or format it for direct upload to your GitHub repo?
