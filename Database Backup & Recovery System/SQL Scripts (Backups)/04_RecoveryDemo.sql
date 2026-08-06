-- Purpose is to demonstrate recovering the TechMart database using a Full Backup and Differential Backup.
USE TechMart;
GO

-- after full backup 01_FullBackup.sql 
-- add a new customer
INSERT INTO Customers
(FirstName, LastName, Email, Phone)
VALUES
('Bob', 'Shaw', 'bob.shaw@email.com', '0825564757');


-- run 02_DifferentialBackup.sql to create differential backup

-- accidental data loss of a specific record
DELETE FROM Customers
WHERE FirstName = 'Bob'
AND LastName = 'Shaw';

SELECT * FROM Customers;

-- now we restore the Full Backup
-- note disconnect from database before restoring otherwise query will not be completed
USE master;
GO

ALTER DATABASE TechMart
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE;
GO

RESTORE DATABASE TechMart
FROM DISK = 'C:\Backups\TechMart.bak'
WITH
    REPLACE,
    NORECOVERY;
GO

-- restore the Differential Backup
RESTORE DATABASE TechMart
FROM DISK = 'C:\Backups\TechMart_Diff.bak'
WITH
    RECOVERY;
GO

-- verify the recovery
SELECT *
FROM Customers;

-- check if we still using masters
SELECT DB_NAME() AS CurrentDatabase;

USE TechMart;
GO
