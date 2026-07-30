USE TechMart;
GO

--==========================================================
-- A view is a virtual table created from the result of a SQL
-- SELECT statement. Views do not store data themselves; they
-- display data from one or more tables and simplify complex
-- queries by allowing them to be reused.
--==========================================================

-- a view that joins the orders and customers tables instead on writing long code
CREATE VIEW View_CustomerOrders
AS
SELECT
    O.OrderID,
    C.FirstName,
    C.LastName,
    O.OrderDate,
    O.TotalAmount
FROM Orders O
INNER JOIN Customers C
    ON O.CustomerID = C.CustomerID;
GO

SELECT *
FROM View_CustomerOrders;

-- view to join the product and suppliers table 
CREATE VIEW View_ProductSuppliers
AS
SELECT
    P.ProductName,
    P.Category,
    P.Price,
    S.CompanyName
FROM Products P
INNER JOIN Suppliers S
ON P.SupplierID = S.SupplierID;
GO

SELECT *
FROM View_ProductSuppliers;

-- view called Product Sales that displays every product sold, including customer, quantity, and selling price information.
CREATE VIEW View_ProductSales
AS
SELECT
    O.OrderID,
    C.FirstName,
    P.ProductName,
    OD.Quantity,
    OD.UnitPrice
FROM OrderDetails OD
INNER JOIN Orders O
ON OD.OrderID = O.OrderID
INNER JOIN Customers C
ON O.CustomerID = C.CustomerID
INNER JOIN Products P
ON OD.ProductID = P.ProductID;
GO

SELECT *
FROM View_ProductSales;

