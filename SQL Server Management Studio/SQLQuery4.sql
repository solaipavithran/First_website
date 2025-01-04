

CREATE OR ALTER PROCEDURE Ups_customers
AS
BEGIN 
		declare @str_date as varchar(50),@end_date as varchar(50)
		set @str_date = '2016-01-01'
		set @end_date = '2016-02-01'

		select O1.order_id,O2.order_date,P1.product_id,O1.list_price,P1.product_name
		from production.products P1
		right join  sales.order_items O1 on  O1.product_id = P1.product_id
		right join sales.orders O2 on  O1.order_id = O2.order_id
		where O2.order_date between @str_date and @end_date;
END;

EXECUTE Ups_customers;

EXEC  sp_helptext Ups_customers;



EXECUTE Ups_customers;


create view vw_sales_brand
as
	select 
		

