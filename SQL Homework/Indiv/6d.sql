select a.title, count(b.film_id)
from film a
inner join inventory b
on a.film_id = b.film_id
group by title;