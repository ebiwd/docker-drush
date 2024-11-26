FROM ebiwd/alpine-ssh:3.20

LABEL maintainer="es-wwwdev@ebi.ac.uk"

ARG DRUSHVER=13.3.3

 # Installing PHP
RUN apk add --no-cache \
    curl \
    git \
    mysql-client \
    patch \
    wget \
    zip \
    jq \
    php83 \
    php83-common \
    php83-fpm \
    php83-pdo \
    php83-gd \
    php83-opcache \
    php83-zip \
    php83-phar \
    php83-iconv \
    php83-cli \
    php83-curl \
    php83-openssl \
    php83-mbstring \
    php83-tokenizer \
    php83-fileinfo \
    php83-json \
    php83-xml \
    php83-xmlwriter \
    php83-simplexml \
    php83-dom \
    php83-pdo_mysql \
    php83-pdo_sqlite \
    php83-tokenizer \
    php83-xmlreader \
    php83-zlib \
    php83-iconv \
    php83-pecl-redis \
    php83-ctype

RUN ln -svf /usr/bin/php83 /usr/bin/php

RUN echo 'memory_limit = -1' >> /etc/php83/conf.d/docker-php-memlimit.ini;

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN composer global require drush/drush:dev-master --with-all-dependencies \
  && ln -s /root/.composer/vendor/bin/drush /usr/bin/drush \
  && export PATH="$HOME/.config/composer/vendor/bin:$PATH" \
  && composer global require drush/drush:${DRUSHVER} --with-all-dependencies

COPY files /

WORKDIR /workspace
