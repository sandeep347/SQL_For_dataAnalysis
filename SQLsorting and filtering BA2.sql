SELECT * FROM Customer

--Select only 2 columns from the table 
SELECT Id,FirstName
from Customer

SELECT
Id,
LastName,
City
FROM Customer

--Selecting only top 5 rows

SELECT TOP 5 * FROM Customer

--Selecting particular customer info using customer
select * from Customer
where Id = 56

select * from Customer
where Id >50-


--alias 
SELECT  [Id] as userid 
      ,[FirstName] as initial_name
      ,[LastName] as final_name
      ,[City] as region
      ,[Country]
      ,[Phone]
  FROM [Sales].[dbo].[Customer]


  select 
  id,
  OrderDate,
  OrderNumber,
  CustomerId,
  TotalAmount,
  TotalAmount + 5000 as bonus
  from Orders

  select 
  Id,
  OrderId,
  ProductId,
  UnitPrice,
  Quantity,
  UnitPrice * Quantity as totalamount
  from OrderItem

  --sorting
  --order by 
  select  * from Customer 
  order by Id desc

  select * from Customer 
  order by FirstName desc

  select * from Customer
  order by Country asc

  --filtering

  select * from Product
  where UnitPrice<10

  select * from Product
  where UnitPrice>=10

  select * from Product
  where SupplierId=3

  Select * from OrderItem
  where ProductId=11
  order by UnitPrice desc
  --in
  Select * from OrderItem
  where ProductId in (11,42)
  order by UnitPrice desc

  --between
  select * from Product
  where UnitPrice between 10 and 15
  order by UnitPrice

  --not in 

  select * from Product
  where SupplierId not in(7,8)