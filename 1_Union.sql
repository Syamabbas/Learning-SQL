--select * 
--from [sql tutorial].dbo.EmployeeDemographics

--select * 
--from [sql tutorial].dbo.EmployeeSalary

select JobTitle, AVG(Salary)
from [sql tutorial].dbo.EmployeeDemographics
right Outer Join [sql tutorial].dbo.EmployeeSalary
on [sql tutorial].dbo.EmployeeDemographics.EmployeeID = [sql tutorial].dbo.EmployeeSalary.EmployeeID
where JobTitle = 'Salesman'
group by JobTitle
