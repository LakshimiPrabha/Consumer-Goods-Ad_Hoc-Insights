select f.product_code, 
p.product,
round(f.manufacturing_cost,2) as manufacturing_cost from
dim_product p join
fact_manufacturing_cost f on
p.product_code =f.product_code
where f.manufacturing_cost = (select max(manufacturing_cost) from fact_manufacturing_cost) or
	  f.manufacturing_cost = (select min(manufacturing_cost) from fact_manufacturing_cost) 
order by f.manufacturing_cost desc;