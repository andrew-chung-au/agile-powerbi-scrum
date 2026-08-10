# StreamFlix Database Schema Design Specification

> **Historical Sprint artifact.** This document records the team’s original design intent. For the current executable names, types, and constraints, use the [data contract](../data-contract.md) and `database/schema.sql`.


**Document:** `StreamFlix_Database_Schema_Design`  
**Author:** Bhanu Prakash (Product Owner)  
**Project:** DataLens Streaming  
**Target Sprint:** Sprint 2  

---

## Objective
Design a relational schema (Star Schema) capable of supporting audience segmentation, watch behavior analysis, and content performance reporting.

---

## Required Entities & Attributes

### 1. Dimension: Users (`Users`)
- `UserID` (INT, Primary Key)
- `Age` (INT)
- `Gender` (VARCHAR)
- `Country` (VARCHAR)
- `SubscriptionStatus` (VARCHAR) — *Free vs. Premium*
- `TotalWatchtime` (INT / FLOAT)
- `Device` (VARCHAR)

### 2. Dimension: Movies (`movies_clean` / `Movies`)
- `MovieID` (INT, Primary Key)
- `Movie_Title` (VARCHAR)
- `Year` (INT)
- `Language` (VARCHAR)
- `Country` (VARCHAR)
- `Total_Views` (INT)

### 3. Fact: Ratings (`Ratings`)
- `RatingID` (INT, Primary Key)
- `UserID` (INT, Foreign Key referencing `Users.UserID`)
- `MovieID` (INT, Foreign Key referencing `movies_clean.MovieID`)
- `Rating` (DECIMAL/INT, valid range 1–5)
- `Timestamp` (DATE / DATETIME) — *Treated at date-level granularity*

### 4. Normalized Genre Model (Junction Implementation)
- **`genres`**: `GenreID` (PK), `Genre_Name` (VARCHAR)
- **`movie_genres`**: `MovieID` (PK, FK1), `GenreID` (PK, FK2) — resolves Many-to-Many relationship between films and multiple genres.

---

## Deliverables
1. Entity Relationship Diagram (ERD) created via Lucidchart or MySQL Workbench.
2. Schema design document detailing normalization rationale and cardinality.