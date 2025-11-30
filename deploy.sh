#!/bin/bash

# Exit on error
set -e

# 1. Setup environment
cp -n .env.example .env

# 2. Install PHP dependencies
composer install

# 3. Generate app key
php artisan key:generate

# 4. Run database migrations
php artisan migrate

# 5. Install Node dependencies
npm install

# 6. Optional: fix known vulnerabilities (dev only)
npm audit fix || true

# 7. Start dev servers (Vite + Laravel + queue + logs)
composer run dev
