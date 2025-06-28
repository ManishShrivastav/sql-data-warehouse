/*
=============================================================
Database and Schema Setup
=============================================================
Purpose:
    This script creates a new database named 'DataWarehouse'. 
    It first checks if the database exists; if it does, the script drops and recreates it. 
    Afterward, it establishes three schemas within the database: 'bronze', 'silver', and 'gold'.

WARNING:
    Executing this script will permanently delete the existing 'DataWarehouse' database and all its contents. 
    Please ensure you have proper backups and proceed with caution.
*/

USE master;
GO

-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
