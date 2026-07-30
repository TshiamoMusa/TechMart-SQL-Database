USE TechMart;
GO

CREATE TABLE Customers
(
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    DateRegistered DATE DEFAULT GETDATE()
);
GO

CREATE TABLE Suppliers
(
    SupplierID INT IDENTITY(1,1) PRIMARY KEY,
    CompanyName VARCHAR(100) NOT NULL,
    ContactPerson VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100)
);
GO

CREATE TABLE Products
(
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    SupplierID INT NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0),
    StockQuantity INT DEFAULT 0 CHECK (StockQuantity >= 0),

    CONSTRAINT FK_ProductSupplier
        FOREIGN KEY (SupplierID)
        REFERENCES Suppliers(SupplierID)
);
GO

CREATE TABLE Employees
(
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(50),
    HireDate DATE
);
GO

CREATE TABLE Orders
(
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    EmployeeID INT NOT NULL,
    OrderDate DATE DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2) DEFAULT 0,

    CONSTRAINT FK_OrderCustomer
        FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID),

    CONSTRAINT FK_OrderEmployee
        FOREIGN KEY (EmployeeID)
        REFERENCES Employees(EmployeeID)
);
GO

CREATE TABLE OrderDetails
(
    OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_OrderDetails_Order
        FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID),

    CONSTRAINT FK_OrderDetails_Product
        FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID)
);
GO

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';


INSERT INTO Customers
(FirstName, LastName, Email, Phone)
VALUES
('John', 'Smith', 'john.smith@email.com', '0821111111');

INSERT INTO Customers
(FirstName, LastName, Email, Phone)
VALUES
('Sarah', 'Johnson', 'sarah.johnson@email.com', '0832222222');

INSERT INTO Customers
(FirstName, LastName, Email, Phone)
VALUES
('Michael', 'Brown', 'michael.brown@email.com', '0843333333');

SELECT * FROM Customers;

-- suppliers 
INSERT INTO Suppliers
(CompanyName, ContactPerson, Phone, Email)
VALUES
('Tech Distributors','David Green','0115551000','sales@techdist.co.za');

INSERT INTO Suppliers
(CompanyName, ContactPerson, Phone, Email)
VALUES
('PC World','Linda Adams','0115552000','contact@pcworld.co.za');

INSERT INTO Suppliers
(CompanyName, ContactPerson, Phone, Email)
VALUES
('Digital Solutions','James White','0115553000','info@digitalsolutions.co.za');

SELECT * FROM Suppliers;

--employees
INSERT INTO Employees (FirstName, LastName, Position, HireDate)
VALUES
('Peter', 'Williams', 'Sales Manager', '2023-01-15'),
('Emily', 'Taylor', 'Sales Assistant', '2024-03-20'),
('Daniel', 'Moore', 'Cashier', '2024-08-10');

SELECT * FROM Employees;

--products 
INSERT INTO Products
(SupplierID, ProductName, Category, Price, StockQuantity)
VALUES
(1, 'Dell Laptop', 'Laptop', 15999.99, 15),
(1, 'Gaming Mouse', 'Accessories', 499.99, 50),
(2, 'Mechanical Keyboard', 'Accessories', 1199.99, 30),
(2, '24-inch Monitor', 'Monitor', 3499.99, 20),
(3, 'External SSD 1TB', 'Storage', 2299.99, 25),
(3, 'USB Flash Drive 64GB', 'Storage', 199.99, 100);

SELECT * FROM Products;

--orders 
INSERT INTO Orders
(CustomerID, EmployeeID, OrderDate, TotalAmount)
VALUES
(1,1,'2025-07-01',16499.98),
(2,2,'2025-07-02',3499.99),
(3,3,'2025-07-03',2499.98);

SELECT * FROM Orders;

--order details 
INSERT INTO OrderDetails
(OrderID, ProductID, Quantity, UnitPrice)
VALUES
(1,1,1,15999.99),
(1,2,1,499.99);
INSERT INTO OrderDetails
(OrderID, ProductID, Quantity, UnitPrice)
VALUES
(2,4,1,3499.99);
INSERT INTO OrderDetails
(OrderID, ProductID, Quantity, UnitPrice)
VALUES
(3,5,1,2299.99),
(3,6,1,199.99);

SELECT * FROM OrderDetails;

