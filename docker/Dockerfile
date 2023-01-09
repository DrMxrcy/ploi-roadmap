ARG PHP_BASE=8.1
ARG DISTRO="alpine"

FROM docker.io/tiredofit/nginx-php-fpm:${PHP_BASE}-${DISTRO}

WORKDIR /var/www

RUN chown -R "${NGINX_USER}":"${NGINX_GROUP}" /var/www

WORKDIR /www/html
COPY . /www/html

#install GD
ENV NGINX_WEBROOT=/www/html \
    NGINX_SITE_ENABLED=ploi-roadmap \
    PHP_KITCHENSINK=TRUE \
    


# Install nodejs
RUN apk add npm

# Upgrading Node
RUN npm cache clean -f
RUN npm install -g n

      
# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN composer install --no-scripts --no-dev
RUN composer install --no-dev --optimize-autoloader --classmap-authoritative

#Run SH
RUN chmod +x ./docker/init.sh

# Expose port 9000
EXPOSE 9000

VOLUME /vendor
VOLUME /var/www/html
CMD ["./docker/init.sh"]
