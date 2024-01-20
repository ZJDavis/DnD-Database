-- Create the DnD database
CREATE DATABASE DnD;

-- Use the DnD database
USE DnD;
GO
-- Create the reference schema
CREATE SCHEMA ref;
GO
-- Create a login for administrators (replace 'your_admin_username' with the actual administrator username)
CREATE LOGIN [your_admin_username] WITH PASSWORD = 'your_admin_password', CHECK_POLICY = OFF, DEFAULT_DATABASE = DnD;

-- Create a database user for administrators
CREATE USER [your_admin_username] FOR LOGIN [your_admin_username];

-- Add the administrator user to the db_owner role for full control
ALTER ROLE db_owner ADD MEMBER [your_admin_username];

-- Create a role for read access
CREATE ROLE db_readers;

-- Add database users to the db_readers role
CREATE USER [public] FOR LOGIN [public];
ALTER ROLE db_readers ADD MEMBER [public];

-- Grant SELECT permission on all tables in the 'ref' schema to the db_readers role
GRANT SELECT ON SCHEMA :: ref TO db_readers;

-- Create reference tables in the 'ref' schema (adjust columns and data types as needed)
CREATE TABLE ref.Classes (
    ClassID INT PRIMARY KEY,
    ClassName NVARCHAR(100)
);

CREATE TABLE ref.Races (
    RaceID INT PRIMARY KEY,
    RaceName NVARCHAR(100)
);

-- ... Add more reference tables as needed ...

-- Ensure only administrators can modify the tables and data
DENY INSERT, UPDATE, DELETE ON SCHEMA :: ref TO db_readers;
