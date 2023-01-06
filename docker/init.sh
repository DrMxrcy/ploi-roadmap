#!/bin/sh

echo -e "Initializing App"

cd ../
compose update
npm ci
php artisan route:cache
php artisan view:clear
php artisan migrate --force
