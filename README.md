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
