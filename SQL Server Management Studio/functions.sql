/*create or alter function update_function(@Quantity)
returns decimal(10,2)
as
begin 
	declare
		@*/

CREATE OR ALTER FUNCTION dbo.udf_OrderValue (
    @Quantity DECIMAL(7,2),
    @Price DECIMAL(10,2),
    @Discount DECIMAL(7,2)
)
RETURNS DECIMAL(20,2)
AS
BEGIN
    DECLARE
        @OrderValue DECIMAL(20,2),
        @DiscountPrice DECIMAL(20,2),
        @TotalAmount DECIMAL(20,2);
    SET @TotalAmount = (@Quantity * @Price);
    SET @DiscountPrice = (@TotalAmount * @Discount);
    SET @OrderValue = (@TotalAmount - @DiscountPrice);
    RETURN @OrderValue;
END;






alter table Order_items 
add Order_values decimal(10,2);

create or alter procedure update_fun
as
begin
		
		update order_items
		set Order_values = dbo.udf_OrderValue(quantity,list_price,discount);
 
end

execute update_fun;

select * from order_items;

alter table customers
drop column Order_values;

-- product,branch,category

select * from brands;
select * from categories;
select * from products;


create or alter procedure inst_brand(@brand_name varchar(50),@brandID as int out)
as 
	begin 
	--declare @brandID as int
	insert into brands(brand_name) 
	values(@brand_name)
	set @brandID = SCOPE_IDENTITY()

end;

create or alter procedure inst_category(@category_name varchar(50), @categoryID as int out)
as 
	begin 
	--declare @categoryID as int
	insert into categories(category_name) 
	values(@category_name)
	set @categoryID = SCOPE_IDENTITY()

end;
create or alter procedure inst_brand(@product_name varchar(50),@model_year int ,@list_price decimal(10,2))
as 
	begin 
	declare @productID as int
	insert into products(product_name,model_year,list_price) 
	values(@product_name,@model_year,@list_price)
	set @productID = SCOPE_IDENTITY()

end;


