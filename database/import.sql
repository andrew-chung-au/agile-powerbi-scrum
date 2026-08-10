-- Deterministic CSV import for the canonical MySQL schema.
-- Run this file from the repository root so the relative paths resolve:
--   mysql --local-infile=1 DataLensStreaming < database/import.sql

USE DataLensStreaming;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE movie_genres;
TRUNCATE TABLE ratings_clean;
TRUNCATE TABLE users;
TRUNCATE TABLE movies_clean;
TRUNCATE TABLE genres;
SET FOREIGN_KEY_CHECKS = 1;

LOAD DATA LOCAL INFILE 'data/processed/genres.csv'
INTO TABLE genres
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@GenreID, @GenreName)
SET
  GenreID = @GenreID,
  Genre_Name = TRIM(TRAILING '\r' FROM @GenreName);

LOAD DATA LOCAL INFILE 'data/processed/movies_clean.csv'
INTO TABLE movies_clean
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@MovieID, @MovieTitle, @Year, @Language, @Country, @TotalViews)
SET
  MovieID = @MovieID,
  Movie_Title = @MovieTitle,
  `Year` = @Year,
  Language = @Language,
  Country = @Country,
  TotalViews = TRIM(TRAILING '\r' FROM @TotalViews);

LOAD DATA LOCAL INFILE 'data/raw/Users.csv'
INTO TABLE users
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@UserID, @Age, @Gender, @Country, @SubscriptionStatus, @TotalWatchTime, @Device)
SET
  UserID = @UserID,
  Age = @Age,
  Gender = @Gender,
  Country = @Country,
  SubscriptionStatus = @SubscriptionStatus,
  TotalWatchTime = @TotalWatchTime,
  Device = TRIM(TRAILING '\r' FROM @Device);

LOAD DATA LOCAL INFILE 'data/processed/ratings_clean.csv'
INTO TABLE ratings_clean
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@RatingID, @UserID, @MovieID, @Rating, @Timestamp)
SET
  RatingID = @RatingID,
  UserID = @UserID,
  MovieID = @MovieID,
  Rating = @Rating,
  `Timestamp` = STR_TO_DATE(
    TRIM(TRAILING '\r' FROM @Timestamp),
    '%e/%c/%Y %k:%i'
  );

LOAD DATA LOCAL INFILE 'data/processed/movie_genres.csv'
INTO TABLE movie_genres
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@MovieID, @GenreID)
SET
  MovieID = @MovieID,
  GenreID = TRIM(TRAILING '\r' FROM @GenreID);
