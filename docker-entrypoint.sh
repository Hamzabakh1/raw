#!/bin/bash
set -e

# Wait for the database to be ready
until PGPASSWORD=$MB_DB_PASS psql -h "$MB_DB_HOST" -U "$MB_DB_USER" -d "$MB_DB_DBNAME" -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"

# Start Metabase
exec /app/run_metabase.sh 