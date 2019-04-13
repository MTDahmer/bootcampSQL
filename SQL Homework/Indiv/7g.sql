select a.store_id, c.city, d.country 
from store a 
inner join address b 
on a.address_id = b.address_id 
inner join city c 
on b.city_id = c.city_id 
inner join country d 
on c.country_id = d.country_id
group by store_id;