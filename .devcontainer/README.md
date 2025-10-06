# DevContainer - Todo PHP (CakePHP)

Este projeto está configurado com VS Code DevContainers para fornecer um ambiente de desenvolvimento consistente e isolado.

## 🚀 Como Usar

### Pré-requisitos

- Docker e Docker Compose instalados
- VS Code com a extensão **Remote - Containers** instalada

### Iniciando o Ambiente

1. **Abra o projeto no VS Code**
2. **Reabra no Container**:
   - Pressione `F1` ou `Ctrl+Shift+P`
   - Digite e selecione: `Dev Containers: Reopen in Container`
   - Aguarde a construção e inicialização dos containers

### Após a Abertura

O devcontainer automaticamente:

- Instala as dependências do Composer
- Configura permissões necessárias
- Inicia os serviços (PHP-FPM, Nginx, MySQL, PHPMyAdmin)

### Portas Disponíveis

- **8080** - Aplicação PHP (http://localhost:8080)
- **8081** - PHPMyAdmin (http://localhost:8081)
- **3306** - MySQL (para ferramentas externas)

## 🛠️ Extensões Incluídas

O devcontainer instala automaticamente as seguintes extensões do VS Code:

- **PHP Intelephense** - IntelliSense avançado para PHP
- **PHP Debug** - Suporte a Xdebug
- **Docker** - Gerenciamento de containers
- **EditorConfig** - Consistência de código
- **GitLens** - Visualização Git avançada
- **Todo Tree** - Rastreamento de TODOs no código

## 📝 Comandos Úteis

### CakePHP

```bash
# Limpar cache
bin/cake cache clear_all

# Executar migrations
bin/cake migrations migrate

# Criar um controller
bin/cake bake controller NomeDoController

# Criar um model
bin/cake bake model NomeDoModel
```

### Composer

```bash
# Instalar dependências
composer install

# Atualizar dependências
composer update

# Adicionar pacote
composer require vendor/package
```

### Testes

```bash
# Executar todos os testes
vendor/bin/phpunit

# Executar teste específico
vendor/bin/phpunit tests/TestCase/NomeDoTeste.php
```

### Análise de Código

```bash
# PHPStan
vendor/bin/phpstan analyse src

# PHP CodeSniffer
vendor/bin/phpcs src

# PHP CodeSniffer Fix
vendor/bin/phpcbf src
```

## 🔧 Configurações

### Banco de Dados

- Host: `mysql`
- Porta: `3306`
- Database: `todoapp`
- Usuário: `todoapp`
- Senha: `todoapp_password`
- Root Password: `root_password`

### PHP

- Versão: 8.2
- Xdebug: Habilitado
- Configuração: `docker/php/php-dev.ini`

### Histórico de Comandos

O histórico do bash é persistido entre reinicializações do container.

## 🐛 Debug

O Xdebug está pré-configurado. Para debugar:

1. Adicione breakpoints no VS Code
2. Pressione `F5` ou vá em Run > Start Debugging
3. Acesse a aplicação no navegador

## 📦 Volumes Persistentes

Os seguintes dados são persistidos:

- Banco de dados MySQL
- Logs do PHP e Nginx
- Histórico de comandos do bash
- Dependências do Composer (vendor)

## 🔄 Reconstruir o Container

Se você modificar o Dockerfile ou docker-compose:

1. Pressione `F1` ou `Ctrl+Shift+P`
2. Digite: `Dev Containers: Rebuild Container`

## 🆘 Problemas Comuns

### Permissões de Arquivo

```bash
chmod -R 777 logs tmp
```

### Reinstalar Dependências

```bash
rm -rf vendor
composer install
```

### Limpar Containers e Volumes

```bash
# Parar todos os containers
docker-compose -f docker-compose.dev.yml down

# Remover volumes (CUIDADO: apaga dados do banco)
docker-compose -f docker-compose.dev.yml down -v
```

## 📚 Documentação

- [CakePHP Documentation](https://book.cakephp.org/4/en/index.html)
- [VS Code DevContainers](https://code.visualstudio.com/docs/devcontainers/containers)
- [Docker Documentation](https://docs.docker.com/)
