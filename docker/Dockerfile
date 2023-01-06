FROM php:8.1-apache

WORKDIR /var/www

RUN chown -R 33:33 /var/www

WORKDIR /var/www/html
COPY . /var/www/html

#install GD
RUN set -eux; apt-get update; \
	apt-get install -y --no-install-recommends libpq-dev \
	#
	# install curl
	libcurl4-openssl-dev \
    # install zip
    libzip-dev \
    # install icu
    icu-dev
	#
	# install gd dependencies
	zlib1g-dev libpng-dev libjpeg-dev \
	libwebp-dev libxpm-dev libfreetype6-dev; \
	#
	# clean up
	rm -rf /var/lib/apt/lists/*; \
	#
	# configure extensions
	docker-php-ext-configure gd --enable-gd \
	--with-jpeg --with-webp --with-xpm --with-freetype; \
    docker-php-ext-configure zip \
	#
	# install extensions
	docker-php-ext-install curl gd sockets intl pdo pdo_mysql pdo_pgsql exif zip; \
	#
	# set up environment
	a2enmod rewrite;


# Install nodejs
RUN apt-get npm

# Upgrading Node
RUN npm cache clean -f
RUN npm install -g n


# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

## Final Run
RUN chown 33:33 /var/www

# Expose port 9000 and start server
ARG PORT=9000
EXPOSE 9000


# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN composer install --no-scripts --no-dev
RUN composer install --no-dev --optimize-autoloader --classmap-authoritative

#Run SH
RUN chmod +x docker/init.sh
CMD ["docker/init.sh"]


VOLUME /vendor
VOLUME /var/www/html
VOLUME /storage
