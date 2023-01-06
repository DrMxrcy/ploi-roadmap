#!/bin/bash
npm ci
php artisan route:cache
php artisan view:clear
php artisan migrate --force
