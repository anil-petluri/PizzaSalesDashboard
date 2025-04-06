-- Pizza Sales
	use Projects;
-- KPI's Requirement
	select * from pizza_sales;

-- Total Revenue
	select sum(total_price) as Total_Revenue from pizza_sales;

-- Average Order Value
	select sum(total_price)/count(distinct order_id) as Avg_Ord_Value
	from pizza_sales;

-- Total Pizza Sold
	select sum(quantity) as Total_Quantity from pizza_sales;

-- Total Orders
	select count(distinct order_id) as Total_Orders from pizza_sales;

-- Average Pizza Per Order
	select cast(cast(sum(quantity) as decimal(10,2)) / cast(count(distinct order_id) as decimal(10,2)) as decimal (10,2))
	as Avg_Pizza_Per_Order from pizza_sales;

-- Chart Requirement
-- Daily Trends for Total Orders
	select datename(dw,order_date) as WeekDay, sum(distinct order_id) as Total_Orders
	from pizza_sales group by datename(dw,order_date)
	order by Total_Orders;

-- Hourly Trends for Total Orders
	select datepart(HOUR,order_time) As Hourly_Time, count(distinct order_id) as Total_Orders
	from pizza_sales
	group by datepart(HOUR,order_time)
	order by datepart(hour,order_time);

-- Percentage of Sales by Pizza category
	select pizza_category, sum(total_price) as Total_Sales, cast(sum(total_price) * 100 as decimal(10,2)) / (select cast(sum(total_price) as decimal(10,2)) from pizza_sales) as PCT
	from pizza_sales
	group by pizza_category;

-- Percentage of Sales for October by Pizza category
	select pizza_category, sum(total_price) as Total_Sales, cast(sum(total_price) * 100 as decimal(10,2)) / (select cast(sum(total_price) as decimal(10,2)) from pizza_sales where month(order_date) = 10 ) as PCT
	from pizza_sales
	where month(order_date) = 10
	group by pizza_category;

-- Percentage of Sales for Quarter 3 by pizza Category
	select pizza_category, sum(total_price) as Total_Sales, cast(sum(total_price) * 100 as decimal(10,2)) / (select cast(sum(total_price) as decimal(10,2)) from pizza_sales where datepart(QUARTER,order_date) = 3) as PCT
	from pizza_sales
	where datepart(QUARTER,order_date) = 3
	group by pizza_category;

-- Percentage of Sales by Pizza Size 
	select pizza_size, sum(total_price) as Sales, CAST(sum(total_price) * 100 / (select sum(total_price) from pizza_sales) as decimal(10,2)) as PCS
	from pizza_sales group by pizza_size
	order by PCS asc;

-- Total Pizza Sold by Pizza Category
	select pizza_category, sum(quantity) as Total_Quantity from pizza_sales
	group by pizza_category;

-- Top 5 Best Sellers by Total Pizza Sold
	select top 5 pizza_name, sum(quantity) as Quantity from pizza_sales
	group by pizza_name
	order by sum(quantity) desc;

-- Bottom 5 Worst Sellers by Total Pizza Sold
	select top 5 pizza_name, sum(quantity) as Quantity from pizza_sales
	group by pizza_name
	order by sum(quantity) asc;


    







