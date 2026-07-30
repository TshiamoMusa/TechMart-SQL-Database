-- A Stored Procedure is a collection of SQL statements that are saved in the database and can be executed whenever needed.

USE TechMart;
GO

-- Procedure GetAllCustomers to display all customers in the database.
CREATE PROCEDURE GetAllCustomers
AS
BEGIN

    SELECT *
    FROM Customers;

END;
GO

EXEC GetAllCustomers;

-- Procedure GetAllProducts to display every product available for sale.
CREATE PROCEDURE GetAllProducts
AS
BEGIN

    SELECT *
    FROM Products;

END;
GO

EXEC GetAllProducts;

-- Procedure GetCustomerOrders to display customer orders together with customer details.
CREATE PROCEDURE GetCustomerOrders
AS
BEGIN

    SELECT
        O.OrderID,
        C.FirstName,
        C.LastName,
        O.OrderDate,
        O.TotalAmount
    FROM Orders O
    INNER JOIN Customers C
        ON O.CustomerID = C.CustomerID;

END;
GO

EXEC GetCustomerOrders;

-- Parameter
-- Procedure: GetCustomerByID to display the details of a customer based on their ID.
CREATE PROCEDURE GetCustomerByID
    @CustomerID INT
AS
BEGIN

    SELECT *
    FROM Customers
    WHERE CustomerID = @CustomerID;

END;
GO

-- this or EXEC GetCustomerByID @CustomerID = 2;
EXEC GetCustomerByID 2;


-- Procedure: GetProductsByCategory to display all products within a selected category.
CREATE PROCEDURE GetProductsByCategory
    @Category VARCHAR(50)
AS
BEGIN

    SELECT *
    FROM Products
    WHERE Category = @Category;

END;
GO

-- always select the category names that match sample data e.g EXEC GetProductsByCategory 'Accessories';
EXEC GetProductsByCategory 'Laptop';

