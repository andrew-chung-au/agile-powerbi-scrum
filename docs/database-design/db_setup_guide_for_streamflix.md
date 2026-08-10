# MySQL database setup guide for StreamFlix

The supported database backend is **MySQL 8.0 or later** and the canonical database name is **`DataLensStreaming`**. The executable SQL is stored in `database/`; this guide explains how to run it without duplicating a second, drifting copy of the schema in prose.

For exact columns, types, CSV mappings, artifact authority, and the duplicate-rating decision, read the [StreamFlix data contract](../data-contract.md).

## Prerequisites

- MySQL Server and the `mysql` command-line client.
- Permission to create the `DataLensStreaming` database.
- Local-file loading enabled in both the client and server where required.
- A clone of this repository; run commands from its root directory so relative CSV paths resolve.

No credentials are stored in this repository. Supply them through the normal MySQL prompt or your local client configuration.

## 1. Create the schema

```bash
mysql --local-infile=1 -u YOUR_USER -p < database/schema.sql
```

[`database/schema.sql`](../../database/schema.sql) creates:

- `genres`;
- `movies_clean`;
- `users`;
- `ratings_clean`;
- `movie_genres`.

It defines primary keys, foreign keys, the movie/genre composite key, one-rating-per-user/movie uniqueness, and basic domain checks.

## 2. Import the checked-in snapshots

```bash
mysql --local-infile=1 -u YOUR_USER -p DataLensStreaming < database/import.sql
```

[`database/import.sql`](../../database/import.sql) truncates the five canonical tables and reloads them in dependency order from:

```text
data/raw/Users.csv
data/processed/movies_clean.csv
data/processed/ratings_clean.csv
data/processed/genres.csv
data/processed/movie_genres.csv
```

The script uses `LOAD DATA LOCAL INFILE` and repository-relative paths. It maps the movie CSV header `Total Views` to the SQL column `TotalViews`, parses the processed rating timestamp as day/month/year, and trims carriage returns so the import behaves consistently with CRLF or LF checkouts.

If MySQL reports that local data loading is disabled, inspect your client/server policy before changing it. Do not replace the repository paths with an author's personal absolute paths.

## 3. Validate the load

First validate the repository snapshots without a database:

```bash
python scripts/validate_project.py
```

Then validate the loaded MySQL tables:

```bash
mysql -u YOUR_USER -p DataLensStreaming < database/validate.sql
```

[`database/validate.sql`](../../database/validate.sql) returns a `Passed` value for expected row counts, foreign-key coverage, duplicate user/movie ratings, and rating range. Every `Passed` value should be `1`.

Expected canonical counts are:

| Table | Rows |
|---|---:|
| `genres` | 18 |
| `movies_clean` | 3,883 |
| `users` | 6,040 |
| `ratings_clean` | 9,998 |
| `movie_genres` | 6,404 |

## 4. Example relationship query

All names below exist in the canonical schema:

```sql
SELECT
  r.RatingID,
  r.UserID,
  u.SubscriptionStatus,
  r.MovieID,
  m.Movie_Title,
  r.Rating,
  r.`Timestamp`
FROM ratings_clean AS r
JOIN users AS u ON u.UserID = r.UserID
JOIN movies_clean AS m ON m.MovieID = r.MovieID
ORDER BY r.RatingID
LIMIT 20;
```

## Historical naming note

Sprint documents and exploratory notebooks contain names such as `ratings`, `Ratings_Dataset`, `Subscription_Status`, `Total_Watch_Time`, `Rating_Timestamp`, and the SQL Server database `DataLens`. They are retained as project history. The executable files in `database/` and the [data contract](../data-contract.md) supersede those names for current setup.
