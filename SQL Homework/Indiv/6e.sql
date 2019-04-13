select a.last_name, a.first_name, sum(b.amount)
from customer a
inner join payment b
on a.customer_id = b.customer_id
group by a.last_name;