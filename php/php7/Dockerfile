FROM alpine:3.8

# Patch APK Mirror to YKode
#RUN echo "http://dl-4.alpinelinux.org/alpine/v3.6/community" > /etc/apk/repositories

# 1.设置变量
ENV TIMEZONE Asia/Shanghai
ENV PHP_MEMORY_LIMIT 512M
ENV MAX_UPLOAD 50M
ENV PHP_MAX_FILE_UPLOAD 200
ENV PHP_MAX_POST 100M
ENV NGINX_VERSION 1.14.0

# 2.安装需要的软件
RUN apk update && \
    apk add --no-cache ca-certificates && \
    apk add --no-cache curl bash tree tzdata && \
    cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
        echo "${TIMEZONE}" > /etc/timezone

# 参考资料
# php https://gist.github.com/phith0n/373cc078a8b25a20432408d5d7556770
# nginx https://www.cnblogs.com/zhujingzhi/p/9742085.html
# php+nginx https://segmentfault.com/a/1190000018415600?utm_source=tag-newest
# https://github.com/tcyfree/apnsc/blob/master/Dockerfile
# https://github.com/docker-library/php/issues/240
# https://gist.github.com/guillemcanal/be3db96d3caa315b4e2b8259cab7d07e
# https://forum.alpinelinux.org/forum/installation/php-iconv-issue

# 3.编译安装nginx
RUN apk add nginx

# 将目录下的文件copy到镜像中
COPY ./nginx/conf.d/default.conf /etc/nginx/conf.d/
COPY ./nginx/nginx.conf /etc/nginx/
COPY ./nginx/cert/ /etc/nginx/cert/

RUN mkdir /www
COPY ./php/index.php /www/index.php

# 4.安装php5.6
RUN apk update && \
  apk add php7-intl \
    php7-mcrypt \
    php7-openssl \
    php7-gmp \
    php7-json \
    php7-dom \
    php7-pdo \
    php7-zip \
    php7-zlib \
    php7-mysqli \
    php7-mysqlnd \
    php7-bcmath \
    php7-gd \
    php7-pdo_mysql \
    php7-gettext \
    php7-xmlreader \
    php7-xmlrpc \
    php7-bz2 \
    php7-iconv \
    php7-curl \
    php7-ctype \
    php7-fpm \
    php7-phar \
    php7-pear \
    php7-memcached \
    php7-mongodb \
    php7-redis \
    php7-tokenizer \
    php7-imagick \
    php7-fileinfo \
    php7-zmq \
    php7-dev \
    php7-apcu \
    php7-xmlwriter \
    php7-exif \
    php7-mbstring\
    php7-opcache \
    php7-pcntl \
    php7-session \
    php7-xml \
    php7-simplexml \
    php7-xsl \
    php7


# php-fpm.conf php.ini
RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php7/php-fpm.conf && \
    sed -i -e "s/listen\s*=\s*127.0.0.1:9000/listen = 9001/g" /etc/php7/php-fpm.conf && \
    sed -i "s|;date.timezone =.*|date.timezone = ${TIMEZONE}|" /etc/php7/php.ini && \
    sed -i "s|memory_limit =.*|memory_limit = ${PHP_MEMORY_LIMIT}|" /etc/php7/php.ini && \
    sed -i "s|upload_max_filesize =.*|upload_max_filesize = ${MAX_UPLOAD}|" /etc/php7/php.ini && \
    sed -i "s|max_file_uploads =.*|max_file_uploads = ${PHP_MAX_FILE_UPLOAD}|" /etc/php7/php.ini && \
    sed -i "s|post_max_size =.*|max_file_uploads = ${PHP_MAX_POST}|" /etc/php7/php.ini && \
    sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php7/php.ini

RUN pecl install swoole

# composer
RUN curl -sS https://getcomposer.org/installer | \
        php -- --install-dir=/usr/bin --filename=composer

RUN apk del tzdata

# 5.ADD-SUPERVISOR
RUN apk add supervisor
RUN rm -rf /var/cache/apk/*

COPY ./supervisor/conf.d/ /etc/supervisor/conf.d/


#6.ADD-CRONTABS
COPY ./crontabs/default /var/spool/cron/crontabs/
RUN cat /var/spool/cron/crontabs/default >> /var/spool/cron/crontabs/root
RUN mkdir -p /var/log/cron  && touch /var/log/cron/cron.log


WORKDIR /www

EXPOSE 9801
STOPSIGNAL SIGTERM

#9.添加启动脚本
COPY ./entrypoint.sh /usr/local/
RUN chmod +x /usr/local/entrypoint.sh

# 启动nginx命令
ENTRYPOINT ["/usr/local/entrypoint.sh"]
