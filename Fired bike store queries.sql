

-- Query which joins three table with the calculations of revenue and profits
	with CTE as
(
select * from bike_share_yr_0
union all
select * from bike_share_yr_1
)
select dteday, season, hr, ct.yr, riders, rider_type, price, COGS,  riders*price as revenue , riders*price-COGS as Profit
from CTE c left join cost_table ct on ct.yr=c.yr


-- The exploratory analysis of datas that gives the values to analyze with the insights

-- 1
with CTE as
(
select * from bike_share_yr_0
union all
select * from bike_share_yr_1
)
select c.hr, round(sum(ct.price)) as revenue, 
case ct.yr
      when 0 then 2021
      else 2022
end as Years
from cost_table ct join CTE c on ct.yr=c.yr
group by c.hr,c.yr


-- 2
with CTE as
(
select * from bike_share_yr_0
union all
select * from bike_share_yr_1
)
select sum(ct.price-ct.COGS) as profit,  round(sum(ct.price)) as revenue, 
case ct.yr
      when 0 then 2021
      else 2022
end as Years
from cost_table ct join CTE c on ct.yr=c.yr
group by c.yr


-- 3
with CTE as
(
select * from bike_share_yr_0
union all
select * from bike_share_yr_1
)
select season, round(sum(ct.price)) as revenue
/*case ct.yr
      when 0 then 2021
      else 2022
end as Years*/
from cost_table ct join CTE c on ct.yr=c.yr
group by  season


-- 4
with CTE as
(
select * from bike_share_yr_0
union all
select * from bike_share_yr_1
)
select sum(riders), ct.yr, rider_type
/*case ct.yr
      when 0 then 2021
      else 2022
end as Years*/
from cost_table ct join CTE c on ct.yr=c.yr
group by  ct.yr, rider_type


