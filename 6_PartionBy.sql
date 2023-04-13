--Mirip Group by

select FirstName, LastName, Gender, Salary,
COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
from EmployeeDemographics as Demo
JOIN EmployeeSalary as Sal
	ON Demo.EmployeeID = Sal.EmployeeID

select Gender, COUNT(Gender)
from EmployeeDemographics as Demo
JOIN EmployeeSalary as Sal
	ON Demo.EmployeeID = Sal.EmployeeID
GROUP BY Gender