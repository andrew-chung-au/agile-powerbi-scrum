-- Canonical StreamFlix schema for MySQL 8.0+
-- Run from the repository root:
--   mysql --local-infile=1 < database/schema.sql

CREATE DATABASE IF NOT EXISTS DataLensStreaming
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_0900_ai_ci;

USE DataLensStreaming;

CREATE TABLE IF NOT EXISTS genres (
  GenreID INT UNSIGNED NOT NULL,
  Genre_Name VARCHAR(100) NOT NULL,
  PRIMARY KEY (GenreID),
  UNIQUE KEY uq_genres_name (Genre_Name)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS movies_clean (
  MovieID INT UNSIGNED NOT NULL,
  Movie_Title VARCHAR(255) NOT NULL,
  `Year` SMALLINT UNSIGNED NOT NULL,
  Language VARCHAR(100) NOT NULL,
  Country VARCHAR(100) NOT NULL,
  TotalViews INT UNSIGNED NOT NULL,
  PRIMARY KEY (MovieID),
  CONSTRAINT chk_movies_year CHECK (`Year` BETWEEN 1888 AND 2100)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS users (
  UserID VARCHAR(16) NOT NULL,
  Age TINYINT UNSIGNED NOT NULL,
  Gender CHAR(1) NOT NULL,
  Country VARCHAR(100) NOT NULL,
  SubscriptionStatus VARCHAR(20) NOT NULL,
  TotalWatchTime INT UNSIGNED NOT NULL,
  Device VARCHAR(50) NOT NULL,
  PRIMARY KEY (UserID),
  CONSTRAINT chk_users_age CHECK (Age <= 120),
  CONSTRAINT chk_users_gender CHECK (Gender IN ('F', 'M')),
  CONSTRAINT chk_users_subscription CHECK (
    SubscriptionStatus IN ('Free', 'Subscriber')
  )
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS ratings_clean (
  RatingID INT UNSIGNED NOT NULL,
  UserID VARCHAR(16) NOT NULL,
  MovieID INT UNSIGNED NOT NULL,
  Rating DECIMAL(2,1) NOT NULL,
  `Timestamp` DATETIME NOT NULL,
  PRIMARY KEY (RatingID),
  UNIQUE KEY uq_ratings_user_movie (UserID, MovieID),
  KEY ix_ratings_movie (MovieID),
  CONSTRAINT fk_ratings_user
    FOREIGN KEY (UserID) REFERENCES users (UserID),
  CONSTRAINT fk_ratings_movie
    FOREIGN KEY (MovieID) REFERENCES movies_clean (MovieID),
  CONSTRAINT chk_ratings_value CHECK (Rating BETWEEN 1.0 AND 5.0)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS movie_genres (
  MovieID INT UNSIGNED NOT NULL,
  GenreID INT UNSIGNED NOT NULL,
  PRIMARY KEY (MovieID, GenreID),
  KEY ix_movie_genres_genre (GenreID),
  CONSTRAINT fk_movie_genres_movie
    FOREIGN KEY (MovieID) REFERENCES movies_clean (MovieID),
  CONSTRAINT fk_movie_genres_genre
    FOREIGN KEY (GenreID) REFERENCES genres (GenreID)
) ENGINE=InnoDB;
