select *
from Production.Product;

--a
select min(weight) as min_w, max(size) as max_s
from Production.Product;

--b
select ProductSubcategoryID, min(weight) as min_w, max(size) as max_s 
from Production.Product
where ProductSubcategoryID is not null
group by ProductSubcategoryID
order by ProductSubcategoryID;

--c
select ProductSubcategoryID, Color, min(weight) as min_w, max(size) as max_s
from Production.Product
where ProductSubcategoryID is not null and Color is not null
group by ProductSubcategoryID, Color
order by ProductSubcategoryID;

select ProductSubcategoryID, min(weight) as min_w, max(size) as max_s
from Production.Product
where ProductSubcategoryID is not null
group by ProductSubcategoryID, Color
having Color is not null
order by ProductSubcategoryID;

--d
select ProductSubcategoryID, min(weight) as min_w
from Production.Product
group by ProductSubcategoryID
having min(weight) >50
--order by min(weight)

--e
select ProductSubcategoryID, color, min(weight) as min_w
from Production.Product
group by ProductSubcategoryID, Color
having min(weight) >50 and color= 'Black'

--f
select TaxType, min(TaxRate) as min_tr
from Sales.SalesTaxRate
group by TaxType
having min(TaxRate)<7
