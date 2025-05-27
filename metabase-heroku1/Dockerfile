FROM metabase/metabase:latest

# Install PostgreSQL client
RUN apt-get update && \
    apt-get install -y postgresql-client && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV MB_DB_TYPE=postgres
ENV MB_DB_DBNAME=metabase
ENV MB_DB_PORT=5432
ENV MB_DB_USER=metabase
ENV MB_DB_PASS=metabase

# Heroku requires the application to listen on the port specified by the PORT environment variable
ENV PORT=3000
EXPOSE $PORT

# The entrypoint script will be copied and executed
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"] 