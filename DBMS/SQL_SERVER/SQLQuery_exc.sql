use BikeStores;

-- 2)
select * from production.products where list_price >1000;

--3)

select * from sales.customers where state ='NY';

--4)

select concat(first_name,' ',last_name) as names,email from sales.customers; 

--5)

select  * from sales.orders where year(order_date) ='2016' ;

--6)

select * from production.products;

select * from production.categories;

select * from production.products P1
left join production.categories C1
on P1.category_id = C1.category_id
where C1.category_name = 'Mountain Bikes'; 

--7)

select C1.category_name, count(P1.product_name) as total_product from production.products P1
left join production.categories C1
on P1.category_id = C1.category_id
group by C1.category_name;

--8)

select * from production.products order by list_price desc;

--9)

select * from sales.customers;
select * from sales.orders;
select * from sales.order_items;
select order_id,C1.customer_id,concat(first_name,' ',last_name) as names from sales.orders O1
left join sales.customers C1
on O1.customer_id = C1.customer_id;

--10)

select * from production.products where model_year = '2017' ;

--Aggregation and Grouping
--1)

select avg(list_price) as  average_listprice  from production.products;

--2)

select * from sales.orders;
select * from sales.order_items;
select * from production.products;

select P1.product_name,O1.product_id,count(O1.quantity) as quantity_sold from sales.order_items O1
inner join production.products P1
on  P1.product_id = O1.product_id
group by O1.product_id,P1.product_name;

--3)

select * from sales.stores;
select * from sales.orders;
select * from sales.order_items;

select S1.store_name,sum(list_price) as total_amount  from sales.orders O1
left join  sales.order_items O2
on O1.order_id = O2.order_id
inner join sales.stores S1
on S1.store_id = O1.store_id
group by O1.store_id,S1.store_name;

--4)
select * from sales.customers;


select C1.customer_id,C1.first_name,count(order_id) as total_orders from sales.orders O1
inner join sales.customers C1
on O1.customer_id = C1.customer_id
group by C1.customer_id,C1.first_name;

--5)

select sum(quantity*list_price*discount) as total_discount from sales.order_items;

--6)

select * from production.categories;


select C1.category_name,avg(list_price) as avg_price_category from production.products P1
inner join production.categories  C1
on P1.category_id = C1.category_id
group by C1.category_name;

--7)


select month(order_date) as Xmonth,count(order_id) as total_order_month from sales.orders
where year(order_date) = '2016'
group by month(order_date);

--8)
select * from production.products;

select C1.category_name,sum(list_price) as  total_revenue from production.products P1
inner join production.categories  C1
on P1.category_id = C1.category_id
group by C1.category_name;

--9)

select * from production.products;

select count(customer_id) as total_customers,state from sales.customers
group by state;

--10)

select P1.model_year,P1.product_name,count(O1.quantity) as total_quantity from sales.order_items O1
inner join production.products P1
on O1.product_id = P1.product_id
group by model_year,P1.product_name
order by model_year;

-- Joins-- 1)
select * from sales.orders;
select * from production.products;
select * from sales.order_items;

select O1.order_id,P1.* from sales.orders O1
left join sales.order_items O2 
on O1.order_id = O2.order_id
inner join production.products P1
on O2.product_id = P1.product_id;

--2)

select * from sales.customers;
select * from sales.orders;

select C1.*,O1.order_id from  sales.customers C1
left join sales.orders O1
on C1.customer_id = O1.customer_id;

--3)

select P1.* from  production.products P1
left join sales.order_items O1
on P1.product_id = O1.product_id
where O1.product_id is null;

--4)

select * from sales.orders;
select * from sales.stores;
select * from sales.staffs;

select O1.order_id,S1.store_name,S2.* from sales.orders O1 
left join sales.stores S1 
on O1.store_id = S1.store_id
inner join sales.staffs S2
on S2.store_id = S1.store_id;

--5)

select * from production.products;
select * from production.brands;
select * from production.categories;

select P1.*,B1.brand_name,C1.category_name from production.brands B1
right join production.products P1 on
B1.brand_id = P1.brand_id
left join production.categories C1 on
P1.category_id = C1.category_id;

--6)

select C1.customer_id,C1.first_name,count(order_id) as total_orders from sales.orders O1
inner join sales.customers C1
on O1.customer_id = C1.customer_id
group by C1.customer_id,C1.first_name
having count(O1.order_id)>5;

--7)

select * from sales.customers
select * from sales.orders



select C1.customer_id, O1.* from sales.customers C1
left join sales.orders O1
on C1.customer_id = O1.customer_id
where state = 'CA'
order by C1.customer_id;

--8)

select * from sales.order_items;
select * from production.products;

select P1.product_name,count(O1.quantity) as total_product from sales.order_items O1
right join  production.products P1
on O1.product_id = P1.product_id
group by P1.product_name;

--9)

select * from production.products;
select * from production.categories;
select * from sales.orders;

select O1.*,P1.product_id,C1.category_name from production.categories C1
inner join production.products P1
on C1.category_id = P1.category_id
inner join sales.orders O1
on O1.order_id = O1.order_id;

--10)
select * from production.brands;
select * from production.products;

select B1.brand_name,count(P1.product_name) as numbe_of_products from production.products P1
left join production.brands B1
on P1.brand_id = B1.brand_id
group by B1.brand_name
having count(P1.product_name)>5;

--Subqueries--1)select max(list_price) as second_high from production.productswhere list_price < (select max(list_price) from production.products);--2)select max(list_price) from production.products;select * from production.categories;--3)select * from sales.customers
select * from sales.ordersselect C1.customer_id,O1.order_id from sales.customers C1inner join sales.orders O1on O1.customer_id = C1.customer_idwhere not EXISTS (select C1.customer_id from sales.customers C1inner join sales.orders O1on O1.customer_id = C1.customer_id);--4)select * from production.products;select * from sales.ordersselect * from sales.order_items;select O2.product_id from sales.orders O1left join sales.order_items O2on O1.order_id = O2.order_idinner join production.products P1on P1.product_id = O2.product_idgroup by O2.product_idhaving count(O2.product_id)>10;--5)select * from sales.customers
select * from sales.orders
 
select C1.customer_id,max(O1.order_date) from sales.customers C1
inner join sales.orders O1
on C1.customer_id = O1.customer_id
group by C1.customer_id;

SELECT o.*
FROM sales.orders o
WHERE o.order_date = (
    SELECT MAX(o2.order_date)
    FROM sales.orders o2
    WHERE o2.customer_id = o.customer_id
)
order by o.customer_id;