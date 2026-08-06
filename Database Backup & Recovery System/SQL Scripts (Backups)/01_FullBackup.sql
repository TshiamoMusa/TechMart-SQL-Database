-- File: 01_FullBackup.sql
-- Purpose is to create a full Backup of TechMart
BACKUP DATABASE TechMart
TO DISK = 'C:\Backups\TechMart.bak'
WITH
    INIT,
    NAME = 'TechMart Full Backup',
    STATS = 10;