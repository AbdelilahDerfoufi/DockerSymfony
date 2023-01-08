FROM php:8.1.0-cli AS app_php

# Allow to use development versions of Symfony
ARG STABILITY="stable"
ENV STABILITY ${STABILITY}

# Allow to select Symfony version
ARG SYMFONY_VERSION=""
ENV SYMFONY_VERSION ${SYMFONY_VERSION}

RUN apt-get update \
    &&  apt-get install -y --no-install-recommends \
    git

RUN curl -sS https://getcomposer.org/installer | php -- \
    &&  mv composer.phar /usr/local/bin/composer

RUN curl -sS https://get.symfony.com/cli/installer | bash \
    &&  mv /root/.symfony/bin/symfony /usr/local/bin

ENV APP_ENV=dev XDEBUG_MODE=off
VOLUME /srv/app/var/

COPY . /app
WORKDIR /app

CMD [ "php" ]

