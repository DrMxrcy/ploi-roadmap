#!/bin/sh

echo -e "Initializing App"

cd ../
npm ci
php artisan route:cache
php artisan view:clear
php artisan migrate --force
