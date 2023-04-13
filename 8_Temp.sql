/*
Biasanya temporary table berfungsi sebagai tabel penampung sementara. 
Misalkan kita ingin menghitung total barang sebelum memasukkannya ke dalam tabel aslinya. 
Atau kita perlu melakukan operasi yang melibatkan MySQL, namun tidak untuk disimpan.
*/

CREATE TABLE #temp_Employee (
EmployeeID int,
JobTitle varchar(100),
Salary int
)

select *
from #temp_Employee

INSERT INTO #temp_Employee VALUES (
'1001', 'HR', '45000'
)

INSERT INTO #temp_Employee
SELECT *
FROM [sql tutorial]..EmployeeSalary

DROP TABLE IF EXISTS #Temp_Employee2
CREATE TABLE #Temp_Employee2 (
JobTitle varchar(50),
EmployeesPerJob int,
AvgAge int,
AvgSalary int)

INSERT INTO #Temp_Employee2
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(Salary)
FROM [sql tutorial]..EmployeeDemographics emp
JOIN [sql tutorial]..EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
GROUP BY JobTitle

select *
FROM #Temp_Employee2