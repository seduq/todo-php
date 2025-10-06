# Todo App - Project Structure

## Quick Reference

### Start Development Environment
```bash
./start-dev.sh
# or manually:
docker compose -f docker-compose.dev.yml up -d
```

### Start Production Environment
```bash
./start-prod.sh
# or manually:
docker compose -f docker-compose.prod.yml up -d --build
```

### Access Points (Development)
- Todo App: http://localhost:8080
- PHPMyAdmin: http://localhost:8081

### Access Points (Production)
- Todo App: http://localhost

## Key Files

### Docker Configuration
- `docker-compose.dev.yml` - Development environment with PHPMyAdmin
- `docker-compose.prod.yml` - Production environment (optimized)
- `docker/php/Dockerfile.dev` - PHP development image
- `docker/php/Dockerfile.prod` - PHP production image
- `docker/nginx/default.conf` - Nginx server configuration
- `docker/mysql/init.sql` - Database initialization

### Application Files
- `app/config/app.php` - Main CakePHP configuration
- `app/config/routes.php` - URL routing
- `app/src/Controller/TodosController.php` - Todo CRUD operations
- `app/src/Model/Table/TodosTable.php` - Todo database model
- `app/templates/Todos/` - Todo view templates

## Database Access

### Restricted User (for application)
- User: `todoapp`
- Password: `todoapp_password`
- Access: Only `todos` table (SELECT, INSERT, UPDATE, DELETE)
- No access to: `sessions` and `users` tables

### Root User (for administration)
- User: `root`
- Password: `root_password` (dev) / set in .env (prod)
- Access: Full database access

## Network Architecture

All services communicate through a custom bridge network:
- Development: `todoapp_network`
- Production: `todoapp_network_prod`

### Ports Exposed

**Development:**
- 8080 → Nginx (web access)
- 8081 → PHPMyAdmin
- 3306 → MySQL (for external tools)

**Production:**
- 80 → Nginx (web access only)
- MySQL and PHP-FPM are not exposed externally

## Security Features

### Database
✅ Restricted user with minimal privileges
✅ Separate users table (not accessible by app user)
✅ Separate sessions table (not accessible by app user)
✅ Only todos table is accessible by application user

### Docker
✅ Separate development and production configurations
✅ Read-only mounts in production where possible
✅ No unnecessary ports exposed in production
✅ Health checks for all services in production
✅ Proper volume management for persistent data

### PHP
✅ OPcache enabled in production
✅ Error display disabled in production
✅ Secure session configuration
✅ File upload limits
✅ All required CakePHP extensions installed

### Nginx
✅ Security headers configured
✅ Gzip compression enabled
✅ Static asset caching
✅ Access to sensitive directories denied
✅ Hidden files access denied

## Folder Structure

```
todo-php/
├── app/                          # CakePHP Application
│   ├── config/                   # Configuration files
│   │   ├── app.php              # Main config
│   │   ├── bootstrap.php        # Bootstrap
│   │   ├── paths.php            # Path definitions
│   │   └── routes.php           # URL routes
│   ├── src/                      # Source code
│   │   ├── Application.php      # Application class
│   │   ├── Controller/          # Controllers
│   │   │   ├── AppController.php
│   │   │   └── TodosController.php
│   │   ├── Model/               # Models
│   │   │   ├── Entity/
│   │   │   │   └── Todo.php
│   │   │   └── Table/
│   │   │       └── TodosTable.php
│   │   └── View/                # View helpers
│   │       └── AppView.php
│   ├── templates/               # View templates
│   │   ├── layout/
│   │   │   └── default.php
│   │   └── Todos/
│   │       ├── index.php
│   │       ├── add.php
│   │       └── edit.php
│   ├── webroot/                 # Public directory
│   │   ├── .htaccess
│   │   └── index.php
│   ├── tmp/                     # Temporary files
│   ├── logs/                    # Application logs
│   ├── composer.json            # PHP dependencies
│   └── .htaccess
├── docker/                       # Docker configuration
│   ├── mysql/                   # MySQL config
│   │   ├── init.sql            # Database schema
│   │   └── my.cnf              # MySQL settings
│   ├── nginx/                   # Nginx config
│   │   ├── default.conf        # Site config
│   │   └── nginx.conf          # Main config
│   └── php/                     # PHP config
│       ├── Dockerfile.dev      # Development image
│       ├── Dockerfile.prod     # Production image
│       ├── php-dev.ini         # Dev PHP settings
│       └── php.ini             # Prod PHP settings
├── docker-compose.dev.yml       # Development compose
├── docker-compose.prod.yml      # Production compose
├── .env.example                 # Environment template
├── .gitignore                   # Git ignore rules
├── README.md                    # Main documentation
├── STRUCTURE.md                 # This file
├── start-dev.sh                # Dev startup script
└── start-prod.sh               # Prod startup script
```

## Maintenance Commands

### View Container Status
```bash
docker ps
```

### View Logs
```bash
# All services
docker compose -f docker-compose.dev.yml logs -f

# Specific service
docker logs -f todoapp_php_dev
docker logs -f todoapp_nginx_dev
docker logs -f todoapp_mysql_dev
```

### Access Container Shell
```bash
docker exec -it todoapp_php_dev bash
docker exec -it todoapp_mysql_dev bash
```

### Run MySQL Commands
```bash
docker exec -it todoapp_mysql_dev mysql -u root -p todoapp
```

### Clear CakePHP Cache
```bash
docker exec -it todoapp_php_dev rm -rf /var/www/html/tmp/cache/*
```

### Update Composer Dependencies
```bash
docker exec -it todoapp_php_dev composer update
```

### Restart Services
```bash
docker compose -f docker-compose.dev.yml restart
```

### Stop and Remove Everything
```bash
docker compose -f docker-compose.dev.yml down -v
```

## Backup and Restore

### Backup Database
```bash
docker exec todoapp_mysql_dev mysqldump -u root -proot_password todoapp > backup.sql
```

### Restore Database
```bash
docker exec -i todoapp_mysql_dev mysql -u root -proot_password todoapp < backup.sql
```

## Troubleshooting

### Composer Dependencies Issue
```bash
docker exec -it todoapp_php_dev composer install --no-interaction
```

### Permission Problems
```bash
docker exec -it todoapp_php_dev chown -R www-data:www-data /var/www/html
docker exec -it todoapp_php_dev chmod -R 777 /var/www/html/tmp /var/www/html/logs
```

### MySQL Connection Failed
1. Check if MySQL is running: `docker ps`
2. Check MySQL logs: `docker logs todoapp_mysql_dev`
3. Verify credentials in `app/config/app.php`
4. Test connection: `docker exec -it todoapp_mysql_dev mysql -u todoapp -ptodoapp_password`

### Port Already in Use
Change ports in `docker-compose.dev.yml` or `docker-compose.prod.yml`

### Complete Reset
```bash
# Stop containers
docker compose -f docker-compose.dev.yml down -v

# Remove images
docker rmi $(docker images -q 'todoapp*')

# Start fresh
./start-dev.sh
```
