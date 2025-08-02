with cte as (
	select d.channel, 
		round(sum(g.gross_price*f.sold_quantity)/1000000, 2) as gross_sales_mln
from dim_customer d
join fact_sales_monthly f 
on d.customer_code = f.customer_code
join fact_gross_price g
on f.product_code = g.product_code
where g.fiscal_year = 2021
group by d.channel
	)

select channel, 
	gross_sales_mln,
	round(gross_sales_mln*100/sum(gross_sales_mln) over (),2) as percentage
from cte
group by channel
order by percentage desc;