use sakila;
-- 1.SABANA DE DATOS 
with datos  as (

SELECT

    film_id

    , title

    , category.name AS category

    , concat(first_name, ' ', last_name) customer

    , rental_date

FROM inventory

    LEFT JOIN rental USING(inventory_id)

    LEFT JOIN film USING(film_id)

    LEFT JOIN film_category USING(film_id)

    LEFT JOIN category USING(category_id)

    LEFT JOIN customer using (customer_id)

),
-- 2.agrupar año x mes
datos_X_fechas as (
 select
customer,
year(rental_date) as rental_year,
month(rental_date) as rental_month,
count(*) as rental_times
from datos
group by
  customer,
  rental_year,
  rental_month
),
-- 3. transponder las filas de mes y año
datos_con_meses_en_columnas as (
select
customer,
sum(case when rental_year=2005 and rental_month=5 then rental_times else 0 end) as may2005,
sum(case when rental_year=2005 and rental_month=6 then rental_times else 0 end) as jun2005
from datos_X_fechas
group by 
customer
),
-- 4. calcular diferencia y crecimientos
datos_comparativos as (
select 
customer 
may2005,
jun2005,
(jun2005-may2005) as diffjun2005,
((jun2005-may2005))/may2005 as porcjun2005
from datos_con_meses_en_columnas
)
select *
from datos_comparativos
LIMIT 3
;












