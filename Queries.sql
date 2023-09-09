
SELECT * FROM pizza_sales;


-- Total Revenue

SELECT round(sum(total_price),2) Total_Revenue
FROM Pizza_sales;

-- Average Order Value

SELECT round(sum(total_price) /  count(distinct order_id),2) Avg_Order_value
from Pizza_sales;

 -- Total Pizzas Sold
 
 SELECT sum(quantity) Tota_pizzas_Sold
 FROM pizza_sales;
 
 -- Total Orders
 
 SELECT count(Distinct order_id) Tota_Orders
 from pizza_sales;
 
 -- Average Pizzas Per Order
 
 SELECT round(sum(quantity) / count(distinct order_id),2) Avg_Pizzas_per_order
 From pizza_sales;
 
 -- Hourly Trend for Total Pizzas Sold
 
 SELECT (hour(order_time)) Hours, sum(quantity) Quantity
 FROM pizza_sales
 group by HOUR (order_time)
 order by HOUR (order_time);

 
 -- Weekly Trend for Orders
 
SELECT WEEK (order_date,3) Week_Number, count(distinct order_id) Number_of_Orders
from pizza_sales
group by Week_Number
Order by Week_Number;
 
 -- % of Sales by Pizza Category
 
 SELECT pizza_category, round(sum(total_price),2) Sum,
 round((sum(total_price) * 100) / (SELECT sum(total_price)FROM pizza_sales),2) PCT
 FROM pizza_sales
 group by pizza_category
 order by PCT DESC;
 
 -- % of Sales by Pizza Size
 
 SELECT pizza_size, round(sum(total_price),2) total_revenue,
 round((sum(total_price) * 100) / (SELECT sum(total_price) FROM pizza_sales),2) PCT
 FROM pizza_sales
 group by pizza_size
 order by PCT DESC;
 
 -- Total Pizzas Sold by Pizza Category
 
 SELECT pizza_category, sum(quantity) Total_Quantity_Sold
 from pizza_sales
 group by pizza_category
 order by Total_Quantity_Sold DESC;
 
 -- Top 5 Pizzas by Revenue
 
 SELECT pizza_name, sum(total_price) Total_Revenue
 FROM pizza_sales
 group by pizza_name
 order by Total_Revenue DESC
 LIMIT 5;
 
 -- Bottom 5 Pizzas by Revenue
 
 SELECT pizza_name, round (sum(total_price),2) Total_Revenue
 FROM pizza_sales
 group by pizza_name
 order by Total_Revenue
 LIMIT 5;
 
 -- Top 5 Pizzas by Quantity
 
 SELECT pizza_name, round (sum(quantity),2) Total_Pizzas_Sold
 FROM pizza_sales
 group by pizza_name
 order by Total_Pizzas_Sold DESC
 LIMIT 5;
 
 -- Bottom 5 Pizzas by Quantity
 
 SELECT pizza_name, round (sum(quantity),2) Total_Pizzas_Sold
 FROM pizza_sales
 group by pizza_name
 order by Total_Pizzas_Sold
 LIMIT 5;
 
 -- Top 5 Pizzas by Total Orders
 
 SELECT pizza_name, round(count(distinct order_id),2) Total_Orders
 FROM pizza_sales
 group by pizza_name
 order by Total_Orders DESC
 LIMIT 5;
 
 -- Bottom 5 Pizzas by Total Orders
 
 SELECT pizza_name, round(count(distinct order_id),2) Total_Orders
 FROM pizza_sales
 group by pizza_name
 order by Total_Orders
 LIMIT 5;