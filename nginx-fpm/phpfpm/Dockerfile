FROM php:5.6.9-fpm
# Install modules


RUN mv /etc/apt/sources.list /etc/apt/sources.list.old
RUN echo "deb http://mirrors.aliyun.com/debian/ jessie main non-free contrib">> /etc/apt/sources.list
RUN echo "deb http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib">> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/debian/ jessie main non-free contrib">> /etc/apt/sources.list
RUN echo "deb-src http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib">> /etc/apt/sources.list



# Install utilities used by TYPO3 CMS / Flow / Neos
RUN apt-get update \
    && apt-get install -y \
        imagemagick \
        graphicsmagick \
        zip \
        unzip \
        wget \
        curl \
        git \
        mysql-client \
        moreutils \
        dnsutils \
    && rm -rf /var/lib/apt/lists/*

# gd
RUN buildRequirements="libpng12-dev libjpeg-dev libfreetype6-dev" \
    && apt-get update && apt-get install -y ${buildRequirements} \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/lib \
    && docker-php-ext-install gd \
    && apt-get purge -y ${buildRequirements} \
    && rm -rf /var/lib/apt/lists/*

# pdo_mysql
RUN docker-php-ext-install pdo_mysql

# mysqli
RUN docker-php-ext-install mysqli

# mysql
RUN docker-php-ext-install mysql

# mcrypt
RUN runtimeRequirements="re2c libmcrypt-dev" \
    && apt-get update && apt-get install -y ${runtimeRequirements} \
    && docker-php-ext-install mcrypt \
    && rm -rf /var/lib/apt/lists/*

# mbstring
RUN docker-php-ext-install mbstring

# intl
RUN buildRequirements="libicu-dev g++" \
    && apt-get update && apt-get install -y ${buildRequirements} \
    && docker-php-ext-install intl \
    && apt-get purge -y ${buildRequirements} \
    && runtimeRequirements="libicu52" \
    && apt-get install -y --auto-remove ${runtimeRequirements} \
    && rm -rf /var/lib/apt/lists/*

# yaml
RUN buildRequirements="libyaml-dev" \
    && apt-get update && apt-get install -y ${buildRequirements} \
    && pecl install yaml \
    && echo "extension=yaml.so" > /usr/local/etc/php/conf.d/ext-yaml.ini \
    && apt-get purge -y ${buildRequirements} \
    && rm -rf /var/lib/apt/lists/*

# imagick
RUN runtimeRequirements="libmagickwand-6.q16-dev --no-install-recommends" \
    && apt-get update && apt-get install -y ${runtimeRequirements} \
    && ln -s /usr/lib/x86_64-linux-gnu/ImageMagick-6.8.9/bin-Q16/MagickWand-config /usr/bin/ \
    && pecl install imagick \
    && echo "extension=imagick.so" > /usr/local/etc/php/conf.d/ext-imagick.ini \
    && rm -rf /var/lib/apt/lists/*

# opcache
RUN docker-php-ext-install opcache

# soap
RUN docker-php-ext-install soap

# zip
RUN docker-php-ext-install zip

RUN  apt-get clean \
     && rm -rf /var/lib/apt

WORKDIR /var/www/html

EXPOSE 9000
CMD ["php-fpm"]
