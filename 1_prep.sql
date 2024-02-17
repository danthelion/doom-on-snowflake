USE ROLE ACCOUNTADMIN;

CREATE ROLE container_apps_test_role;

CREATE DATABASE IF NOT EXISTS container_apps_test_db;
GRANT OWNERSHIP ON DATABASE container_apps_test_db TO ROLE container_apps_test_role;

CREATE OR REPLACE WAREHOUSE container_apps_test_warehouse WITH
  WAREHOUSE_SIZE='X-SMALL';
GRANT USAGE ON WAREHOUSE container_apps_test_warehouse TO ROLE container_apps_test_role;

CREATE SECURITY INTEGRATION IF NOT EXISTS container_apps_test_snowservices_ingress_oauth
  TYPE=oauth
  OAUTH_CLIENT=snowservices_ingress
  ENABLED=true;

GRANT BIND SERVICE ENDPOINT ON ACCOUNT TO ROLE container_apps_test_role;

CREATE COMPUTE POOL container_apps_test_compute_pool
  MIN_NODES = 1
  MAX_NODES = 1
  INSTANCE_FAMILY = CPU_X64_XS;
GRANT USAGE, MONITOR ON COMPUTE POOL container_apps_test_compute_pool TO ROLE container_apps_test_role;

GRANT ROLE container_apps_test_role TO USER DANI_ADMIN;

USE ROLE container_apps_test_role;
USE DATABASE container_apps_test_db;
USE WAREHOUSE container_apps_test_warehouse;

CREATE SCHEMA IF NOT EXISTS container_apps_test_schema;
CREATE IMAGE REPOSITORY IF NOT EXISTS container_apps_test_repository;
CREATE STAGE IF NOT EXISTS container_apps_test_stage
  DIRECTORY = ( ENABLE = true );
