use sakila;
select last_name,count(*) as count 
from actor 
group by last_name;