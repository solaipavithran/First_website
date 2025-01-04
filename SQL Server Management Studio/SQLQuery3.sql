/*declare @a  as varchar(50);
set  @a = ' hello';

select @a;

DECLARE @name NVARCHAR(50);
SET @name = 'John Doe'; 
SELECT @name;*/

declare @Firstname as varchar(100)
	,@LastName as varchar(100)
	,@MiddleName as varchar(100)
 
set @Firstname = '  Mahindra  '
set @MiddleName = '  Singh  '
set @LastName = '  Dhoni  '
 
select CONCAT(LTRIM(RTRIM(@Firstname)), ' '
				,LTRIM(RTRIM(@MiddleName)),' '
				,LTRIM(RTRIM(@LastName))
				) as [Full Name]
 
select CONCAT(@Firstname,' ',@MiddleName,' ',@LastName)


-- table value Function

DECLARE  @product TABLE(
		product_id int not null,
		product_name varchar(100) not null,
		unit_price decimal(10,2) not null

)

insert into @product(product_id,product_name,unit_price)
select product_id,product_name,list_price from production.products;

select * from @product;
use BikeStores;
/*
create or alter function udf_insert(
@course as varchar(500)
)
returns @coursetable table(courseName varchar(100))
as
begin 
	declare
		@lstring varchar(100),
		@rstring varchar(100),
		@mstring varchar(100),
		@endstring varchar(100)
	set @lstring = left(@course,CHARINDEX(',',@course-1))
	set	@rstring = SUBSTRING(@course,CHARINDEX('.',@course+1),len(@course))
	set	@mstring = left(@rstring,CHARINDEX(',',@course+2))
	set	@endstring = SUBSTRING(@rstring,CHARINDEX(',',@rstring+1),len(@rstring))
	insert into @coursetable 
	return;
end;

select dbo.udf_insert('python,java,c++');
*/

CREATE OR ALTER FUNCTION udf_tb1_PrgCourse(
	@Course AS VARCHAR(500)
)
RETURNS @CourseTable TABLE(
				CourseName VARCHAR(100)
				)
AS
BEGIN
	DECLARE
		@lString AS VARCHAR(100),
		@rString AS VARCHAR(100),
		@mString AS VARCHAR(100),
		@EndString AS VARCHAR(100)
 
	SET @lString = LEFT(@Course, CHARINDEX(',', @Course)-1)
	SET @rString = SUBSTRING(@Course, CHARINDEX(',', @Course)+1, LEN(@Course))
	SET @mString = LEFT(@rString, CHARINDEX(',',@Course)+2)
	SET @EndString = SUBSTRING(@rString, CHARINDEX(',',@rString)+1, LEN(@rString))
 
 
	 INSERT INTO @CourseTable (CourseName)
    VALUES (@lString), (@mString), (@EndString)
 
	
 
    RETURN
END
 
 
DECLARE @Course VARCHAR(500) = 'SQL, BootStrap, Python';
SELECT * FROM udf_tb1_PrgCourse(@Course);
DECLARE @Course VARCHAR(500) = 'SQL, BootStrap, Python';
-- dynamic function 

CREATE OR ALTER FUNCTION dynamic_fun(
@Data as varchar(500),@delimiter as char(1)
)
RETURNS @coursetable table(coursename varchar(200))
AS
BEGIN
		DECLARE @pos_delimiter int = -1

		WHILE(len(@Data)>0)
		BEGIN
		SET @pos_delimiter = CHARINDEX(@delimiter,@Data)
			IF((@pos_delimiter = 0) and (len(@data) > 0))
			BEGIN 
				INSERT INTO @coursetable(coursename)
				VALUES (@Data)
				BREAK
			END
			IF(@pos_delimiter>1)
			BEGIN 
				INSERT INTO @coursetable(coursename)
				VALUES(left(@Data,@pos_delimiter-1))

				set @Data = right(@Data,(len(@Data) - @pos_delimiter))
			END
			ELSE
			BEGIN 
				SET @Data = right(@Data,(len(@Data) - @pos_delimiter))
			END
		end
	return
end

declare @Data as varchar(500)

set @Data = 'SQL,python'

select * from dbo.dynamic_fun(@Data,',')

-- sql as a text

declare @select as varchar(100),
		@sql as varchar(500),
		@tablename as varchar(50);
set @select = 'SELECT * FROM ';
set @tablename = 'production.products';
set @sql = @select +' '+@tablename;

print @sql

exec (@sql)
use BikeStores
select * from production.products;


DECLARE @Select VARCHAR(100),
        @TableName VARCHAR(50),
        @sql VARCHAR(500);


-- Set variable values
SET @Select = 'SELECT * FROM ';
SET @TableName = 'production.products';
SET @sql = @Select + ' ' + @TableName;  -- Ensure space between 'FROM' and the table name
 
-- Print the dynamic SQL query
PRINT @sql;
 
-- Execute the dynamic SQL query
EXEC (@sql);

