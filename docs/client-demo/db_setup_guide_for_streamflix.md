MySQL Database Setup Guide for StreamFlix

## 1. Set up the database connection

```sql
CREATE DATABASE IF NOT EXISTS DataLensStreaming;
USE DataLensStreaming;
```

## 2. Creating genres table

```sql
CREATE TABLE genres (
  GenreID INT PRIMARY KEY,
  Genre_Name VARCHAR(100) NOT NULL
);
```

```sql
SHOW VARIABLES LIKE 'secure_file_priv';
```

2

```sql
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/movies_clean.csv'
INTO TABLE movies_clean
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(MovieID, Movie_Title, Year, Language, Country, Total_Views);
```

## 3. Creating movies_clean table

```sql
CREATE TABLE movies_clean (
  MovieID INT PRIMARY KEY,
  Movie_Title VARCHAR(255) NOT NULL,
  Year INT,
  Language VARCHAR(100),
  Country VARCHAR(100),
  Total_Views INT
);
```

## 4. Creating movies_genres table

```sql
CREATE TABLE movie_genres (
  MovieID INT NOT NULL,
  GenreID INT NOT NULL,
  PRIMARY KEY (MovieID, GenreID),
  CONSTRAINT fk_movie_genres_movie
    FOREIGN KEY (MovieID)
    REFERENCES movies_clean(MovieID),
  CONSTRAINT fk_movie_genres_genre
    FOREIGN KEY (GenreID)
    REFERENCES genres(GenreID)
);
```

3

## 5. Creating ratings table

```sql
CREATE TABLE ratings (
  RatingID INT PRIMARY KEY,
  UserID INT NOT NULL,
  MovieID INT NOT NULL,
  Rating DECIMAL(2,1),
  Rating_Timestamp DATETIME,
  CONSTRAINT fk_ratings_user
    FOREIGN KEY (UserID)
    REFERENCES users(UserID),
  CONSTRAINT fk_ratings_movie
    FOREIGN KEY (MovieID)
    REFERENCES movies_clean(MovieID)
);
```

## 6. Creating users table

```sql
CREATE TABLE users (
  UserID INT PRIMARY KEY,
  Age INT,
  Gender VARCHAR(20),
  Country VARCHAR(50),
  Subscription_Status VARCHAR(20),
  Total_Watch_Time INT,
  Device VARCHAR(50)
);
```