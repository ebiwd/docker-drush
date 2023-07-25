FROM ebiwd/alpine-ssh:3.18

LABEL maintainer www-dev@ebi.ac.uk

ARG DRUSHVER=11.6.0

 # Installing PHP
RUN apk add --no-cache \
    curl \
    git \
    mysql-client \
    patch \
    wget \
    zip \
    jq \
    php82 \
    php82-common \
    php82-fpm \
    php82-pdo \
    php82-opcache \
    php82-zip \
    php82-phar \
    php82-iconv \
    php82-cli \
    php82-curl \
    php82-openssl \
    php82-mbstring \
    php82-tokenizer \
    php82-fileinfo \
    php82-json \
    php82-xml \
    php82-xmlwriter \
    php82-simplexml \
    php82-dom \
    php82-pdo_mysql \
    php82-pdo_sqlite \
    php82-tokenizer \
    php82-pecl-redis

RUN ln -svf /usr/bin/php82 /usr/bin/php

RUN echo 'memory_limit = -1' >> /etc/php82/conf.d/docker-php-memlimit.ini;

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN composer global require drush/drush:${DRUSHVER} \
  && ln -s /root/.composer/vendor/bin/drush /usr/bin/drush

COPY files /

WORKDIR /workspace
