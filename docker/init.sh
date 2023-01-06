#!/bin/bash
composer update
composer install
npm ci
php artisan route:cache
php artisan view:clear
php artisan migrate --force