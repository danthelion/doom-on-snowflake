USE ROLE doom_role;
USE DATABASE doom_db;
USE SCHEMA doom_schema;
USE WAREHOUSE doom_warehouse;

CREATE SERVICE doom_service
  IN COMPUTE POOL doom_compute_pool
  FROM SPECIFICATION $$
    spec:
      containers:
      - name: doom
        image: /doom_db/doom_schema/doom_repository/doom:latest
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
