#!/bin/bash
set -e

# Function to check database connection
check_db() {
    if command -v psql &> /dev/null; then
        until PGPASSWORD=$MB_DB_PASS psql -h "$MB_DB_HOST" -U "$MB_DB_USER" -d "$MB_DB_DBNAME" -c '\q'; do
            >&2 echo "Postgres is unavailable - sleeping"
            sleep 1
        done
        >&2 echo "Postgres is up - executing command"
    else
        >&2 echo "PostgreSQL client not available - skipping connection check"
    fi
}

# Check database connection
check_db

# Start Metabase with the correct port
export MB_JETTY_PORT=$PORT
exec /app/run_metabase.sh 