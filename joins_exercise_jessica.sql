--1. Give the name, release year, and worldwide gross of the lowest grossing movie.

SELECT 
		film_title,
		release_year,
		worldwide_gross
FROM specs 
	INNER JOIN revenue 
	ON specs.movie_id = revenue.movie_id
	ORDER BY worldwide_gross ASC
	LIMIT 1;

"Semi-Tough"	1977	$37,187,139


--2. What year has the highest average imdb rating?
SELECT release_year,
		AVG(imdb_rating) AS avg_imdb_rating
FROM specs 
	INNER JOIN rating 
	ON specs.movie_id = rating.movie_id 
	GROUP BY specs.release_year
	ORDER BY avg_imdb_rating DESC;

1991 has the highest average imdb rating


--3. What is the highest grossing G-rated movie? Which company distributed it?

SELECT specs.mpaa_rating,
		revenue.worldwide_gross AS gross,
		specs.film_title AS movie,
		distributors.company_name AS company
FROM specs 
	INNER JOIN revenue 
	ON specs.movie_id = revenue.movie_id
	INNER JOIN distributors 
	ON domestic_distributor_id = distributors.distributor_id 
WHERE specs.mpaa_rating = 'G'
	ORDER BY gross DESC;

TOY STORY 4 is the highest grossing G-rated movie - distributed by Walt Disney 

--4. Write a query that returns, for each distributor in the distributors table, the distributor name and the number of movies associated with that distributor in the movies 
--table. Your result set should include all of the distributors, whether or not they have any movies in the movies table.
SELECT 
	company_name,
	COUNT(movie_id)	
FROM distributors 
	LEFT JOIN specs 
	ON distributors.distributor_id = specs.domestic_distributor_id
	GROUP BY distributors.company_name;


--5. Write a query that returns the five distributors with the highest average movie budget.

SELECT 
	distributors.company_name, 
	AVG(film_budget) AS avg_movie_budget
FROM specs 
	INNER JOIN distributors 
	ON distributors.distributor_id = specs.domestic_distributor_id
	INNER JOIN revenue 
	ON specs.movie_id = revenue.movie_id 
GROUP BY distributors.company_name 
	ORDER BY avg_movie_budget DESC
	LIMIT 5; 


--6. How many movies in the dataset are distributed by a company which is not headquartered in California? Which of these movies has the highest imdb rating?



--7. Which have a higher average rating, movies which are over two hours long or movies which are under two hours?
