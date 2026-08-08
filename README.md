# DataLens Streaming Analytics (StreamFlix Case Study)

**Technical Stack:** SQL (MySQL) | Power BI | Python (Pandas) | Git/GitHub | Jira  
**Methodology:** Agile / Scrum (3 Sprints)

## 📌 Project Overview
This repository contains the workflow, technical documentation, and final deliverables for **DataLens Streaming**, a team-based data analytics capstone project. 

While the client scenario (StreamFlix) is a simulated business case, the project was executed by applying real-world collaborative practices. Our team operated as a data consulting group, managing the project lifecycle from initial scoping and data engineering through to dashboarding and handover.

## 🎯 The Business Problem
**StreamFlix** is an international streaming platform transitioning from a free, ad-supported model to a premium subscription-based service. 

**The Objective:** The business required a data-driven content acquisition strategy to prioritize film genres that will retain existing users while attracting new premium subscribers. 

**The Deliverable:** A relational database schema to house user and rating data, alongside an interactive Power BI dashboard providing actionable insights segmented by user demographics, subscription tiers, and geographic locations.

## 🛠️ Project Lifecycle & Methodology
The project was delivered over three structured Agile Sprints, coordinated via Jira and GitHub fork-and-pull-request workflows:

* **Sprint 1 (Data Foundation & Scoping):** Conducted project kickoff, established [Client Needs](docs/project-initiation/client-needs.md), audited raw CSV datasets, resolved data quality anomalies, and proposed a conceptual Star Schema dimensional model.
* **Sprint 2 (Database Engineering & EDA):** Designed the [Database Schema](docs/specifications/StreamFlix_Database_Schema_Design.md), implemented the physical MySQL database via our [SQL Setup Guide](docs/database-design/db_setup_guide_for_streamflix.md), established referential integrity, and conducted exploratory data analysis.
* **Sprint 3 (Business Intelligence & Delivery):** Developed interactive Power BI dashboards, integrated dynamic age-grouping logic via SQL, and delivered the final stakeholder presentation and handover package. (See our [Communication Log](docs/communication/communication_log.md) for stakeholder management).

## 👥 Team & Roles
This project was a collaborative effort by the DataLens Analytics Team, with shared responsibilities across data cleaning, SQL development, and visualization. 

* **Andrew Chung:** GitHub/Repository Lead & Analytics Contributor ([GitHub](https://github.com/andrew-chung-au))
* **Sabahat Naz:** Scrum Master & Analytics Contributor ([GitHub](https://github.com/sabnaz1988))
* **Shanika Kodithuwakku:** Jira Workflow Manager & Analytics Contributor ([GitHub](https://github.com/shimashi2021-del))
* **Rakhi Porwad:** Analytics Contributor
* **Shilpa Joseph:** Analytics Contributor ([GitHub](https://github.com/ShilpaDev-prog))

## 📂 Repository Structure
The repository is organized to separate raw data, technical documentation, source code, and reporting assets.

```text
project-root/
├── data/                  # Raw CSVs and processed, clean data outputs
├── docs/                  
│   ├── communication/     # Client correspondence and internal team communication logs
│   ├── database-design/   # ERD diagrams, schema documentation, and SQL setup guides
│   ├── sprint-notes/      # Agile meeting notes, sprint reviews, and sprint planning
│   └── specifications/    # Technical implementation and backlog specifications
├── src/                   # Jupyter notebooks (Python) containing data cleaning and analysis workflows
├── reports/               # Final PDF reports and dashboard deliverables
└── visuals/               # Dashboard mockups and exported charts for presentations

**🔍 Quick Links to Key Technical Assets:**
* [Team Playbook & Workflow Guide](docs/team-playbook.md)
* [MySQL Database Setup Guide (DDL/DML)](docs/database-design/db_setup_guide_for_streamflix.md)
* [Database Schema Design & ERD](docs/database-design/database_design_documentation.md)
* [Client Needs & Project Scoping](docs/project-initiation/client-needs.md)
* [Sprint 2 Client Demo Notes](docs/database-design/demo-presentation-notes.md)

## 🚀 Key Features & Technical Highlights
* **Relational Database Design:** Transitioned flat files into a normalized Star Schema separating `Users`, `Movies`, `Ratings`, and `Genres`, using a junction table to resolve multi-genre titles.
* **Data Cleansing:** Standardized text delimiters, extrapolated missing metadata, and handled referential integrity issues such as orphaned user IDs and duplicate ratings.
* **Cross-Functional Collaboration:** Implemented a structured Git fork-and-PR workflow (governed by our custom [Team Playbook](docs/team-playbook.md)) to coordinate team contributions, manage binary Power BI asset handoffs, and maintain clear documentation covering client requirements and technical specifications.

## 📬 Contact
For questions regarding the repository setup, technical implementation, or broader data engineering workflows, please reach out to [Andrew Chung](https://www.linkedin.com/in/andrewchung-cloudai/).