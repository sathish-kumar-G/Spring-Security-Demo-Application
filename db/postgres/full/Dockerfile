FROM postgres:12.1

# Set password for 'postgres' system (not DB) user
RUN echo 'postgres:secret' | chpasswd

# Setup DB
ENV POSTGRES_USER demo_admin
ENV POSTGRES_PASSWORD demo123
ENV PGDATA /var/lib/postgresql/data/security

# make temporary directory in Docker container for storing DB scripts
RUN mkdir -p /tmp/psql/demo-svc



# Adjust PostgreSQL configuration so that remote connections to the
# database are possible.
RUN echo "host all  all    0.0.0.0/0  md5" >> /var/lib/postgresql/data/pg_hba.conf

# And add ``listen_addresses`` to postgresql.conf
RUN echo "listen_addresses='*'" >> /var/lib/postgresql/data/postgresql.conf

# Copy script files to Docker container entry point directory
COPY setup-database.sh /docker-entrypoint-initdb.d/

# Copy SQL files to Docker container temporary directory
COPY demo-svc /tmp/psql/demo-svc/
# Set Port Configurations
EXPOSE 5432

# Docker build & run commands
# docker build -t demo-service-db .
# docker run --name demo-service-db -p 5432:5432 -it demo-service-db