SELECT * FROM pizza_sales;


-- Total Revenue

SELECT round(sum(total_price),2) Total_Revenue
FROM Pizza_sales;

-- Average Order Value

SELECT round(sum(total_price) /  count(DISTINCT order_id),2) Avg_Order_value
FROM Pizza_sales;

 -- Total Pizzas Sold
 
 SELECT sum(quantity) Total_pizzas_Sold
 FROM pizza_sales;
 
 -- Total Orders
 
 SELECT count(DISTINCT order_id) Total_Orders
 FROM pizza_sales;
 
 -- Average Pizzas Per Order
 
 SELECT round(sum(quantity) / count(DISTINCT order_id),2) Avg_Pizzas_per_order
 FROM pizza_sales;
 
 -- Hourly Trend for Total Pizzas Sold
 
 SELECT (hour(order_time)) Hours, sum(quantity) Quantity
 FROM pizza_sales
 GROUP BY HOUR (order_time)
 ORDER BY HOUR (order_time);

 
 -- Weekly Trend for Orders
 
SELECT WEEK (order_date,3) Week_Number, count(DISTINCT order_id) Number_of_Orders
FROM pizza_sales
GROUP BY Week_Number
ORDER BY Week_Number;
 
 -- % of Sales by Pizza Category
 
 SELECT pizza_category, round(sum(total_price),2) Sum,
 round((sum(total_price) * 100) / (SELECT sum(total_price)FROM pizza_sales),2) PCT
 FROM pizza_sales
 GROUP BY pizza_category
 ORDER BY PCT DESC;
 
 -- % of Sales by Pizza Size
 
 SELECT pizza_size, round(sum(total_price),2) total_revenue,
 round((sum(total_price) * 100) / (SELECT sum(total_price) FROM pizza_sales),2) PCT
 FROM pizza_sales
 GROUP BY pizza_size
 ORDER BY PCT DESC;
 
 -- Total Pizzas Sold by Pizza Category
 
 SELECT pizza_category, sum(quantity) Total_Quantity_Sold
 from pizza_sales
 GROUP BY pizza_category
 ORDER BY Total_Quantity_Sold DESC;
 
 -- Top 5 Pizzas by Revenue
 
 SELECT pizza_name, sum(total_price) Total_Revenue
 FROM pizza_sales
 GROUP BY pizza_name
 ORDER BY Total_Revenue DESC
 LIMIT 5;
 
 -- Bottom 5 Pizzas by Revenue
 
 SELECT pizza_name, round (sum(total_price),2) Total_Revenue
 FROM pizza_sales
 GROUP BY pizza_name
 ORDER BY Total_Revenue
 LIMIT 5;
 
 -- Top 5 Pizzas by Quantity
 
 SELECT pizza_name, round (sum(quantity),2) Total_Pizzas_Sold
 FROM pizza_sales
 GROUP BY pizza_name
 ORDER BY Total_Pizzas_Sold DESC
 LIMIT 5;
 
 -- Bottom 5 Pizzas by Quantity
 
 SELECT pizza_name, round (sum(quantity),2) Total_Pizzas_Sold
 FROM pizza_sales
 GROUP BY pizza_name
 ORDER BY Total_Pizzas_Sold
 LIMIT 5;
 
 -- Top 5 Pizzas by Total Orders
 
 SELECT pizza_name, round(count(DISTINCT order_id),2) Total_Orders
 FROM pizza_sales
 GROUP BY pizza_name
 ORDER BY Total_Orders DESC
 LIMIT 5;
 
 -- Bottom 5 Pizzas by Total Orders
 
 SELECT pizza_name, round(count(DISTINCT order_id),2) Total_Orders
 FROM pizza_sales
 GROUP BY pizza_name
 ORDER BY Total_Orders
 LIMIT 5;