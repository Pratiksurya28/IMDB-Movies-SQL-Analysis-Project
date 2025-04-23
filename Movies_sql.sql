show databases;
-- a)Can you get all data about movies?  
--  b)	How do you get all data about directors?
select * from directors;
select * from movies;

-- c)	Check how many movies are present in IMDB.
select count(original_title) from movies;

-- d)	Find these 3 directors: James Cameron ; Luc Besson ; John Woo
select * from directors WHERE name IN ('James Cameron', 'Luc Besson', 'John Woo');

-- e)	Find all directors with name starting with S.
select * from directors where name like "S%";

-- f)	Count female directors.
select * from directors where gender = 1;

-- g )	Find the name of the 10th first women directors?
select name from directors where gender = 1 order by id asc limit 1 offset 9;

-- h)	What are the 3 most popular movies?
select original_title  from movies  order by popularity desc limit 3;

-- i)	What are the 3 most bankable movies?
select original_title from movies order by revenue desc limit 3;

-- j)	What is the most awarded average vote since the January 1st, 2000?
select original_title, vote_average, vote_count from movies where release_date >= '2000-01-01' order by vote_count desc limit 1;

-- k)	Which movie(s) were directed by Brenda Chapman?
select m.original_title from movies as m  join directors as d on d.id = m.director_id where d.name = 'Brenda Chapman';

-- l)	Which director made the most movies?   
select d.name ,count(m.director_id) as count_movies from directors d join movies m on d.id = m.director_id group by d.name order by count_movies desc limit 1;

-- m)	Which director is the most bankable?
select d.name, sum(m.revenue) as total_revenue from movies m join directors d on d.id = m.director_id group by d.name order by total_revenue desc limit 1;

 
 



