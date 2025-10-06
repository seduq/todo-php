#!/bin/bash

# Todo App - Development Setup Script

echo "🚀 Starting Todo App Development Environment..."

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed. Please install Docker first."
    exit 1
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose is not installed. Please install Docker Compose first."
    exit 1
fi

# Start containers
echo "📦 Starting Docker containers..."
docker compose -f docker-compose.dev.yml up -d

# Wait for MySQL to be ready
echo "⏳ Waiting for MySQL to be ready..."
sleep 10

# Check if vendor directory exists
if [ ! -d "app/vendor" ]; then
    echo "📥 Installing PHP dependencies..."
    docker exec -it todoapp_php_dev composer install
else
    echo "✓ PHP dependencies already installed"
fi

# Set proper permissions
echo "🔧 Setting proper permissions..."
docker exec -it todoapp_php_dev chown -R www-data:www-data /var/www/html/tmp /var/www/html/logs
docker exec -it todoapp_php_dev chmod -R 777 /var/www/html/tmp /var/www/html/logs

echo ""
echo "✅ Todo App is ready!"
echo ""
echo "📱 Access the application at:"
echo "   - Todo App: http://localhost:8080"
echo "   - PHPMyAdmin: http://localhost:8081"
echo ""
echo "🗄️  Database credentials:"
echo "   - Root: root / root_password"
echo "   - App User: todoapp / todoapp_password"
echo ""
echo "🛑 To stop the application, run:"
echo "   docker compose -f docker-compose.dev.yml down"
echo ""
