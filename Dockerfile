FROM alpine

RUN apk add --update curl git rsync wget zip \
  php5 php5-ctype php5-curl php5-dom php5-json php5-openssl php5-mysqli php5-phar php5-sqlite3 php5-zlib \
  && rm /var/cache/apk/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN composer require drush/drush:8 && ln -s /vendor/bin/drush /usr/bin/drush

CMD ["/bin/sh"]
