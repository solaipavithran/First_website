/*CREATE TABLE  Bank_Trans(
	id tinyint,
	amount decimal(10,2),
	Trans_date DATETIME
);


truncate table Bank_trans;

insert into Bank_trans values(1,1000,'2024-03-11 10:30:45'),
								(2,2000,'2024-03-11 11:00:00'),
								(3,500,'2024-03-11 10:30:45'),
								(4,1000,'2024-03-11 10:30:45'),
								(5,15000,'2024-03-11 10:30:45'),
								(6,4000,'2024-03-11 10:30:45'),
								(7,6000,'2024-03-11 10:30:45'),
								(8,8000,'2024-03-11 10:30:45')*/

use BikeStores;
select * from customers;

select * into Adit_customer from (select * from customers) as A where 1=2 ;	
drop table Adit_customer;
select * from Adit_customer;

alter table Adit_customer
add operation char(3);

CREATE OR ALTER TRIGGER trg_Customers
on Customers after delete
as
begin
set identity_insert Adit_customer on;
	insert into Adit_customer(customer_id,first_name,last_name,phone,email,street,city,state,zip_code,operation)
	select customer_id,first_name,last_name,phone,email,street,city,state,zip_code,'del' from deleted;
set identity_insert Adit_customer off;
end;

delete from customers where customer_id = 2;
select * from Adit_customer;
select * from customers;



create or alter trigger audit_update
on customers after update
as begin
	set identity_insert Adit_customer on;
	insert into Adit_customer(customer_id,first_name,last_name,phone,email,street,city,state,zip_code,operation)
	select customer_id,first_name,last_name,phone,email,street,city,state,zip_code,'upd' from deleted;
	set identity_insert Adit_customer off;
end;


update customers 
set state = 'NY'
where customer_id = 3;





