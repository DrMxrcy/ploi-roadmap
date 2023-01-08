#!/bin/sh

echo -e "EEEEEEE                                                      lll " 
echo -e "EE        aa aa  sss  yy   yy pp pp     aa aa nn nnn    eee  lll "
echo -e "EEEEE    aa aaa s     yy   yy ppp  pp  aa aaa nnn  nn ee   e lll "
echo -e "EE      aa  aaa  sss   yyyyyy pppppp  aa  aaa nn   nn eeeee  lll "
echo -e "EEEEEEE  aaa aa     s      yy pp       aaa aa nn   nn  eeeee lll "
echo -e "                 sss   yyyyy  pp                                 "
echo -e "                                                                 "
 
sleep 5

echo -e "[INFO] Getting Ready"

sleep 5

echo -e "[INFO] Initializing App"

echo -e "[INFO] Installing Packages"

composer update 

echo -e "[INFO] Clearing Route Cache"
php artisan route:cache 

echo -e "[INFO] Clearing View Cache"
php artisan view:clear 

echo -e "[INFO] Migrating Database"
php artisan migrate 

php-fpm
echo -e "[INFO] Running On Port 9000"

echo -e "[INFO] To Finish Setup, Run php artisan roadmap:install and type yes for everything"

