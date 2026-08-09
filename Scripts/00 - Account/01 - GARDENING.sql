-- Gardening account creation (from org account)

-- use orgadmin role for account creation
USE ROLE ORGADMIN;

-- create a new account in AWS US West (Oregon) region with Enterprise edition
CREATE ACCOUNT GARDENING
    ADMIN_NAME = 'NICOLE'
    ADMIN_PASSWORD = 'rLEp4%!k3r}<Ri!Crn5d4TK$'
    ADMIN_USER_TYPE = 'PERSON'
    FIRST_NAME = 'Nicole'
    LAST_NAME = 'Samson'
    EMAIL = 'nicole.samson@hearthloreanalytics.com'
    MUST_CHANGE_PASSWORD = TRUE
    EDITION = ENTERPRISE
    REGION = AWS_US_WEST_2
    COMMENT = 'Account for Gardening project'
;

/* results
{"accountLocator":"NJB67552","accountLocatorUrl":"https://njb67552.snowflakecomputing.com","accountName":"GARDENING","url":"https://phsisym-gardening.snowflakecomputing.com","edition":"ENTERPRISE","regionGroup":"PUBLIC","cloud":"AWS","region":"AWS_US_WEST_2"}
*/

-- confirm account creation
SHOW ACCOUNTS;
