-- use sysadmin for warehouse ownership
USE ROLE SYSADMIN;

-- create the warehouse
CREATE WAREHOUSE IF NOT EXISTS DEVELOPMENT
    WAREHOUSE_TYPE = STANDARD
    WAREHOUSE_SIZE = XSMALL
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE
    MIN_CLUSTER_COUNT = 1
    MAX_CLUSTER_COUNT = 1
    INITIALLY_SUSPENDED = TRUE
    COMMENT = 'Warehouse to be used for development and by development team'
    ENABLE_QUERY_ACCELERATION = FALSE
;
