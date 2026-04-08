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

---

<details>
<summary>📋 Assignment Rubric (WGU Task Requirements)</summary>

<br>

Data analysts frequently perform periodic extraction of data from a larger 
database. They then use this extracted data for analysis. A single data extract 
may serve different organizational needs such as populating an executive summary 
or providing a complete, detailed collection of data. This task emulates such a 
process — creating a repeatable data export, import, and analysis for various 
stakeholders.

**Requirements covered:**

- **A** — Summarize one real-world business report creatable from the DVD Database
  - A1. Describe the data used for the report
  - A2. Identify two or more source tables for detailed and summary sections
  - A3. Identify specific fields for each report section
  - A4. Identify one field requiring custom transformation and explain why
  - A5. Explain different business uses of detailed vs. summary sections
  - A6. Explain recommended refresh frequency for stakeholder relevance

- **B** — Write SQL to create tables for both report sections

- **C** — Write a SQL query to extract raw data for the detailed section and verify accuracy

- **D** — Write function(s) performing the transformation(s) identified in A4

- **E** — Write a SQL trigger on the detailed table to continually update the summary table on insert

- **F** — Create a stored procedure to refresh both tables (truncate + ETL reload), with comments on execution frequency
  - F1. Explain how the procedure can be scheduled for data freshness

- **G** — Panopto video demonstrating code functionality and summarizing the programming environment

- **H** — Record web sources used for data or third-party code segments

- **I** — Acknowledge sources using in-text citations and references

- **J** — Demonstrate professional communication in content and presentation

</details>

<!-- Badges -->

<p align="center">
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white" />
  <img src="https://img.shields.io/badge/SQL-025E8C?style=for-the-badge&logo=amazon-dynamodb&logoColor=white" />
  <img src="https://img.shields.io/badge/ETL-4CAF50?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyBmaWxsPSJ3aGl0ZSIgaGVpZ2h0PSIyNCIgd2lkdGg9IjI0IiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGQ9Ik0xMiAyYTEwIDEwIDAgMSAwIDEwIDEwQTEwIDEwIDAgMCAwIDEyIDJ6bTAgMThjLTQuNDEgMC04LTMuNTktOC04czMuNTktOCA4LTggOCAzLjU5IDggOC0zLjU5IDgtOCA4eiIvPjwvc3ZnPg==" />
  <img src="https://img.shields.io/badge/Data%20Mining-673AB7?style=for-the-badge&logo=databricks&logoColor=white" />
  <img src="https://img.shields.io/badge/WGU-0A4E9B?style=for-the-badge&logo=graduation-cap&logoColor=white" />
  <img src="https://img.shields.io/badge/Academic%20Project-555555?style=for-the-badge" />
</p>

