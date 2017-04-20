FROM php:7.1-fpm
# arguments
ARG USER

RUN apt-get update;

# install xdebug
RUN pecl install xdebug
RUN docker-php-ext-enable xdebug
RUN echo "error_reporting = E_ALL" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "display_startup_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "display_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.idekey=\"PHPSTORM\"" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_autostart = 1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo "xdebug.remote_port=9001" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

#add symfony installator
RUN echo "Instaling symfony installer"
RUN mkdir -p /usr/local/bin
RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony

# install pdo_mysql
RUN docker-php-ext-install pdo pdo_mysql

#install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

#install git for composer
RUN apt-get install -y git

#install unzip for composer
RUN apt-get install -y unzip

#custom commands for easy life
RUN echo '#bin/bash\nphp bin/console cache:clear' >> /usr/bin/sfcc
RUN chmod +x /usr/bin/sfcc

RUN echo '#bin/bash\nphp bin/console cache:clear --env=prod' >> /usr/bin/sfccp
RUN chmod +x /usr/bin/sfccp

RUN echo '#bin/bash\ncomposer install' >> /usr/bin/ci
RUN chmod +x /usr/bin/ci


RUN useradd -ms /bin/bash $USER

USER $USER

WORKDIR /app