/*
    Replace what's in brackets [] below with the values to fill-in the template, then ctrl+h
        database name: [database_name]
        database comment: [database_comment]
*/
-- use sysadmin role for ownership
USE ROLE SYSADMIN;

-- create the [database_name] database
CREATE DATABASE IF NOT EXISTS [database_name]
    COMMENT = '[database_comment]'
;

-- confirm database creation
SHOW DATABASES;

-- drop the default public schema
DROP SCHEMA IF EXISTS [database_name].PUBLIC;

-- confirm public schema was dropped
SHOW SCHEMAS;

-- grant securityadmin rights to create database roles
GRANT CREATE DATABASE ROLE ON DATABASE [database_name] TO ROLE SECURITYADMIN;

-- view all databases (dropped and active) in account
/*
USE ROLE SYSADMIN;
USE WAREHOUSE DEVELOPMENT;
SELECT 
    DATABASE_NAME
    ,COMMENT
    ,CREATED
    ,LAST_ALTERED 
    ,DELETED 
FROM SNOWFLAKE.ACCOUNT_USAGE.DATABASES 
WHERE DATABASE_NAME = '[database_name]'
ORDER BY CREATED DESC
;
*/
