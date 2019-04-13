use sakila;
select a.name, sum(e.amount)
from category a
inner join film_category b
on a.category_id = b.category_id
inner join inventory c
on b.film_id = c.film_id
inner join rental d
on c.inventory_id = d.inventory_id
inner join payment e
on d.rental_id = e.rental_id
group by a.name
order by sum(e.amount) desc;