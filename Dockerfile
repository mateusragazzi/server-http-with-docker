FROM  php:7.3-apache

RUN apt-get -y update \
    && apt-get install -y git\
    && apt-get install -y libicu-dev \
    && apt-get install -y libzip-dev \
    && apt-get install -y libxml2-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && docker-php-ext-install zip \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install soap \
    && docker-php-ext-enable  zip \
    && docker-php-ext-install  mbstring \
    && docker-php-ext-enable mbstring \ 
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-enable pdo_mysql \
    && docker-php-ext-enable mysqli \
    && docker-php-ext-enable soap \
    && a2enmod rewrite

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf