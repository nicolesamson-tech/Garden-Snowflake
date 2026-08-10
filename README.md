# Garden-Snowflake
This repository contains all the files necessary to setup and configure Snowflake for a Garden / Gardening project.

- [Scripts](#scripts)
    - [Account](#account)
    - [Warehouses](#warehouses)
    - [Databases, Schemas, and RBAC](#databases-schemas-and-rbac)
        - [GOVERNANCE](#governance)
    - [Functional Roles](#functional-roles)
    - [Rollbacks](#rollbacks)

## Scripts
Scripts should be executed in a specific order, as detailed below. There is a primary script that will execute all needed scripts in the appropriate sequence. Or they can be executed individually in order.

### Account
The first thing we need to create is the account to hold the data. You can skip this step if you already have an account. For this project, we're creating a new GARDENING account, to keep this separate from our production data and make it easier to dispose of in the future.

>***NOTE:*** The account creation scripts should only be run once. They are not included in the master deployment script as a result.

- Scripts
    - Accounts
        - GARDENING
            - [GARDENING.sql](Scripts/Accounts/GARDENING/GARDENING.sql)
                - Creates the account
                - Should be run from the organization account or one with orgadmin enabled
                - It could take several minutes for the resulting link to be functional
            - [GARDENING Configuration.sql](Scripts/Accounts/GARDENING/GARDENING%20Configuration.sql)
                - Sets the timezone and any other account configurations
                - Should be run from the newly created account

### Warehouses
After the account is created and configured, we're ready to create the warehouses.

>***NOTE:*** Warehouses will not have their own access roles, since they would need to be created at the account level. There are only two actual options: GRANT USAGE and GRANT MONITOR, so those lines will be added to the functional role scripts.

```
-- usage is needed for USE WAREHOUSE
GRANT USAGE ON [WAREHOUSE] TO ROLE [FUNCTIONAL_ROLE];

-- monitor is needed for SUSPEND or RESUME
GRANT MONITOR ON [WAREHOUSE] TO ROLE [FUNCTIONAL_ROLE];

```

- Scripts
    - Warehouses
        - [DEVELOPMENT.sql](Scripts/Warehouses/DEVELOPMENT.sql)

### Databases, Schemas, and RBAC
Now we're ready to create some databases, schemas, and database roles.

- Scripts
    - Databases
        - GOVERNANCE <a id="governance"></a>
            - [GOVERNANCE.sql](Scripts/Databases/GOVERNANCE/GOVERNANCE.sql)
            - COMMON
                - [COMMON.sql](Scripts/Databases/GOVERNANCE/COMMON/COMMON.sql)
            - Database Roles
                - [COMMON_READ.sql](Scripts/Databases/GOVERNANCE/Database%20Roles/COMMON_READ.sql)
                - [COMMON_MODIFY.sql](Scripts/Databases/GOVERNANCE/Database%20Roles/COMMON_MODIFY.sql)
                - [COMMON_BUILD.sql](Scripts/Databases/GOVERNANCE/Database%20Roles/COMMON_BUILD.sql)
                - [COMMON_ENGINEER.sql](Scripts/Databases/GOVERNANCE/Database%20Roles/COMMON_ENGINEER.sql)

### Functional Roles
- Scripts
    - Functional Roles
        - [DATA_TEAM.sql](Scripts/Functional%20Roles/DATA_TEAM.sql)

### Rollbacks
Every creation script has a corresponding rollback. The rollback should return the account to the state it was in before the creation / modification scripts were run. This is for testing purposes as much as deployment.

- Scripts
    - Rollbacks
        - Databases
            - GOVERNANCE
                - [Rollback Governance.sql](Scripts/Rollbacks/Databases/GOVERNANCE/Rollback%20GOVERNANCE.sql)
        - Warehouses
            - [Rollback DEVELOPMENT.sql](Scripts/Rollbacks/Warehouses/Rollback%20DEVELOPMENT.sql)

### Templates

- Templates
    - Create Account
    - Create Warehouse
    - Create Functional Roles
    - [Create Database](Scripts/Templates/Create%20Database.sql)
    - Create Schema
    - Schema Read Database Role
    - Schema Modify Database Role
    - Schema Build Database Role
    - Schema Engineer Database Role
