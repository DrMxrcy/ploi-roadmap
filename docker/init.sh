#!/bin/bash

cd /var/www/html
npm ci
php artisan route:cache
php artisan view:clear
php artisan migrate --force
