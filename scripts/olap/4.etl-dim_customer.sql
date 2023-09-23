insert into sakila_dwn.dim_customer(
   customer_id,
   customer,
   district,
   country
)
select
    customer_id,
    concat(first_name, ' ', last_name) as customer,
    district,
    city,
    country
from customer as customer
    join address as ad using (address_id)
    join city as ci using (city_id)
    join country as co using (country_id)
