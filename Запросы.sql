--1. **Выбрать всех сотрудников с должностью 'Manager':**
SELECT * FROM Employee WHERE Position = 'Курьер';

--2. **Выбрать всех заказчиков и количество их заказов:**
SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS OrderCount
FROM Customer c
LEFT JOIN "Order" o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;

--3. **Выбрать список продуктов с их поставщиками:**
SELECT p.ProductID, p.Name, s.Name AS SupplierName
FROM Product p
INNER JOIN Supplier s ON p.SupplierID = s.SupplierID;

--4. **Выбрать все заказы, отсортированные по дате в обратном порядке:**
SELECT * FROM "Order" ORDER BY OrderDate DESC;

--5. **Выбрать все документы сотрудников, содержащие слово 'Док':**
SELECT * FROM Employee WHERE Documents LIKE '%Документ 3%';

--6. **Выбрать сумму оплаты для каждого заказа:**
SELECT OrderID, SUM(TotalPrice) AS TotalPayment
FROM "Order"
GROUP BY OrderID;

--7. **Для расчета общей суммы стоимости всех заказов**
SELECT SUM(TotalPrice) AS TotalPayment
FROM "Order";

--8. **Выбрать все категории продуктов и количество продуктов в каждой категории:**
SELECT c.CategoryName, COUNT(p.ProductID) AS ProductCount
FROM Category c
LEFT JOIN Product p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName;

--9. **Выбрать имена всех сотрудников и названия их ролей:**
SELECT e.FirstName, e.LastName, er.RoleName
FROM Employee e
INNER JOIN UserAccount ua ON e.EmployeeID = ua.EmployeeID
INNER JOIN EmployeeRole er ON ua.RoleID = er.RoleID;

--10. **Выбрать общее количество заказов для каждого заказчика:**
SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(o.OrderID) AS OrderCount
FROM Customer c
LEFT JOIN "Order" o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;

--11. **Выбрать все продукты с ценой ниже $100 и отсортировать их по цене:**
SELECT * FROM Product WHERE Price < 100(80) ORDER BY Price;
--SELECT * FROM Product WHERE Price > 100(80) ORDER BY Price;

--12. **Выбрать информацию о продуктах, у которых статус 'в наличии' и они относятся к определенной категории:**
SELECT p.Name, p.Description, c.CategoryName
FROM Product p
INNER JOIN Category c ON p.CategoryID = c.CategoryID
WHERE p.Status = 'В наличии' AND c.CategoryName = 'Овощи';


--13. Подсчитать количество заказов (Order) для каждого клиента (Customer):
SELECT CustomerID, COUNT(*) AS OrderCount FROM "Order" GROUP BY CustomerID;


--14. Выбрать все заказы (Order) с деталями о продуктах и количестве каждого продукта:
SELECT o.OrderID, p.Name AS ProductName, oi.Quantity 
FROM "Order" o 
JOIN OrderItem oi ON o.OrderID = oi.OrderID 
JOIN Product p ON oi.ProductID = p.ProductID;


--15. **Вывести поставщика и продукции в статуса(В наличии, не в наличии)**
SELECT Supplier.Name, Product.Name
FROM Supplier
JOIN Product ON Supplier.SupplierID = Product.SupplierID
WHERE Product.Status = 'не в наличии';
--WHERE Product.Status = 'В наличии';

--15. **Вывести сотрудников с определенным режимом работы**
SELECT * FROM Employee WHERE Schedule LIKE '%Пн-Пт%' ORDER BY LastName;