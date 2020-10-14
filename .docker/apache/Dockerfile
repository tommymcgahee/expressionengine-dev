ARG CUSTOM_APACHE_VERSION
FROM httpd:$CUSTOM_APACHE_VERSION

RUN apk update; \
    apk upgrade;
RUN sed -i \
        # -e 's/^#\(Include .*httpd-ssl.conf\)/\1/' \
        -e 's/^#\(LoadModule .*mod_ssl.so\)/\1/' \
        -e 's/^#\(LoadModule .*mod_socache_shmcb.so\)/\1/' \
        conf/httpd.conf
# Copy apache vhost file to proxy php requests to php-fpm container
COPY dev.apache.conf /usr/local/apache2/conf/dev.apache.conf
COPY localhost.key /usr/local/apache2/conf/server.key
COPY localhost.crt /usr/local/apache2/conf/server.crt
RUN echo "Include /usr/local/apache2/conf/dev.apache.conf" \
    >> /usr/local/apache2/conf/httpd.conf