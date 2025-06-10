#!/usr/bin/env bash
echo "Running composer"
composer install --no-dev --optimize-autoloader --working-dir=/var/www/html

# Warm up cache
php bin/console cache:warmup
echo "Caching config..."
APP_ENV=prod APP_DEBUG=0 php bin/console cache:clear
