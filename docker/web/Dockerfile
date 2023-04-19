# php image with version 8.2 on alpine linux distribution.
FROM php:8.2-fpm-alpine

# dockerfile maintainer name, surname and contact email.
MAINTAINER Aleksandar Rakić <aleksandar.rakic@yahoo.com>

# update or install required packages.
RUN apk upgrade && apk add  \
    libwebp-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libxpm-dev \
    freetype-dev \
    libzip-dev \
    libsodium-dev \
    icu-dev \
    zlib-dev

# configure php extensions.
RUN docker-php-ext-configure intl
RUN docker-php-ext-configure gd --with-jpeg --with-freetype

# install php extensions.
RUN docker-php-ext-install pdo \
    pdo_mysql \
    gd \
    sodium \
    zip \
    intl

# install composer.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer

# set default time zone to Belgrade.
ENV TZ=Europe/Belgrade
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# copy files from source directory.
COPY ./src /var/www/html

# set working directory.
WORKDIR /var/www/html