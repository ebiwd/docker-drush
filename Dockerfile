FROM ebiwd/alpine-ssh:latest

LABEL maintainer www-dev@ebi.ac.uk

ARG DRUSHVER=8.1.11

RUN apk add --update \
    curl \
    git \
    mysql-client \
    wget \
    zip \
    php7 \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-json \
    php7-mbstring \
    php7-openssl \
    php7-pcntl \
    php7-pdo_sqlite \
    php7-posix \
    php7-mysqli \
    php7-phar \
    php7-sqlite3 \
    php7-zlib

RUN ln -sf /usr/bin/php7 /usr/bin/php \
  && rm /var/cache/apk/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN composer require drush/drush:${DRUSHVER} \
  && ln -s /vendor/bin/drush /usr/bin/drush

COPY files /

WORKDIR /workspace
