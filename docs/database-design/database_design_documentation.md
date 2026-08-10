# Database Schema Design Documentation – Streaming Platform

> **Current contract:** This document describes the design rationale. For the executable MySQL 8 schema, exact data types, CSV mappings, and canonical names, use the [StreamFlix data contract](../data-contract.md) and the SQL files in [`database/`](../../database/).

## 1. Overview

The database is designed to store and connect user activity data in a structured format. It follows a relational model to ensure the data is well-organized, consistent, and easy to analyse.

## 2. Tables

### Movies (`movies_clean`)
The `movies_clean` table stores core movie information: `MovieID` (primary key), `Movie_Title`, `Year`, `Language`, `Country`, and `TotalViews`. It is used to analyse movie metadata and the supplied catalog-level view totals.

### Users (`users`)
The `users` table contains `UserID` (a string primary key such as `SF_1`), `Age`, `Gender`, `Country`, `SubscriptionStatus`, `TotalWatchTime`, and `Device`. It supports demographic and current-cohort descriptions.

### Ratings (`ratings_clean`)
The `ratings_clean` table captures one retained rating per user/movie pair. It includes `RatingID` (primary key), `UserID` and `MovieID` (foreign keys), `Rating`, and `Timestamp`. It connects users and movies and supports descriptive rating analysis.

### Genres
The Genres table stores genre categories with `GenreID` as the primary key and `Genre_Name` as the attribute. It provides a standard classification system for movies.

### Movie genres (`movie_genres`)
The `movie_genres` junction table links movies and genres using `MovieID` and `GenreID` as a composite primary key and foreign keys. It resolves the many-to-many relationship where a movie can belong to multiple genres and a genre can include multiple movies.

## 3. Relationships

The schema includes one-to-many relationships from `users` and `movies_clean` to `ratings_clean`. It also includes a many-to-many relationship between movies and genres, implemented through `movie_genres`.

## 4. Design Rationale

The separation of Ratings from Users and Movies allows scalable analysis of user behaviour and movie performance. The junction table ensures proper handling of complex relationships between movies and genres, while foreign keys maintain referential integrity across all tables.

## 5. Key Benefits

This schema supports efficient querying, scalable analytics, and recommendation system development. It ensures clean data separation, reduces duplication, and provides a strong foundation for analysing user behaviour, movie trends, and genre distribution.
