FROM php:7.3.28-fpm


# Install required extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable installed extensions
RUN docker-php-ext-enable mysqli pdo pdo_mysql


# Install MySQL client
RUN apt-get update && apt-get install -y default-mysql-client

WORKDIR /var/www/html


