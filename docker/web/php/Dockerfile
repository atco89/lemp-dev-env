# php image with version 8.2 FPM on alpine linux distribution.
FROM php:8.2-fpm-alpine

# dockerfile maintainer name, surname and contact email.
MAINTAINER Aleksandar Rakić <aleksandar.rakic@yahoo.com>

# set env variables.
ENV APCU_VERSION 5.1.21
ENV XDEBUG_VERSION 3.2.1

# update or install required packages.
RUN apk --update add \
    libwebp-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libxpm-dev \
    freetype-dev \
    libzip-dev \
    libsodium-dev \
    icu-dev \
    zlib-dev \
    ca-certificates \
    git \
    openssh-client \
    unzip \
    oniguruma-dev \
    bash \
    g++ \
    autoconf \
    make \
    linux-headers \
    nodejs \
    npm

# install pecl libraries.
RUN pecl channel-update pecl.php.net \
        && pecl install apcu-$APCU_VERSION \
        && pecl install xdebug-$XDEBUG_VERSION \
        && pecl clear-cache

# configure php extensions.
RUN docker-php-ext-configure intl \
    && docker-php-ext-configure gd --with-jpeg --with-freetype

# enable php extensions.
RUN docker-php-ext-enable apcu xdebug

# install php extensions.
RUN docker-php-ext-install opcache \
    mbstring \
    pdo \
    pdo_mysql \
    gd \
    sodium \
    zip \
    intl

# download and install composer.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && mkdir -p /var/www/.composer

# copy files from source directory.
COPY ./docker/web/php/php.ini /usr/local/etc/php/conf.d/php.ini
COPY ./docker/web/php/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
COPY ./src /var/www/html

# set working directory.
WORKDIR /var/www/html
