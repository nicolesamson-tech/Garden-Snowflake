/*
    Replace what's in brackets [] below with the values to fill-in the template
        account name: [account_name] -- in uppercase
        admin user name: [admin_name] -- in uppercase
        admin password: [admin_password]
        admin first name: [first_name] -- mixed case
        admin last name: [last_name] -- mixed case
        admin e-mail: [admin_email] -- lower or mixed case
        account edition: [edition] -- STANDARD, ENTERPRISE, BUSINESS_CRITICAL
        account region: [region] -- see https://docs.snowflake.com/en/user-guide/admin-account-identifier#label-snowflake-region-ids
            use the Snowflake Region ID:
                AWS_US_WEST_2
                GCP_US_CENTRAL1
                AZURE_SOUTHCENTRALUS
        comment: [comment]

*/
-- account creation (execute from organization account)

-- use orgadmin role for account creation
USE ROLE ORGADMIN;

-- create a new account in AWS US West (Oregon) region with Enterprise edition
CREATE ACCOUNT [account_name]
    ADMIN_NAME = '[admin_name]'
    ADMIN_PASSWORD = '[admin_password]'
    ADMIN_USER_TYPE = 'PERSON'
    FIRST_NAME = '[first_name]'
    LAST_NAME = '[last_name]'
    EMAIL = '[admin_email]'
    MUST_CHANGE_PASSWORD = TRUE
    EDITION = [edition]
    REGION = [region]
    COMMENT = '[comment]'
;

/* results

*/

-- confirm account creation (this may take several minutes to populate)
SHOW ACCOUNTS;
