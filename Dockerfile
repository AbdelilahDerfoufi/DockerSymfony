FROM php:8.0.2-apache

RUN apt-get update && apt-get install -y \
    git \
    curl\
    zip \
    unzip \
    libmcrypt-dev \
    mysql-client libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
&& docker-php-ext-install mcrypt pdo_mysql

RUN docker-php-ext-install pdo mysqli pdo_mysql zip;
# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#install Symfony
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | sudo -E bash
RUN sudo apt install symfony-cli


RUN symfony new app --version=5.4 

RUN cd /app

CMD ["symfony", "server:start"]