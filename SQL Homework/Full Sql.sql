use sakila;
select first_name, last_name
from actor;
select concat(first_name ,' ' ,last_name) 
as 'Actor Name' 
from actor;
select * 
from actor 
where first_name 
like "Joe";
select * 
from actor 
where last_name 
like "%GEN%";
select last_name , first_name from actor 
where last_name 
like "%LI%"
order by (last_name);
select country , country_id 
from country 
where country 
in ('Afghanistan', 'Bangladesh', 'China');
alter table actor
add description BLOB;
alter table actor
drop column description;
select last_name,count(*) as count 
from actor 
group by last_name;
select last_name,count(*) as count 
from actor 
group by last_name
having count > 1;
update actor
set first_name = 'Harpo'
where first_name = 'Groucho' and last_name = 'Williams';
update actor
set first_name = 'Groucho'
where first_name = 'Harpo' and last_name = 'Williams';
select first_name, last_name, a.address_id, b.address 
from staff a
left join address b
on a.address_id = b.address_id;
select first_name, last_name, a.staff_id, sum(amount)
from staff a
left join payment b
on a.staff_id = b.staff_id
where b.payment_date LIKE "2005-08%"
group by a.staff_id;
select a.title, a.film_id, count(b.actor_id)
from film a
inner join film_actor b
on a.film_id = b.film_id
group by a.title;
select a.title, count(b.film_id)
from film a
inner join inventory b
on a.film_id = b.film_id
group by title;
select a.last_name, a.first_name, sum(b.amount)
from customer a
inner join payment b
on a.customer_id = b.customer_id
group by a.last_name;
select title, language_id
from film 
where language_id = 1 and (title like "q%" or title like "k%");
select first_name, last_name, email
from customer
where address_id in 
(
select address_id
from address
where city_id in 
(
select city_id
from city
where country_id in
(
select country_id
from country
where country = "Canada"
)));
select title
from film 
where film_id in 
(
select film_id
from film_category
where category_id in
(
select category_id
from category
where name = "Family"
));
select c.title, b.film_id, count(a.inventory_id)
from rental a
inner join inventory b
on a.inventory_id = b.inventory_id
inner join film c
on b.film_id = c.film_id
group by c.title
order by count(a.inventory_id) desc;
select c.store_id , sum(a.amount) 
from payment a
inner join staff b
on a.staff_id = b.staff_id
inner join store c
on b.store_id = c.store_id
group by c.store_id;
select a.store_id, c.city, d.country 
from store a 
inner join address b 
on a.address_id = b.address_id 
inner join city c 
on b.city_id = c.city_id 
inner join country d 
on c.country_id = d.country_id
group by store_id;
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
create view TopGrossCategory as
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
show create view topgrosscategory;
drop view if exists topgrosscategory;
 