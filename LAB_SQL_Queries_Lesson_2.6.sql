USE sakila;

'1.In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name,
 you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
 These three actors have the same last name. So we do not want to include this last name in our output. 
 Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.'
 
 SELECT last_name, count(last_name) as counter_lastname
 from actor
 group by last_name
 having count(last_name) = 1 ;
 
 
 
'2.Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last 
names of the actors where the last name was present more than once'

 SELECT last_name, count(last_name) as counter_lastname
 from actor
 group by last_name
 having count(last_name) > 1
 order by counter_lastname DESC;



'3.Using the rental table, find out how many rentals were processed by each employee.'

select staff_id, count(rental_id) as rentals
from rental
group by staff_id;


'4.Using the film table, find out how many films were released each year.'

select release_year, count(film_id) as filmes_releases
from film
group by release_year;


'5.Using the film table, find out for each rating how many films were there.'

select rating, count(film_id) as rate_rating
from film
group by rating;

'6.What is the mean length of the film for each rating type. Round off the average lengths to two decimal places'

select rating, count(film_id) as rate_rating, round(avg(length),2) as avg_duration
from film
group by rating;

'7.Which kind of movies (rating) have a mean duration of more than two hours?'

select rating, count(film_id) as films, round(avg(length),2) as avg_duration
from film
group by rating
having avg(length) > 120;

'8.Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.'

select title,
		length,
        case when length < 60 then 'short'
        when length between 60 AND 90 then 'medium'
        ELSE 'long' end as length_rank
from film
where length is not null and length > 0
order by length; 

