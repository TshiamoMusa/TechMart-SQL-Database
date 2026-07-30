SELECT *
FROM Customers;

--display all products with supplier names
SELECT
    P.ProductName,
    P.Category,
    P.Price,
    S.CompanyName
FROM Products P
INNER JOIN Suppliers S
ON P.SupplierID = S.SupplierID;

--display customer orders
SELECT
    O.OrderID,
    C.FirstName,
    C.LastName,
    O.OrderDate,
    O.TotalAmount
FROM Orders O
INNER JOIN Customers C
ON O.CustomerID = C.CustomerID;

--show every product sold
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