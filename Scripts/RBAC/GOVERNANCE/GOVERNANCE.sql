-- use sysadmin role for ownership
USE ROLE SYSADMIN;

-- create the governance database
CREATE DATABASE IF NOT EXISTS GOVERNANCE
    COMMENT = 'Database for holding governance objects, including network policies, masking policies, and row access policies'
;

-- confirm database creation
SHOW DATABASES;

-- drop the default public schema
DROP SCHEMA IF EXISTS GOVERNANCE.PUBLIC;

-- confirm public schema was dropped
SHOW SCHEMAS;

-- grant securityadmin rights to create database roles
GRANT CREATE DATABASE ROLE ON DATABASE GOVERNANCE TO ROLE SECURITYADMIN;

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
WHERE DATABASE_NAME = 'GOVERNANCE'
ORDER BY CREATED DESC
;
*/
