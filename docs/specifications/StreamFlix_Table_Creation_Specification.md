# StreamFlix SQL Table Creation & Data Ingestion Specification

> **Historical Sprint artifact.** This document records the original ingestion specification. The executable MySQL 8 setup is `database/schema.sql` plus `database/import.sql`; exact mappings are in the [data contract](../data-contract.md).


**Document:** `StreamFlix_Table_Creation_Specification`  
**Author:** Bhanu Prakash (Product Owner)  
**Project:** DataLens Streaming  
**Target Sprint:** Sprint 2  

---

## Objective
Implement the physical schema in MySQL and ingest the prepared CSV datasets.

---

## Implementation Steps

### 1. Environment & Database Initialization
- Create database: `DataLensStreaming`.
- Ensure character set is configured for international titles and text (UTF-8).

### 2. Table Creation (`DDL`)
- Define primary keys and appropriate data types for `Users`, `movies_clean`, `genres`, `movie_genres`, and `Ratings`.
- Establish foreign key constraints:
  - `Ratings.UserID` -> `Users.UserID`
  - `Ratings.MovieID` -> `movies_clean.MovieID`
  - `movie_genres.MovieID` -> `movies_clean.MovieID`
  - `movie_genres.GenreID` -> `genres.GenreID`

### 3. Data Ingestion Protocol
- Import CSV datasets using `LOAD DATA INFILE` or database import wizards:
  - `Users.csv` -> `Users`
  - `movies_refined.csv` -> `movies_clean`
  - `Ratings_Dataset.csv` -> `Ratings`

### 4. Data Validation Queries
- Validate referential integrity between `Ratings` and parent tables (`Users`, `movies_clean`).
- Resolve duplicate ratings by isolating unique composite pairs `(UserID, MovieID)` and retaining the latest `RatingID`.
- Verify record counts match source CSV line counts.

---

## Deliverables
- Complete SQL DDL and DML scripts.
- Data verification query outputs and error logs.