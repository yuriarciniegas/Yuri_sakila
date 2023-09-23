---insert into sakila.fact_rental
insert into sakila_dwn.fact_rental(
   rental_id,
   date_key,
   store_key,
   customer_key,
   count_rental
)

with datos as (
   select
   rental_id,
   rental_date,
   TO_DAYS(rental_date) as date_key,
   customer_id,
   customer_key,
   store_id,
   store_key
from
   sakila.rental
   join sakila_dwn.dim_customer using (customer_id)
   join sakila.staff using (staff_id)
   join sakila_dwn.dim_store using (store_id)
)
select
  rental_id;
  date_key,
  store_key,
  customer_key
  1 as  count_rental
from datos
;