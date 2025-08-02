select * from
(SELECT 
p.product_code,
  p.product,
  p.division, 
  SUM(s.sold_quantity) AS total_sold_quantity, s.fiscal_year,
   Dense_RANK() OVER (
    PARTITION BY p.division
    ORDER BY SUM(s.sold_quantity) DESC
  ) AS rank_order
FROM dim_product p
JOIN fact_sales_monthly s 
  ON p.product_code = s.product_code
    GROUP BY p.product, p.division,s.fiscal_year,p.product_code) as sub
    where fiscal_year =2021 and rank_order<=3
    order by division

