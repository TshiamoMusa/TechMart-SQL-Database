-- Purpose to perform basic database maintenance on the TechMart database.

USE TechMart;
GO

-- check the database for corruption
DBCC CHECKDB ('TechMart');
GO

-- update statistics
EXEC sp_updatestats;
GO

-- shrink the database if required
-- Note: do not run this regularly in production only after large file is deleted 
DBCC SHRINKDATABASE (TechMart);
GO