use sakila;
select c.title, b.film_id, count(a.inventory_id)
from rental a
inner join inventory b
on a.inventory_id = b.inventory_id
inner join film c
on b.film_id = c.film_id
group by c.title
order by count(a.inventory_id) desc;
