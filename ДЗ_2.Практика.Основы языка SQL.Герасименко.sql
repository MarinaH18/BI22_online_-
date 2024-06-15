--a) не понимаю проблему с 'where'
select BusinessEntityID, LoginID, Gender, BirthDate
From HumanResources.Employee
where Gender = 'F' and BirthDate > '1969-01-29';

--b)
select distinct PersonType
from Person.Person 
where LastName like 'M%' or LastName like 'N%' and MiddleName is not null;

--c)
select *
from Sales.SpecialOffer
where StartDate between '2013-01-01' and '2014-01-01'
order by DiscountPct desc

--d)
select ProductID, Name, ProductNumber
from Production.Product
where ProductNumber like '_B%[1-9]'
order by ProductID desc

--e)
select ProductID, Name, Color, Size
from Production.Product
where Color in ('Red', 'Silver', 'Black') and Size is not null

--f)   SickLeaveHours, VacationHours
select distinct JobTitle, SickLeaveHours, VacationHours
from HumanResources.Employee
where SickLeaveHours <= 15 or VacationHours <= 20 and JobTitle not like '%Vice President_%' and  JobTitle not like '%_Manager%'  

--g)
Вывести LastName и FirstName из таблицы Person.Person 
где LastName начинается на 'R' и упорядочить FirstName по алфавиту, а LastName в обратном порядке.