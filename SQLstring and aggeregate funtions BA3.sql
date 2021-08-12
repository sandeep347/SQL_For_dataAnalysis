--filetring based on characters 
select * from customer
where FirstName like 'M%' --NAMES THAT START WITH M

select * from customer
where FirstName like '%A' --Names that ends with A

select * from customer
where FirstName like '%Ar%' --Names that contains AR

select * from Customer
where country like 's%' --country name that starts with S

select * from Customer
where country like '%n' --country name that ends with n

select * from Customer
where country like '%w%' --country name that contains with w

select * from Customer
where country like '_taly'


select * from Customer
where country like '_____d' --underscore represents the initials 

select * from Customer
where country='Italy'

--Basic functions of SQL

select  upper([FirstName]) as capital from [dbo].[Customer]

SELECt [Id]
      ,[FirstName]
	  ,UPPER([FirstName])  u_name
      ,[LastName]
      ,[City]
      ,[Country]
      ,[Phone]
  FROM [Sales].[dbo].[Customer]

  SELECt [Id]
      ,[FirstName]
	  ,len([FirstName]) as lengthofname -- len length of string
	  ,UPPER([FirstName])  u_name   --upper converts to uppercase
      ,lower([LastName]) l_name --lower converts to lower case 
      ,[City]
      ,[Country]
      ,[Phone]
  FROM [Sales].[dbo].[Customer]

  SELECT [Id]
      ,[OrderId]
      ,[ProductId]
	  ,[Unitprice]
      ,round([UnitPrice],1) -- round decimal reduces
      ,[Quantity]
  FROM [Sales].[dbo].[OrderItem]

   SELECT [Id]
      ,[OrderId]
      ,[ProductId]
	  ,[Unitprice]
      ,floor([UnitPrice]) --floor rounds to nearest integer
      ,[Quantity]
  FROM [Sales].[dbo].[OrderItem]

  SELECT [Id]
      ,[OrderId]
      ,[ProductId]
	  ,[Unitprice]
      ,ceiling([UnitPrice]) -- ceiling pushes to next integer
      ,[Quantity]
  FROM [Sales].[dbo].[OrderItem]

  SELECT [Id]
      ,[FirstName]
      ,[LastName]
	  ,CONCAT([FirstName],' ', [LastName]) as merged  -- concat mergering two data
      ,[City]
      ,[Country]
      ,[Phone]
  FROM [Sales].[dbo].[Customer]


  SELECT TOP (1000) [Id]
      ,[FirstName]
      ,[LastName]
	  ,(FirstName+' '+LastName) --concat 2nd method
      ,[City]
      ,[Country]
      ,[Phone]
	  ,GETDATE() as today ---get todays date 
  FROM [Sales].[dbo].[Customer]

  SELECT TOP (1000) [Id]
      ,[FirstName]
      ,[LastName]
      ,[City]
      ,[Country]
	  ,left([Country],3) as initial --left takes initial letters of word
	  ,RIGHT([City],4) as final --right takes last letters of word
      ,[Phone]
  FROM [Sales].[dbo].[Customer]

  select ltrim('       sandeep')--ltrim clears the empty spaces 
  select len('suresh        t    ')
  select rtrim('suresh          ')--rtrim clears the empty sapces from right side 

  SELECT TOP (1000) [Id]
      ,[FirstName]
      ,[LastName]
	  ,reverse([LastName]) as rev --reverses the given element
      ,[City]
      ,[Country]
      ,[Phone]
	  ,REPLICATE([Phone],1) as rep --replicates the elements in rows for how many u need
  FROM [Sales].[dbo].[Customer]

  SELECT TOP (1000) [Id]
      ,[FirstName]
      ,[LastName]
      ,[City]
	  ,REPLACE([Country],'Germany','Bhatkal') --replaces the given charaters 
      ,[Country]
      ,[Phone]
  FROM [Sales].[dbo].[Customer]

  --aggergate functions
  --to find the total sales made each customerid using group by

 SELECT [CustomerId]
      ,sum([TotalAmount]) as totalsales
  FROM [Sales].[dbo].[Orders]
  group by CustomerId
  order by totalsales

  SELECT
      [CustomerId]
      ,sum([TotalAmount]) as totalsales --sum of total sales made by each customer 
  FROM [Sales].[dbo].[Orders]
  group by CustomerId

   SELECT
      [CustomerId]
      ,avg([TotalAmount]) as avgsale  -- avg sale by customer
  FROM [Sales].[dbo].[Orders]
  group by CustomerId

  SELECT
      [CustomerId]
      ,MAX([TotalAmount]) as avgsale  -- MAX sale by customer
  FROM [Sales].[dbo].[Orders]
  group by CustomerId

  SELECT
      [CustomerId]
      ,MIN([TotalAmount]) as avgsale  -- MIN sale by customer
  FROM [Sales].[dbo].[Orders]
  group by CustomerId

  SELECT  
  CustomerId,
  count([OrderNumber]) as totalorders --total numbers orders placed by customer
  FROM Orders
  group by CustomerId

  SELECT 
  CustomerId,
  count([Id]) as totalorders --total numbers orders placed by customerid=63
  FROM Orders
  where CustomerId=63
  group by CustomerId

  select 
  SupplierId,
  count(Id) no_of_products,
  sum(UnitPrice)
  from Product
  where supplierId=1
  group by SupplierId


  --group by order id and which orderid has max sales

  select 
  OrderId,
  max([Unitprice]) as maxordervalue
  from OrderItem
  where OrderId=4
  group by OrderId
  

  select 
  orderId,
  sum(UnitPrice) as totalsales
  from OrderItem
  where OrderId=4
  group by OrderId

  select * from customer --find the number customers in each country
  select 
  Country,
  count([Id]) as total_number
  from Customer
  group by Country
  order by total_number  desc

  --find the number of country whose customer count is more than 5
  select Country from Customer
  group by Country
  having COUNT(Id)>5


  select 
  Country,
  count(Id) as total
  from Customer
  group by Country
  having  count(Id)> 5

  --find the number of customers by city and country 

  select * from Customer

  select city,country,count(Id) as total_customers from Customer
  group by City,Country
  having COUNT(id)>3
  order by total_customers desc

  --find which customerid has more orders 

   select CustomerId,COUNT(ID) AS TOTALORDERS
   from Orders
   group by CustomerId
   ORDER BY TOTALORDERS DESC

   --find the customers who has placed more than 12 orders

    select CustomerId,COUNT(ID) AS TOTALORDERS
   from Orders
   group by CustomerId
   HAVING COUNT(ID)>12

   --find how many customers are there in a country 
   select * from Customer

   select country,COUNT(Id) as Total_customer from Customer
   group by Country
   order by Total_customer desc

   --find which country has more number of suppliers

   select * from Supplier

   select Country,count(id) as totalsuppliers from Supplier
   group by Country
   order by totalsuppliers desc

   --union,union all-takes all the values 
select * from EmployeeDemographics
--union takes unique value from both the tables 
select * from WareHouseEmployeeDemographics

select * from EmployeeDemographics
union
select * from WareHouseEmployeeDemographics

select * from EmployeeDemographics
union all
select * from WareHouseEmployeeDemographics

--DATE FUNCTIONS
SELECT GETDATE() --SHOWS TODAYS DATE
SELECT DATEPART(YEAR,GETDATE()) --SHOWS THE YEAR
SELECT DATEPART(MONTH,GETDATE())--SHOWS THE MONTH
SELECT MONTH(GETDATE())

SELECT * FROM ORDERS
--extract only years,months,days from order table 
SELECT
Id,
orderdate,
DATEPART(year,OrderDate)as years,
DATEPART(MONTH,OrderDate)as months,
DATEPART(DAY,OrderDate)as days,
customerid,
TotalAmount
from Orders

--datediff gives the difference between days yearmonth 
select DATEDIFF(DAY,'1995-02-20',GETDATE())
select DATEDIFF(YEAR,'1995-02-20',GETDATE())
select DATEDIFF(MONTH,'1995-02-20',GETDATE())
select datename(day,GETDATE())
select datename(MONTH,GETDATE()) --gives the name of month

--find the how the orders is old

SELECT
Id,
orderdate,
DATEdiff(year,OrderDate,GETDATE())as years,
customerid,
TotalAmount
from Orders

--find the total years of working by employesss

SELECT [employee_id]
      ,[first_name]
      ,[last_name]
      ,[hire_date]
	  ,datediff(year,hire_date,GETDATE()) as totalexp
      ,[job_id]
      ,[salary]
      ,[manager_id]
      ,[department_id]
  FROM [HR].[dbo].[employees]

  --adding one year to current date 
 SELECT  DATEADD (YEAR, 1 ,GETDATE())
 --ADDING 6 MONTHS TO EXISTING DATE 
 SELECT  DATEADD (MONTH, 6 ,GETDATE())