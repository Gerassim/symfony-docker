FROM php:7.1-fpm
# arguments
ARG USER

RUN apt-get update;

# install php extensions
RUN pecl install xdebug && \
    docker-php-ext-enable xdebug  && \
    docker-php-ext-install pdo pdo_mysql

COPY xdebug.conf /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

#add symfony installator
RUN echo "Instaling symfony installer"  && \
    mkdir -p /usr/local/bin  && \
    curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony && \
    chmod a+x /usr/local/bin/symfony

#install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer  && \
    composer --version && \
    apt-get install -y git unzip

#custom commands for easy life
RUN echo '#bin/bash\nphp bin/console cache:clear' >> /usr/bin/sfcc && \
    chmod +x /usr/bin/sfcc && \
    echo '#bin/bash\nphp bin/console cache:clear --env=prod' >> /usr/bin/sfccp && \
    chmod +x /usr/bin/sfccp && \
    echo '#bin/bash\ncomposer install' >> /usr/bin/ci && \
    chmod +x /usr/bin/ci


RUN useradd -ms /bin/bash $USER

USER $USER

WORKDIR /app