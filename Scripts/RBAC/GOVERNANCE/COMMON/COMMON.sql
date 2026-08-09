-- use sysadmin (owner) to create the database
USE ROLE SYSADMIN;

-- create new schemas
CREATE SCHEMA IF NOT EXISTS GOVERNANCE.COMMON
    WITH MANAGED ACCESS
    COMMENT = 'Schema for common governance objects, including network policies, masking policies, and row access policies'
;

-- confirm new schema was created
SHOW SCHEMAS;

-- modify role
CREATE DATABASE ROLE IF NOT EXISTS GOVERNANCE.COMMON_MODIFY
    COMMENT = 'Role for modify access to governance common schema'
;
