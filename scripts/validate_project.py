#!/usr/bin/env python3
"""Validate the repository data contract without third-party dependencies."""

from __future__ import annotations

import csv
import json
import re
import sys
from collections import Counter, defaultdict
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]

EXPECTED = {
    "data/raw/Movies.csv": (
        ["MovieID", "Title", "Genres", "Language", "Country", "Total Views"],
        3883,
    ),
    "data/raw/Ratings_Dataset.csv": (
        ["RatingID", "UserID", "MovieID", "Rating", "Timestamp"],
        10000,
    ),
    "data/raw/Users.csv": (
        [
            "UserID",
            "Age",
            "Gender",
            "Country",
            "SubscriptionStatus",
            "TotalWatchTime",
            "Device",
        ],
        6040,
    ),
    "data/processed/genres.csv": (["GenreID", "Genre_Name"], 18),
    "data/processed/movie_genres.csv": (["MovieID", "GenreID"], 6404),
    "data/processed/movies_clean.csv": (
        ["MovieID", "Movie_Title", "Year", "Language", "Country", "Total Views"],
        3883,
    ),
    "data/processed/ratings_clean.csv": (
        ["RatingID", "UserID", "MovieID", "Rating", "Timestamp"],
        9998,
    ),
}


def read_csv(relative_path: str) -> tuple[list[str], list[dict[str, str]]]:
    path = ROOT / relative_path
    with path.open(newline="", encoding="utf-8-sig") as stream:
        reader = csv.DictReader(stream)
        return list(reader.fieldnames or []), list(reader)


def validate_data(errors: list[str]) -> None:
    loaded: dict[str, list[dict[str, str]]] = {}
    for relative_path, (expected_headers, expected_rows) in EXPECTED.items():
        path = ROOT / relative_path
        if not path.is_file():
            errors.append(f"missing required dataset: {relative_path}")
            continue
        headers, rows = read_csv(relative_path)
        loaded[relative_path] = rows
        if headers != expected_headers:
            errors.append(
                f"{relative_path}: headers {headers!r}, expected {expected_headers!r}"
            )
        if len(rows) != expected_rows:
            errors.append(
                f"{relative_path}: {len(rows)} rows, expected {expected_rows}"
            )

    if len(loaded) != len(EXPECTED):
        return

    users = loaded["data/raw/Users.csv"]
    raw_ratings = loaded["data/raw/Ratings_Dataset.csv"]
    ratings = loaded["data/processed/ratings_clean.csv"]
    movies = loaded["data/processed/movies_clean.csv"]
    genres = loaded["data/processed/genres.csv"]
    movie_genres = loaded["data/processed/movie_genres.csv"]

    def require_unique(rows: list[dict[str, str]], key: str, label: str) -> None:
        values = [row[key] for row in rows]
        duplicates = [value for value, count in Counter(values).items() if count > 1]
        if duplicates:
            errors.append(f"{label}: duplicate {key} values {duplicates[:5]}")

    require_unique(users, "UserID", "users")
    require_unique(ratings, "RatingID", "ratings_clean")
    require_unique(movies, "MovieID", "movies_clean")
    require_unique(genres, "GenreID", "genres")

    user_ids = {row["UserID"] for row in users}
    movie_ids = {row["MovieID"] for row in movies}
    genre_ids = {row["GenreID"] for row in genres}
    pairs = [(row["UserID"], row["MovieID"]) for row in ratings]
    movie_genre_pairs = [(row["MovieID"], row["GenreID"]) for row in movie_genres]

    if len(pairs) != len(set(pairs)):
        errors.append("ratings_clean: duplicate (UserID, MovieID) pairs")
    if len(movie_genre_pairs) != len(set(movie_genre_pairs)):
        errors.append("movie_genres: duplicate (MovieID, GenreID) pairs")
    if any(row["UserID"] not in user_ids for row in ratings):
        errors.append("ratings_clean: orphan UserID values")
    if any(row["MovieID"] not in movie_ids for row in ratings):
        errors.append("ratings_clean: orphan MovieID values")
    if any(row["MovieID"] not in movie_ids for row in movie_genres):
        errors.append("movie_genres: orphan MovieID values")
    if any(row["GenreID"] not in genre_ids for row in movie_genres):
        errors.append("movie_genres: orphan GenreID values")

    invalid_ratings = [
        row["RatingID"]
        for row in ratings
        if not 1.0 <= float(row["Rating"]) <= 5.0
    ]
    if invalid_ratings:
        errors.append(f"ratings_clean: values outside 1-5 at {invalid_ratings[:5]}")

    # Preserve and verify the team's documented cleaning rule: for duplicate
    # user/movie pairs, retain the numerically greatest RatingID. RatingID is
    # not guaranteed to be chronological; the data contract documents this.
    grouped: dict[tuple[str, str], list[dict[str, str]]] = defaultdict(list)
    for row in raw_ratings:
        grouped[(row["UserID"], row["MovieID"])].append(row)
    expected_ids = {
        max(rows, key=lambda row: int(row["RatingID"]))["RatingID"]
        for rows in grouped.values()
    }
    actual_ids = {row["RatingID"] for row in ratings}
    if actual_ids != expected_ids:
        missing = sorted(expected_ids - actual_ids, key=int)
        extra = sorted(actual_ids - expected_ids, key=int)
        errors.append(
            f"ratings_clean: cleaning rule mismatch; missing={missing}, extra={extra}"
        )


def validate_json(errors: list[str]) -> None:
    for pattern in ("**/*.json", "**/*.ipynb"):
        for path in ROOT.glob(pattern):
            if ".git" in path.parts:
                continue
            try:
                json.loads(path.read_text(encoding="utf-8-sig"))
            except (OSError, UnicodeError, json.JSONDecodeError) as exc:
                errors.append(f"invalid JSON: {path.relative_to(ROOT)}: {exc}")


def validate_markdown_links(errors: list[str]) -> None:
    link_pattern = re.compile(r"!?\[[^\]]*\]\(([^)]+)\)")
    for path in ROOT.rglob("*.md"):
        text = path.read_text(encoding="utf-8-sig")
        for target in link_pattern.findall(text):
            target = target.strip().split()[0].strip("<>")
            if target.startswith(("http://", "https://", "mailto:", "#")):
                continue
            target = target.split("#", 1)[0]
            if not target:
                continue
            resolved = (path.parent / target).resolve()
            if not resolved.exists():
                errors.append(
                    f"broken Markdown link in {path.relative_to(ROOT)}: {target}"
                )


def validate_repository_hygiene(errors: list[str]) -> None:
    forbidden = [
        path
        for path in ROOT.rglob("*")
        if path.is_file()
        and path.name in {"localSettings.json", "cache.abf"}
        and ".pbi" in path.parts
    ]
    for path in forbidden:
        errors.append(f"Power BI local file is tracked/present: {path.relative_to(ROOT)}")

    windows_user_path = re.compile(r"[A-Za-z]:\\Users\\")
    credential_url = re.compile(r"://[^:/\s]+:[^@/\s]+@")
    for path in ROOT.rglob("*"):
        if not path.is_file() or ".git" in path.parts:
            continue
        if path.suffix.lower() not in {".md", ".py", ".sql", ".tmdl", ".ipynb"}:
            continue
        try:
            text = path.read_text(encoding="utf-8-sig")
        except UnicodeError:
            continue
        if windows_user_path.search(text):
            errors.append(f"machine-specific user path in {path.relative_to(ROOT)}")
        if credential_url.search(text):
            errors.append(f"credential-like URL in {path.relative_to(ROOT)}")


def main() -> int:
    errors: list[str] = []
    validate_data(errors)
    validate_json(errors)
    validate_markdown_links(errors)
    validate_repository_hygiene(errors)

    if errors:
        print("Validation failed:")
        for error in errors:
            print(f"- {error}")
        return 1

    print(
        "Validation passed: datasets, keys, relationships, cleaning rule, JSON, "
        "documentation links, and repository hygiene are consistent."
    )
    return 0


if __name__ == "__main__":
    sys.exit(main())
