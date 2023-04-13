--select FirstName, LastName, Age,
--CASE
--	when Age > 30 Then 'Old'
--	when Age between 27 and 30 then 'Young'
--	else 'Baby'
--END as status
--From [sql tutorial].dbo.EmployeeDemographics
--where Age is not null
--order by Age

select FirstName, LastName, JobTitle, Salary,
CASE
	WHEN JobTitle = 'Salesman' Then Salary + (Salary * .10)
	WHEN JobTitle = 'Accountant' Then Salary + (Salary * .05)
	WHEN JobTitle = 'HR' Then Salary + (Salary * .000001)
	ELSE Salary + (Salary * .03)
END AS SalaryAfterRaise
from EmployeeDemographics
Join EmployeeSalary
	On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID