-- Normalization
/*
type of Normalization Forms:
1. 1NF = 1 cell andd onle value there should be primary key

*/

CREATE DATABASE Normalization;
use Normalization;
drop table Product;
CREATE TABLE Product(
product_id int PRIMARY KEY,
colour_id char(5),
categoryID char(3),
sizeID char(5),
usageID char(5),
ManufactureID char(5),
product_name varchar(50) not null,
price decimal(7,2) not null,
XDescription varchar(100),
created datetime default getdate(),
numerinstock int,
);

select * from Product;

ALTER TABLE Product
Drop column usage,manufacture;
ALTER TABLE Product
ADD colour_id char(5);

ALTER TABLE Product
ADD CONSTRAINT colour_id foreign key(colour_id) references colour(colour_id )
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	CONSTRAINT category_id foreign key(categoryID) references category(categoryID)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	CONSTRAINT sizeID foreign key(sizeID) references size(sizeID )
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	CONSTRAINT usageID foreign key(usageID) references usage(usageID)
	ON UPDATE CASCADE
	ON DELETE CASCADE,
	CONSTRAINT ManufactureID foreign key(ManufactureID) references Manufacture(ManufactureID)
	ON UPDATE CASCADE
	ON DELETE CASCADE;
	


exec sp_help product;

INSERT into Product values(10,'Nike air','casual','nike',1875.00,'to wear',default,25);

select * from product;



CREATE TABLE category(
		categoryID char(3) PRIMARY KEY,
		categoryNmae varchar(50) not null,
)
INSERT INTO category VALUES('C01','MEN'),('C02','WOMEN');
select * from category;

CREATE TABLE colour(
colour_id char(5) PRIMARY KEY,
colour_name varchar(30),
);

INSERT INTO colour VALUES('CLR01','Black'),('CLR02','White'),('CLR03','Green');
select * from colour;

CREATE TABLE size(
		sizeID char(5) primary key,
		sizeName varchar(50),
);

INSERT INTO size VALUES('SZ001','8-us'),('SZ002','9-EG'),('SZ003','10-IND');

select * from size;

drop table Manufacture;
CREATE TABLE usage(
usageID char(5) primary key,
usageName varchar(50)
);
INSERT INTO usage VALUES('US001','casual'),('US002','Formal');
CREATE TABLE Manufacture(
ManufactureID char(5) primary key,
ManufactureName varchar(50)
);

INSERT INTO Manufacture VALUES('MA001','Nike'),('MA002','FILA'),('MA003','adidas');
select * from Manufacture;

	
