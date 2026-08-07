-- n Q1. What is total revenue and average order value by product category? (Revenue = unit price × quantity ×
-- (1 - discount %), after you've handled the data quality issues from Part 1.)

select category, 
round(avg(unit_price),2) as average_value,
round(sum(revenue),2) as revenue
from customers_orders
group by category
order by revenue desc;

-- n Q2. Which customers have an average order value above the overall average and have placed more than 3
-- previous orders? (This should use a subquery or CTE comparing to an aggregate.)


select customer_id, round(avg(revenue),2) as orders_value
from customers_orders
group by customer_id
having max(previous_orders) > 3 and orders_value >  ( select avg(revenue)
						from customers_orders)
order by orders_value desc;


-- n Q3. What are the top 3 best-selling products (by quantity sold) within each category? 
with product_quantity_total AS (
    select category, product_name, SUM(quantity) AS total_quantity
    from customers_orders
    group by category, product_name),
    
products_rank as (select category, product_name, total_quantity,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY total_quantity DESC
        ) as product_rank
    from product_quantity_total)
    
select category, product_name, total_quantity, product_rank
from products_rank
where product_rank <= 3
order by category, product_rank;


-- n Q4. Segment customers into tiers (e.g. Low/Medium/High) based on total spend, and show order count and
-- average review rating per tier. (Use CASE WHEN logic for the segmentation.)


Select (case when revenue <= 40 then "Low" when revenue > 40 and revenue < 80 then "Medium" else "High" end) as tier,
count(*) as orders_count,
round(avg(review_rating),2) avg_review_rating
from customers_orders
group by tier
order by orders_count desc;

-- n Q5. Is there a relationship between sales channel (Online vs In-Store) and return rate? In

with returned_rate as ( select customers_orders.channel, ( case when returned = "No" then 0 else 1 end) as returned
						from customers_orders)
					

select returned_rate.channel,  sum(returned)/count(returned) as return_rate
from returned_rate
group by channel;


# in store-purchases have 2% chance higher of being returned compared to Online-purchases




