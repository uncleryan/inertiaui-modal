#!/bin/bash

# Exit on any error
set -e

echo "🚀 Setting up Inertia Modal Full Project..."

# Setup demo-app
echo "📁 Setting up demo-app..."
cd demo-app

# Copy .env file if it doesn't exist
if [ ! -f .env ]; then
    echo "📝 Creating .env file..."
    cp .env.example .env
fi

# Install Composer dependencies
echo "📦 Installing Composer dependencies for demo-app..."
composer install --no-interaction --prefer-dist --optimize-autoloader

# Install Node.js dependencies for demo-app
echo "📦 Installing Node.js dependencies for demo-app..."
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

# Go back to root and setup other packages
cd ..

# Setup React package
echo "📁 Setting up React package..."
cd react
npm install
cd ..

# Setup Vue package
echo "📁 Setting up Vue package..."
cd vue
npm install
cd ..

# Setup docs if it has package.json
if [ -f docs/package.json ]; then
    echo "📁 Setting up docs..."
    cd docs
    npm install
    cd ..
fi

echo "✅ Setup complete! You can now:"
echo "   • Run 'cd demo-app && php artisan serve' to start the Laravel development server"
echo "   • Run 'cd demo-app && npm run dev' to start the Vite development server"
echo "   • Run 'cd react && npm run dev' to build React library"
echo "   • Run 'cd vue && npm run dev' to build Vue library"
echo "   • Access the demo app at http://localhost:8000"
echo "   • Access Mailpit at http://localhost:8025"
