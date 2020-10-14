ARG CUSTOM_MYSQL_VERSION
FROM mysql:$CUSTOM_MYSQL_VERSION

RUN apt-get update; \
    apt-get upgrade; \
    groupadd -g 1000 docker \
    && usermod -u 1000 -a -G docker mysql

USER mysql