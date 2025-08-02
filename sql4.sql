with cte as (select p.segment, 
count(distinct p.product_code) as product_count_2021 from
dim_product p
join fact_gross_price f on
p.product_code = f.product_code
where f.fiscal_year = 2021
group by p.segment, f.fiscal_year
),
cte1 as (select p.segment, 
count(distinct p.product_code) as product_count_2020 from
dim_product p
join fact_gross_price f on
p.product_code = f.product_code
where f.fiscal_year = 2020
group by p.segment, f.fiscal_year
)

select c.segment,
c.product_count_2021,
c1.product_count_2020,
c.product_count_2021 - c1.product_count_2020 as diff
from cte c join cte1 c1 using(segment)
order by diff desc
limit 1



