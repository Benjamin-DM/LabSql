use AdventureWorks2017
--1. Visualizar todos los registros de la tabla productos.
select * from Production.Product
go

--2. Ver la estructura de la tabla productos
exec sp_help 'Production.Product'
go

--3. Cuantos productos no pertenecen a una subcategoría.
FROM Production.Product
WHERE ProductSubcategoryID IS NULL;

--4. Ver listado de subcategorías de productos
SELECT *
FROM Production.ProductSubcategory

--5. Visualizar listado de subcategorías con sus respectivas categorías
SELECT
sub.ProductSubcategoryID,
cat.Name,
sub.Name,
sub.rowguid,
sub.ModifiedDate
FROM Production.ProductSubcategory AS sub
INNER JOIN Production.ProductCategory AS cat
ON cat.ProductCategoryID = sub.ProductCategoryID

--6. Visualizar cantidad de productos por cada subcategoría
SELECT 
DISTINCT COUNT(pp.ProductID) as 'Producto', 
ps.name AS 'Subcategoria' 
FROM Production.Product pp
INNER JOIN Production.ProductSubcategory ps
ON pp.ProductSubcategoryID = ps.ProductSubcategoryID
GROUP BY ps.name

--7. Ver precio promedio por cada categoría de producto
SELECT pc.name AS 'Categoria',
AVG(pp.ListPrice) AS 'Precio Promedio'
FROM Production.Product pp
INNER JOIN Production.ProductSubcategory ps
ON pp.ProductSubcategoryID = ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory pc
ON ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.name

--8. Ver cantidad de productos por categoría
SELECT * FROM Production.ProductCategory
SELECT
pro.ProductID,
cat.Name AS Categoria,
pro.Name
FROM Production.Product AS pro
INNER JOIN Production.Productcategory AS cat
ON cat.ProductCategoryID = pro.ProductSubcategoryID

--9. Ver cantidad de productos sólo de la categoría components
SELECT
pro.ProductID,
cat.Name AS Categoria,
pro.Name
FROM Production.Product AS pro
INNER JOIN Production.Productcategory AS cat
ON cat.Name = 'Components'

--10. Visualizar el total de ventas por cada categoría de producto
SELECT C.Name, 
SUM(SA.LineTotal * SA.UnitPrice) as TOTAL
FROM Production.Product P
INNER JOIN Sales.SalesOrderDetail SA 
on P.ProductID = SA.ProductID
INNER JOIN Production.ProductSubcategory S 
on S.ProductSubcategoryID = P.ProductSubcategoryID
INNER JOIN Production.ProductCategory C 
on C.ProductCategoryID = S.ProductCategoryID
GROUP BY C.Name
--11. Ver la cantidad total de empleados
SELECT COUNT(*) FROM HumanResources.Employee
SELECT * FROM HumanResources.Employee

--12. Ver la cantidad total de empleados de acuerdo a su estado civil.
SELECT * FROM HumanResources.Employee WHERE MaritalStatus='S' 
SELECT * FROM HumanResources.Employee WHERE MaritalStatus='M'

--13. Ver cantidad de empleados por género
SELECT * FROM HumanResources.Employee WHERE Gender = 'F' AND MaritalStatus='S' 
SELECT * FROM HumanResources.Employee WHERE Gender = 'M' AND MaritalStatus='M'

--14. Ver listado de Departamentos
select * FROM HumanResources.Department

--15. Ver cantidad de empleados por cada departamento
SELECT 
Department,
COUNT(*) AS empleados
FROM HumanResources.vEmployeeDepartment GROUP BY Department

