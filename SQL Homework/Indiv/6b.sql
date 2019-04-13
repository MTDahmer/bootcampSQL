use sakila;
select first_name, last_name, a.staff_id, sum(amount)
from staff a
left join payment b
on a.staff_id = b.staff_id
where b.payment_date LIKE "2005-08%"
group by a.staff_id;