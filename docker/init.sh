#!/bin/sh

echo -e " ______                                       _ " 
echo -e "|  ____|                                     | |"
echo -e "| |__   __ _ ___ _   _ _ __   __ _ _ __   ___| |"
echo -e "|  __| / _` / __| | | | '_ \ / _` | '_ \ / _ \ |"
echo -e "| |___| (_| \__ \ |_| | |_) | (_| | | | |  __/ |"
echo -e "|______\__,_|___/\__, | .__/ \__,_|_| |_|\___|_|"
echo -e "                  __/ | |                       "
echo -e "                 |___/|_|                       "
 
sleep 5

echo -e "[INFO] Initializing App"

echo -e "[INFO ]Installing Packages"
composer update --quiet
npm ci -- silent

echo -e "[INFO] Clearing Route Cache"
php artisan route:cache -- quiet

echo -e "[INFO] Clearing View Cache"
php artisan view:clear -- quiet

echo -e "[INFO] Migrating Database"
php artisan migrate --force -- quiet

echo -e "[INFO] Initialization Has Finished"

