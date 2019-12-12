-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select c.CategoryName as Category,
    p.ProductName as Product
from [product] as p
join category as c 
    on p.CategoryId = c.id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select o.id as OrderNumber,
    s.CompanyName as CompanyName
from [order] as o
join shipper as s 
    on o.ShipVia = s.id
where OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select p.ProductName as Product,
    od.Quantity as Quantity
from OrderDetail as od
join Product as p
    on od.ProductId = p.Id
where OrderId = 10251
order by Product;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

select o.id as OrderNumber,
    c.CompanyName,
    e.lastName as LastName
from [order] as o
join Customer as c
    on o.CustomerId = c.id
join Employee as e
    on o.EmployeeId = e.id;