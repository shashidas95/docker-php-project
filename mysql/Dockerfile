FROM mysql:8.3
COPY ./electric_shop.sql /docker-entrypoint-initdb.d/
RUN chmod 644 /docker-entrypoint-initdb.d/electric_shop.sql