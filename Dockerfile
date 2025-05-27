FROM metabase/metabase:latest

# Set environment variables
ENV MB_DB_TYPE=postgres
ENV MB_DB_DBNAME=metabase
ENV MB_DB_PORT=5432
ENV MB_DB_USER=metabase
ENV MB_DB_PASS=metabase

# Expose the default Metabase port
EXPOSE 3000

# The entrypoint script will be copied and executed
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"] 