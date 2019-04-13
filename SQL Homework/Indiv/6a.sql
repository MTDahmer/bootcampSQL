 use sakila;
 select first_name, last_name, a.address_id, b.address 
 from staff a
 left join address b
 on a.address_id = b.address_id;