use sakila;
select c.store_id , sum(a.amount) 
from payment a
inner join staff b
on a.staff_id = b.staff_id
inner join store c
on b.store_id = c.store_id
group by c.store_id;