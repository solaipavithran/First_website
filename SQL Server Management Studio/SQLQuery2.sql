/*
create view hi
as
select customer_if,first_name,last_name,age,country,case 
			when age >= 18 then 'eligible to vote'
			else 'not eligible to vote'
			end as vote_eligibility
			from citizen*/

use BikeStores;

SELECT * FROM customers;

/*WITH cte_customer as (

SELECT *, ROW_NUMBER() OVER(ORDER BY first_name DESC) as xRowNumber from customers

)

select top 10 * from cte_customer;


select C1.customer_id,concat(C1.first_name,' ',C1.last_name) from customers as C1 
inner join orders as O2 C1.customer_id = C2.customer_id
inner join order_items as O3

*/
-- Scenario: Top 10 Customers by order value
-- Output: customers,  order value
-- Tables: Customers, Order, Order_item
with cte_TopCustomers as(
	select 
		  c1.customer_id as [Customer ID]
		  ,CONCAT(c1.first_name,' ',c1.last_name) as Customer
		  ,SUM(oi3.quantity*oi3.list_price) as [Order Value]
		  ,ROW_NUMBER() over(order by sum (oi3.quantity*oi3.list_price) ) as xRowNumber
		  ,RANK() over(order by sum (oi3.quantity*oi3.list_price) ) as xRank
		  ,DENSE_RANK() over(order by sum (oi3.quantity*oi3.list_price) ) as xDenseRank
	from customers as c1
	inner join orders as o2 on c1.customer_id = o2.customer_id
	inner join order_items oi3 on o2.order_id = oi3.order_id
	group by c1.customer_id
			 , CONCAT(c1.first_name,' ',c1.last_name)
);
--select [Customer ID],Customer,[Order Value],xRank,xDenseRank from cte_TopCustomers
--where XRank <= 10;


with cte_state as(
select *,ROW_NUMBER() over(partition by state order by state) as xRowNumber from customers
)
select * from cte_state
where xRowNumber<=3;

-- top 

with cte_TopCustomers as(
	select 
		  c1.customer_id as [Customer ID]
		  ,CONCAT(c1.first_name,' ',c1.last_name) as Customer
		  ,SUM(oi3.quantity*oi3.list_price) as [Order Value]
		  ,ROW_NUMBER() over(order by sum (oi3.quantity*oi3.list_price) ) as xRowNumber
		  ,RANK() over(order by sum (oi3.quantity*oi3.list_price) ) as xRank
		  ,DENSE_RANK() over(order by sum (oi3.quantity*oi3.list_price) ) as xDenseRank
	from customers as c1
	inner join orders as o2 on c1.customer_id = o2.customer_id
	inner join order_items oi3 on o2.order_id = oi3.order_id
	group by c1.customer_id
			 , CONCAT(c1.first_name,' ',c1.last_name)
)
select [Customer ID],Customer,[Order Value],xRank,xDenseRank from cte_TopCustomers
where XRank <= 10;

--views 
CREATE OR ALTER VIEW vM_Bottom_customers
as
select 
		  c1.customer_id as [Customer ID]
		  ,CONCAT(c1.first_name,' ',c1.last_name) as Customer
		  ,SUM(oi3.quantity*oi3.list_price) as [Order Value]
		  ,ROW_NUMBER() over(order by sum (oi3.quantity*oi3.list_price) ) as xRowNumber
		  ,RANK() over(order by sum (oi3.quantity*oi3.list_price) ) as xRank
		  ,DENSE_RANK() over(order by sum (oi3.quantity*oi3.list_price) ) as xDenseRank
	from customers as c1
	inner join orders as o2 on c1.customer_id = o2.customer_id
	inner join order_items oi3 on o2.order_id = oi3.order_id
	group by c1.customer_id
			 , CONCAT(c1.first_name,' ',c1.last_name);
select * from vM_Bottom_customers
where XRank <= 10;

--select , from order_items;
BEGIN TRANSACTION;

select P1.product_id,B1.brand_id,B1.brand_name,sum(O1.quantity*O1.list_price) as order_value,
DENSE_RANK() OVER( ORDER BY sum(O1.quantity*O1.list_price) ) from brands B1  
inner join products P1 on  B1.brand_id = P1.brand_id
inner join order_items O1 on  P1.product_id = O1.product_id
group by P1.product_id,B1.brand_id,B1.brand_name;




3	Tameka	Fisher	NULL	tameka.fisher@aol.com	769C Honey Creek St. 	Redondo Beach	NY	90278
