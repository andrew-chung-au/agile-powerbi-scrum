# DataLens Streaming – Communication Log

**Project:** DataLens Streaming  
**Client:** StreamFlix  
**Last updated:** 02/07/2026 

This log captures all project-related communications in chronological order, including client meetings, internal emails, and forwarded correspondence.

## Contents

- [COMMS-01 – Sprint 1: Kickoff Meeting](#comms-01-client--sprint-1-kickoff-meeting)
- [COMMS-02 – Sprint 1: Clarifying Questions for Review](#comms-02-internal--sprint-1-clarifying-questions-for-review)
- [COMMS-03 – Sprint 1: StreamFlix Raw Data](#comms-03-internal--sprint-1-streamflix-raw-data)
- [COMMS-04 – Sprint 1: Backlog Shared](#comms-04-internal--sprint-1-backlog-shared)
- [COMMS-05 – Sprint 1: Data Limitations and Cleaning Summary](#comms-05-internal--sprint-1-data-limitations-and-cleaning-summary)
- [COMMS-06 – Sprint 1: New Datasets Received](#comms-06-internal--sprint-1-new-datasets-received-users--ratings)
- [COMMS-07 – Sprint 1: Client Data Corrections](#comms-07-internal--sprint-1-client-data-corrections)
- [COMMS-08 – Sprint 1: Dataset Review Summary](#comms-08-internal--sprint-1-dataset-review-summary-users--ratings)
- [COMMS-09 – Sprint 1 Close: Next Phase Briefing](#comms-09-internal--sprint-1-close-next-phase-briefing)
- [COMMS-10 – Sprint 2: Python Mapping Help Request](#comms-10-internal--sprint-2-python-mapping-help-request)
- [COMMS-11 – Sprint 2: Python Mapping Guidance](#comms-11-internal--sprint-2-python-mapping-guidance)
- [COMMS-12 – Sprint 2: Client Request for Rating Insights](#comms-12-internal--sprint-2-client-request-for-rating-insights)
- [COMMS-13 – Sprint 3: Client Request for Age-Group Visualisations](#comms-13-internal--sprint-3-client-request-for-age-group-visualisations)
- [COMMS-14 – Sprint 3: Age-Grouping Update Confirmation](#comms-14-internal--sprint-3-age-grouping-update-confirmation)
- [COMMS-15 – Sprint 3: Client Dashboard Feedback](#comms-15-internal--sprint-3-client-dashboard-feedback)
- [COMMS-16 – Sprint 3: Draft Response to Client Feedback](#comms-16-internal--sprint-3-draft-response-to-client-feedback)

---

## [COMMS-01] Client – Sprint 1: Kickoff Meeting  
**Date:** 17/06/2026  
**From:** Bash, Innovation Manager, Business Development Department, StreamFlix  
**To:** DataLens Team  
**Type:** Client Meeting

We're here today to discuss an exciting and urgent project to help the company transition from a free, ad-supported platform to a subscription-based service.

StreamFlix deals with all genres of films but needs to identify which ones to prioritise as we revamp our platform and systems.

We want to focus on buying films that regular users appreciate while also attracting new subscribers. As an Italian company with ambitions for global growth, we require objective data to guide our decisions. We would like actionable insights on:

- What types of films different groups of users enjoy, based on age, location, and subscription type.
- Identifying the most successful genres and movies for each audience.
- A dashboard with clear visualisations that stakeholders can easily interpret.

The timeline for this project is very tight. The revamped platform is already announced and must launch in a few weeks, so I need you to propose the first version of the project by 1st July. I'd like this meeting to be an open discussion, so feel free to ask any questions to get the information you need to get started.

---

## [COMMS-02] Internal – Sprint 1: Clarifying Questions for Review  
**Date:** 17/06/2026 05:00 PM  
**From:** Andrew Chung `<a.chung@datalens.com>`  
**To:** Bhanu Prakash `<b.prakash@datalens.com>`  
**Cc:** da-team2  
**Subject:** DataLens Streaming Project: Clarifying Questions for Review  

Hi Bhanu,

Following the kickoff meeting with StreamFlix, we have drafted a set of clarifying questions to help us confirm the project scope and ensure our first version is aligned with the client's expectations and priorities.

Before we send anything externally, could you please review the questions below and advise if any changes are needed?

**1. Data Access and Structure**
- What is the current format and location of the user demographic, subscription, and watch history data?
- Will we be querying a database directly, or will flat files such as CSVs be provided?
- Does StreamFlix currently maintain a consolidated inventory of the film library mapped to the genres under analysis?

**2. Defining Metrics for Success**
- What is the primary measure of a successful movie or genre, such as total watch time, completion rates, or user ratings?
- Does StreamFlix already use internal performance thresholds, or should we define the bands based on the data?
- Will we have access to rights acquisition costs and historical promotional spend by title?

**3. Strategy and Dashboard Audience**
- Are there specific regions or markets we should focus on for the first iteration?
- Who are the primary stakeholders for the dashboard, and what level of detail would be most useful for them?

Once you have reviewed this, we can finalise the wording before sending it to the client.

Best regards,

Andrew Chung  
DataLens Analytics Team

---

## [COMMS-03] Internal – Sprint 1: StreamFlix Raw Data  
**Date:** 18/06/2026 10:45 AM  
**From:** Bhanu Prakash `<b.prakash@datalens.com>`  
**To:** da-team2  
**Subject:** Fwd: StreamFlix Raw Data

Dear team,

Please see the below forwarded email from the client.

StreamFlix is counting on your expertise to create impactful dashboards that help guide their transition to a subscription-based platform. Let's ensure we meet their expectations together!

Kind regards,

Bhanu Prakash  
Product Owner

> **Forwarded message**  
> **From:** BASH `<bash@streamflix.com>`  
> **Sent:** 18/06/2026 10:00 AM  
> **To:** Product Owner  
> **Subject:** StreamFlix Raw Data  
> **Attachments:** `Movies.csv`  
>
> Good afternoon!
>
> Thank you for your insightful questions. I will need to consult with my colleagues to get all these answers. In the meanwhile please find attached the `Movies.csv` file, which includes the raw data you'll need for the project.
>
> Best regards,
>
> Sincerely,
>
> Bash  
> Innovation Manager, Business Development Department, StreamFlix

---

## [COMMS-04] Internal – Sprint 1: Backlog Shared  
**Date:** 18/06/2026 11:15 AM  
**From:** Bhanu Prakash `<b.prakash@datalens.com>`  
**To:** da-team2  
**Subject:** Sprint 1 Backlog
**Attachments:** `StreamFlix_Sprint_1_Backlog.docx`

Dear da-team2,

I hope you are doing well.

As we commence Sprint 1, I would like to share the Sprint 1 Backlog List Document, which outlines the tasks to plan and complete plan for this sprint.

The primary objective of Sprint 1 is to establish a strong foundation for our analytics initiative by delivering the agreed backlog items within the sprint timeline. Please review the document thoroughly and ensure you have a clear understanding of your assigned tasks and dependencies.

I look forward to a productive Sprint 1 and appreciate your commitment to delivering valuable outcomes for the project.

Kind regards,

Bhanu Prakash  
Product Owner

---

## [COMMS-05] Internal – Sprint 1: Data Limitations and Cleaning Summary  
**Date:** 19/06/2026 10:00 AM  
**From:** Sabahat Naz `<s.naz@datalens.com>`  
**To:** Bhanu Prakash `<b.prakash@datalens.com>`  
**Cc:** da-team2  
**Subject:** DataLens Streaming Project: Data Limitations and Cleaning Summary

Dear Bhanu,

Thank you for providing the raw dataset.

We have completed an initial review of the client-provided dataset. However, before we proceed further, we would like to flag an important limitation: the current dataset does not contain the user-level information required to deliver the audience-segmented insights requested in the project brief.

To meet the original client request, we would need data such as:

- user demographics, including age and location,
- subscription data, distinguishing between free and paid users,
- user-level watch history, and
- performance metrics such as ratings or completion rates.

Without this information, our analysis will be limited to movie-level trends such as overall genre popularity and total views. This means we will not be able to produce the more impactful insights requested by the client, such as what different user groups enjoy based on age, location, and subscription type.

### Data Cleaning Summary

As part of our review of the client-provided dataset, we identified and addressed a few data quality issues:

- **Missing values in Movie Title and Year:** Two entries were missing the Movie Title and Year. These entries were marked as "Unknown" so that they can be filtered from the analysis if needed.
- **Genre correction:** The genre label Dramatic appeared three times and was replaced for those films with more appropriate genre labels (Final Destination -> Horror, Schindler's List -> War & Drama, Gladiator -> Action & Drama).
- **Genre adjustment:** Scary Movie was labelled as "Comedy--Horror". This was split into Comedy and Horror, and the combined "Comedy-Horror" label was removed as it only appeared once in the dataset.
- **Spelling correction:** The genre value "Dramma" appeared in movie entries (Wonder Boys and Fargo) and was corrected to Drama.

### Clarifications Required

We noticed that the Language and Country fields appear to contain single values for each film, but some entries seem unusual or inconsistent. To ensure accurate interpretation of the dataset, could you please confirm whether these fields represent the original production details or whether they were simplified during data preparation?

**1. Language column**

Could you please confirm whether this column refers to the original audio language, subtitle language, or another format?

**2. Country column**

Could you please confirm whether this column refers to the country of production or another classification used in the dataset?

**3. Total Views column**

Are the total views recorded globally for each movie, or are they specific to each country listed?

We recommend that the missing user-level data be requested as a priority, as it will directly affect whether we can deliver the insights and dashboard expected by 1 July.

Kind regards,

Sabahat Naz  
DataLens Analytics Team

---

## [COMMS-06] Internal – Sprint 1: New Datasets Received (Users & Ratings)  
**Date:** 19/06/2026 10:45 AM  
**From:** Bhanu Prakash `<b.prakash@datalens.com>`  
**To:** da-team2  
**Subject:** New Datasets Received: Users and Ratings 
**Attachments:** `Users.csv`, `Ratings_Dataset.csv`

Dear Team,

We have just received additional input from the client in the form of `Users.csv` and `Ratings_Dataset.csv` datasets. As part of our Sprint 1 activities, please review and explore these files thoroughly.

Your key objectives are:

- Understand the structure and contents of both datasets.
- Identify primary keys, potential foreign keys, and relationships between tables.
- Assess data quality, completeness, and any anomalies.
- Document key observations and assumptions.
- Prepare recommendations that will support the schema design process.

Please ensure your analysis is completed and ready for discussion during our upcoming review session.

Kind regards,

Bhanu Prakash  
Product Owner

---

## [COMMS-07] Internal – Sprint 1: Client Data Corrections  
**Date:** 19/06/2026 11:30 AM  
**From:** Bhanu Prakash `<b.prakash@datalens.com>`  
**To:** da-team2  
**Subject:** Fwd: StreamFlix Data Corrections and Clarifications

Dear team,

Please see the below forwarded email from the client in response to your earlier email.

Kind regards,

Bhanu Prakash  
Product Owner

> **Forwarded message**  
> **From:** BASH `<bash@streamflix.com>`  
> **Sent:** 19/06/2026 11:15 AM  
> **To:** Product Owner  
> **Subject:** StreamFlix Data Corrections and Clarifications
>
> Hello!
>
> As requested, I am sharing the answers and instructions regarding the errors that you and your team have reported:
>
> 1. Mistake 1: Create a new YEAR column by extrapolating it from the Title column.
> 2. Mistake 2: The movie with the year "non_def" is from 1995.
> 3. Mistake 3: The untitled film is titled "The Phantom of the Opera".
> 4. Mistake 4: There is a movie whose genres are separated by "–" instead of "|" like the others. Please fix this error.
> 5. Mistake 5: There are 5 films in the Drama genre where the word "Drama" contains a spelling error in the Genre column. Please align them with the correct spelling.
>
> Please let me know if you have any further questions or require additional clarifications.
>
> Best regards,
>
> Bash

---

## [COMMS-08] Internal – Sprint 1: Dataset Review Summary (Users & Ratings)  
**Date:** 19/06/2026 02:30 PM  
**From:** Andrew Chung `<a.chung@datalens.com>`  
**To:** Bhanu Prakash `<b.prakash@datalens.com>`  
**Cc:** da-team2  
**Subject:** Users and Ratings Dataset Review Summary

Dear Bhanu,

We have completed the initial review of the Users.csv and Ratings_Dataset.csv files as part of Sprint 1. Below is a summary of the key findings and assumptions for review:

- Users.csv contains 6,040 records and Ratings_Dataset.csv contains 10,000 records.
- UserID is the primary key for Users, and RatingID is the primary key for Ratings_Dataset.
- Ratings.UserID links to Users.UserID, and Ratings.MovieID links to the Movies table.
- The data supports a one-to-many relationship from Users to Ratings, and from Movies to Ratings.
- No missing values were found in the reviewed fields, and no duplicate full rows were identified.
- Rating values are within the expected range of 1–5.
- A number of UserID values in Ratings do not appear in Users; this should be confirmed as a referential integrity issue or a loading issue.
- The Timestamp column has a fixed time component of 04:32:50, so it should be treated as a date-level field rather than a full timestamp.
- The Users dataset appears complete across its descriptive fields, and the data is suitable for a star schema design with Ratings as the central fact table.
- If repeated ratings for the same user and movie are not intended, a uniqueness rule should be considered for (UserID, MovieID).

Please review and let us know if anything else should be added before we finalise the schema design discussion.

Kind regards,

Andrew Chung  
DataLens Analytics Team

---

## [COMMS-09] Internal – Sprint 1 Close: Next Phase Briefing  
**Date:** 22/06/2026 10:15 AM  
**From:** Bhanu Prakash `<b.prakash@datalens.com>`  
**To:** da-team2  
**Subject:** Sprint 1 Close: Next Phase Briefing
**Attachments:** `StreamFlix_Database_Schema_Design.docx`, `StreamFlix_Table_Creation_Specification.docx`

Dear Team,

Thank you all for your hard work and valuable contributions during Sprint 1. Your dedication, collaboration, and effort have helped us achieve our sprint goals successfully.

As we move into the next phase, please find the attached documents to support your work on database schema design and table creation. Review the materials and continue collaborating with your teams to complete the required deliverables.

Great work so far and keep up the momentum!

Regards,

Bhanu Prakash  
Product Owner

---

## [COMMS-10] Internal – Sprint 2: Python Mapping Help Request  
**Date:** 22/06/2026 12:00 PM  
**From:** Ben Powers `<b.powers@datalens.com>`  
**To:** da-team2  
**Subject:** Python Mapping Help — Recommendations

Hi,

I hope you’re doing well! I really need some help and I thought you might be able to point me in the right direction.

I’m trying to create a colour map of the world to visualise the happiness index across different years using Python. I’ve been looking into a couple of datasets, but I’m not sure which Python libraries to use for this. Honestly, I’m feeling a bit overwhelmed because I have other tasks piling up, and I don’t have the time to figure this out right now.

Could you help me with this? I’m not asking for the full solution — just some suggestions for libraries that would work well and a bit of direction to get me started.

Thanks so much! Let me know what you think.

Regards,

Ben

---

## [COMMS-11] Internal – Sprint 2: Python Mapping Guidance  
**Date:** 22/06/2026 12:00 PM  
**From:** Rakhi Porwad `<r.porwad@datalens.com>`  
**To:** Ben Powers `<b.powers@datalens.com>`  
**Subject:** Re: Python Mapping Help — Recommendations  

Hi Ben,

Thanks for reaching out. I completely understand how this can feel a bit overwhelming when you’re juggling multiple tasks. I am happy to help point you in the right direction and save you some research time!

I'm balancing a few tight deadlines myself today so I won't be able to build the full solution, but I spent about 15 minutes looking into your datasets and mapped out a quick game plan to get you unblocked.

For your use case (creating a world choropleth map showing happiness index across 2015–2019), the most suitable and beginner-friendly approach would be:
- `pandas` – for loading and combining your yearly datasets. You can merge the 2015–2019 files into one DataFrame and add a `Year` column to each so they can be analysed together.
- `plotly.express` – this is the best library for your task. It allows you to create interactive world maps very easily and also supports animation by year, which is ideal for showing changes over time.
- *(Optional)* `geopandas` – useful if you want more advanced geographic control, but it’s not necessary for your current goal.

Since you're working with separate CSVs from 2015–2019, the column names are inconsistent across years, so you'll need to standardise them before merging. Here's a suggested step-by-step approach:
- Load each dataset individually and inspect the columns.
- Standardise the column names across all years.
- Add a `Year` column to each dataset.
- Keep only the columns needed for the visualisation (e.g. `Country`, `Happiness Score`, `Year`).
- Combine everything into a single master DataFrame.
- Create a map for one year first to verify everything is working correctly.
- Once that's successful, extend it to multiple years and add animation to show changes over time.

Following these steps will keep things manageable and make it much easier to debug if anything looks off.

Let me know if you’d like some guidance on how to structure or merge the datasets.

Best regards,

Rakhi Porwad  
DataLens Analytics Team

---

## [COMMS-12] Internal – Sprint 2: Client Request for Rating Insights  
**Date:** 23/06/2026 11:45 AM  
**From:** Bhanu Prakash `<b.prakash@datalens.com>`  
**To:** da-team2  
**Subject:** Fwd: Suggestion – Rating Insights

Dear Team,

I have just heard/received a message from the client during the Sprint Review. This isn’t a formal request it is more of a “thinking on the fly” moment. We won’t be responding today as we are in the middle of a sprint review. However, this is a great opportunity to practise writing relevant SQL queries and clearly documenting your thinking for non-technical stakeholders.

Regards,

Bhanu Prakash  
Product Owner  

> **Forwarded message**  
> **From:** BASH <bash@streamflix.com>  
> **Sent:** 23/06/2026 11:35 AM  
> **To:** Product Owner  
> **Subject:** Suggestion: Rating Insights
> 
> Good morning!
> Thanks again for the updates they’ve been really helpful. A thought came to mind: it might be useful to get average ratings per movie and also see how they vary between free and premium users. 
>
> No rush just something to think about.
> 
> Best regards,
> 
> Bash

---

## [COMMS-13] Internal – Sprint 3: Client Request for Age-Group Visualisations  
**Date:** 30/06/2026 01:00 PM  
**From:** Bhanu Prakash `<b.prakash@datalens.com>`  
**To:** da-team2  
**Subject:** Fwd: Request: Age-Group Visualisations

Dear Team,

I have just received the below email from the client during the Sprint Review.

Let’s take a moment to consider how these changes may affect our visualisations and identify the steps required to implement them. You can complete this directly using SQL queries, so there is no need to return to Python to regenerate the graphs.

Please update the relevant SQL queries, refresh the MySQL data imports, and amend the affected Power BI visuals accordingly.

Regards,

Bhanu Prakash  
Product Owner  

> **Forwarded message**  
> **From:** BASH `<bash@streamflix.com>`  
> **Sent:** 30/06/2026 12:30 PM  
> **To:** Product Owner  
> **Subject:** Request: Age-Group Visualisations
>
> Good morning,
>
> I hope the dashboard development is progressing well.
>
> We would like to make a small update to the user segmentation. Please group users into specific age brackets and reflect these groups in the relevant dashboard visualisations.
>
> The requested age groups are:
>
> - 0–10 years
> - 11–20 years
> - 21–30 years
> - 31–40 years
> - 41–50 years
> - And subsequent age ranges as appropriate
>
> Best regards,
>
> Bash

---

## [COMMS-14] Internal – Sprint 3: Age-Grouping Update Confirmation  
**Date:** 30/06/2026 02:30 PM  
**From:** Sabahat Naz `<s.naz@datalens.com>`  
**To:** Bhanu Prakash `<b.prakash@datalens.com>`  
**Cc:** da-team2  
**Subject:** Age-Grouping Update for Dashboard Visualisations

Dear Bhanu,

Thank you for the update and for sharing the client’s request.

We understand the requirement to group users into defined age brackets—0–10, 11–20, 21–30, 31–40, 41–50, and subsequent ranges—and reflect these changes across the dashboard visualisations.

We will implement the age-banding logic directly in SQL, refresh the MySQL data imports, and update all affected Power BI visuals accordingly. We will also review each relevant report page to ensure that the updated segmentation is applied consistently across charts and insights.

We will prioritise this change and proceed with the required updates.

Regards,

Sabahat Naz  
DataLens Analytics Team

---

## [COMMS-15] Internal – Sprint 3: Client Dashboard Feedback
**Date:** 02/07/2026 09:30 AM
**From:** Bhanu Prakash `<b.prakash@datalens.com>`
**To:** da-team2
**Subject:** Fwd: Dashboard Feedback and Requested Changes

Dear Team,

Please see the below email from the client following the dashboard presentation.

The client has requested an additional visualisation and would like us to confirm whether the requested change is feasible and when an updated dashboard could be expected.

Kind regards,

Bhanu Prakash
Product Owner

> **Forwarded message**
> **From:** BASH `<bash@streamflix.com>`
> **Sent:** 02/07/2026 09:30 AM
> **To:** Product Owner
> **Subject:** Dashboard Feedback and Requested Changes
>
> Good morning,
>
> Thank you for presenting your dashboards. Overall, I’m impressed with the work your team has done! However, I’d like to request a couple of changes:
> 
> - Could you create a graph showing the evolution of gender preferences among women over the past 50 years?
> - For the data on movies, I’d like the dashboard to only include films released after 1980.
>
> Can you let me know if these changes are feasible and, if so, when we can expect the updated dashboard? 
>
> Thanks,
>
> Bash

---

## [COMMS-16] Internal – Sprint 3: Draft Response to Client Feedback
**Date:** 02/07/2026 11:30 AM  
**From:** Andrew Chung `<a.chung@datalens.com>`  
**To:** Bhanu Prakash `<b.prakash@datalens.com>`  
**Cc:** da-team2  
**Subject:** Draft for Review: Response to Client Feedback

Hi Bhanu,

Please review the draft response below to the client’s feedback following the dashboard presentation.

> **Draft client response**
>
> Dear Bash,
>
> Thank you for the fantastic feedback during our final presentation. We are thrilled to hear that you are impressed with the dashboards the team has delivered.
>
> Regarding your requested modifications, we have just reached our final project deadline and are currently compiling our complete project handover package. Because we have concluded the agreed-upon development sprints, we cannot implement new functional changes directly into this version of the dashboards. However, if you would like to formally extend the scope to include these features, we would be happy to discuss this as a separate Change Request phase.
>
> In the meantime, we want to ensure you are fully equipped as you deploy the current system. As part of our final delivery, we are handing over all core project assets, including the interactive dashboard files, the underlying datasets, and the complete database configuration scripts.
>
> With these handovers, here is how those refinements can be approached:
>
> Filtering for post-1980 films: Since your team will have full ownership of the dashboard files and configuration scripts, this is highly achievable. A simple date filter or slicer can be applied directly to the dashboard interface, or the underlying data query can be restricted at the database level before it populates the visual layer.
>
> 50-Year Gender Preference Evolution Graph: Our current data model maps StreamFlix's specific user profiles, movie catalogue and user ratings. Because this data focuses entirely on your active platform users, it does not inherently capture the historical demographic data required to map a 50-year macro trend. To help your team or a future developer integrate this external data down the road, we have included our final [database schema and data model blueprints](../database-design/database_design_documentation.md) within the handover package.
>
> We will be forwarding the secure download link to the complete handover package by the end of the day to ensure a smooth transition. It has been an absolute pleasure collaborating with you and the StreamFlix team on this project.
>
> Best regards,
>
> [Your Name]
> DataLens Analytics Team