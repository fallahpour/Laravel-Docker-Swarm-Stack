FROM php:8.2-fpm

# نصب پکیج‌های مورد نیاز
RUN apt-get update && apt-get install -y \
    zip unzip curl libpng-dev libonig-dev libxml2-dev \
    libzip-dev git nano && \
    docker-php-ext-install pdo_mysql mbstring zip exif pcntl

# نصب Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# محل پروژه
WORKDIR /var/www

# کپی فایل‌ها
COPY ./laravel-app /var/www

# تنظیم سطح دسترسی
RUN chown -R www-data:www-data /var/www && chmod -R 755 /var/www

CMD ["php-fpm"]
