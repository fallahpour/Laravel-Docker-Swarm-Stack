#!/bin/bash

cd /var/www

if [ ! -f artisan ]; then
  echo "Laravel project not found. Installing..."
  composer create-project --prefer-dist laravel/laravel .
else
  echo "Laravel already installed."
fi

exec "$@"
