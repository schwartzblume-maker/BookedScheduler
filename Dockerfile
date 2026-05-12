FROM php:7.4-apache

# 必要な PHP 拡張
RUN docker-php-ext-install mysqli

# Apache のドキュメントルートを Booked の Web ディレクトリに設定
WORKDIR /var/www/html
COPY . /var/www/html

# パーミッション調整
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
