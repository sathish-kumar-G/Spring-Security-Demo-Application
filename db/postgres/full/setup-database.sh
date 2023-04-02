#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE demo_service_db;
    CREATE ROLE demo_service_usr WITH LOGIN PASSWORD 'demo123';
    GRANT ALL PRIVILEGES ON DATABASE demo_service_db TO demo_service_usr;
    GRANT pg_read_server_files TO demo_service_usr;
    ALTER DATABASE demo_service_db OWNER TO demo_service_usr;
EOSQL

psql -U demo_service_usr demo_service_db < /tmp/psql/demo-svc/db.sql
