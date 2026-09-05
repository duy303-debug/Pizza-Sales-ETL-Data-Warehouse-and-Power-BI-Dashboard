# 🍕 Pizza Sales ETL & Business Intelligence

## Overview

This project focuses on building an end-to-end ETL pipeline for pizza sales
data using SQL Server Integration Services (SSIS), SQL Server, and a Data
Warehouse.

The project extracts data from the source system, performs data cleansing
and transformation, and loads the processed data into a Data Warehouse
designed using a Star Schema.

The Data Warehouse is then connected to Power BI to provide interactive
dashboards and business insights for pizza sales analysis.

---

## 🎯 Goal

The main goal of this project is to build an ETL pipeline that transforms
raw pizza sales data into structured data for analysis and reporting.

The project aims to:

- Build a Staging Database
- Build a Data Warehouse
- Perform data cleansing and transformation
- Load Dimension and Fact tables
- Implement incremental data loading
- Analyze sales performance using Power BI
- Identify best-selling and underperforming pizzas

---

## Technologies

- Visual Studio
- SQL Server Integration Services (SSIS)
- SQL Server Management Studio (SSMS)
- Power BI
- DAX
- Slowly Changing Dimension (SCD type 1)

---

# Project Stages

## Star Schema Design

The data warehouse is designed using a star schema to support efficient sales analysis and reporting.

The schema consists of three dimension tables—Product, Date, and Time—and a central fact table containing sales transactions and key measures.

<img width="1587" height="775" alt="image" src="https://github.com/user-attachments/assets/fcccccf3-ed0b-41a8-b4c0-e29908f92776" />

## ETL Architecture

The ETL pipeline follows an end-to-end process from the source data to the Data Warehouse.

The process extracts pizza sales data into the Staging Database, performs data cleansing and transformation, and then loads the processed data into the Data Warehouse.

<img width="402" height="577" alt="image" src="https://github.com/user-attachments/assets/91950ca3-2751-4744-8759-8aa842bb82c6" />

---

# First-time ETL

## 5. Extract Data into the Staging Area

The source pizza sales data is extracted and loaded into the Staging Database.

This step stores the source data in staging tables before data transformation.

<img width="1352" height="742" alt="image" src="https://github.com/user-attachments/assets/854f64e1-2b91-4abe-861c-955d6953b6fb" />

---

## 6. Transform Source Data into Dimensions and Facts

The staging data is cleansed and transformed before being loaded into the Data Warehouse.

The transformation process includes data type conversion, handling NULL values, and preparing the data for the Dimension and Fact tables.

<img width="1362" height="740" alt="image" src="https://github.com/user-attachments/assets/169bb594-0099-4c9e-bbb2-b0894a1640a7" />

---

## 7. Dimension First Load

The transformed data is loaded into the Dimension tables in the Data Warehouse.

The initial load inserts the available Dimension records into the corresponding destination tables.

<img width="1367" height="742" alt="image" src="https://github.com/user-attachments/assets/526768ee-e7b8-4e17-ac34-3a1e1121edb9" />

---

## 8. Fact Table Full Load

After the Dimension tables have been loaded, the pizza sales transactions are loaded into the `FactPizzaSales` table.

The Fact table stores the sales measures and references the corresponding Dimension tables.

<img width="1366" height="737" alt="image" src="https://github.com/user-attachments/assets/9e180930-c280-4731-8e9a-1491b4a4baa5" />

## 9. Truncate

Truncate all Dimension and Fact tables in the Staging area to prepare for future ETL runs.

---

# Next-time ETL

The next-time ETL process is designed to process new and changed records
without reloading the entire Data Warehouse.

The incremental process uses Slowly Changing
Dimension (SCD) to identify and process changes.

---

## 10. Extract Data into the Staging Area


<img width="1330" height="617" alt="image" src="https://github.com/user-attachments/assets/fd288e6c-42bb-4dc5-813b-54aeaa804e8c" />


---

## 11. Transform Source Data into Dimensions and Facts


<img width="1422" height="552" alt="image" src="https://github.com/user-attachments/assets/28619471-c839-4786-ba48-a2cde2fd6117" />

---

## 12. Dimension Load


<img width="1485" height="512" alt="image" src="https://github.com/user-attachments/assets/4e15a6e0-a124-4708-9aa3-0c4254f7ad8b" />


---

## 13. Fact Table Full Load

<img width="1222" height="737" alt="image" src="https://github.com/user-attachments/assets/60d7b6b0-0120-495f-89ee-b6f03d197ad4" />


---

## 9. Truncate

Truncate all Dimension and Fact tables in the Staging area to prepare for future ETL runs.

