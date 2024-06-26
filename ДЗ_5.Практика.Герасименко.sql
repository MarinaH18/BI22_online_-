--1 a,b,c,d
select distinct StandardCost,
Case
when StandardCost=0 or StandardCost is null then 'not for sale'
when StandardCost >0 and StandardCost <100 then '<$100'
when StandardCost >=100 and StandardCost<500 then '<$500'
when StandardCost >=500 then '>=$500'
end as casecost
from Production.Product

--3 
select season, LastReceiptCost, 
case
when datepart(mm, LastReceiptDate) in (01, 02, 12) then 'winter'
when datepart(mm, LastReceiptDate) in (03, 04, 05) then 'spring'
when datepart(mm, LastReceiptDate) in (06, 07, 08) then 'summer'
when datepart(mm, LastReceiptDate) in (09, 10, 11) then 'autumn'
when LastReceiptCost <2000 then 'Do not include'
end as season
from Purchasing.ProductVendor
where AverageLeadTime >15
order by season

--4 как вывести все колонки?
select BusinessEntityID, AverageLeadTime, ModifiedDate,
sum (LastReceiptCost) over(partition by BusinessEntityID) as cost,
max (LastReceiptCost) over(partition by UnitMeasureCode) AS maxcost
from Purchasing.ProductVendor
where AverageLeadTime =15
order by BusinessEntityID
