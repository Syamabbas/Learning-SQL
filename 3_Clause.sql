--select JobTitle, count(JobTitle)
--from EmployeeDemographics
--join EmployeeSalary
--	on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--group by JobTitle
--having count(JobTitle) > 1

select JobTitle, AVG(Salary) as avg_salary
from EmployeeDemographics
join EmployeeSalary
	on EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
group by JobTitle
having avg(Salary) > 45000
order by AVG(Salary)