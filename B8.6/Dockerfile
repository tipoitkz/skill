FROM php:8.0.16-fpm-alpine3.14

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ADD ./devops_module10_compose/php/php.ini /usr/local/etc/php/conf.d/40-custom.ini
ADD ./devops_module10_compose/www/index.php /var/www

WORKDIR /var/www

CMD ["php-fpm"]
