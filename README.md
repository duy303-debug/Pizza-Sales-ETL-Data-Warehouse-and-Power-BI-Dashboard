# 🍕 Pizza Sales ETL & Business Intelligence

## Overview

This project focuses on building an end-to-end ETL pipeline for pizza sales data using SQL Server Integration Services (SSIS), SQL Server, and a Data Warehouse.

The pipeline extracts, cleanses, transforms, and loads pizza sales data into a Data Warehouse designed using a Star Schema.

The Data Warehouse is then connected to Power BI to analyze sales performance and answer key business questions, such as:

- How does revenue change from month to month?
- Which pizzas generate the highest revenue?
- Which pizzas have the highest sales volume?
- How many orders are placed?
- Which time period has the highest number of orders?
- Which pizza categories and sizes are most popular?

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

The SQL script used to create the Data Warehouse structure:

[Data Warehouse SQL Script](DataWarehouse_createDatabase.sql)

## ETL Architecture

The ETL pipeline follows an end-to-end process from the source data to the Data Warehouse.

The process extracts pizza sales data into the Staging Database, performs data cleansing and transformation, and then loads the processed data into the Data Warehouse.

<img width="402" height="577" alt="image" src="https://github.com/user-attachments/assets/91950ca3-2751-4744-8759-8aa842bb82c6" />


---

# First-time ETL

## 5. Extract Data into the Staging Area

The source pizza sales data is extracted and loaded into the Staging Database.

This step stores the source data in staging tables before data transformation.

<img width="1082" height="347" alt="image" src="https://github.com/user-attachments/assets/ad044f49-25df-4527-90fe-f141317f4ed4" />

---

## 6. Transform Source Data into Dimensions and Facts

The staging data is cleansed and transformed before being loaded into the Data Warehouse.

The transformation process includes data type conversion, handling NULL values, and preparing the data for the Dimension and Fact tables.

<img width="1357" height="502" alt="image" src="https://github.com/user-attachments/assets/5d4dd157-c804-4de7-83b5-843bbeb423aa" />

---

## 7. Dimension First Load

The transformed data is loaded into the Dimension tables in the Data Warehouse.

The initial load inserts the available Dimension records into the corresponding destination tables.

<img width="897" height="375" alt="image" src="https://github.com/user-attachments/assets/0446e653-63cf-422c-a80d-50d6861d7777" />

---

## 8. Fact Table Full Load

After the Dimension tables have been loaded, the pizza sales transactions are loaded into the `FactPizzaSales` table.

The Fact table stores the sales measures and references the corresponding Dimension tables.

<img width="1050" height="546" alt="image" src="https://github.com/user-attachments/assets/251a6548-86da-4224-b983-d1f1570ad9e0" />

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


<img width="1185" height="432" alt="image" src="https://github.com/user-attachments/assets/47eea3cf-ebd0-4160-a3c0-5825fc13b64e" />


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

## 14. Truncate

Truncate all Dimension and Fact tables in the Staging area to prepare for future ETL runs.
# Dashboard

The Power BI dashboard provides interactive visualizations for analyzing pizza sales performance.

[View Power BI Dashboard](dashboard.pbix)
