create table if not exists imdb_top_movies
(
	Poster_Link		varchar(4000),
	Series_Title	varchar(1000),
	Released_Year	varchar(10),
	Certificate		varchar(10),
	Runtime			varchar(20),
	Genre			varchar(50),
	IMDB_Rating		decimal,
	Overview		varchar(4000),
	Meta_score		int,
	Director		varchar(200),
	Star1			varchar(200),
	Star2			varchar(200),
	Star3			varchar(200),
	Star4			varchar(200),
	No_of_Votes		bigint,
	Gross			money
);

1) 1) Fetch all data from imdb table 

select * from imdb_top_movies;

2) Fetch only the name and release year for all movies.

select series_title, released_year from imdb_top_movies;

3) Fetch the name, release year and imdb rating of movies which are UA certified.

select series_title, released_year, imdb_rating, certificate from imdb_top_movies
where certificate = 'UA';

4) Fetch the name and genre of movies which are UA certified and have a Imdb rating of over 8.

select series_title, genre, certificate, imdb_rating from imdb_top_movies
where certificate = 'UA' AND imdb_rating > 8;

5) Find out how many movies are of Drama genre.

select series_title, genre from imdb_top_movies
where genre = 'Drama';

6) How many movies are directed by "Quentin Tarantino", "Steven Spielberg", "Christopher Nolan" and "Rajkumar Hirani".

select director, count(series_title) as total_movies from imdb_top_movies
where director in('Quentin Tarantino', 'Steven Spielberg', 'Christopher Nolan','Rajkumar Hirani')
Group By director;

7) What is the highest imdb rating given so far?

select max(imdb_rating) as highest_rating from imdb_top_movies;

8) What is the highest and lowest imdb rating given so far?
8a) Solve the above problem but display the results in different rows.
8b) Solve the above problem but display the results in different rows. 
    And have a column which indicates the value as lowest and highest.

	
9) Find out the total business done by movies staring "Aamir Khan".

SELECT 
    SUM(Gross) AS Total_Business
FROM imdb_top_movies
WHERE Star1 = 'Aamir Khan' OR Star2 = 'Aamir Khan' OR Star3 = 'Aamir Khan' OR Star4 = 'Aamir Khan';

10) Find out the average imdb rating of movies 
    which are neither directed by "Quentin Tarantino", "Steven Spielberg", "Christopher Nolan" 
    and are not acted by any of these stars "Christian Bale", "Liam Neeson", "Heath Ledger", 
    "Leonardo DiCaprio", "Anne Hathaway".

select avg(IMDB_Rating) as average_IMDB_rating
from imdb_top_movies
where Director Not IN('Quentin Tarantino', 'Steven Spielberg', 'Christopher Nolan')
And star1 not in('Christian Bale', 'Liam Neeson', 'Heath Ledger','Leonardo DiCaprio', 'Anne Hathaway')
OR star2 not in('Christian Bale', 'Liam Neeson', 'Heath Ledger','Leonardo DiCaprio', 'Anne Hathaway')
OR star3 not in('Christian Bale', 'Liam Neeson', 'Heath Ledger','Leonardo DiCaprio', 'Anne Hathaway')
OR star4 not in('Christian Bale', 'Liam Neeson', 'Heath Ledger','Leonardo DiCaprio', 'Anne Hathaway');

11) Mention the movies involving both "Steven Spielberg" and "Tom Cruise".
select series_title from imdb_top_movies
where Director = 'Steven Spielberg' AND Star1 = 'Tom Cruise'
OR Star2 = 'Tom Cruise'
OR Star3 = 'Tom Cruise'
OR Star4 = 'Tom Cruise';

12) Display the movie name and watch time (in both mins and hours) which have over 9 imdb rating.
Select series_title, runtime
from imdb_top_movies
where IMDB_Rating > 9;

















