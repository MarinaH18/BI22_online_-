
--3.a) join € сделала правильно, а дальше пыталась чз where, забыла про COUNT
select concat (p.FirstName, ' ', p.LastName) as n_f
from Person.Person as p
join Person.PersonPhone as pph
on p.BusinessEntityID=pph.BusinessEntityID
group by concat (p.FirstName, ' ', p.LastName)
having count(pph.PhoneNumber) >1

--3.b) 
select pp.Name
from Production.Product as pp
join Purchasing.ProductVendor as ppv
on pp.ProductID=ppv.ProductID
join Purchasing.Vendor as pv
on ppv.BusinessEntityID=pv.BusinessEntityID 
where pv.Name like '%a%' or pv.AccountNumber like 'A%'
group by pp.Name
having avg(ppv.StandardPrice)>10

--3.c)
select pv.Name
from Purchasing.Vendor as pv
left join Purchasing.ProductVendor as ppv
on pv.BusinessEntityID=ppv.BusinessEntityID
where ppv.BusinessEntityID is null

--4.a) 
 select emp.emp_name, dep.Dep_name
 from t.employees as emp
 left join t.departament as dep
 on emp.dep_id=dep.dep_id

 --4.b) не прописала count
 select dep.Dep_name
 from t.departament as dep
 left join t.employees as emp
 on emp.dep_id=dep.dep_id

 --4.c)
 select lower(concat(FirstName, '_', LastName) replace (concat(FirstName, '_', LastName), ' ', '@gmail.com') as email
 from table
 
 --4.d)
 select top 1 d.dep_name, r.revenue 
 isnull (e.dep_id, 'N.D.')
 from t.departament as d
 left join t.employees as e
 on e.dep_id=d.dep_id
 full join t.revenue as r
 on e.emp_id=r.emp_id
 where sum(r.revenue)=(select max(revenue)
                       from t.revenue)

--5.a) кроме этого варианта ничего не сработало, но не пон€тно, почему выдает даты
--с €нвар€ 2014, если "за последние 10 лет" значит с 24.06.2014 до 23.06.2024?
select *
from Purchasing.ProductVendor
where datediff (yy, lastreceiptdate, current_timestamp) =10

--5.b
select *
from Purchasing.ProductVendor
where month(lastreceiptdate)=06

--5.c
select datename(dw, LastReceiptdate) as dayw, count(*) as dela
from Purchasing.ProductVendor
group by datename(dw, LastReceiptdate)
having count(*) <=7

--5.d не пон€ла, как с подзапросом сделать
select distinct
day(LastReceiptdate) as dy, count(*) as daydela,
month(LastReceiptdate) as mn, count(*) as mndela,
year(LastReceiptdate) as yr, count(*) as yrdela
from Purchasing.ProductVendor
group by day(LastReceiptdate), month(LastReceiptdate), year(LastReceiptdate)
order by day(LastReceiptdate), month(LastReceiptdate), year(LastReceiptdate)