ARG PHP_IMAGE=php:apache
FROM ${PHP_IMAGE}

RUN a2enmod rewrite \
    && printf '<Directory /var/www/html>\n    AllowOverride All\n    Require all granted\n</Directory>\n' > /etc/apache2/conf-available/onemanager.conf \
    && a2enconf onemanager

WORKDIR /var/www/html

COPY . /var/www/html/

RUN mkdir -p /var/www/html/.data \
    && chown -R www-data:www-data /var/www/html

VOLUME ["/var/www/html/.data"]

EXPOSE 80
