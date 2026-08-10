# StreamFlix data contract

This document is the source of truth for the reproducible analytical data model. It separates the current execution path from historical sprint artifacts that are retained as evidence of the team's work.

## Canonical pipeline

```text
data/raw/Movies.csv
        |
        +--> movie title/year and genre normalization
        |         |
        |         +--> data/processed/movies_clean.csv
        |         +--> data/processed/genres.csv
        |         +--> data/processed/movie_genres.csv
        |
data/raw/Users.csv ------------------------------+
                                                   |
data/raw/Ratings_Dataset.csv                       |
        |                                          |
        +--> duplicate-pair rule                   |
                  |                                |
                  +--> data/processed/ratings_clean.csv
                                                   |
                                                   v
                                  MySQL DataLensStreaming
                                                   |
                              analysis notebooks / CSV fallback
                                                   |
                                                   v
                                  Power BI PBIP/PBIR/TMDL
                                                   |
                                                   v
                                    evidence-aware findings
```

The checked-in processed CSV files are the reproducible analytical snapshots used by the canonical notebook and Power BI model. MySQL is the canonical database backend from the project specifications, sprint records, README, and setup deliverable. SQL Server connections found in older notebooks are historical execution details, not a second supported backend.

## Authority of repository artifacts

| Artifact | Status | Role |
|---|---|---|
| `data/raw/*.csv` | Authoritative inputs | Client-provided source snapshots. |
| `data/processed/movies_clean.csv` | Authoritative analytical table | Normalized movie attributes. |
| `data/processed/genres.csv` | Authoritative analytical table | Genre lookup. |
| `data/processed/movie_genres.csv` | Authoritative analytical table | Movie-to-genre junction. |
| `data/processed/ratings_clean.csv` | Authoritative analytical table | Ratings after the team's duplicate-pair rule. |
| `data/processed/device_distribution_*.csv` | Derived output | Reusable extracts created for exploratory visualizations. |
| `data/processed/top10_movies.csv` | Derived output | All movies with more than five ratings, sorted by average rating; despite the filename, it contains more than ten rows. |
| `data/processed/most_popular_genres.csv` | Derived output | Movie counts by genre. |
| `reports/DataLens_Streaming_Final.*` | Current report source and exports | PBIP/PBIR/TMDL is editable source; PDF/PNG files are review exports. |
| Sprint notes, communication log, specifications | Historical record | Explain decisions and collaboration; they are not executable setup instructions. |
| Backend-specific legacy notebooks | Historical analysis record | Preserve team work, but are not the canonical rerun path. See [`src/README.md`](../src/README.md). |

## Canonical database

- Engine: MySQL 8.0 or later.
- Database: `DataLensStreaming`.
- Character set: `utf8mb4`.
- Executable assets: [`database/schema.sql`](../database/schema.sql), [`database/import.sql`](../database/import.sql), and [`database/validate.sql`](../database/validate.sql).

The canonical tables are lowercase to avoid cross-platform case-sensitivity surprises:

### `users`

| Column | MySQL type | Constraint/source |
|---|---|---|
| `UserID` | `VARCHAR(16)` | Primary key; source values are strings such as `SF_1`. |
| `Age` | `TINYINT UNSIGNED` | Required. |
| `Gender` | `CHAR(1)` | `F` or `M`. |
| `Country` | `VARCHAR(100)` | Required. |
| `SubscriptionStatus` | `VARCHAR(20)` | `Free` or `Subscriber`. |
| `TotalWatchTime` | `INT UNSIGNED` | Aggregate user-level watch time supplied in the source. |
| `Device` | `VARCHAR(50)` | Required. |

### `movies_clean`

| Column | MySQL type | Constraint/source |
|---|---|---|
| `MovieID` | `INT UNSIGNED` | Primary key. |
| `Movie_Title` | `VARCHAR(255)` | Required. |
| `Year` | `SMALLINT UNSIGNED` | Required; current range is 1919-2000. |
| `Language` | `VARCHAR(100)` | Required. |
| `Country` | `VARCHAR(100)` | Required. |
| `TotalViews` | `INT UNSIGNED` | Maps from the CSV header `Total Views`. |

### `ratings_clean`

| Column | MySQL type | Constraint/source |
|---|---|---|
| `RatingID` | `INT UNSIGNED` | Primary key. |
| `UserID` | `VARCHAR(16)` | Foreign key to `users.UserID`. |
| `MovieID` | `INT UNSIGNED` | Foreign key to `movies_clean.MovieID`. |
| `Rating` | `DECIMAL(2,1)` | Required, range 1.0-5.0. |
| `Timestamp` | `DATETIME` | Date-time of the supplied rating record. The time component is not analytically informative in this dataset. |

The table also enforces uniqueness on `(UserID, MovieID)` because the processed snapshot contains one retained rating per user/movie pair.

### `genres` and `movie_genres`

| Table | Columns | Keys |
|---|---|---|
| `genres` | `GenreID INT UNSIGNED`, `Genre_Name VARCHAR(100)` | Primary key `GenreID`; unique `Genre_Name`. |
| `movie_genres` | `MovieID INT UNSIGNED`, `GenreID INT UNSIGNED` | Composite primary key; foreign keys to `movies_clean` and `genres`. |

## CSV-to-table mapping

| CSV | Destination | Header mapping |
|---|---|---|
| `data/raw/Users.csv` | `users` | Direct: `UserID`, `Age`, `Gender`, `Country`, `SubscriptionStatus`, `TotalWatchTime`, `Device`. |
| `data/processed/movies_clean.csv` | `movies_clean` | Direct except `Total Views` -> `TotalViews`. |
| `data/processed/ratings_clean.csv` | `ratings_clean` | Direct: `RatingID`, `UserID`, `MovieID`, `Rating`, `Timestamp`; import parses `d/m/Y H:M`. |
| `data/processed/genres.csv` | `genres` | Direct: `GenreID`, `Genre_Name`. |
| `data/processed/movie_genres.csv` | `movie_genres` | Direct: `MovieID`, `GenreID`. |

## Duplicate-rating decision

The raw ratings file contains two repeated `(UserID, MovieID)` pairs. The team retained the row with the numerically greatest `RatingID`, removing IDs `1183` and `7937`. The processed file and Power BI model implement that rule.

This is not equivalent to retaining the latest timestamp in every case: for user `SF_1756` and movie `745`, retained RatingID `8708` has an earlier timestamp than removed RatingID `7937`. The rule is preserved to keep the delivered analysis stable, but future data should use an explicit event timestamp and a documented tie-breaking rule.

## Reproduce and validate

From the repository root:

```bash
python scripts/validate_project.py
mysql --local-infile=1 < database/schema.sql
mysql --local-infile=1 DataLensStreaming < database/import.sql
mysql DataLensStreaming < database/validate.sql
```

The Python validator requires only the standard library. It checks file presence, exact headers and row counts, primary/foreign-key assumptions, the duplicate-rating rule, JSON syntax, local documentation links, and repository hygiene.

For the Python analysis workflow and notebook status, see [`src/README.md`](../src/README.md). For interpretation limits, see [`analysis-methodology.md`](analysis-methodology.md).
