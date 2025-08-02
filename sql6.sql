select f.customer_code,
	c.customer, 
	round(avg(f.pre_invoice_discount_pct*100),2) as average_discount_percentage
from dim_customer c
join fact_pre_invoice_deductions f
on c.customer_code = f.customer_code
where f.fiscal_year=2021 and c.market = 'India'
group by f.customer_code, c.customer
order by average_discount_percentage desc
limit 5;