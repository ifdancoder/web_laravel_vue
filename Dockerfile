FROM php:8.3-fpm

RUN mkdir -p /tmp
RUN cd /tmp \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

RUN apt-get update && apt-get install -y \
    && docker-php-ext-install pdo_mysql mysqli

RUN pecl install -o -f redis && rm -rf /tmp/pear && docker-php-ext-enable redis

RUN apt-get install -y libpng-dev zlib1g-dev libwebp-dev libjpeg-dev libfreetype6-dev 

RUN docker-php-ext-configure gd --with-jpeg --with-freetype --with-webp && docker-php-ext-install gd

# Install important libraries
RUN echo "\e[1;33mInstall important libraries\e[0m"
RUN apt-get -y install --fix-missing \
    apt-utils \
    build-essential \
    git \
    curl \
    libcurl4 \
    libcurl4-openssl-dev \
    zlib1g-dev \
    libzip-dev \
    zip \
    libbz2-dev \
    locales \
    libmcrypt-dev \
    libicu-dev \
    libonig-dev \
    libsodium-dev

RUN docker-php-ext-install sodium zip sockets
RUN docker-php-ext-configure pcntl --enable-pcntl &&docker-php-ext-install pcntl

# RUN docker-php-ext-install \
#     exif \
#     pcntl \
#     bcmath \
#     ctype \
#     curl \
#     iconv \
#     xml \
#     soap \
#     pcntl \
#     mbstring \
#     tokenizer \
#     bz2 \
#     zip \
#     intl

ARG USERNAME

ARG UID
ARG GID

RUN groupmod -g $GID www-data || groupadd -g $GID www-data
RUN usermod -u $UID www-data || useradd -u $UID www-data

USER www-data

CMD ["php-fpm"]