select p1.unique_products_2020, 
	p2.unique_products_2021, 
	round((unique_products_2021-unique_products_2020)/unique_products_2020*100, 2) as percentage_chg
from 
	(select count(distinct product_code) as unique_products_2020
	from fact_sales_monthly
	where fiscal_year =2020) p1
join
	(select count(distinct product_code) as unique_products_2021
	from fact_sales_monthly
	where fiscal_year =2021) p2;
