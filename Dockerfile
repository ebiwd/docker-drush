FROM alpine

RUN apk add --update \
    curl \
    git \
    mysql-client \
    openssh \
    rsync \
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
    php7-zlib \
  && rm /var/cache/apk/* \
  && mkdir -p ~/.ssh \
  && echo -e "Host *\n\tIdentityFile ~/.ssh/%r\n\tStrictHostKeyChecking no" >> ~/.ssh/config \
  && echo -e "#!/bin/sh\necho -e \"$2\" > ~/.ssh/$1 && chmod 400 ~/.ssh/$1" > ~/bin/add-ssh-key && chmod +x ~/bin/add-ssh-key \
  && ln -s /usr/bin/php7 /usr/bin/php \
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer \
  && composer require drush/drush:8.1.10 \
  && ln -s /vendor/bin/drush /usr/bin/drush \
  && mkdir -p ~/.drush \

CMD ["/bin/sh"]
