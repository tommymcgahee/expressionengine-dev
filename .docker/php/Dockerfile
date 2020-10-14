ARG CUSTOM_PHP_VERSION
FROM php:$CUSTOM_PHP_VERSION

RUN apk update; \
    apk upgrade; \
    apk add libpng-dev;

RUN docker-php-ext-install mysqli gd fileinfo iconv pdo pdo_mysql opcache; 
    # \ docker-php-ext-enable mysqli gd fileinfo iconv pdo pdo_mysql opcache;

COPY opcache.ini /usr/local/etc/php/conf.d/opcache.ini