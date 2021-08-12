--SQL JOINS

SELECT * FROM Customer

SELECT * FROM Orders

--Eg1--find the country wise totalsales in customer and orders table

SELECT
Country,
TotalAmount
 FROM Customer AS C
INNER JOIN 
Orders AS O 
ON 
C.Id=O.CustomerId

SELECT
Country,
sum(o.TotalAmount) AS Totalsalescountry
FROM Customer AS C
INNER JOIN 
Orders AS O 
ON 
C.Id=O.CustomerId
group by Country
order by Totalsalescountry desc

--eg2 which city has more number of sales 

select 
City,
sum(Orders.TotalAmount) as Totalsalescity 
from
Customer
INNER JOIN 
Orders
ON
Customer.Id=Orders.CustomerId
group by City
order by Totalsalescity desc

--eg3 full all the customer details from the orders table
select * from orders 
select * from customer
 
 select 
 CustomerId,
 sum([TotalAmount]) as total_sales,
 FirstName,
 LastName,
 City,
 Country
 from Orders
 left join 
 Customer
 on 
 Orders.CustomerId=Customer.Id
 group by 
 CustomerId,
 FirstName,
 LastName,
 City,
 Country

 --eg4 write a query to pull connect supplier and product table tell which supplier sells how many products 

 select * from supplier 
 select * from product

 select 
 Supplier.Id,
 Supplier.CompanyName,
 count(Product.Id) AS TOTALPRODUCTS 

 from Supplier
 inner join
 Product
 on
 Supplier.Id=Product.SupplierId
 GROUP BY 
 Supplier.Id,
 Supplier.CompanyName
 ORDER BY TOTALPRODUCTS DESC

 --TYPES of Joins inner,left,right,outer,selfjoin   

 --eg5 ull the customer name and ordernumber
 select * from Customer
 sELECT * from Orders

 select 
 FirstName,
 LastName,
[OrderNumber]

 from Customer
 inner join
 Orders
 on
 Customer.Id=Orders.CustomerId
 where customer.id=4
 
--eg6 pull ordernumber,orderdate,productnumber,unitprice,qty (joining of 3 tables)

select 
Orders.OrderNumber,
Orders.OrderDate,
Product.ProductName,
OrderItem.UnitPrice,
OrderItem.Quantity
from Orders 
join
OrderItem
on
Orders.Id=OrderItem.OrderId
join product 
on Product.Id=OrderItem.ProductId

--eg7 pull out  productname purcased by customer id=2
select 
Customer.Id,
Customer.FirstName,
Orders.OrderNumber,
Product.ProductName
from Customer 
join Orders  on
Customer.Id=Orders.CustomerId
join
OrderItem on
OrderItem.OrderId=Orders.Id
join 
Product on
Product.Id=OrderItem.ProductId
where Customer.Id=5

--eg8 pullout supplier id ,companyname,contact,productname,unitprice and quantity

select 
Supplier.id,
Supplier.CompanyName,
Supplier.ContactName,
product.ProductName,
OrderItem.Quantity,
OrderItem.UnitPrice
from Supplier 
join Product
on Supplier.Id=Product.SupplierId
join OrderItem
on OrderItem.ProductId=Product.Id
where Supplier.Id=1
order by Supplier.Id 

--if we want to group these 

select 
Supplier.id,
Supplier.CompanyName,
Supplier.ContactName,
product.ProductName,
sum(OrderItem.Quantity) as total_quantity,
sum(OrderItem.UnitPrice) as total_unitprice
from Supplier 
join Product
on Supplier.Id=Product.SupplierId
join OrderItem
on OrderItem.ProductId=Product.Id
where Supplier.Id=1
group by 
Supplier.id,
Supplier.CompanyName,
Supplier.ContactName,
product.ProductName
order by Supplier.Id 

--eg9 find which manager does the employee report to using  (selfjoin)

select * from employees

select 
e.employee_id,
m.manager_id,
e.first_name,
m.first_name
from employees as e join
 employees as m on
 e.manager_id=m.employee_id

 --eg10 pull out employees firstname,lastname,departmentname

 select 
 employees.first_name,
 employees.last_name,
 departments.department_name
from employees join departments
on employees.department_id=departments.department_id

--subquery

--find the list of employees how is earning more than avg salary
select avg(salary) from employees

select 
employee_id,
first_name,
salary
from employees
where salary > (select avg(salary) from employees)

select 
employee_id,
first_name,
salary,
(select avg(salary) from employees) as avg_slary
from employees
where salary > (select avg(salary) from employees)

select 
employee_id,
first_name,
avg(salary) as avg_salary
from
employees
group by 
employee_id,
first_name

--find the list of employees whose  is earning  more than minimum salary

select 
employee_id,
first_name,
salary,
(select min(salary) FROM employees) AS minimum_salary
from employees
where salary > (select min(salary) FROM employees) 

--find the list of employees whose salary is less than minimum salary

select  
employee_id,
first_name,
salary,
(select AVG(salary) from employees) as avg_salary,
salary - (select AVG(salary) from employees) as salary_diff
from employees
where salary < (select AVG(salary) from employees)

--pull out the names of employee whose location id is 1700 give first and lastname

--first method by using joins

select employee_id,first_name,last_name,location_id from employees join departments on employees.department_id=departments.department_id
where departments.location_id =1700

--by using subquery (imp)

select employee_id,first_name,last_name from employees 
where employees.department_id in (select department_id from departments where location_id=1700)

--using subquery give the country names whose regionname=Europe

select country_name from countries 
where countries.region_id in (select region_id from regions where region_name='Europe')

--using the sub query pullout the firstname,lastname of employees whose jobtitle="accountant"

select first_name,last_name,job_id from employees
where employees.job_id in (select job_id from jobs where job_title='Accountant')

--using the subquery pullout the department name which in london
select department_name from departments
where departments.location_id in (select location_id from locations where city = 'seattle')

--case statements 

--find the above average and below average segment 
select * from Orders

SELECT [Id]
      ,[OrderDate]
      ,[OrderNumber]
      ,[CustomerId]
      ,[TotalAmount]
	  ,(select avg(TotalAmount) from Orders) as avg_sales
	  ,case 
	  when TotalAmount < (select avg(TotalAmount) from Orders) then 'below average'
	  else 'Above average' end as sales_segment
  FROM [Sales].[dbo].[Orders] 

  --segerigate the supplier data into USA AND NO_USA SUPPLIER

  SELECT TOP (1000) [Id]
      ,[CompanyName]
      ,[ContactName]
      ,[ContactTitle]
      ,[City]
      ,[Country]
	  ,CASE WHEN Country = 'USA' THEN 'American supplier' else 'Non american supplier' end as america_OR_NON 
      ,[Phone]
      ,[Fax]
  FROM [Sales].[dbo].[Supplier]

  --Segrigate orderitem  based on unitprice morethan or less than 10 dollars

  SELECT [Id]
      ,[OrderId]
      ,[ProductId]
      ,[UnitPrice]
	  ,case when unitprice < 10 then 'Above' else 'below'end as above_or_below10dollars
      ,[Quantity]
  FROM [Sales].[dbo].[OrderItem]

  --in th hr data segrigate employees salary above avg and below avg

  SELECT TOP (1000) [employee_id]
      ,[first_name]
      ,[last_name]
      ,[email]
      ,[phone_number]
      ,[hire_date]
      ,[job_id]
      ,[salary]
	  ,(select avg(salary) from employees) as avg_salary
	  ,case when salary > (select avg(salary) from employees) then 'Above avg' else 'below avg' end as avg_salarygrid 
      ,[manager_id]
      ,[department_id]
  FROM [HR].[dbo].[employees]





