#!/bin/bash

# اگر فایل env وجود نداشت، کپی کن از env.example
if [ ! -f .env ]; then
  cp .env.example .env
fi

# Generate APP_KEY اگر وجود نداشت
if [ -z "$APP_KEY" ] || ! grep -q "$APP_KEY" .env; then
  php artisan key:generate --force
fi

# Set permissions
chown -R www-data:www-data /var/www
chmod -R 755 /var/www/storage /var/www/bootstrap/cache

# Clear and cache configs
php artisan config:clear
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Run migrations
php artisan migrate --force

# Run php-fpm (برای نگه داشتن کانتینر در حال اجرا)
exec php-fpm

