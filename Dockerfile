FROM php:7.4-apache

RUN a2enmod rewrite \
    && sed -ri 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

WORKDIR /var/www/html

COPY . /var/www/html

RUN mkdir -p /var/www/html/.data \
    && chown -R www-data:www-data /var/www/html \
    && chmod -R 775 /var/www/html/.data

EXPOSE 80
