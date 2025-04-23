# 🎬 IMDB Movies SQL Analysis Project

A structured SQL-based data analysis project using the IMDB movie dataset, aimed at extracting insights about movies, directors, popularity, and box office revenue. This project demonstrates practical SQL querying skills applied on a relational database with multiple use cases.

---

## 🎯 Project Objective

To explore and analyze the IMDB dataset to answer key business and entertainment-related questions such as:

- Who are the most prolific and profitable directors?
- What are the most popular and high-revenue movies?
- Which movies have the highest ratings since 2000?
- How many female directors are in the database?

This project strengthens data analysis skills with hands-on experience in **JOINs, Aggregations, Sorting, Filtering, Subqueries**, and **Pattern Matching** in SQL.

---

## 🗃️ Dataset Information

The project utilizes two relational tables:

### 🎥 Movies Table
- `id` (Movie ID)
- `original_title` (Movie name)
- `budget`, `revenue`, `popularity`
- `release_date`, `vote_average`, `vote_count`
- `director_id` (Foreign key from directors)
- `tagline`, `overview`, `title`

### 🎬 Directors Table
- `id` (Director ID – Primary Key)
- `name`, `gender`, `department`

> 🔗 These tables are joined via: `movies.director_id = directors.id`

---

## 📌 SQL Tasks Performed

# Combine all SQL queries from the IMDB Movies project into one .sql file

imdb_sql_queries = """
-- a) Get all data about movies
SELECT * FROM movies;

-- b) Get all data about directors
SELECT * FROM directors;

-- c) Total number of movies in the database
SELECT COUNT(original_title) FROM movies;

-- d) Find these 3 directors: James Cameron, Luc Besson, John Woo
SELECT * FROM directors 
WHERE name IN ('James Cameron', 'Luc Besson', 'John Woo');

-- e) List of all directors with names starting with 'S'
SELECT * FROM directors 
WHERE name LIKE 'S%';

-- f) Count of female directors
SELECT COUNT(*) FROM directors 
WHERE gender = 1;

-- g) Name of the 10th female director by ID
SELECT name FROM directors 
WHERE gender = 1 
ORDER BY id ASC 
LIMIT 1 OFFSET 9;

-- h) Top 3 most popular movies
SELECT original_title 
FROM movies 
ORDER BY popularity DESC 
LIMIT 3;

-- i) Top 3 most bankable (highest revenue) movies
SELECT original_title 
FROM movies 
ORDER BY revenue DESC 
LIMIT 3;

-- j) Movie with the most votes since Jan 1st, 2000
SELECT original_title, vote_average, vote_count 
FROM movies 
WHERE release_date >= '2000-01-01' 
ORDER BY vote_count DESC 
LIMIT 1;

-- k) Movies directed by Brenda Chapman
SELECT m.original_title 
FROM movies AS m 
JOIN directors AS d 
ON d.id = m.director_id 
WHERE d.name = 'Brenda Chapman';

-- l) Director with the most movies
SELECT d.name, COUNT(m.director_id) AS count_movies 
FROM directors d 
JOIN movies m ON d.id = m.director_id 
GROUP BY d.name 
ORDER BY count_movies DESC 
LIMIT 1;

-- m) Most bankable director (by revenue)
SELECT d.name, SUM(m.revenue) AS total_revenue 
FROM movies m 
JOIN directors d ON d.id = m.director_id 
GROUP BY d.name 
ORDER BY total_revenue DESC 
LIMIT 1;
"""

🛠️ Tools & Environment
Database: MySQL (remotely hosted on projects.datamites.com)

Tools: MySQL Workbench / DBeaver / DB Browser

SQL Concepts Used:

Joins (INNER JOIN)

Aggregations (SUM, COUNT, AVG)

Filtering (WHERE, IN, LIKE)

Sorting & Limiting

Grouping & Subqueries

🔍 Insights Summary
🎥 Most popular movies by popularity score are instantly recognizable blockbusters.

💰 Top revenue generators highlight the financial impact of certain franchises.

👩‍💼 The database includes limited representation of female directors.

🎬 Directors like James Cameron consistently show high performance in both popularity and revenue.

🧮 Powerful SQL queries help derive storytelling data with real business relevance.
