with CTE_Employee as
(select FirstName, LastName, Gender, Salary, 
COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender,
AVG(Salary) OVER (PARTITION BY Gender) as AvgSalary
FROM EmployeeDemographics emp
JOIN EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
WHERE Salary > 45000
)
select FirstName, AvgSalary
From CTE_Employee