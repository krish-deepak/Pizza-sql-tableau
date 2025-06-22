# 1.total revenue of pizzas

SELECT round(sum(total_price),2) as total_revenue FROM `engaged-upgrade-454713-n7.data.pizza_sql_DA`;

#2.avg order value
SELECT round(avg(total_price),2) as avg_order_value FROM `engaged-upgrade-454713-n7.data.pizza_sql_DA`;

#3 total pizzas order
SELECT sum(quantity) as total_quantity FROM `engaged-upgrade-454713-n7.data.pizza_sql_DA`;

#4. total orders
select count(distinct order_id) as total_orders from  `engaged-upgrade-454713-n7.data.pizza_sql_DA`;

#5.avg pizzas per order
select round(sum(quantity) / count(distinct order_id),2) as avg_pizza_per_order from `engaged-upgrade-454713-n7.data.pizza_sql_DA`; 


#6 no of orders per weekday
SELECT
    FORMAT_DATE('%A', order_date) AS order_day,
    COUNT(DISTINCT order_id) AS total_orders
FROM
    engaged-upgrade-454713-n7.data.pizza_sql_DA
GROUP BY
    FORMAT_DATE('%A', order_date), -- Group by the day name
    FORMAT_DATE('%w', order_date)  -- Also group by the day number to allow ordering by it
ORDER BY
    FORMAT_DATE('%w', order_date); -- Order by the day number
#7 no. of orders per month
select 
     format_date('%B', order_date) as order_month,
     count(distinct order_id) as total_orders
from engaged-upgrade-454713-n7.data.pizza_sql_DA
group by 
    format_date('%B', order_date),
    format_date('%m', order_date)
order by format_date('%m', order_date);


#8 % of sales by pizza category

select pizza_category, 
round(sum(total_price)/(select sum(total_price) from engaged-upgrade-454713-n7.data.pizza_sql_DA) * 100,2) as sales_pct
from engaged-upgrade-454713-n7.data.pizza_sql_DA
group by pizza_category
order by sales_pct desc;
      
#9 % of sales by pizza size

select pizza_size, 
round(sum(total_price)/(select sum(total_price) from engaged-upgrade-454713-n7.data.pizza_sql_DA) * 100,2) as sales_pct_by_size
from engaged-upgrade-454713-n7.data.pizza_sql_DA
group by pizza_size
order by 2 desc;

#10 total pizzas sold by category

select pizza_category, count(pizza_category) as no_of_pizzas
from engaged-upgrade-454713-n7.data.pizza_sql_DA
group by 1
order by 2 desc ;

#11 Top 5 Best Sellers by Revenue, Total Quantity and Total Orders

select 
      pizza_name,round(sum(total_price)) as total_sale_amount, count(quantity) as total_quantity, 
      count (distinct order_id) as total_orders
from engaged-upgrade-454713-n7.data.pizza_sql_DA
group by 1
order by 2 desc ,3 desc ,4 desc
limit 5;


#12 bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders

select 
      pizza_name,round(sum(total_price)) as total_sale_amount, count(quantity) as total_quantity, 
      count (distinct order_id) as total_orders
from engaged-upgrade-454713-n7.data.pizza_sql_DA
group by 1
order by 2 asc ,3 asc ,4 asc
limit 5;
