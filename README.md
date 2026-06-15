# 🏘️ RT Treasurer Management System

## 📌 Project Overview
This project was created as part of a System Analyst technical assessment. The objective is to design a web-based RT Treasurer Management System that helps manage resident contributions, donations, expenses, and financial reports.

The scope of this project includes:
- Requirement analysis
- Database design (ERD)
- PostgreSQL database scripts
- Dummy data preparation
- Financial reporting queries

---

# 📋 Business Rules & Assumptions

## Kavling Information
The residential area consists of 90 kavlings:
- Block A - D:
  - 20 kavlings per block
  - Land area: 100 m² each
- Block E:
  - 10 kavlings
  - Land area: 200 m² each
Total kavlings: **90 units**

---

## Monthly Contribution Rules
Contribution rates are determined based on the kavling status and calculated per 100 m².
| Kavling Status | Cleaning Fee | Security Fee |
|---|---:|---:|
| Dihuni | Rp100.000 | Rp100.000 |
| Tidak Dihuni | Rp100.000 | Rp50.000 |
| Kosong | Rp50.000 | Rp50.000 |

For kavlings with a land area of 200 m², the contribution amount is multiplied by 2.

---

## Monthly Fixed Expenses
The RT has mandatory monthly expenses:
| Expense Type | Amount |
|---|---:|
| Kebersihan | Rp2.000.000 |
| Keamanan | Rp8.000.000 |

Total fixed monthly expenses: **Rp10.000.000**

Additional expenses such as:
- Wedding donations
- Funeral support
- Health support
- Religious events
are considered optional and depend on actual events.

---

# 🗃 Database Design

The database consists of 6 main tables:
| Table Name | Description |
|---|---|
| data_owner | Stores owner information |
| data_kavling | Stores kavling information, status, and land area |
| data_iuran | Stores contribution rates based on kavling status |
| data_pembayaran | Stores payment and donation transaction headers |
| detail_pembayaran | Stores detailed contribution payment per period |
| data_pengeluaran | Stores expense transactions |

ERD file can be found in the folder named 'ERD code.id'.

---

# 📊 Reports

The system provides several financial reports.

## 1. Monthly Income and Expense Summary
Displays the total income and expense for each month.
Example information:
- Period
- Total income
- Total expense

---

## 2. Monthly Contribution Detail
Displays detailed contribution information including:
- Owner name
- Kavling information
- Kavling status
- Contribution type
- Contribution amount
- Payment period
- Payment status:
  - Paid
  - Unpaid
  - Outstanding

---

## 3. Normal Monthly Financial Simulation
This report calculates the expected monthly financial condition with the following assumptions:
- All owners pay their monthly contributions.
- No overdue payments.
- No additional donations.
- No special event expenses.

Expected result:

| Description | Amount |
|---|---:|
| Monthly Income | Rp15.000.000 |
| Monthly Expense | Rp10.000.000 |

---

# 🗂 Repository Structure

```
Technical-Test-CodeID
│
├── CODE.ID
│   ├── ERD code.id.jpg
│   ├── Test Online - SA CODE.ID.pdf
│   ├── Test Online - SA CODE.ID.xlsx
│   ├── create_schema_table.sql
│   ├── insert_dummy_data.sql
│   ├── insert_dummy_data.sql
│   └── summary_query.sql
│
└── README.md

---

# 🛠 Technologies

- Database: PostgreSQL
- Database Management Tool: Navicat
- ERD Design: Draw.io
- Documentation: Microsoft Excel

---

# 🎯 System Analyst Approach

This project focuses not only on database implementation but also on understanding business processes and translating them into technical solutions.
The design covers:
- Entity relationship modeling
- Business rule definition
- Data normalization
- Payment flow analysis
- Financial reporting logic
- Application feature mapping between System Analyst and Fullstack Developer

---

# 👩 Author

**Anastasia Rugun Christiany**  
System Analyst Technical Assessment  
Created: June 2026
