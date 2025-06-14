FROM richarvey/nginx-php-fpm:latest

COPY . .
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
# Image config
ENV SKIP_COMPOSER 1
ENV WEBROOT /var/www/html/public
ENV PHP_ERRORS_STDERR 1
ENV RUN_SCRIPTS 1
ENV REAL_IP_HEADER 1

# Symfony config
ENV APP_ENV prod

# Allow composer to run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

CMD ["/start.sh"]
