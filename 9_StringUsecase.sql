/*
String Function TRIM LTRIM Replace Substring upper lower
*/

CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

INSERT INTO EmployeeErrors Values
('1001 ', 'Jimbo', 'Halbert')
,(' 1002', 'Pamela', 'Beasely')
,('1005', 'Toby', 'Flenderson - Fired')

SELECT * 
FROM EmployeeErrors


--Using TRIM
SELECT EmployeeID, TRIM(EmployeeID) as IDTRIM
FROM EmployeeErrors

SELECT EmployeeID, LTRIM(EmployeeID) as IDTRIM
FROM EmployeeErrors

SELECT EmployeeID, RTRIM(EmployeeID) as IDTRIM
FROM EmployeeErrors

--Using Replace
SELECT LastName, REPLACE(LastName, '- Fired','') AS LastNameFixed
FROM EmployeeErrors

--Using Substring
SELECT err.FirstName, SUBSTRING(err.FirstName,1,3), SUBSTRING(dem.FirstName,1,3)
FROM EmployeeErrors err
JOIN [sql tutorial]..EmployeeDemographics dem
ON SUBSTRING(err.FirstName,1,3) = SUBSTRING(dem.FirstName,1,3)

--Using lower, upper
select FirstName, LOWER(FirstName) lower, UPPER(FirstName) up
FROM EmployeeErrors