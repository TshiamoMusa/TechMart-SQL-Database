
-- Purpose is to restore the TechMart database from a full backup.
RESTORE DATABASE TechMart
FROM DISK = 'C:\Backups\TechMart.bak'
WITH
    REPLACE,
    RECOVERY;

-- Purpose is to restore the TechMart database using a full backup followed by a differential backup.

-- Restore the Full Backup
RESTORE DATABASE TechMart
FROM DISK = 'C:\Backups\TechMart.bak'
WITH
    REPLACE, -- this overides the current database
    NORECOVERY;

-- Restore the Differential Backup
RESTORE DATABASE TechMart
FROM DISK = 'C:\Backups\TechMart_Diff.bak'
WITH
    RECOVERY;