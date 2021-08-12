FROM php:fpm

RUN docker-php-ext-install pdo pdo_mysql

RUN apt-get update \
     && apt-get install -y libzip-dev \
     && docker-php-ext-install zip

# Install extensions
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && sync && \
    install-php-extensions gd intl

RUN pecl install xdebug && docker-php-ext-enable xdebug
