-- executed on Gardening account

-- use accountadmin to so we can alter the account settings
USE ROLE ACCOUNTADMIN;

-- update the timezone on the account
ALTER ACCOUNT SET TIMEZONE = 'US/Central';

-- confirm the timezone change
SHOW PARAMETERS LIKE 'TIMEZONE' IN ACCOUNT;

-- add security integrations for google sso

-- add security integrations for tableau cloud & desktop
