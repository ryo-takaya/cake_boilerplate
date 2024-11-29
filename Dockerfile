FROM php:8.2-apache

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apt update \
# Zip
&& apt install -y vim unzip \
# MySQL
&& docker-php-ext-install pdo_mysql \
# intl
&& apt install -y libicu-dev \
&& docker-php-ext-install intl  \
# Apache mod_rewrite 有効化
&& a2enmod rewrite