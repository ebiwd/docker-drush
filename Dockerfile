FROM alpine

RUN apk add --update curl git rsync wget zip php7 php7-ctype php7-curl php7-dom php7-json php7-openssl php7-mysqli php7-phar php7-sqlite3 php7-zlib \
  && rm /var/cache/apk/*
  && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
  && composer require drush/drush:8

CMD ["/bin/sh"]
