-- use securityadmin role to create the functional role
USE ROLE USERADMIN;

-- create the role
CREATE ROLE IF NOT EXISTS DATA_TEAM
    COMMENT = 'Role for data team members to access and manage data'
;

-- grant the role to sysadmin
GRANT ROLE DATA_TEAM TO ROLE SYSADMIN;

-- confirm role creation
SHOW ROLES;

-- switch to securityadmin for role grants
USE ROLE SECURITYADMIN;
-- allow execute tasks and managed tasks
--GRANT EXECUTE TASK ON ACCOUNT TO ROLE DATA_TEAM;
--GRANT EXECUTE MANAGED TASK ON ACCOUNT TO ROLE DATA_TEAM;

-- allow lineage functionality
GRANT VIEW LINEAGE ON ACCOUNT TO ROLE DATA_TEAM;

-- schema access grants
GRANT DATABASE ROLE GOVERNANCE.COMMON_ENGINEER TO ROLE DATA_TEAM;

-- warehouse grants
GRANT USAGE ON WAREHOUSE DEVELOPMENT TO ROLE DATA_TEAM;
