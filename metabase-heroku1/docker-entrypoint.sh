#!/bin/bash
set -e

# Function to check database connection
check_db() {
    if ! command -v psql &> /dev/null; then
        >&2 echo "ERROR: PostgreSQL client (psql) is not installed"
        >&2 echo "Starting Metabase without database connection check"
        return 1
    fi

    # Try to connect to the database
    local max_attempts=30
    local attempt=1
    
    while [ $attempt -le $max_attempts ]; do
        if PGPASSWORD=$MB_DB_PASS psql -h "$MB_DB_HOST" -U "$MB_DB_USER" -d "$MB_DB_DBNAME" -c '\q' 2>/dev/null; then
            >&2 echo "Postgres is up - executing command"
            return 0
        fi
        
        >&2 echo "Postgres is unavailable - sleeping (attempt $attempt/$max_attempts)"
        sleep 2
        attempt=$((attempt + 1))
    done
    
    >&2 echo "WARNING: Could not connect to database after $max_attempts attempts"
    >&2 echo "Starting Metabase anyway..."
    return 1
}

# Check database connection
check_db

# Start Metabase with the correct port
export MB_JETTY_PORT=$PORT
exec /app/run_metabase.sh 