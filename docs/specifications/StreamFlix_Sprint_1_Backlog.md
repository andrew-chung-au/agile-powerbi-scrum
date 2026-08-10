# StreamFlix Analytics – Sprint 1 Backlog Specification

> **Historical Sprint artifact.** This backlog is retained as evidence of the original plan and acceptance criteria. Current reproducibility guidance starts in the repository [README](../../README.md).


**Document:** `StreamFlix_Sprint_1_Backlog`  
**Author:** Bhanu Prakash (Product Owner)  
**Project:** DataLens Streaming  
**Target Sprint:** Sprint 1  

---

## Sprint Overview
Sprint 1 establishes the collaborative infrastructure and data foundation for StreamFlix's platform relaunch. The primary focus is data intake, exploratory data hygiene, and addressing data quality anomalies.

---

## Backlog Tasks

### Task 1: Project Board & Workflow Setup
- **Objective:** Initialize the project task board and establish collaboration protocols.
- **Workflow Lists:** `Backlog`, `To Do`, `In Progress`, `Done`.
- **Card Setup:** Create a central `README` card containing:
  - Project scope and transition objectives (free platform to subscription model).
  - Assigned roles: Scrum Master (Sabahat Naz), Jira/Task Tracking (Shanika Kodithuwakku), GitHub Repository Lead (Andrew Chung).
  - Attached raw dataset files and operational Git guides.

### Task 2: Data Cleaning & Initial Quality Audit
- **Objective:** Audit the raw `Movies.csv` file for structural and formatting defects.
- **Actions Required:**
  - Audit missing fields (empty titles, missing release years, unpopulated genres).
  - Flag inconsistent text formats (mixed delimiters, casing anomalies, spelling variations).
  - Identify outlier records.
- **Deliverable:** Save intermediate output as `movies_cleaned.csv` and document cleaning actions.

### Task 3: Dataset Refinement Based on Stakeholder Feedback
- **Objective:** Incorporate client clarifications to produce a verified movie dataset.
- **Actions Required:**
  - Extrapolate release years from titles where missing.
  - Apply specific title/year overrides for unclassified entries.
  - Standardize genre delimiter formats (replace hyphens/dashes with pipe `|` delimiters).
  - Correct genre text misspellings (e.g., standardizing variations of *Drama*).
- **Deliverable:** Save final cleaned dataset as `movies_refined.csv`.