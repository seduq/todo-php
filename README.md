# Todo App - CakePHP with Docker

A modern Todo application built with CakePHP 5, MySQL, and Nginx, fully containerized with Docker.

## 📋 Features

- ✅ Create, Read, Update, Delete (CRUD) todos
- ✅ Mark todos as completed/uncompleted
- ✅ Clean and responsive UI
- ✅ Fully containerized with Docker
- ✅ Separate development and production environments
- ✅ PHPMyAdmin for database management (development)
- ✅ Nginx web server with optimized configuration
- ✅ MySQL 8.0 database with restricted user access
- ✅ VS Code DevContainer support for consistent development environment

## 🏗️ Architecture

```
todo-php/
├── .devcontainer/         # VS Code DevContainer configuration
├── app/                   # CakePHP application
│   ├── config/           # Configuration files
│   ├── src/              # Application source code
│   │   ├── Controller/  # Controllers
│   │   ├── Model/       # Models (Entity & Table)
│   │   └── View/        # View class
│   ├── templates/        # View templates
│   └── webroot/         # Public directory
├── docker/               # Docker configuration
│   ├── mysql/           # MySQL initialization and config
│   ├── nginx/           # Nginx configuration
│   └── php/             # PHP Dockerfiles and config
├── docker-compose.dev.yml   # Development environment
└── docker-compose.prod.yml  # Production environment
```

## 🚀 Quick Start

### Prerequisites

- Docker (version 20.10 or higher)
- Docker Compose (version 2.0 or higher)
- VS Code with Remote - Containers extension (optional, for DevContainer)

### Option 1: Using VS Code DevContainer (Recommended)

1. **Open the project in VS Code**

   ```bash
   code /home/seduq/projects/todo-php
   ```

2. **Reopen in Container**

   - Press `F1` or `Ctrl+Shift+P`
   - Type and select: `Dev Containers: Reopen in Container`
   - Wait for the container to build and start

3. **Access the application**
   - **Todo App**: http://localhost:8080
   - **PHPMyAdmin**: http://localhost:8081

The DevContainer automatically:

- Installs Composer dependencies
- Sets up proper permissions
- Configures Xdebug for debugging
- Installs useful VS Code extensions

📚 See [.devcontainer/README.md](.devcontainer/README.md) for more details.

### Option 2: Manual Docker Setup

#### Development Environment

1. **Clone the repository**

   ```bash
   cd /home/seduq/projects/todo-php
   ```

2. **Start the development environment**

   ```bash
   docker compose -f docker-compose.dev.yml up -d
   ```

3. **Install PHP dependencies (first time only)**

   ```bash
   docker exec -it todoapp_php_dev composer install
   ```

4. **Set proper permissions**

   ```bash
   docker exec -it todoapp_php_dev chown -R www-data:www-data /var/www/html/tmp /var/www/html/logs
   docker exec -it todoapp_php_dev chmod -R 777 /var/www/html/tmp /var/www/html/logs
   ```

5. **Access the application**

   - **Todo App**: http://localhost:8080
   - **PHPMyAdmin**: http://localhost:8081
     - Server: `mysql`
     - Username: `root`
     - Password: `root_password`

6. **Stop the environment**
   ```bash
   docker compose -f docker-compose.dev.yml down
   ```

### Production Environment

1. **Create environment file**

   ```bash
   cp .env.example .env
   ```

2. **Edit `.env` file and set strong passwords**

   ```bash
   nano .env
   ```

3. **Build and start production environment**

   ```bash
   docker compose -f docker-compose.prod.yml up -d --build
   ```

4. **Access the application**

   - **Todo App**: http://localhost

5. **Stop the environment**
   ```bash
   docker compose -f docker-compose.prod.yml down
   ```

## 🗄️ Database

### Structure

The application uses three tables:

- **todos**: Main table for todo items (accessible by restricted user)
- **users**: User authentication (not accessible by restricted user)
- **sessions**: Session management (not accessible by restricted user)

### Database Users

- **Root User**: `root` / `root_password` (full access)
- **Application User**: `todoapp` / `todoapp_password` (access only to `todos` table)

### Sample Data

The database is initialized with three sample todos to help you get started.

## 🐳 Docker Services

### Development (`docker-compose.dev.yml`)

| Service    | Port | Description              |
| ---------- | ---- | ------------------------ |
| php        | -    | PHP 8.2-FPM with Xdebug  |
| nginx      | 8080 | Nginx web server         |
| mysql      | 3306 | MySQL 8.0 database       |
| phpmyadmin | 8081 | Database admin interface |

### Production (`docker-compose.prod.yml`)

| Service | Port | Description             |
| ------- | ---- | ----------------------- |
| php     | -    | PHP 8.2-FPM (optimized) |
| nginx   | 80   | Nginx web server        |
| mysql   | -    | MySQL 8.0 database      |

Note: In production, only Nginx port 80 is exposed. MySQL is only accessible within the Docker network.

## 🔧 Configuration

### PHP Extensions

The following PHP extensions are installed:

- pdo_mysql (database connectivity)
- mysqli (MySQL improved)
- mbstring (multibyte string support)
- intl (internationalization)
- zip (compression)
- opcache (performance)
- bcmath (arbitrary precision math)
- exif (image metadata)
- pcntl (process control)

### Network

Both environments use a custom bridge network (`todoapp_network`) to isolate services and allow inter-container communication.

### Volumes

Persistent data is stored in Docker volumes:

- `mysql_data`: Database files
- `mysql_logs`: MySQL logs
- `php_logs`: PHP-FPM logs
- `nginx_logs`: Nginx access and error logs

## 📝 Usage

### Creating a Todo

1. Click "➕ Add New Todo"
2. Enter a title (required)
3. Optionally add a description
4. Click "Save Todo"

### Editing a Todo

1. Click "✏️ Edit" on any todo
2. Modify the title or description
3. Toggle the completed checkbox if needed
4. Click "Update Todo"

### Completing a Todo

- Click "✅ Complete" to mark as done
- Click "↩️ Undo" to mark as not done

### Deleting a Todo

- Click "🗑️ Delete" and confirm

## 🛠️ Useful Commands

### View logs

```bash
# PHP logs
docker logs todoapp_php_dev

# Nginx logs
docker logs todoapp_nginx_dev

# MySQL logs
docker logs todoapp_mysql_dev
```

### Access containers

```bash
# PHP container
docker exec -it todoapp_php_dev bash

# MySQL container
docker exec -it todoapp_mysql_dev bash

# Run MySQL client
docker exec -it todoapp_mysql_dev mysql -u root -p
```

### Restart services

```bash
# Development
docker compose -f docker-compose.dev.yml restart

# Production
docker compose -f docker-compose.prod.yml restart
```

### Clean up

```bash
# Stop and remove containers, networks
docker compose -f docker-compose.dev.yml down

# Stop and remove everything including volumes
docker compose -f docker-compose.dev.yml down -v
```

## 🔒 Security Notes

### Development

- Debug mode is enabled
- Xdebug is installed
- PHPMyAdmin is accessible
- All ports are exposed for easy access
- Error messages are displayed

### Production

- Debug mode is disabled
- No Xdebug overhead
- No PHPMyAdmin
- Only Nginx port 80 is exposed
- Errors are logged, not displayed
- OPcache is enabled for performance
- Read-only volume mounts where possible
- Health checks for all services
- Restricted database user with minimal privileges

## 🐛 Troubleshooting

### Permission Issues

```bash
docker exec -it todoapp_php_dev chown -R www-data:www-data /var/www/html
docker exec -it todoapp_php_dev chmod -R 777 /var/www/html/tmp /var/www/html/logs
```

### Database Connection Issues

Check if MySQL is running:

```bash
docker exec -it todoapp_mysql_dev mysqladmin ping -u root -p
```

### Clear CakePHP Cache

```bash
docker exec -it todoapp_php_dev rm -rf /var/www/html/tmp/cache/*
```

### Rebuild Containers

```bash
docker compose -f docker-compose.dev.yml down
docker compose -f docker-compose.dev.yml up -d --build --force-recreate
```

## 📚 Technology Stack

- **Framework**: CakePHP 5.x
- **Language**: PHP 8.2
- **Database**: MySQL 8.0
- **Web Server**: Nginx (Alpine)
- **Containerization**: Docker & Docker Compose

## 📄 License

MIT License

## 🤝 Contributing

Feel free to submit issues and pull requests!

## 📧 Support

For questions or issues, please open an issue in the repository.
