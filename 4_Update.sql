select *
from EmployeeDemographics

update EmployeeDemographics
set Age = 31, Gender = 'Female'
where FirstName = 'Holly' and LastName = 'Flax'

delete from EmployeeDemographics
where EmployeeID = 1005