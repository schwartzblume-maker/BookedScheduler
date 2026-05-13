FROM php:7.4-apache

# PostgreSQL 用の PHP 拡張
RUN apt-get update && apt-get install -y \
    libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql pgsql

# Apache の mod_rewrite を有効化（.htaccess が動くように）
RUN a2enmod rewrite
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# ドキュメントルート
WORKDIR /var/www/html
COPY . /var/www/html

# パーミッション調整
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80
