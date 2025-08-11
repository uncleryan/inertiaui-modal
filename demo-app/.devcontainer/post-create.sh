#!/bin/bash

# Exit on any error
set -e

echo "🚀 Setting up Inertia Modal Demo App..."

# Copy .env file if it doesn't exist
if [ ! -f .env ]; then
    echo "📝 Creating .env file..."
    cp .env.example .env
fi

# Install Composer dependencies
echo "📦 Installing Composer dependencies..."
composer install --no-interaction --prefer-dist --optimize-autoloader

# Install Node.js dependencies
echo "📦 Installing Node.js dependencies..."
npm install

# Generate application key
echo "🔑 Generating application key..."
php artisan key:generate --ansi

# Create SQLite database if it doesn't exist
echo "🗄️ Setting up database..."
if [ ! -f database/database.sqlite ]; then
    touch database/database.sqlite
fi

# Run database migrations
echo "🏗️ Running database migrations..."
php artisan migrate --force

# Seed the database
echo "🌱 Seeding database..."
php artisan db:seed --force

# Create storage link
echo "🔗 Creating storage link..."
php artisan storage:link

# Set proper permissions
echo "🔧 Setting permissions..."
chmod -R 775 storage bootstrap/cache

echo "✅ Setup complete! You can now:"
echo "   • Run 'php artisan serve' to start the Laravel development server"
echo "   • Run 'npm run dev' to start the Vite development server"
echo "   • Access the app at http://localhost:8000"
