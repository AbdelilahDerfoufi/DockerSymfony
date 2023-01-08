FROM php:8.1.0-cli AS app_php

# Allow to use development versions of Symfony
ARG STABILITY="stable"
ENV STABILITY ${STABILITY}

# Allow to select Symfony version
ARG SYMFONY_VERSION=""
ENV SYMFONY_VERSION ${SYMFONY_VERSION}


COPY . /app
WORKDIR /app

CMD [ "php" ]

