use sakila;

insert into dim_store(
 store_id,
 store,
 district
 city,
 country
)

select
  st.store_id,
    concat (ad.address,',',ad.district) as store,
    ad.district,
    ci.city,
    co.country
from store as st
 join address as ad using (address_id)
 join city as ci using(city_id)
 join country as co using (country_id)
 ;
