# Dev Container Setup for Inertia Modal

This project includes two dev container configurations to help you get started quickly with development.

## Available Dev Containers

### 1. Demo App Only (`demo-app/.devcontainer`)
- Focused on the Laravel demo application
- Lighter setup, faster startup
- Includes PHP 8.3, Node.js 20, Composer, and all Laravel dependencies
- Best for working specifically on the demo app

### 2. Full Project (`.devcontainer`)
- Includes the entire project workspace
- Sets up demo-app, React library, Vue library, and docs
- Best for working on the modal libraries and demo app together

## Getting Started

### Prerequisites
- [Visual Studio Code](https://code.visualstudio.com/)
- [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)

### Using the Demo App Container

1. Open the `demo-app` folder in VS Code
2. When prompted, click "Reopen in Container" or use the Command Palette:
   - `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
   - Type "Dev Containers: Reopen in Container"
3. Wait for the container to build and setup to complete
4. The demo app will be automatically configured and ready to use

### Using the Full Project Container

1. Open the root project folder in VS Code
2. When prompted, click "Reopen in Container" or use the Command Palette:
   - `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
   - Type "Dev Containers: Reopen in Container"
3. Wait for the container to build and setup to complete
4. All project components will be automatically configured

## What's Included

### Development Environment
- **PHP 8.3** with extensions: PDO, SQLite, MySQL, mbstring, exif, pcntl, bcmath, gd, zip
- **Node.js 20.x** with npm
- **Composer** for PHP dependency management
- **Git** and **GitHub CLI**
- **SQLite** database (pre-configured)

### VS Code Extensions
- **Intelephense** - PHP language server
- **PHP Namespace Resolver** - Auto-import PHP classes
- **Tailwind CSS IntelliSense** - Tailwind CSS support
- **Volar** - Vue.js support
- **TypeScript** - Enhanced TypeScript/JavaScript support
- **Prettier** - Code formatting
- **ESLint** - JavaScript/TypeScript linting

### Services
- **Mailpit** - Email testing tool (accessible at http://localhost:8025)

## Port Forwarding

The following ports are automatically forwarded:
- **8000** - Laravel development server
- **5173** - Vite development server
- **3000** - Node.js development server
- **8025** - Mailpit web interface (for email testing)

## Development Workflow

### Starting the Demo App
```bash
# In the demo-app directory (or /workspace/demo-app in full project)
php artisan serve
```

### Starting Vite (for frontend assets)
```bash
# In the demo-app directory
npm run dev
```

### Building Libraries (Full Project Only)
```bash
# React library
cd react && npm run dev

# Vue library  
cd vue && npm run dev
```

## Database

The dev container uses SQLite by default, which is automatically configured during setup. The database file is located at:
- Demo app container: `/workspace/database/database.sqlite`
- Full project container: `/workspace/demo-app/database/database.sqlite`

## Troubleshooting

### Container Won't Start
1. Make sure Docker Desktop is running
2. Try rebuilding the container: `Ctrl+Shift+P` > "Dev Containers: Rebuild Container"

### Permission Issues
If you encounter permission issues, the container includes a `vscode` user with sudo access.

### Database Issues
If you need to reset the database:
```bash
rm database/database.sqlite
touch database/database.sqlite
php artisan migrate:fresh --seed
```

## Manual Setup (if needed)

If the automatic setup fails, you can run these commands manually:

```bash
# Copy environment file
cp .env.example .env

# Install dependencies
composer install
npm install

# Setup Laravel
php artisan key:generate
php artisan migrate:fresh --seed
php artisan storage:link
```

## Additional Tools

The container includes several useful tools:
- `git` - Version control
- `gh` - GitHub CLI
- `composer` - PHP dependency manager
- `npm` - Node.js package manager
- `php artisan` - Laravel command line tool

Happy coding! 🚀
