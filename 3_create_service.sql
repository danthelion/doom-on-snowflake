USE ROLE container_apps_test_role;
USE DATABASE container_apps_test_db;
USE SCHEMA container_apps_test_schema;
USE WAREHOUSE container_apps_test_warehouse;

CREATE SERVICE doom_service
  IN COMPUTE POOL container_apps_test_compute_pool
  FROM SPECIFICATION $$
    spec:
      containers:
      - name: echo
        image: /container_apps_test_db/container_apps_test_schema/container_apps_test_repository/doom:latest
        env:
          SERVER_PORT: 8080
      endpoints:
      - name: doomendpoint
        port: 8080
        public: true
      $$
   MIN_INSTANCES=1
   MAX_INSTANCES=1;

SHOW ENDPOINTS IN SERVICE doom_service;
