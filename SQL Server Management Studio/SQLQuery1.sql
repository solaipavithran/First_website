/*create database employee;
use employee;
drop table if exists emp;
create table emp(
     emp_id int,
	 firstname varchar(50) not null,
	 lastname varchar(50) not null,
	 hiredate date not null,
	 emailid varchar(50),
	 phoneno varchar(50),
	 jobid varchar(50),
	 salary decimal(7,2),
	 primary key(emp_id)
);
 
 
insert into emp (emp_id,firstname,lastname,hiredate,emailid,jobid,salary) values
(100, 'Steven','King','1987-06-17','steven.king@gmail.com','AD_Pres',90000.00)
,(101, 'N','Kochar','1989-09-21','n.kochar@gmail.com','AD_VP',17000.00)
,(102, 'Lex','DeHaan','1993-01-13','lex.dehaan@gmail.com','AD_VP',25000.00)
,(103, 'Alexander','Hunold','1990-01-03','alexander.hunold@gmail.com','IT_PROG',9000.00)
,(104, 'Bruce','Ernst','1991-05-21','bruce.ernst@gmail.com','IT_PROG',6000.00)
,(105, 'David','Austin','1997-06-25','david.austin@gmail.com','IT_PROG',4800.00);
 
 
select *, case jobid
	when 'IT_PROG' then (salary*0.1)+salary
	when 'AD_Pres' then (salary*0.2)+salary
	else salary
	end as RevisedSalary
from emp;

select *, case
	when jobid = 'AD_Pres' then (salary*0.2)+salary
	when emp_id = 101 then (salary*0.1)+salary
	else salary
	end as RevisedSalary
from emp;

select concat(firstname,'(',substring(lastname,1,1),')') from emp;
select * from emp
order by case jobid
			when 'AD_pres' then 'C'
			when 'IT_POROG' then 'B'
			when 'AD_VP' then 'A'
		else 'D'
		end ;

select jobid,case jobid
			when 'AD_pres' then 'C'
			when 'IT_POROG' then 'B'
			when 'AD_VP' then 'A'
		else 'D'
		end from emp;*/
CREATE TABLE citizen(
		customer_if tinyint,
		first_name varchar(50),
		last_name varchar(50),
		age int not null,
		country varchar(30));
insert into citizen values(1,'john','doe',31,'usa'),
						(2,'robert','luna',22,'usa'),
						(3, 'Michael', 'Johnson', 40, 'India'),
						(4, 'Emily', 'Davis', 35, 'India'),
						(5, 'David', 'Brown', 28, 'India'),
						(6, 'Sarah', 'Williams', 32, 'India'),
						(7, 'James', 'Miller', 45, 'India'),
						(8, 'Laura', 'Wilson', 27, 'India'),
						(9, 'Robert', 'Moore', 29, 'India'),
						(10, 'Linda', 'Taylor', 33, 'India');
insert into citizen values(11,'john','doe',17,'usa');
BEGIN TRANSACTION;
INSERT INTO citizen VALUES
select count(*),case 
			when age >= 18 then 'eligible to vote'
			else 'not eligible to vote'
			end as vote_eligibility
			from citizen
			group by 
			case
			when age >= 18 then 'eligible to vote'
			else 'not eligible to vote'
			end;
select coalesce(null,null,'india','usa','south korea') as country;


