# Project Overview

This academic project required designing and implementing a simplified end‑to‑end data‑mining and ETL workflow within a single PostgreSQL environment. Although all work is performed inside one database for instructional purposes, the structure mirrors real‑world analytics tasks where data must be extracted, transformed, and loaded to support reporting and decision‑making.

The goal of the project is to create a repeatable reporting pipeline driven by a clearly defined business question that depends on aggregated data. The resulting report is composed of two sections:

- **Detailed Section** – Contains the raw, granular records that inform the analysis.  
- **Summary Section** – Contains aggregated metrics automatically generated from the detailed data through ETL logic.

---

## Skills Demonstrated

### Business & Analytical Skills
- **Summarizing a real‑world business report** using the provided datasets and data dictionaries, including defining the analytical question and identifying stakeholders.
- **Describing the underlying data sources**, including relevant tables, relationships, and fields required for both the detailed and summary sections.
- **Selecting and justifying fields** included in each section based on their relevance to the business question and their role in aggregation.
- **Identifying and implementing a custom data transformation**, such as converting coded values into human‑readable labels to improve clarity and usability.
- **Explaining the distinct business purposes** of detailed versus summary data and how each supports different levels of decision‑making.
- **Determining an appropriate refresh cadence** to ensure the report remains accurate and relevant for stakeholders.

---

## Technical Competencies

- **Creating database structures** (tables) to store both detailed and summary report sections.
- **Writing SQL queries** to extract and validate raw data for the Detailed section.
- **Developing SQL functions** to perform required data transformations.
- **Implementing a trigger** that automatically updates the Summary table whenever new records are added to the Detailed table.
- **Building a stored procedure** that refreshes both tables by clearing existing data and re‑running the ETL pipeline, including documentation on recommended execution frequency.
- **Explaining how to schedule the stored procedure** to maintain ongoing data freshness.
- **Demonstrating the full workflow** through a recorded walkthrough of the SQL code, environment, and ETL logic.
- **Documenting sources and maintaining academic integrity**, including citations, references, and professional communication throughout the submission.

---
<!-- Badges -->
<h1 align="center">Scripting Databases – ETL & Data Mining Project</h1>

<p align="center">
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white" />
  <img src="https://img.shields.io/badge/SQL-025E8C?style=for-the-badge&logo=amazon-dynamodb&logoColor=white" />
  <img src="https://img.shields.io/badge/ETL-4CAF50?style=for-the-badge&logo=data:image/svg+xml;base64,PHN2ZyBmaWxsPSJ3aGl0ZSIgaGVpZ2h0PSIyNCIgd2lkdGg9IjI0IiB2aWV3Qm94PSIwIDAgMjQgMjQiPjxwYXRoIGQ9Ik0xMiAyYTEwIDEwIDAgMSAwIDEwIDEwQTEwIDEwIDAgMCAwIDEyIDJ6bTAgMThjLTQuNDEgMC04LTMuNTktOC04czMuNTktOCA4LTggOCAzLjU5IDggOC0zLjU5IDgtOCA4eiIvPjwvc3ZnPg==" />
  <img src="https://img.shields.io/badge/Data%20Mining-673AB7?style=for-the-badge&logo=databricks&logoColor=white" />
  <img src="https://img.shields.io/badge/WGU-0A4E9B?style=for-the-badge&logo=graduation-cap&logoColor=white" />
  <img src="https://img.shields.io/badge/Academic%20Project-555555?style=for-the-badge" />
</p>

