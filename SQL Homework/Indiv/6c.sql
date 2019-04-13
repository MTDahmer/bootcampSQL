use sakila;
select a.title, a.film_id, count(b.actor_id)
from film a
inner join film_actor b
on a.film_id = b.film_id
group by a.title;