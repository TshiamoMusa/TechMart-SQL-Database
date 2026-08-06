-- Purpose is to creates a differential backup of the TechMart database.
BACKUP DATABASE TechMart
TO DISK = 'C:\Backups\TechMart_Diff.bak'
WITH
    DIFFERENTIAL,
    INIT,
    NAME = 'TechMart Differential Backup',
    STATS = 10;