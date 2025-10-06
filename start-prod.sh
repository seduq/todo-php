#!/bin/bash

# Todo App - Production Setup Script

echo "🚀 Starting Todo App Production Environment..."

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

# Check if .env file exists
if [ ! -f ".env" ]; then
    echo "⚠️  .env file not found. Creating from .env.example..."
    cp .env.example .env
    echo "⚠️  Please edit .env file and set strong passwords before continuing!"
    echo "   Run: nano .env"
    exit 1
fi

# Build and start containers
echo "📦 Building and starting Docker containers..."
docker compose -f docker-compose.prod.yml up -d --build

# Wait for services to be ready
echo "⏳ Waiting for services to be ready..."
sleep 15

echo ""
echo "✅ Todo App is ready!"
echo ""
echo "📱 Access the application at:"
echo "   - Todo App: http://localhost"
echo ""
echo "⚠️  Important: Make sure you have set strong passwords in .env file!"
echo ""
echo "🛑 To stop the application, run:"
echo "   docker compose -f docker-compose.prod.yml down"
echo ""
