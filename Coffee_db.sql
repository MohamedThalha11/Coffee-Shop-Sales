use coffee_shop_sales_db;
select * from coffee_shop_sales;
describe coffee_shop_sales;

update coffee_shop_sales
set transaction_date = str_to_date(transaction_date,'%c/%e/%Y');
select transaction_date from coffee_shop_sales limit 10;
alter table coffee_shop_sales
modify column transaction_date date;

update coffee_shop_sales
set transaction_time = str_to_date(transaction_time,'%H:%i:%s');
alter table coffee_shop_sales
modify column transaction_time time;
alter table coffee_shop_sales
modify column unit_price decimal(10,2);

select sum(unit_price * transaction_qty ) as Total_Sales
from coffee_shop_sales
where 
month(transaction_date) = 3;  -- March month

-- to calculate Month over Month
SELECT MONTH(transaction_date) AS month,
ROUND(SUM(unit_price * transaction_qty)) AS total_sales,
(SUM(unit_price * transaction_qty) - LAG(SUM(unit_price * transaction_qty), 1) OVER (ORDER BY MONTH(transaction_date))) -- Absolute MoM Difference
/ LAG(SUM(unit_price * transaction_qty), 1) OVER (ORDER BY MONTH(transaction_date)) 
* 100 AS MoM_percent    -- % of MoM Change
FROM coffee_shop_sales
WHERE MONTH(transaction_date) IN (3, 4)    -- for months of March and April
GROUP BY MONTH(transaction_date)
ORDER BY MONTH(transaction_date);


select count(transaction_id) as Total_Orders
from coffee_shop_sales
where 
month(transaction_date) = 3;  -- March month

SELECT MONTH(transaction_date) AS month,
count(transaction_id) AS total_orders,
(count(transaction_id) - LAG(count(transaction_id), 1) OVER (ORDER BY MONTH(transaction_date))) -- Absolute MoM Difference
/ LAG(count(transaction_id), 1) OVER (ORDER BY MONTH(transaction_date)) 
* 100 AS MoM_percent    -- % of MoM Change
FROM coffee_shop_sales
WHERE MONTH(transaction_date) IN (4, 5)    -- for months 
GROUP BY MONTH(transaction_date)
ORDER BY MONTH(transaction_date);


select sum(transaction_qty) as Total_Qty
from coffee_shop_sales
where 
month(transaction_date) = 3;  -- March month

SELECT MONTH(transaction_date) AS month,
sum(transaction_qty) AS total_qty_sold,
(sum(transaction_qty) - LAG(sum(transaction_qty), 1) OVER (ORDER BY MONTH(transaction_date))) --  MoM Difference
/ LAG(sum(transaction_qty), 1) OVER (ORDER BY MONTH(transaction_date)) 
* 100 AS MoM_percent    -- % of MoM Change
FROM coffee_shop_sales
WHERE MONTH(transaction_date) IN (4, 5)    -- for months 
GROUP BY MONTH(transaction_date)
ORDER BY MONTH(transaction_date);



select
  sum(unit_price * transaction_qty) as Total_Sales,
  sum(transaction_qty) as Total_Qty_Sold,
  count(transaction_id) as Total_Orders
  from coffee_shop_sales
  where transaction_date = '2023/5/18';
  
  
  
  
  select 
   case when dayofweek(transaction_date) in (1,7) then 'weekends'
   else 'weekdays'
   end as Day_type,
   sum(unit_price * transaction_qty) as Total_Sales
   from coffee_shop_sales
   where month(transaction_date) = 5
   group by
   case when dayofweek(transaction_date) in (1,7) then 'weekends'
   else 'weekdays'
   end ;



select
   store_location,
   sum(unit_price * transaction_qty) as Total_Sales
   from coffee_shop_sales
   where month(transaction_date) = 5
   group by store_location
   order by sum(unit_price * transaction_qty) desc;
   
   
   
select 
  avg(total_sales) as Avg_sales   -- outer query
from 
  (
  select sum(unit_price * transaction_qty) as total_sales
  from coffee_shop_sales
  where month(transaction_date) = 5
  group by transaction_date
  ) as Inner_query;
  
  
select
   day(transaction_date) as day_of_month,
   sum(unit_price * transaction_qty) as total_sales
from coffee_shop_sales
  where month(transaction_date) = 5
group by (transaction_date)
order by (transaction_date);




select
   day_of_month,          -- outer query
case
   when total_sales > avg_sales then 'Above Average'
   when total_sales < avg_sales then 'Belove Average'
   else 'Equal to Average'
end as Sales_Status,
	total_sales
from (
  select
  day(transaction_date) as day_of_month,
  sum(unit_price * transaction_qty) as total_sales,
  avg(sum(unit_price * transaction_qty)) over () as avg_sales
from coffee_shop_sales
where month(transaction_date) = 5 
group by day(transaction_date)) as sales_data
order by day_of_month;




select 
  product_category,
  sum(unit_price * transaction_qty) as total_sales
from coffee_shop_sales
where month(transaction_date) = 5
group by product_category
order by sum(unit_price * transaction_qty) desc;
  
  select 
  product_type,
  sum(unit_price * transaction_qty) as total_sales
from coffee_shop_sales
where month(transaction_date) = 5 and product_category = 'Coffee'
group by product_type
order by sum(unit_price * transaction_qty) desc
limit 10;
  
  
  
select
  sum(unit_price * transaction_qty) as total_sales,
  sum(transaction_qty) as total_qty_sold,
  count(*) as total_orders
from coffee_shop_sales
where month(transaction_date) = 5 -- Month
and dayofweek(transaction_date) = 1 -- Day
and hour(transaction_time) = 14;   -- Hour
  
  


select
  hour(transaction_time),
  sum(unit_price * transaction_qty) as total_sales
from coffee_shop_sales
where month(transaction_date) = 5
group by hour(transaction_time)
order by hour(transaction_time);


select
 case 
     when dayofweek(transaction_date) = 2 then 'Monday'
     when dayofweek(transaction_date) = 3 then 'Tuesday'
     when dayofweek(transaction_date) = 4 then 'Wednesday'
     when dayofweek(transaction_date) = 5 then 'Thursday'
     when dayofweek(transaction_date) = 6 then 'Friday'
     when dayofweek(transaction_date) = 7 then 'Saturday'
     else 'Sunday'
end as Day_of_Week,
round(sum(unit_price * transaction_qty)) as total_sales
from coffee_shop_sales
where month(transaction_date) = 5
group by
  case 
     when dayofweek(transaction_date) = 2 then 'Monday'
     when dayofweek(transaction_date) = 3 then 'Tuesday'
     when dayofweek(transaction_date) = 4 then 'Wednesday'
     when dayofweek(transaction_date) = 5 then 'Thursday'
     when dayofweek(transaction_date) = 6 then 'Friday'
     when dayofweek(transaction_date) = 7 then 'Saturday'
     else 'Sunday'
end;