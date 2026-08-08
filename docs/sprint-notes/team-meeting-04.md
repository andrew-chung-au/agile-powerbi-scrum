# Team Meeting 04 Notes (Sprint 2)

**Date:** 22/06/2026
**Project:** DataLens Streaming
**Client:** StreamFlix
**Meeting purpose:** Sprint 2 kickoff — database schema design and SQL implementation

This fourth team meeting marked the transition from Sprint 1 into Sprint 2. The session was used to review the Product Owner's (Bhanu Prakash) sprint communication, confirm the tasks assigned for Sprint 2, and address a peer support request received via the team channel. The focus of Sprint 2 is to move from data exploration into physical database implementation.

## Sprint 2 launch communication

Product Owner (Bhanu Prakash) issued the Sprint 2 briefing (`[COMMS-09]`), attaching the formal design and implementation briefs:
- `StreamFlix_Database_Schema_Design.docx` (Task 4 specification)
- `StreamFlix_Table_Creation_Specification.docx` (Task 6 specification)

The team confirmed deliverables for Sprint 2: ERD diagrams, MySQL table creation scripts, and initial data exploration queries.

## Sprint 2 tasks assigned

The following tasks were assigned to the team for Sprint 2, covering schema design, physical database implementation, and early data exploration.

### Define the database structure
The team was assigned the task of designing the database schema by identifying the necessary tables, fields, and relationships based on the client requirements established during Sprint 1.

The team agreed on the following conceptual schema structure:

- **Movies table:** movie identifier, title, year, language, country, and total views
- **Users table:** user identifier, age, gender, country, subscription status, total watch time, and device
- **Ratings table:** rating identifier, linked user, linked movie, rating value, and timestamp
- **Genres table:** genre identifier and genre name
- **Movie_Genres table:** linked movie and linked genre, resolving the many-to-many relationship between movies and genres

The relationships were confirmed as One-to-Many between `Users` and `Ratings`, and One-to-Many between `movies` and `Ratings`. `movies` and `genres` share a Many-to-Many relationship, resolved through the `movie_genres` junction table, allowing a single film to belong to multiple genres without duplication. This is consistent with the Star Schema design recommended at the end of Sprint 1, with `Ratings` as the Fact Table and `Users`, `movies`, and `genres` as Dimension Tables.

The team will use SQL and an ERD tool to complete this task. Deliverables include an ERD diagram and a schema design documentation file uploaded to Jira.

### Implement tables in SQL
The team was also assigned the task of creating the `movies`, `Users`, `Ratings`, `genres`, and `movie_genres` tables in the SQL database and validating the relationships between them.

The team discussed and agreed on the following implementation approach:

1. Set up the database connection and identify the appropriate method for importing data from CSV files
2. Write `CREATE TABLE` SQL statements with appropriate data types and primary keys for all tables
3. Create the `Ratings` and `movie_genres` tables with foreign key references to the relevant parent tables
4. Validate foreign key relationships by inserting sample data and running test queries
5. Save and document all SQL scripts on Jira

Deliverables for this task include SQL scripts for all tables, test queries, and validation screenshots or logs.

### Data exploration for future visualisation
To prepare for the upcoming visualisation and dashboard work, the team took the initiative to think through how the dataset could be explored and structured for future analysis. The focus was on identifying useful measures and considering how different dimension categories, such as age groups and movie decades, might affect the way the data could later be visualised.

## Peer support — ad hoc request

The team reviewed an ad hoc request from Ben Powers (`[COMMS-10]`) seeking guidance on building a world choropleth map in Python for the happiness index. 

Rakhi Porwad shared recommended libraries and steps (`[COMMS-11]`):
- Using `pandas` to merge 2015–2019 CSVs after standardizing inconsistent column headers.
- Using `plotly.express` for interactive, animated geographic rendering.
- `geopandas` as an optional extension for customized boundary control.

## Key discussion points

The team confirmed that the schema structure agreed during Sprint 1 remained appropriate for the current sprint and continued to align with the available data.

The team also noted that some user performance metrics were available, but not in the full form originally hoped for, and no internal success benchmarks were provided. The Product Owner (Bhanu Prakash) clarified that the team would need to establish its own thresholds for analysis and focus on building the strongest possible outcome from the data that was available. Film availability dates were not supplied, and clarification on the movie-level Language and Country fields was not provided, making those dimensions difficult to use reliably in the analysis.

The earlier planning items around priority regions, rights acquisition costs, promotional spend, and dashboard stakeholder detail were not progressed, so those aspects were no longer in scope for the current phase.

The timestamp field was also treated as a date-level value for analysis purposes, which supported cleaner processing and more consistent reporting across the dataset.

## Immediate actions agreed

The team agreed to:
- begin ERD diagramming based on the confirmed five-table schema,
- write `CREATE TABLE` SQL statements for all tables,
- validate the schema by importing sample data from the provided CSV files and testing query relationships,
- resolve the outstanding unmatched `UserID` referential integrity issue before finalising the schema,
- consider future measures and dimension categories to support later visualisation work, share any relevant insights or observations with the team,
- and upload all completed SQL scripts, ERD diagrams, and documentation to Jira before the Sprint 2 review session.

## Next steps

The next phase of work will focus on physical database implementation and early data exploration. The team will proceed using the confirmed data structure, with all deliverables to be completed and documented on Jira by the Sprint 2 review.

## Related Documents
* **Communication Log:** [`[COMMS-09] Sprint 1 Close Briefing`, `[COMMS-10]` & `[COMMS-11] Python Mapping Support`](../communication/communication_log.md)
* **Design Specifications:** [Database Schema Design](../specifications/StreamFlix_Database_Schema_Design.md), [Table Creation Specification](../specifications/StreamFlix_Table_Creation_Specification.md)
* **Design Deliverable:** [Database Design Documentation](../database-design/database_design_documentation.md)