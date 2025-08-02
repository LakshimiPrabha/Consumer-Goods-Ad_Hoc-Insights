select date_format(f.date, '%b') as month, 
	date_format(f.date, '%Y') as year, f.fiscal_year, 
	round(sum(g.gross_price*f.sold_quantity)/1000000, 2) as gross_sales_amount_mln
from  dim_customer d
join fact_sales_monthly f 
on d.customer_code = f.customer_code
join fact_gross_price g
on f.product_code = g.product_code
where d.customer='Atliq Exclusive'
group by month, year, f.fiscal_year
order by year;