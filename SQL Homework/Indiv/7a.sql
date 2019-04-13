select title, language_id
from film 
where language_id = 1 and (title like "q%" or title like "k%")
;

