--select FirstName + ' ' + LastName FullName
--FROM EmployeeDemographics

--select avg(Age) as AvgAge
--FROM EmployeeDemographics

select Demo.EmployeeID
from EmployeeDemographics as Demo
JOIN EmployeeSalary as Sal
	ON Demo.EmployeeID = Sal.EmployeeID