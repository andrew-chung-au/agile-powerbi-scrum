# DataLens Streaming Analytics (StreamFlix Case Study)

**Technical Stack:** SQL (MySQL) | Power BI | Python (Pandas) | Git/GitHub | Jira  
**Methodology:** Agile / Scrum (3 Sprints)

---

## 📌 Project Overview

This repository contains the workflow, technical documentation, and final deliverables for **DataLens Streaming**, a team-based data analytics capstone project.

While the client scenario (StreamFlix) is a simulated business case, the project was executed by applying real-world collaborative practices. Our team operated as a data consulting group, managing the project lifecycle from initial scoping and data engineering through to dashboarding and handover.

---

## 🎯 The Business Problem

**StreamFlix** is an international streaming platform transitioning from a free, ad-supported model to a premium subscription-based service.

**The Objective:** The business required a data-driven content acquisition strategy to prioritize film genres that will retain existing users while attracting new premium subscribers.

**The Deliverable:** A relational database schema to house user and rating data, alongside an interactive Power BI dashboard providing actionable insights segmented by user demographics, subscription tiers, and geographic locations.

---

## 📖 Project Story

StreamFlix is transitioning from a free, ad-supported model to a premium subscription service. The core business question was: **what content drives free users to convert to paid subscribers?**

Our analysis showed that:

- Comedy and Drama dominate overall viewing, but they are already well served on the free tier.
- The biggest opportunity lies in **high-variance titles** – content that free users largely ignore but subscribers rate highly.
- By acquiring and positioning these “conversion catalyst” titles behind the paywall, StreamFlix can maximise subscription sign-ups while protecting ad revenue from popular free-tier content.

The interactive Power BI dashboard enables the acquisition and marketing teams to target these opportunities by **age band, country, device, and subscription status**, rather than relying on global averages.

---

## 🎯 Key Insights

- **Genre focus:** Drama and Comedy drive most ratings, but acquisition should prioritise high-variance genres (e.g. Sci‑Fi, War, Fantasy, Documentaries) that correlate with premium conversion. [41]
- **Core audience:** Users aged 35–54 are the most engaged segment; they should be the primary target for premium marketing and regional catalog curation.
- **Platform balance:** Usage is evenly split across Free vs Subscriber and across devices (Mobile, Smart TV, Desktop, Tablet), supporting a **seamless multi-device experience** with region-specific optimisation.

---

## 🖼️ Visual Highlights

**Executive Overview**

![Executive Overview](visuals/5_executive_overview.png)

*Key metrics: 3,883 movies, 6,040 users, ~10K ratings; Drama and Comedy lead engagement; near 50/50 split between Free and Subscriber.*

**User Footprint**

![User Footprint](visuals/7_user_footprint.png)

*Balanced distribution across age groups, countries, and devices; core engaged audience in the 35–54 age band.*

**Conversion Catalyst**

![Conversion Catalyst](visuals/9_conversion_catalyst.png)

*Top‑Left = “Paywall Goldmine” (high subscriber, low free).  
Bottom‑Right = “Free‑Tier Hooks” (high free, low subscriber).  
Bubble size = total views; colour = genre.*

*(For the full narrative and detailed charts, see the [Project Story](docs/project-story.md).)*

---

## 🛠️ Project Lifecycle & Methodology

The project was delivered over three structured Agile Sprints, coordinated via Jira and GitHub fork-and-pull-request workflows:

- **Sprint 1 (Data Foundation & Scoping):** Conducted project kickoff, established [Client Needs](docs/project-initiation/client-needs.md), audited raw CSV datasets, resolved data quality anomalies, and proposed a conceptual Star Schema dimensional model.
- **Sprint 2 (Database Engineering & EDA):** Designed the [Database Schema](docs/specifications/StreamFlix_Database_Schema_Design.md), implemented the physical MySQL database via our [SQL Setup Guide](docs/database-design/db_setup_guide_for_streamflix.md), established referential integrity, and conducted exploratory data analysis.
- **Sprint 3 (Business Intelligence & Delivery):** Developed interactive Power BI dashboards, integrated dynamic age-grouping logic via SQL, and delivered the final stakeholder presentation and handover package. (See our [Communication Log](docs/communication/communication_log.md) for stakeholder management).

---

## 👥 Team & Roles

This project was a collaborative effort by the DataLens Analytics Team, with shared responsibilities across data cleaning, SQL development, and visualization.

- **Andrew Chung:** GitHub/Repository Lead & Analytics Contributor ([GitHub](https://github.com/andrew-chung-au))
- **Sabahat Naz:** Scrum Master & Analytics Contributor ([GitHub](https://github.com/sabnaz1988))
- **Shanika Kodithuwakku:** Jira Workflow Manager & Analytics Contributor ([GitHub](https://github.com/shimashi2021-del))
- **Rakhi Porwad:** Analytics Contributor
- **Shilpa Joseph:** Analytics Contributor ([GitHub](https://github.com/ShilpaDev-prog))

---

## 🔍 Quick Links to Key Technical Assets

- [Team Playbook & Workflow Guide](docs/team-playbook.md)
- [MySQL Database Setup Guide (DDL/DML)](docs/database-design/db_setup_guide_for_streamflix.md)
- [Database Schema Design & ERD](docs/database-design/database_design_documentation.md)
- [Client Needs & Project Scoping](docs/project-initiation/client-needs.md)
- [Sprint 2 Client Demo Notes](docs/database-design/demo-presentation-notes.md)
- [Project Story & Insights](docs/project-story.md)

---

## 📂 Repository Structure

The repository is organized to separate raw data, technical documentation, source code, and reporting assets.

```text
├── data/                    # Raw CSVs and processed, clean data outputs
├── docs/
│   ├── communication/       # Client correspondence and internal team communication logs
│   ├── database-design/     # ERD diagrams, schema documentation, and SQL setup guides
│   ├── sprint-notes/        # Agile meeting notes, sprint reviews, and sprint planning
│   └── specifications/      # Technical implementation and backlog specifications
├── src/                     # Jupyter notebooks (Python) containing data cleaning and analysis workflows
├── reports/                 # Final PDF reports and dashboard deliverables
└── visuals/                 # Dashboard mockups and exported charts for presentations
```

---

## 🚀 Key Features & Technical Highlights

- **Relational Database Design:** Transitioned flat files into a normalized Star Schema separating `Users`, `Movies`, `Ratings`, and `Genres`, using a junction table to resolve multi-genre titles.
- **Data Cleansing:** Standardized text delimiters, extrapolated missing metadata, and handled referential integrity issues such as orphaned user IDs and duplicate ratings.
- **Cross-Functional Collaboration:** Implemented a structured Git fork-and-PR workflow (governed by our custom [Team Playbook](docs/team-playbook.md)) to coordinate team contributions, manage binary Power BI asset handoffs, and maintain clear documentation covering client requirements and technical specifications.

---

## 📬 Contact

For questions regarding the repository setup, technical implementation, or broader data engineering workflows, please reach out to [Andrew Chung](https://www.linkedin.com/in/andrewchung-cloudai/).