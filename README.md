# Scripting Databases — PostgreSQL ETL Reporting Pipeline

Academic project (WGU) demonstrating a full ETL workflow built against the 
PostgreSQL DVD Rental database. The pipeline extracts customer payment and 
rental data, applies a custom transformation, and auto-populates a summary 
report via trigger — all refreshable through a stored procedure.

---

## Business Question
**Which customers generate the most rental revenue, and how does that 
vary by district?**

---

## How It Works

**1. Extract & Load**  
Raw data is pulled from four source tables — `payment`, `customer`, 
`rental`, and `address` — joined and inserted into `report_detailed`, 
ordered by payment date descending.

**2. Transform**  
A custom PL/pgSQL function (`customer_loyalty()`) categorizes customers 
based on payment behavior (e.g., total spend thresholds → loyalty tier label).

**3. Summarize via Trigger**  
`update_summary` fires `AFTER INSERT` on `report_detailed` and automatically 
populates `report_summary` with aggregated results — no manual step required.

**4. Stored Procedure Refresh**  
A stored procedure truncates both report tables and reruns the full ETL load, 
designed to be scheduled (e.g., monthly) to keep data current.

---

## Key SQL Concepts Demonstrated
- `CREATE TABLE` with primary keys and foreign key constraints
- Multi-table `INNER JOIN` extraction queries
- PL/pgSQL custom functions and transformations
- `AFTER INSERT` trigger automating summary population
- Stored procedure with truncate + reload pattern
- `SELECT DISTINCT`, `ALTER TABLE`, `TRUNCATE`, `DROP`

---

## File Reference

| File | Purpose |
|---|---|
| `SQLIntro.sql` | Foundational SQL — DDL, DML, joins, functions, triggers |
| `SectionB.sql` | Section B task queries |
| `extract_insert_query` | ETL extraction: joins payment, customer, rental, address |
| `function_transform_query` | Custom transformation function (loyalty categorization) |
| `create_trigger_query` | Trigger: auto-updates summary on detailed insert |
| `create_procedure_query` | Stored procedure: full refresh of both report tables |
| `report_detailed_query` | Query to view detailed report |
| `report_summary_query` | Query to view summary report |
| `show_report_detailed_query` | Display/verification query |
| `Datamining/` | Supporting data mining analysis |

---

## Environment
- PostgreSQL (PL/pgSQL)
- WGU Labs on Demand — DVD Rental Database

<!-- Badges -->

<p align="center">
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white" />
  <img src="https://img.shields.io/badge/SQL-025E8C?style=for-the-badge&logo=amazon-dynamodb&logoColor=white" />
  <img src="https://img.shields.io/badge/ETL-4CAF50?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyBmaWxsPSJ3aGl0ZSIgaGVpZ2h0PSIyNCIgd2lkdGg9IjI0IiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGQ9Ik0xMiAyYTEwIDEwIDAgMSAwIDEwIDEwQTEwIDEwIDAgMCAwIDEyIDJ6bTAgMThjLTQuNDEgMC04LTMuNTktOC04czMuNTktOCA4LTggOCAzLjU5IDggOC0zLjU5IDgtOCA4eiIvPjwvc3ZnPg==" />
  <img src="https://img.shields.io/badge/Data%20Mining-673AB7?style=for-the-badge&logo=databricks&logoColor=white" />
  <img src="https://img.shields.io/badge/WGU-0A4E9B?style=for-the-badge&logo=graduation-cap&logoColor=white" />
  <img src="https://img.shields.io/badge/Academic%20Project-555555?style=for-the-badge" />
</p>

