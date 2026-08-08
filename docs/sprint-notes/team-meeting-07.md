# Team Meeting 07 Notes (Sprint 3 Planning and Dashboard Review)

**Date:** 30/06/2026  
**Project:** DataLens Streaming  
**Client:** StreamFlix  
**Meeting purpose:** Sprint 3 planning — dashboard finalisation, age-group updates, presentation preparation, and outstanding task review  

This seventh team meeting focused on planning and completing the remaining Sprint 3 work. The team reviewed the client’s new age-grouping requirement, updated the SQL and Power BI visualisations, checked the latest dashboard versions, and prepared the presentation for the final client review scheduled for 1 July.

## Sprint 3 planning

The team reviewed the remaining Sprint 3 tasks and confirmed the work required before the final client presentation. This included finalising the dashboard pages, checking the latest Power BI files, reviewing key insights, and confirming that the remaining Jira and GitHub tasks were either completed or clearly assigned.

## Age-grouping update

The team reviewed the client’s request relayed by Bhanu (`[COMMS-13]`) to group users into explicit age bands: **0–10, 11–20, 21–30, 31–40, 41–50, 51–60, and 61+ years**.

As confirmed in the team response (`[COMMS-14]`), the logic was incorporated directly into the SQL queries and refreshed in Power BI without re-running Python visual scripts. An extra test category present in earlier SQL drafts was removed to match client specifications.

## Dashboard review

The team reviewed the latest dashboard pages and visualisations to confirm that the updated age groups were reflected correctly. The review included the executive overview, audience insights, user footprint, content acquisition targets, subscription status, device usage, genre performance, and movie rating visualisations.

The team also reviewed the key insights and recommendations that would be used to explain the dashboard results to the client. Particular attention was given to explaining the difference between content popularity and average ratings, as popular genres were not always the highest-rated genres.

## Presentation preparation

The team began preparing the presentation for the final client review on 1 July. Team members reviewed the order of the dashboard pages, their speaking sections, the main insights, and the recommendations to be presented.

The presentation narrative focused on understanding StreamFlix users, identifying popular and highly rated content, comparing user segments, and supporting the client’s transition from a free platform to a subscription-based service.

## Key discussion points

- The client’s requested age groups were implemented in the SQL query and Power BI visualisations (`[COMMS-13]`, `[COMMS-14]`).
- The revised age bands were set as 0–10, 11–20, 21–30, 31–40, 41–50, 51–60, and 61+ years.
- The team reviewed the latest Power BI files and dashboard pages.
- Key insights and recommendations were prepared for the final presentation.
- The team discussed how to explain the difference between content popularity and content ratings.
- Presentation sections and speaking responsibilities were reviewed.
- The final client presentation was scheduled for 1 July.
- Any new functionality requested after the agreed project deadline would need to be considered as a separate Change Request (providing the basis for handling subsequent post-demo inquiries in `[COMMS-15]` and `[COMMS-16]`).

## Immediate actions agreed

The team agreed to:

- finalise the SQL age-grouping query,
- update and check all affected Power BI visualisations,
- complete the remaining dashboard insights and recommendations,
- review the latest Power BI file,
- update the relevant project files in GitHub,
- finalise presentation notes and speaking sections,
- and rehearse the presentation before the client review.

## Next steps

The team will complete the remaining dashboard and presentation updates before the final client presentation on 1 July. After the presentation, the team will record any client feedback and prepare the final project handover materials.

## Related Documents

* **Communication Log:** [`[COMMS-13] Age-Group Visualisations Request`, `[COMMS-14] Age-Grouping Update Confirmation`, `[COMMS-15] & [COMMS-16] Post-Demo Feedback & Handover Response`](../communication/communication_log.md)
* **Project Specifications:** [Client Needs](../project-initiation/client-needs.md), [Project Outline](../project-initiation/project-outline.md)